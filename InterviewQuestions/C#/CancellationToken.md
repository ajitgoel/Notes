https://stackoverflow.com/questions/62185377/using-cancellation-token-properly-in-c-sharp

As said in the [official documentation](https://docs.microsoft.com/en-us/dotnet/api/system.threading.cancellationtoken?view=netcore-3.1), ==the cancellation token allows propagating a cancellation signal. This can be useful for example, to cancel long-running operations that for some reason do not make sense anymore or that are simply taking too long.==

The `CancelationTokenSource` will allow you to get a custom token that you can pass to the `requestExecutor`. It will also provide the means for cancelling a running `Task`.

```cs
private CancellationTokenSource cts = new CancellationTokenSource();

// ...

private Task<T> ProcessCassQuery<T>(Func<CancellationToken, Task<T>> requestExecuter, string msg) where T : class
{
    return requestExecuter(cts.Token);
}
```

**Example**

Let's take a look at a different minimal/dummy example so we can look at the inside of it.

Consider the following method, `GetSomethingAsync` that will yield return an incrementing integer every second.

The call to `token.ThrowIfCancellationRequested` will make sure a `TaskCanceledException` is thrown if this process is cancelled by an outside action. Other approaches can be taken, for example, check if `token.IsCancellationRequested` is true and do something about it.

```cs
private static async IAsyncEnumerable<int> GetSomethingAsync(CancellationToken token)
{
    Console.WriteLine("starting to get something");
    token.ThrowIfCancellationRequested();
    for (var i = 0; i < 100; i++)
    {
        await Task.Delay(1000, token);
        yield return i;
    }
    Console.WriteLine("finished getting something");
}
```

Now let's build the main method to call the above method.

```cs
public static async Task Main()
{    
    var cts = new CancellationTokenSource();
    // cancel it after 3 seconds, just for demo purposes
    cts.CancelAfter(3000);
    // or: Task.Delay(3000).ContinueWith(_ => { cts.Cancel(); });
    await foreach (var i in GetSomethingAsync(cts.Token))
    {
        Console.WriteLine(i);
    }
}
```

If we run this, we will get an output that should look like:

```none
starting to get something
0
1
Unhandled exception. System.Threading.Tasks.TaskCanceledException: A task was canceled.
```

Of course, this is just a dummy example, the cancellation could be triggered by a user action, or some event that happens, it does not have to be a timer.