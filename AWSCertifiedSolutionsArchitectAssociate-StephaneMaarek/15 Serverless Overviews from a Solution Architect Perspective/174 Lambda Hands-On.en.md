
<v Instructor>So lets get started with Lambda</v>
and for this I'm just going to type Lambda
and get into the Lambda console.
Now you may see a different screen
just because I've already used Lambda.
So if you go to the URL and do instead of /functions
use /begin, hopefully that works for you
and this takes you to the normal Get Started Lambda page
and I really like this page because
it demonstrates how Lambda works.
So Lambda lets you run code without thinking about servers
and that make it a serverless service
and there is zero administration.
So we have different examples of how Lambda works
based on the code so if you have a code you prefer,
a language you prefer .NET, Go, Java, Node.js, Python, Ruby
you just use whatever you want and your Custom runtime.
But so in this example I'm just going to click on Node.js,
the one selected and you'll see this is a function
that logs something and return Hello from Lambda!
And so as we can see its very simple code
nothing special about it and we can just run it with Lambda.
So we'll click on Run and this runs the function
and it returns Hello from Lambda!
So Lambda runs your code that makes a lot of sense,
but next Lambda responds to events.
So I really like this diagram that's
why I want to show you this page.
We can see that a lot of different event sources
can send events to Lambda and the Lambda function
will reply and will react to these events.
So as we can see it says Hello from Lambda!
Every time there is a little event
reaching the Lambda function.
And so these events can be a logo, streaming analytics,
data processing, mobile backend, et cetera, et cetera.
And so as we can see as we receive these events
right now there's only two cog wheels
so your Lambda function scales based
on if it receives more events or less events.
So you can click on Streaming analytics a lot
and if you click really, really fast you see more cogwheels
which means that your function has scaled accordingly.
And as soon as I stop clicking then automatically
it's going to remove these Lambda function executions
and they will be just gone.
So you can click on any of these things in here
and this will create events so as we can see
if I click on the photo it goes into
my data processing extra bucket
which will evoke a Lambda function,
or if I click on my mobile it goes into mobile backend,
which again evokes lambda function.
So as we can see Lambda can respond to
Streaming analytics, Data processing or Mobile backend
and it scales based on if I click a lot on it or not.
So next it scales seamlessly, so as we can see right now
as more invocations happen for our Lambda function
our cost remains at zero that's because the first
1 million invocations are within the free tier.
But as soon as we pass the 1 million invocations
I'm going to start getting billed for it,
so here we go, one cent.
So the more invocations I do, the faster the number of
invocations will go up obviously and the higher the cost.
But what we can see that the cost grows linearly
with the number of Lambda invocations
and that is the whole power of Lambda,
you only pay for what you use
and it scales based on the load you're having.
So let's go ahead and create our first function.
Now we have three ways to create a function,
you could be authoring from scratch, blueprint
or browsing the serverless app repository.
So let's use a blueprint 'cause
I wanna show you the hello world.
So I'm going to type hello world in here, hello
and there is a hello-world-python here
that we'll use this blueprint, okay.
Then we will configure this blueprint
and so we have to give our function a name
so we'll just call it hello and then world,
if I can type it, here we go.
And then there is this execution role.
So here we have the option and we must actually
create an IAM role for our Lambda function.
This is what our Lambda function will use to perform
its integration with other services.
So I have three options, I can create a new role,
use an existing role or create
a new role from policy templates
and right now I'm just going to
create a new role with basic Lambda permissions.
As you see it will create a role named hello-world-role
and something here, which will be different for you.
And the role will have the permissions to upload logs
to Amazon Cloudwatch Logs, so this is perfect.
Then we scroll down and we look at the Lambda function code.
So the runtime is Python 3.7 and I think Python
is an easy language to read so no need to know Python,
I just think it's very easy to handle.
And so as we can see we have a function called
lambda_handler and it will print three things.
So value1 equals event key1, value2 equals event key2
et cetera, et cetera and then they will
return the event key1.
So it's a very simple function that logs a few stuff
at the screen and then returns a value.
So were going to play and run this function,
so I'll create this function and its took about 30 seconds
but my function is now created.
So I can go ahead and invoke it with a test event.
So I'm going to click on Test right here
and then you have to Create a new test event.
The template is Hello World and I'm calling it SimpleEvent.
And this event is a JSON which contains key1, value1,
key2, value2, key3, value3.
And click on Create, so this creates a test event
and then I have to run my test event,
so I click on test yet again
and now we can see execution result has succeeded.
So if I open the details of this
we're going to get more information.
First of all this is the return of value1,
so this corresponds to when our Lambda function said
return event key1 which for our test event was value1.
And then we get a lot more information,
so here we get the log output so all the things that were
printed by the Lambda function.
We can see the start of our invocation with the Requestid.
We can see the version of our Lambda function
that was invoked so latest, we can see the end
of our Lambda function with the Requestid
and we can see the report, the duration was 2.35
millisecond, 100 millisecond has been billed
and the size of the memory was 128 mega bytes.
So we get the same information in a summary right here.
So again the Requestid, we get the duration 2.35 millisecond
but we have been billed more, so 100 milliseconds
and why, well because our Lambda function is billed
in increments of 100 milliseconds.
We've configured 128 mega bytes of RAM
but was used only 48 mega bytes,
so this is an indication that we have
rightly sized our serverless Lambda function.
We cannot go lower than 128 mega bytes so this is perfect
and we get this log.
So this log actually comes from Cloudwatch Logs
so if I click here I will be taken directly into the
Cloudwatch Log console and in this I can see my Log groups,
so aws/lambda/hello-world which is the name of my function.
And then I have Log stream and this Log stream
corresponds to this invocation
and in here I'm able to see the log for that invocation.
Okay great, so now let's play
and change our Lambda function code.
So I scroll down and make sure that
Lambda hello-world is selected.
Then you have the function code
and in here you can see that we can change the code.
So I'm going to comment this line so on line 11
I'm going to add a
symbol like this and a hashtag
and a hash sign and then I will remove the hash sign
on the line 12 and this will raise an exemption.
So instead of returning something
my Lambda function will return an exemption.
So I will save this, now my Lambda function is saved.
I will scroll up and click on Test
and as we can see now we get execution results failed
and something went wrong and we know why.
We get also the same thing in our Cloudwatch Log
so if I go back to my Log group
and I refresh my Log streams.
Now I should see a second log stream,
this one is newer and in here I'm able to see this error
right here which says something went wrong.
So we can use Cloudwatch Logs to debug our Lambda functions
in case they go wrong and in each function invocation
will create a new log stream.
Okay, so let's just finish with this UI on the high level.
So the other thing is our Lambda function
has the name lambda_function.py so this is the name of our
code lambda_function.py and the handler is called
lambda_function.lambda_handler.
so lambda_function here represents the name of our file,
so that's the Lambda service knows which file to invoke
and then the second part lambda_handler corresponds
to the name of our function here call lambda_handler.
So its saying okay, to the Lambda service
take that Lambda function file
and invoke the function lambda_handler, which is right here.
So this is called the function code
and this is called the handler, very simple, okay?
So finally how did our Lambda function
write to Cloudwatch Logs?
So this is an integration between Lambda and Cloudwatch Logs
obviously, this is done for you.
But we can go to permissions and see what's going on.
So an execution role was created for our Lambda function
and we can open the role in the new tab.
And this role in here has a Resource summary
and we can see that it has access to Amazon Cloudwatch Logs.
It can do three actions on two resources,
it can do on any resource and create log group
which allowed our function to create the log group
aws/lambda/hello-world
and it also has the power to create Log streams
and put Log events in this Log group
and so that means that our Lambda function
was able to create these Log streams and push the Logs.
So when we create an IAM role with Lambda
and has the basic execution statements
that means that it created an IAM role
with a policy name that was managed.
And this policy just contains very simply
these three permissions.
So that's just a short introduction to Lambda,
but hopefully it started to make a lot of sense already.
Before we go and finish this lecture,
please go back to your function.
You un-comment so un-comment this line
and re-comment the other line, press on save and Test.
And now your function should be working
and then we're good to go.
So I will see you in the next lecture.