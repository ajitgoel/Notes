# [C# Async Antipatterns](https://markheath.net/post/async-antipatterns)

The `async` and `await` keywords have done a great job of simplifying writing asynchronous code in C#, but unfortunately they can't magically protect you from getting things wrong. In this article, I want to highlight a bunch of the most common async coding mistakes or antipatterns that I've come across in code reviews.

### ==1. Forgotten `await`==

Whenever you call a method that returns a `Task` or `Task<T>` you should not ignore its return value. In most cases, that means awaiting it, although there are occasions where you might keep hold of the `Task` to be awaited later.

In this example, we call `Task.Delay` but because we don't await it, the "After" message will get immediately written, because `Task.Delay(1000)` simply returns a task that will complete in one second, but nothing is waiting for that task to finish.

```cs
Console.WriteLine("Before");
Task.Delay(1000);
Console.WriteLine("After");
```

If you make this mistake in a method that returns `Task` and is marked with the `async` keyword, then the compiler will give you a helpful error:

> Because this call is not awaited, execution of the current method continues before the call is completed. Consider applying the 'await' operator to the result of the call.

But in synchronous methods or task-returning methods not marked as `async` it appears the C# compiler is quite happy to let you do this, so remain vigilant that you don't let this mistake go unnoticed.

### 2. Ignoring tasks

Sometimes developers will deliberately ignore the result of an asynchronous method because they explicitly *don't* want to wait for it to complete. Maybe it's a long-running operation that they want to happen in the background while they get on with other work. So sometimes I see code like this:

```cs
// do it in the background - we don't want to wait for it
var ignoredTask = DoSomethingAsync();
```

The danger with this approach is that nothing is going to catch any exceptions thrown by `DoSomethingAsync`. At best, that means you didn't know it failed to complete. At worst, [it can terminate your process](https://docs.microsoft.com/en-us/dotnet/standard/threading/exceptions-in-managed-threads).

So use this approach with caution, and make sure the method has good exception handling. Often when I see code like this in cloud-applications, I often refactor it to post a message to a queue, whose message handler performs the background operation.

### ==3. Using `async void` methods==

Every now and then you'll find yourself in a synchronous method (i.e. one that doesn't return a `Task` or `Task<T>`) but you want to call an `async` method. However, without marking the method as `async` you can't use the `await` keyword. There are two ways developers work round this and both are risky.

The first is when you're in a `void` method, the C# compiler will allow you to add the `async` keyword. This allows us to use the `await` keyword:

```cs
public async void MyMethod()
{
    await DoSomethingAsync();
}
```

The trouble is, that the *caller* of `MyMethod` has no way to `await` the outcome of this method. They have no access to the `Task` that `DoSomethingAsync` returned. So you're essentially ignoring a task again.

Now there are some valid use cases for `async void` methods. The best example would be in a Windows Forms or WPF application where you're in an event handler. Event handlers have a method signature that returns `void` so you can't make them return a `Task`.

So it's not necessarily a problem to see code like this:

```cs
public async void OnButton1Clicked(object sender, EventArgs args)
{
    await LoadDataAsync();
    // update UI
}
```

But in most cases, I recommend against using `async void`. If you can make your method return a `Task`, you should do so.

### ==4. Blocking on tasks with `.Result` or `.Wait`==

Another common way that developers work around the difficulty of calling asynchronous methods from synchronous methods is by using the `.Result` property or `.Wait` method on the `Task`. The `.Result` property waits for a `Task` to complete, and then returns its result, which at first seems really useful. We can use it like this:

```cs
public void SomeMethod()
{
    var customer = GetCustomerByIdAsync(123).Result;
}
```

