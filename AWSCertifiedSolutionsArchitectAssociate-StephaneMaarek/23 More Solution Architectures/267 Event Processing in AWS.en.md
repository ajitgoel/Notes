
<v Instructor>So let's talk about events processing AWS</v>
and the different possibilities we have
and the kind of constraints that we have alongside them.
So the first one, is to use SQS and Lamda.
And if you use SQS Lambda, with our SQS queue
and their Lambda function.
And so the events are going to be inserted
into our SQS queue and the Lamdda service is going
to pull the SQS queue.
And in case there are issues, it's going
to put back the messages into the SQS queue
and try and retry to pull that, okay?
And this can go into some sort of infinite loop.
So in case there is a big problem of one message,
what we can do is set up SQS to send the message
to a dead letter queue after say five tries.
This will be a way out of it.
Now we can also use SQS FIFO, and Lamda.
In this case, FIFO means first in, first out,
and that means that the messages are going
to be processed in order.
So now our Lamda function is going to try and retry
to get the messages from the queue,
but because it just to process them in order
in case one message doesn't go through,
is going to be a blocking never ending process
and the whole queue processing will be blocked,
in which case yet again, we can set up a dead letter queue
to send these messages off to SQS queue
and allow our functions to keep on processing it.
Okay, next we have another option, SNS and Lambda.
In this case, SNS is a service
and the message goes through it and then the message
is sent asynchronously to Lambda
in which gets to them to function
as a different retry behavior.
in case it can not process that message
is going to retry but internally,
and that retry will be three times
and if the message is not processed successfully
it will be discarded or we can set up a DLQ but this time
at the Lambda service level, to send that message in to,
for example, the SQS queue for letter processing.
So as we can see, this is a different kind of architecture
with SQS, the DLQ is set up on the SQS side.
And for Lambda, the DLQ is set up on the Lambda side.
So different architectures we have different needs.
Now, let's talk about the Fan Out Pattern,
Which is, how do you deliver a data to multiple SQS queues?
So option one, we have our application
and it has the AWS SDK installed on it
and we have safe three SQS queues we'd like
to deliver a message onto.
So what we could do very easily is to write our application,
do you first send a message to the first queue
and then send a message to the second queue
and then send again the same message to the third queue.
And that would work, but that would be somewhat
not too reliable, right?
Because for example, if our application crushes
after we send a message to the second queue,
then the third queue will never receive the last message.
And the content of each queue will be different.
So while this works, this is not very reliable
and this is not pretty.
Instead we can use a Fan Out Pattern,
which is to combine it, your SQS queue with an SNS topic
in the middle.
And in this case, what happens?
Well, our SQS queues are going to be subscribers
of our SNS topic in the middle.
And what will happen is that any time we send a message
to the SNS topic, it will be sent by the SNS service
into all of other SQS queues, which has a higher guarantee.
So from our application perspective now,
we just do a PUT into our SNS topic
and automatically the SNS service will fan out that message
into your other SQS queue.
And this works really well.
And that's a very common design pattern on AWS.
So the cool thing about it is that we can combine this
with adventing on S3.
So we have events happening in our S3 buckets
and we want to react to them happening in real time.
So what kind of events we can react with?
Well, we can react to S3 object created
or S3 Object Removed, S3 Object Restore or S3 Replication.
And you can even have a filter to just be able to react
to certain name in particular.
For example, you wanna say, I want to filter
so that all the events that are created correspond
to a JPEG file so image.
And the use case for this would be, for example,
to generate thumbnail images of images
that have been uploaded to Amazon S3 in real time.
So let's take an example, we upload an object
into our Amazon S3 buckets and we can react
in three different ways.
The first one is to Amazon SNS.
So we can send a notification directly into an SNS topic,
thanks to S3 events,
or we can send a message into an SQS queue,
or we can asynchronously invoke a Lambda function.
And so these are the only three possible destinations
for your Amazon S3 events.
But, thanks to these destinations,
we can do a lot of things.
First of all, if it's SNS, we can combine we just learned
before from the Fan Out Pattern
to just send it to to multiple SQS queue.
So using one S3 events, in one SNS topic,
we could send the data out to say 10 SQS queue.
Very cool, if we have an SQS queue,
we can also, for example, create a Lambda function
or an EC2 instance to read the messages
of that SQS queue, and the benefit we get out of using
an SQS queue would be, for example,
that if the Lamda function fails,
then our message remains in our SQS queue
and can be processed by another application.
And finally, if we are taking into Amazon Lambda,
then we've learned that we can do whatever we want really,
it's free, but in case our Lambda fails
because it has been asynchronous in vocation,
then we can define a dead letter queue
on a letter function,
such as if it fails to process it three times,
then we can send the message to SQS, for example,
for later processing.
Okay, so this gives you a lot of architectures
that are possible, all stemming from the idea
that any object created, removed, restored, or replicated
in S3 can generate an event in its own
and can be sent to SNS, SQS or Lambda.
Now something you should know is that you can create
as many S3 events as desired
on your S3 bucket so you could have as many events
as you want.
So you can create one event for SNS, one event for SQS,
one event for Lambda, whatever you want.
And the S3 event notifications are typically delivered
within seconds, but sometimes can take a minute or longer.
And if two writes are made to a non versioned single object
at the same time, then it's possible you only see one,
S3 events and not two.
If you wanted to get an event for each
and every single object that has been uploaded into S3,
then you need to make sure that, you enable versioning
such as each object in itself its own
its own version and will create its own notification.
And that is just a small caveat coming
from the documentation.
Nothing to worry about from an exempt perspective,
but from a well perspective,
if you want you get an S3 event for every single object
in your Amazon S3 bucket.
Then make sure it's your enabled versioning.
Okay, so remember the three destinations out
of Amazon S3's, so SNS, SQS, and Lambda,
and the fact you can make new patterns out of these.
For example, SNS with Fan Out Pattern gives you
two SQS queues and so on.
All right, that's it's, I will see you in the next lecture.