
<v Instructor>So what is AWS Lambda,</v>
and why is it helpful for us?
So let's take an example,
we are going to start with Amazon EC2.
And Amazon EC2, as we know,
they are virtual servers in the cloud,
and we have to provision them,
so we are limited by the amount of memory
and CPU we're going to provision.
They have to be continuously running.
I mean, we can optimize them
by starting them and stopping them efficiently,
but otherwise, they run continuously,
regardless of if something's happening or not
on your instance.
And if you want to scale, you can use Auto Scaling groups,
but that means that you need to do something
to automatically add and remove servers.
Now, this is one way of doing things,
and it has worked great, but then there is AWS Lambda.
So with Lambda, these are virtual functions,
no servers to manage.
So that means that we just provision the code
and the functions run.
This is limited by time,
so we're talking about short executions of up to 15 minutes,
which is, in my opinion, not that short.
And then finally, they run on-demand.
So that means that when you don't use Lambda,
your Lambda function is not running,
and you only are going to be billed
when your function is running
and it will run on-demand when it gets invoked,
which is a huge shift from Amazon EC2.
Finally, this scaling is automated.
If you need more Lambda functions, occurrences,
and different currency,
then automatically, AWS will provision for you,
more Lambda functions.
Magical.
We'll see this in the hands-on.
So, benefits of Lambda, I'm sure you see many.
First of all, the pricing is super easy.
You're going to pay for the number of requests
Lambda receives, so the number of invocations,
and your compute time, so how long Lambda was running for.
There is a very generous free tier on Lambda,
which is 1 million Lambda requests,
and 400,000 gigabyte-seconds of compute time.
It is also integrated with so many AWS services,
as we'll see, and we can use
a lot of different programming languages on Lambda,
so we're quite free,
and there is very easy monitoring integrations
through CloudWatch.
Finally, if you want to provision
more resources per function,
you can provision up to
three gigabytes of RAM per function, which is a lot.
And by the way, you need to know this,
if you increase the RAM of your function,
then it will also improve the quality and performance
of your CPU and network.
So, let's talk about the language
that are supported on Lambda.
The first one is Node.js, so JavaScript, Python,
Java, and this is Java 8 compatible, C# or .NET Core,
Golang, C# and Powershell, Ruby,
and there is a new API called the Custom Runtime API,
where you can run pretty much any language on Lambda,
but it has to be community supported,
and one of these example is, for example,
the Rust language.
Okay.
The one thing that does not run on Lambda is Docker.
So, if in the exam you are asked,
hey, I want to run a Docker container on AWS,
you have to think ECS or Fargate.
It is not for Lambda.
That's the only caveat.
Now, I said that Lambda was integrated
with so many AWS services,
so I'll give you a few,
and some idea of how they're integrated.
And in this course,
we will see some of these integrations.
So, API Gateway is to create a REST API,
and they will invoke our Lambda functions.
Kinesis will be using Lambda
to do some data transformations on the fly.
DynamoDB will be used to create some triggers,
so whenever something happens in our database,
a Lambda function will be triggered.
Amazon S3, we've seen this already,
a Lambda function will be triggered anytime, for example,
a file is created in S3.
CloudFront, this will be Lambda@Edge,
and I have a lecture dedicated to this in this section.
CloudWatch Events or EventBridge,
this is whenever things happen
in our infrastructure on AWS and want to be able
to react to things, for example,
say, we have a CodePipeline state changes,
and we want to do some automations based on it,
we can use a Lambda function.
CloudWatch Logs to stream these logs wherever you want.
SNS to react to notifications
and your SNS topics.
SQS to process messages from your SQS queues.
And finally, Cognito to react to whenever,
for example, a user logs into your database.
So these are just the main ones,
there are tons of Lambda integrations,
and so I want to show you a very good example here,
which is a serverless thumbnail creation.
So let's say we have an S3 bucket,
and we want to create thumbnails on the fly,
so there will be an event, which is,
that the new image will be uploaded in Amazon S3.
This will trigger through an S3 event notification,
a Lambda function.
And that lambda function will have code
to generate a thumbnail.
That thumbnail may be pushed and uploaded
into another S3 bucket or the same S3 bucket,
which would be a smaller version of that image,
and also, our Lambda function
may want to insert some data into DynamoDB,
around some metadata for the image, for example,
the image name, size, creation date, et cetera, et cetera.
And so thanks to Lambda,
we've automated and had a reactive architecture
to the event of new app, new images being created in S3.
Another example that's extremely popular,
is a serverless CRON job.
So CRON is a way, on your EC2 instances, for example,
to generate jobs every five minutes,
or every Monday at 10:00 a.m., et cetera, et cetera.
But you need to run CRON on a virtual server,
so an EC2 instance, and so on.
And so while your instance is not running,
or at least your CRONs are not doing anything,
then your instance time is wasted.
And so as such, you can create a CloudWatch event rule,
or an EventBridge rule,
that will be triggered every one hour.
And every one hour, it will be integrated
with a Lambda function that will perform your task.
So this is a way to create a serverless CRON,
because in this example,
CloudWatch Events is serverless,
and Lambda functions are serverless too.
Now let's take an example at the Lambda pricing.
So you can find all the information on this website
in case the information here is outdated,
but it will give you an example of how that works.
So you pay per calls, the first 1 million requests are free,
and then you're going to pay 20 cents
for extra 1 million requests,
so that makes a very, very cheap request.
Then you're going to pay per duration
in increments of 100 milliseconds.
So you get the first 400,000 gigabyte-seconds
of compute time per month for free.
And then what that means is gigabyte-seconds that,
it means you get 400,000 seconds of execution,
if the function has one gigabyte of RAM.
That means you get eight times as more seconds,
if the function has eight times as less RAM,
so 128 megabyte of RAM.
And after that,
you're going to pay $1 for 600,000 gigabyte-seconds.
So to be honest, you can make the math,
it's usually very, very cheap to run your code on Lambda,
so it's a very popular option to create your applications.
So that's it.
Now let's go into the hands-on
to get a feeling of how Lambda works.