
<v Instructor>Now let's talk about a delay queue.</v>
So a delay queue is to delay messages so that consumers
don't see them immediately.
And this can be a delay of up to 15 minutes.
By default, the delay parameter is zero seconds.
That means that as soon as you send the message
into an SQS queue, the message will be available right away
to be read but you can set a default at the queue level
to say all the messages should be delayed by X number
of seconds or every time you send a message
you can set a per-message delay
if you wanted to using the DelaySeconds parameter.
So we have a queue.
Our producer will send a message to that queue
and the queue, for example, has a default value
for how long that message should be delayed.
And so maybe it's like 30 seconds.
And so after 30 seconds, then when a consumer polls
for messages, it will see that message
and receive it successfully.
So let's go into the console to see
how that works in practice.
So back in SQS, I'm going to create a queue
and I will call this one DelayQueue.
And as we can see here, we have a new setting
called delivery delay.
And so by default, it is zero seconds but we can set it
all the way to 15 minutes.
So I'm just going to set this to 10 seconds
so that messages will wait 10 seconds
before being read by a consumer.
Okay, the rest will be standard so we'll just go ahead
and click on Create queue.
Now my delay queue is created.
I will go ahead and send and receive messages.
And let's enter a random message.
Now, as you can see, by default, the deliver delay
has been created into the console
and it says 10 seconds but we can override it.
For example, you could say 30 or we could say zero
or maybe longer but we'll leave it as a default
of 10 seconds.
So I'm going to start polling for messages.
And as you can see, no messages are received.
And I'm going to send a message right now.
And we have to wait 10 seconds.
One, two, three, four, five, six, seven, eight, nine, 10.
And hopefully by now the message should appear
in my consumer.
And here it is. It's been 10 seconds.
And so, as you can see, there was a delay between the send
and the actual delivery of that message.
And for some use cases, this may be something
that you want and that's something that may be desirable.
But as a certified AWS person, you should know
that this functionality exists.
So that's it, very short demo but I hope that was helpful.
And I will see you in the next lecture.