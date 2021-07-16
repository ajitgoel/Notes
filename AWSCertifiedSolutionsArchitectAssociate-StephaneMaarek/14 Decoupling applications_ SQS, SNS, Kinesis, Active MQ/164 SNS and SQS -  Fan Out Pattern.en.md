
<v ->So now let's look at a very common pattern</v>
called the SNS + SQS:Fan Out.
The idea is that you want to send the same message
into many different SQS queues but to do so,
you're going to use SNS.
So you will push once the message into SNS,
and all the SQS queues that are subscribers
for that message will receive it.
So the buying service wants to send a message
to many different SQS queues because you have
many different applications reading from SQS,
and therefore, you will send it first to an SNS topic.
Just one message to the SNS topic.
And the SNS topic will deliver that message
to all the SQS queues that are subscribed to it.
And with some guarantees obviously.
Now, the Fraud Service, maybe reading
from the first SQS Queue or the Shipping Service
reading from the second SQS Queue,
will all have a copy of the message.
And so this pattern is called Fan-Out because we send once,
and we have multiple receives into SQS queues.
It's fully decoupled, there are no data loss.
And why do we want this in the first place?
Well, by having the message into SQS queues,
then we have data persistence,
we can get delayed processing and retries of work.
I mean, all the good thing we saw
thanks to the SQS queues.
Also, you can add more SQS subscribers over time
and the Buying Service won't even know about it,
because the Buying Service is just sending a message
into your SNS topic.
So this allows you for greater efficiency later on,
if you want to add more receiving services,
more microservices reading from this data.
Finally, to make sure that this works,
your SQS queue needs to have an access policy
that allows the SNS service to write to it
otherwise the message will not be accepted.
And very, very notable, especially in the exam,
SNS cannot send messages to SQS FIFO queues
which is a limitation by AWS.
That one you should know.
So if in the exam, you see that SNS sends message
to SQS FIFO queue, you can rule out that answer
because that is simply not possible today.
And to make this very clear,
if I go to my DemoQueue and my DemoQueue.fifo,
as you can see in my DemoQueue,
I can have SNS subscriptions and you could subscribe
to an SNS topic and you will need to
change the access policy to allow the SNS topic
to write to it.
But this is all possible
and you can just check out the documentation for this.
This is really well indicated on how this works.
And so it's possible for a normal queue, a standard queue
to have SNS subscriptions.
but if we go into my Fifo queue,
as you can see SNS subscription is simply grayed out,
because it is impossible for an SNS topic
to send data into an SQS Fifo queue.
So here is a use case for SQS and SNS Fan-Out
that can come up in the exam.
So S3 Events, cannot send by default event type
to many different destinations.
So you can have many, many different rules
into your S3 Events,
but for one specific type of event, for example,
objects being created, and the specific prefix for example,
images slash or just star, if you want all your events.
You can only have one S3 Event rule.
So say for example, you want to have an application
that reads events from an SQS queue for all the objects
created into your S3 bucket,
then you can only have one rule,
that will send messages into only one SQS queue.
But if you want to have many SQS queues,
having these events or a copy of this events,
then you cannot use just S3 event.
You have to use the fan-out pattern we just saw.
So the idea is what?
You have your objects-created rule
into your Amazon S3 event notification.
And instead of having SQS queue as destination,
you will have an SNS topic as a destination for this events.
And the SNS topic will use the fan-out pattern
to send this message to as many SQS queues as you need,
so that different applications
can read the same events coming out of the S3.
And you can even extend this because
now lambda functions for example,
that we haven't seen yet, but we'll see it soon.
Can also read from SNS topic and receive this notification.
So this fan-out pattern is very helpful to circumvent
the limitation of Amazon S3 buckets.
Even notifications wishes that for a combination
of event type and prefix,
you can only have one S3 Event rule.
So that's it.
I hope you like this lecture.
And I will see you in the next lecture.