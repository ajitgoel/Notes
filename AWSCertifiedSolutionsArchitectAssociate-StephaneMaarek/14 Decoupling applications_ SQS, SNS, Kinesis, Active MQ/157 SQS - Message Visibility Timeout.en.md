
<v Instructor>So now let's talk about an important concept,</v>
which is called the message visibility timeout.
So when a message is polled by a consumer,
it becomes invisible to other consumers.
So let's take an example.
We have the time going from left to right,
and we have a consumer doing a ReceiveMessage request,
and therefore, a message will be returned from the queue.
Now the visibility timeout begins.
And by default, that message visibility timeout
is 30 seconds.
That means that during these 30 seconds,
the message has to be processed, okay?
And if you do so,
that means that if the same or other consumers
do a message request API call,
then the message will not be returned.
And again another one during the timeout window,
the message will not be returned.
So effectively, during the visibility timeout,
that message is invisible to other consumers.
But after the visibility timeout is elapsed
and if the message has not been deleted,
then the message will be
quote unquote put back into the queue
and therefore, another consumer or the same consumer
doing a receive message API call
will receive the message again, the same message as before.
So, this is something that's really important to understand.
As you can see, while we receive a message,
it becomes invisible during the visibility timeout period.
Now, if we take a look at the same diagram,
what we notice is that
if we don't process a message
within the visibility timeout window,
then it will be processed twice potentially, right?
Because it will be received by two different consumers,
or twice by the same consumer.
And so, if a consumer is actively processing a message
but knows that it needs a bit more time
to process the message because otherwise,
it will go out of the visibility timeout window,
there is an API called ChangeMessageVisibility.
And so if a consumer knows
that a message needs a bit more time to be processed
and you don't want to process that message twice,
then the consumer should call
the ChangeMessageVisibility API to tell SQS,
hey, do not make that message visible for now, okay?
I just need a bit more time to process this message.
And so, how do you set this message visibility timeout?
Well, if you set it to
a really, really high value by default, say, hours,
and the consumer crashes,
then it will take hours until this message reappears,
re-becomes visible in your SQS queue,
and that will take a lot of time.
If you set it to something really, really low,
like a few seconds,
what happens that if the consumer
doesn't end up having enough time to process that message
for whatever reason,
then it will be read many times by different consumers
and you may get duplicate processing.
So the idea is that the visibility timeout
should be set to something reasonable for your application
and your consumer should be programmed
that if they know they need a bit more time,
then they should call the ChangeMessageVisibility API
to get more time and increase the timeout
of that visibility window.
But understanding this concept
is very important from an exam perspective
because there will be scenarios on that.
So, let's go in the console
to see how that works in practice.
So I'm going to open
two windows of send and receive messages
just to show you how that works, so.
In the first window, I'm going to enter a hello world
and it's going to be sent into the queue.
And if you remember,
the queue has a default timeout of 30 seconds.
So what's going to happen is that I have two consumers,
I have the first window and the second window consumer,
and so I'm going to read the messages from the first window.
So let's poll for messages.
Now my message has appeared right here,
it has been received.
And if I go into my second consumer and poll for messages,
as you can see, the message does not appear in here.
And the reason it doesn't appear is that we are still within
the visibility window timeout of that message
and therefore, during these 30 seconds
this message is trying to be processed by this consumer,
this consumer right here will not see it.
But let's assume that we stop polling, okay?
So we don't delete the message
and we know this message will timeout at some point.
What will happen is that yes, I'm already here,
in the second window, in the second consumer,
this is the second consumer,
then the message has been received
because it was being put back into the queue.
And now let's assume we do something correctly,
we delete that message,
then we have fully processed that message.
But remember, that message was received twice.
It said received count was two.
So it's important for you to understand
how this visibility window works,
and this was a good demonstration of it.
Now, if you wanted to change this setting by default,
what you could be doing is go into Edit,
and then for visibility timeout,
you could set the default value
between zero seconds, which is definitely not recommended,
up to 12 hours.
I think 30 seconds is fine, but again, remember,
if a consumer needs more time to process a message,
you should just call the ChangeMessageVisibility API
to edit the visibility of that one message
and increase the value
so that another consumer will not see that message
and the first consumer will get enough time
to process that message accordingly.
So, that's it.
I hope you liked it, and I will see you in the next lecture.