But there are some problems here. The first is that using blocking calls like `Result` ties up a thread that could be doing other useful work. More seriously, mixing async code with calls to `.Result` (or `.Wait()`) opens the door to some [really nasty deadlock problems](https://blog.stephencleary.com/2012/07/dont-block-on-async-code.html).

Usually, whenever you need to call an asynchronous method, you should just make the method you are in asynchronous. Yes, its a bit of work and sometimes results in a lot of cascading changes which can be annoying in a large legacy codebase, but that is still usually preferable to the risk of introducing deadlocks.

There might be some instances in which you can't make the method asynchronous. For example, if you want to make an async call in a class constructor - that's not possible. But often with a bit of thought, you can redesign the class to not need this.

For example, instead of this:

```cs
class CustomerHelper
{
    private readonly Customer customer;
    public CustomerHelper(Guid customerId, ICustomerRepository customerRepository) 
    {
        customer = customerRepository.GetAsync(customerId).Result; // avoid!
    }
}
```

You could do something like this, using an asynchronous factory method to build the class instead:

```cs
class CustomerHelper
{
    public static async Task<CustomerHelper> CreateAsync(Guid customerId, ICustomerRepository customerRepository)
    {
        var customer = await customerRepository.GetAsync(customerId);
        return new CustomerHelper(customer)
    }

    private readonly Customer customer;
    private CustomerHelper(Customer customer) 
    {
        this.customer = customer;
    }
}
```

Other situations where your hands are tied are when you are implementing a third party interface that is synchronous, and cannot be changed. I've ran into this with `IDispose` and implementing ASP.NET MVC's `ActionFilterAttribute`. In these situations you either have to get very creative, or just accept that you need to introduce a blocking call, and be prepared to write lots of `ConfigureAwait(false)` calls elsewhere to protect against deadlocks (more on that shortly).

The good news is that with modern C# development, it is becoming increasingly rare that you need to block on a task. Since C# 7.1 you could declare [async Main](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-7-1) methods for console apps, and ASP.NET Core is much more async friendly than the previous ASP.NET MVC was, meaning that you should rarely find yourself in this situation.

### ==5. Mixing `ForEach` with `async` methods==

The `List<T>` class has a "handy" method called `ForEach` that performs an `Action<T>` on every element in the list. If you've seen any of my LINQ talks you'll know my misgivings about this method as encourages a variety of bad practices (read [this](https://blogs.msdn.microsoft.com/ericlippert/2009/05/18/foreach-vs-foreach/) for some of the reasons to avoid `ForEach`). But one common threading-related misuse I see, is using `ForEach` to call an asynchronous method.

For example, let's say we want to email all customers like this:

```cs
customers.ForEach(c => SendEmailAsync(c));
```

What's the problem here? Well, what we've done is exactly the same as if we'd written the following `foreach` loop:

```cs
foreach(var c in customers)
{
    SendEmailAsync(c); // the return task is ignored
}
```

We've generated one `Task` per customer but haven't waited for any of them to complete.

Sometimes I'll see developers try to fix this by adding in `async` and `await` keywords to the lambda:

```cs
customers.ForEach(async c => await SendEmailAsync(c));
```

But this makes no difference. The `ForEach` method accepts an `Action<T>`, which returns `void`. So you've essentially created an `async void` method, which of course was one of our previous antipatterns as the caller has no way of awaiting it.

So what's the fix to this? Well, personally I usually prefer to just replace this with the more explicit `foreach` loop:

```cs
foreach(var c in customers)
{
    await SendEmailAsync(c);
}
```

Some people prefer to make this into an extension method, called something like `ForEachAsync`, which would allow you to write code that looks like this:

==await customers.ForEachAsync(async c => await SendEmailAsync(c));==

But don't mix `List<T>.ForEach` (or indeed `Parallel.ForEach` which has exactly the same problem) with asyncrhonous methods.

### ==6. Excessive parallelization==

Occasionally, a developer will identify a series of tasks that are performed sequentially as being a performance bottleneck. For example, here's some code that processes some orders sequentially:

```cs
foreach(var o in orders)
{
    await ProcessOrderAsync(o);
}
```

Sometimes I'll see a developer attempt to speed this up with something like this:

```cs
var tasks = orders.Select(o => ProcessOrderAsync(o)).ToList();
await Task.WhenAll(tasks);
```

What we're doing here is calling the `ProcessOrderAsync` method for every order, and storing each resulting `Task` in a list. Then we wait for all the tasks to complete. Now, this does "work", but what if there were 10,000 orders? We've flooded the thread pool with thousands of tasks, potentially preventing other useful work from completing. If `ProcessOrderAsync` makes downstream calls to another service like a database or a microservice, we'll potentially overload that with too high a volume of calls.

What's the right approach here? Well at the very least we could consider constraining the number of concurrent threads that can be calling `ProcessOrderAsync` at a time. I've written about [a few different ways to achieve that here](https://markheath.net/post/constraining-concurrent-threads-csharp).

If I see code like this in a distributed cloud application, it's often a sign that we should introducing some messaging so that the workload can be split into batches and handled by more than one server.

### 7. Non-thread-safe side-effects

If you've ever looked into functional programming (which I recommend you do even if you have no plans to switch language), you'll have come across the idea of "pure" functions. The idea of a "pure" function is that it has no side effects. It takes data in, and it returns data, but it doesn't mutate anything. Pure functions bring [many benefits](https://markheath.net/post/testable-code-with-pure-functions) including inherent thread safety.

Often I see asynchronous methods like this, where we've been passed a list or dictionary and in the method we modify it:

```cs
public async Task ProcessUserAsync(Guid id, List<User> users)
{
    var user = await userRepository.GetAsync(id);
    // do other stuff with the user
    users.Add(user);
}
```

The trouble is, this code is risky as it is not thread-safe for the `users` list to be modified on different threads at the same time. Here's the same method updated so that it no longer has side effects on the users list.

```cs
public async Task<User> ProcessUserAsync(Guid id)
{
    var user = await userRepository.GetAsync(id);
    // do other stuff with the user
    return user;
}
```

Now we've moved the responsibility of adding the user into the list onto the caller of this method, who has a much better chance of ensuring that the list is accessed from one thread only.

### 8. Missing `ConfigureAwait(false)`

`ConfigureAwait` is not a particularly easy concept for new developers to understand, but it is an important one, and if you find yourself working on a codebase that uses `.Result` and `.Wait` it can be critical to use correctly.

I won't go into great detail, but essentially the meaning of `ConfigureAwait(true)` is that I would like my code to continue on the same "[synchronization context](https://msdn.microsoft.com/magazine/gg598924.aspx?f=255&MSPPError=-2147217396)" after the `await` has completed. For example, in a WPF application, the "synchronization context" is the UI thread, and I can only make updates to UI components from that thread. So I almost always want `ConfigureAwait(true)` in my UI code.

```cs
private async void OnButtonClicked() 
{
    var data = await File.ReadAllBytesAsync().ConfigureAwait(true);
    this.textBoxFileSize.Text = $"The file is ${data.Length} bytes long"; // needs to be on the UI thread
}
```

Now `ConfigureAwait(true)` is actually the default, so we could safely leave it out of the above example and everything would still work.

But why might we want to use `ConfigureAwait(false)`? Well, for performance reasons. Not everything needs to run on the "synchronization context" and so its better if we don't make one thread do all the work. So `ConfigureAwait(false)` should be used whenever we don't care what thread the continuation runs on, which is actually a lot of the time, especially in low-level code that is dealing with files and network calls.

However, when we start combining code that has synchronization contexts, `ConfigureAwait(false)` and calls to `.Result`, there is a real danger of deadlocks. And so the recommended way to avoid this is to remember to call `ConfigureAwait(false)` *everywhere* that you don't explicitly need to stay on the synchronization context.

For example, if you make a general purpose NuGet library, then it is highly recommended to put `ConfigureAwait(false)` on every single `await` call, since you can't be sure of the context in which it will be used.

There is some good news on the horizon. In [ASP.NET Core there is no longer a synchronization context](http://blog.stephencleary.com/2017/03/aspnetcore-synchronization-context.html), which means that you no longer need to put calls to `ConfigureAwait(false)` in. Although, it remains recommended when creating NuGet packages.

But if you are working on projects that run the risk of a deadlock, you need to be very vigilant about adding the `ConfigureAwait(false)` calls in everywhere.

### 9. Ignoring the async version

Whenever a method in the .NET framework takes some time, or performs some disk or network IO, there is almost always an asynchronous version of the method you can use instead. Unfortunately, the synchronous versions remain for backwards compatibility reasons. But there is no longer any good reason to use them.

So for example, prefer `Task.Delay` to `Thread.Sleep`, prefer `dbContext.SaveChangesAsync` to `dbContext.SaveChanges` and prefer `fileStream.ReadAsync` to `fileStream.Read`. These changes free up the thread-pool threads to do other more useful work, allowing your program to process a higher volume of requests.

### 10. `try` `catch` without `await`

There's a handy optimization that you might know about. Let's suppose we have a very simple async method that only makes a single async call as the last line of the method:

```cs
public async Task SendUserLoggedInMessage(Guid userId)
{
    var userLoggedInMessage = new UserLoggedInMessage() { UserId = userId };
    await messageSender.SendAsync("mytopic", userLoggedInMessage);
}
```

In this situation, there is no need to use the `async` and `await` keywords. We could have simply done the following and returned the task directly:

```cs
public Task SendUserLoggedInMessage(Guid userId)
{
    var userLoggedInMessage = new UserLoggedInMessage() { UserId = userId };
    return messageSender.SendAsync("mytopic", userLoggedInMessage);
}
```

Under the hood, this produces slightly more efficient code, as code using the `await` keyword compiles into a state machine behind the scenes.

But let's suppose we update the function to look like this:

```cs
public Task SendUserLoggedInMessage(Guid userId)
{
    var userLoggedInMessage = new UserLoggedInMessage() { UserId = userId };
    try
    {
        return messageSender.SendAsync("mytopic", userLoggedInMessage);
    }
    catch (Exception ex)
    {
        logger.Error(ex, "Failed to send message");
        throw;
    }
}
```

It looks safe, but actually the `catch` clause will not have the effect you might expect. It will not catch all exceptions that might be thrown while the `Task` returned from `SendAsync` runs. That's because we've only caught exceptions that were thrown while we created that Task. If we wanted to catch exceptions thrown at any point during that task, we need the `await` keyword again:

```cs
public async Task SendUserLoggedInMessage(Guid userId)
{
    var userLoggedInMessage = new UserLoggedInMessage() { UserId = userId };
    try
    {
        await messageSender.SendAsync("mytopic", userLoggedInMessage);
    }
    catch (Exception ex)
    {
        logger.Error(ex, "Failed to send message");
        throw;
    }
}
```

Now our catch block will be able to catch exceptions thrown at any point in the `SendAsync` task execution.

### Summary

There are lots of ways in which you can cause yourself problems with async code, and so its worth investing time to deepen your understanding of threading. In this article I've just picked out a few of the problems I see most frequently, but I'm sure there are plenty more that could be added. Let me know in the comments what advice you'd add to this list.

If you'd like to learn more about threading in C#, a few resources I can recommend are Bill Wagner's recent NDC talk [The promise of an async future awaits](https://www.youtube.com/watch?v=ghDS4_NFbcQ), Filip Ekberg's Pluralsight course [Getting Started with Asynchronous Programming in .NET](https://www.pluralsight.com/courses/asynchronous-programming-dotnet-getting-started), and of course anything written by renowned async expert [Stephen Cleary](https://blog.stephencleary.com/).