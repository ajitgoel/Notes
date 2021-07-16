
<v Instructor>So let's about SQS,</v>
and at the core of SQS is a queue
because SQS is a simple queuing service.
So we have an SQS queue,
and it is going to contain messages.
And to contain messages,
well, something needs to send messages into our SQS queue
and whatever sends a message into our SQS queue
is called a producer.
So it's possible for us to have one producer,
but also have more.
You can have multiple producers
sending many messages into an SQS queue.
And the message could be whatever he wants.
For example, it could be process this order,
or process this video.
Whatever message you create goes into the queue.
Then something needs to process the messages from the queue
and receive them, and it's called consumers.
So consumers will poll the messages from the queue,
so that means that they will ask the queue,
do you have any message for me?
And the queue says, yes, here it is.
And the consumer will poll these messages
and get some information.
And then with that message,
it will process it and then delete it back from the queue.
And you may have multiple consumers
consuming messages from an SQS queue.
So a queuing service is here to be a buffer
to decouple between your producers and your consumers.
Now, SQS is a complicated service
and we'll see that in-depth,
but the very first offering is called Amazon SQS
for standard queues.
And SQS, historically on AWS, it is the oldest offering.
It was one of the first services on AWS.
It's over 10 years old so it's quite,
quite set in stone about how it works.
It's a fully managed service,
and it will be used to decouple applications.
So anytime you see application decoupling in your exam,
think about Amazon SQS.
Now, why is SQS so special?
Well, we get an unlimited throughputs.
That means you can send
as many messages per second as you want,
and the queue can have as many messages as you want as well.
So there's no limit on throughputs
and no limits in the number of messages in the queue.
Now, each message is short-lived.
What does that mean?
That means that by default,
the message will stay in the queue for four days
and the maximum amount of time
that a message can be in a queue is 14 days.
That means that as soon as you send a message to a queue,
it has to be read by consumer and deleted from the queue
after being processed within that retention period,
otherwise, it will be lost.
Then we have low-latency.
So SQS means that, for them,
is that whenever you send a message
or read a message from SQS,
you will get a response very quickly,
less than 10 milliseconds on publish and receive.
And the messages in SQS have to be small.
They have to be less than 256 kilobytes per messages sent.
Now SQS is a queuing service,
so you can see high throughput, high volume, and so on,
and so, it is possible to have duplicates messages.
That means that, for example,
sometimes a message will be delivered twice,
and so this is why it's called at least once delivery.
And if you go ahead with writing an application,
you need to take that into account.
It can also have out of the order messages,
which means it's best effort ordering,
and we'll see there is another type of offering from SQS
that can deal with that limitation,
but we'll see this later on in this section.
So, let's go back to our message producers.
So, messages that are up to 256 kilobytes
are sent into SQS by producers.
And how does it happen?
Well, the producers will send the messages to SQS
using an SDK, software development kits.
And the API to send a message to SQS is called SendMessage.
Very simple.
Now the message, it will be written,
it will be persisted into the SQS queue
until a consumer reads that message and deletes it,
which signifies that the message has been processed.
We know the retention.
And so, what's a use case for producing messages?
For example, you want to process an order,
for example, packets, and then ship it to the center.
And so you wanna do this in your own time
so you will send a message into the SQS queue
with maybe some information,
such as the order ID, the customer ID,
and any attributes you may want.
For example, the address, and so on.
And then your consumer, that is in application rights,
will have to deal with that message itself.
So, again, to confirm,
SQS standard has unlimited throughputs.
So we've seen about producers. Very simple.
Now let's look about consumers.
So consumers, they are applications
that we have to write with some code
and these applications can be running on EC2 instances,
so your virtual servers on AWS,
but also they can be running on your own on-premises servers
if you wanted to,
or, we haven't seen it yet,
but they can also be running
on Lambda functions on AWS Lambda.
We'll see in this course,
it is a serverless compute type of service.
What this means is that you can just read messages
directly from them as well.
We'll see this later on this course, do not worry.
So, going back to our simple use case about EC2 instances,
our queue has a consumer
and the consumer polls for SQS for messages.
And that means that the consumer will ask the queue,
do you have messages for me?
And the consumer may receive up to 10 messages at a time.
So if there are messages in the SQS queue,
it will receive a valid response saying
here are the messages that are waiting for you.
Then the consumer, it's your code,
has a responsibility to process these messages.
For example, insert some orders into an RDS database.
So you will go ahead and for each order,
you will insert it into your RDS database,
something that you have to write, obviously with your code,
and then because these messages have been processed
because they have been received
and inserted into an Amazon RDS database,
your consumer will go ahead
and delete these messages from the queue
using the DeleteMessage API.
And this will guarantee that no other consumer
will be able to see these messages
and therefore, the message processing is complete.
So now we can scale this up.
We can have multiple consumers at a time.
So our SQS queue can have multiple consumers
that will receive and process these messages in parallel.
So here we have three on EC2 instances,
and so each consumer will receive
a different set of messages by calling the poll function.
And so, if somehow a message
is not processed fast enough by a consumer,
it will be received by other consumers,
and so this is why we have at least once delivery.
And this is also why we have best-effort message ordering.
Now, as I said, when the consumers
are done with the messages, they will have to delete them,
otherwise, other consumers will see these messages.
And so what this means is that with SQS queues,
if we need to increase the throughputs
because we have more messages,
then we can add consumers and do horizontal scaling
to improve the throughput of processing.
And so, if you remember what we said,
this is a perfect use case for using SQS
with your Auto Scaling groups, or ASG.
So, what does that mean?
Well, that means that your consumers
will be running on EC2 instances
inside of an Auto Scaling group
and they will be polling for messages from the SQS queue.
But now your Auto Scaling group has to be scaling
on some kind of metric,
and a metric that is available to us is the Queue Length.
It's called ApproximateNumberOfMessages.
It is a CloudWatch Metric that's available in any SQS queue.
And we could set up an alarm,
such as whenever the queue length go over a certain level,
then please set up a CloudWatch Alarm,
and this alarm should increase the capacity
of my Auto Scaling group by X amount.
And this will guarantee that
the more messages you have in your SQS queue,
maybe because there's a surge of orders on your websites,
the more EC2 instances will be provided
by your Auto Scaling group,
and you will accordingly process these messages
at a higher throughputs.
So this is a very common integration
that you will see in the exam.
Now SQS, again, the use case
is to decouple between applications, so application tiers.
So, for example, let's take an example of an application
that processes videos.
We could have just one big application
that's called a front-end that will take the request
and whenever a video needs to be processed,
it will do the processing
and then insert that into an S3 bucket.
But the problem is that processing
may be very, very long to do
and it may just slow down your websites
if you do this in the front-end here.
So instead, you can decouple your application here and say,
wait a minute, the request of processing a file
and the actual processing of a file
can happen in two different applications.
And therefore, whenever you take a request
to process a file,
you will send a message into an SQS queue.
Now, when you do the request to process,
that file will be in the SQS queue
and you can create a second processing tier
called the back-end processing application
that will be in its own Auto-Scaling group
to receive these messages, process these videos,
and insert them into an S3 bucket.
So as we can see here with this architecture,
we can scale the front-end accordingly,
and we can scale the back-end accordingly as well,
but independently.
And because the SQS queue has unlimited throughputs
and it has unlimited number of messages
in terms of the queue, then you are really safe,
and this is a robust and scalable type of architecture.
And also, for your front-end,
you can use the optimal type of EC2 instances
or architecture for your front-end.
And for the back-end,
maybe if you're doing some video processing,
you can use some EC2 instances
that have a GPU, a graphical processing unit,
because you know that these type of instances
will be optimal for doing this kind of workload.
So this is the kind of architecture
that will come up in the exam
and that you're expected to know,
and this is an amazing and tremendous use case
for SQS queues.
Finally, SQS security.
So we have encryption in-flight
by sending and producing messages using the HTTPS API,
we get at-rest encryption using KMS keys,
and if we wanted to, we can do client-side encryption,
but that means that the client has to perform
the encryption and the decryption itself.
It's not something that's supported by SQS out of the box.
For access controls, IAM policies are going to be able to
regulate access to the SQS API,
but we also have SQS access policies,
which are similar to S3 bucket policies,
and they're very helpful when you want to do
cross-account access to SQS queue,
or when you want you to allow other services,
such as SNS that we'll see very soon, or Amazon S3,
to write to an SQS queue,
for example, with S3 events.
So that's it for SQS for an overview.
I hope you liked it,
and I will see you in the next lecture for some practice.