
<v Instructor>Now let's talk</v>
about dead letter queues in SQS.
The idea is that let's get into the scenario where a
consumer fails to process a message
within the visibility Timeout Period.
Then we know that the message automatically
goes back into the queue.
So the consumer reads the message.
Maybe there's a failure.
Maybe we don't have enough time.
The message goes back into the queue.
Now, if that's the thing happens very often,
that can be a problem.
For example, we read again the message.
Maybe there's something wrong with the message.
Maybe your consumer doesn't understand the message or can't
process the message.
Then the message will go back into the queue
and it will happen again.
We'll read the message again from SQS,
and it will go again back into the queue.
So we can set a threshold to how many times
this can happen.
And this failure loop can be a big problem,
but we can set a maximum received threshold.
And if that threshold is exceeded,
then we can tell SQS to say, well,
this message looks a bit odd.
It looks like it's being processed too many times and not
successfully, therefore send this into a dead letter queue.
And the dead letter queue will contain
that message and for later processing.
And so the message will be removed from the first queue and
sent into the second one.
Why do we have data queues?
Well we have them for debugging.
It's very helpful.
For example, when some messages
cannot be processed to send them into a DLQ
or dead letter queue and have an application later on
analyze this message or someone analyze this message and
understand why they made our application crash or why they
were not successfully processed.
Now, because the messages are in the dead letter queue,
and this is also an SQS queue.
They will expire at some point because there is a limit to
the message retention period.
And so it's never a bad idea for your dead letter queues to
set a really high retention,
maybe 14 days to make sure you give yourself enough time to
read the messages,
process them and understand what went on
with the failure of processing.
So let's go in the console to see how we can enact this.
So let's go ahead and practice dead letter queue.
So first I need to create my dead letter queue.
So let's go in here into standard
and I'll call it Demo Queue DLQ.
So this is a dead letter queue.
And remember, because messages should be persisted
for a very long time
into the message rejection period.
I'm going to change from four days to 14 days to make sure I
give myself ample time to analyze these messages and not
lose them for no reason.
So 14 days is a long message rejection period,
which is great.
Now I'm going to scroll down,
everything looks good and I will just go ahead
and create this queue.
So my DLQ has been created and now I need to configure
my first queue.
So let's refresh this to see my, both my queues.
Here we go.
I need to reconfigure my first queue to designate
this one as the dead letter queue.
So let's go and edit the settings of this one.
And I am going to scroll down.
First I will set the visibility timeouts
to something like five seconds to ensure
that the cycle is very,
very quick for the demo.
And I will scroll down.
And at the very bottom,
there is the dead letter queue configuration.
I should enable it.
And then I choose a dead letter queue.
So I will choose my queue named Demo Queue DLQ and
now we can set how many times a message should be
sent into my GL queue.
So between one and 1000.
So if you expect the message to be maybe reprocessed up to
10 times, then you should do up to 10, but for this demo,
I want to show you quickly how it happens,
so I will say maximum received is three.
That means that after a message is received three times,
if it was put back yet again into my SQS queue,
please send it to this DLQ,
so that I can troubleshoot it later on.
So let's save this and let's play with this demo.
So here is my DLQ on the left,
my normal queue on the left hand side,
and my DLQ on the right hand side.
So what I'm going to do is I'm going to go into my DLQ
and I'm going to start a consumer polling for messages.
And as you can see right now,
we have zero messages available.
Now into my normal queue,
I'm going to go again, send and receive messages,
and then we'll enter a hello world, poison pill.
Poison pill because we just assume
this will make my application crash
and it will not be able to be processed correctly.
So I'll send that message and the message has been sent
and ready to be received.
And so if I start pulling from messages,
as we can see the message is right here and has been
received one time.
Now has been received two times because it
was already put in back in the queue.
And very soon it received three times and I'm still not
being able to process it, I don't delete it.
And very, very soon,
what you'll see is that this message
will not be received a fourth time,
because if we go to these other type and just pull again
for messages, it has been sent into my DLQ.
So, because we haven't had the chance
to process that message,
then automatically it went above the threshold of the
maximum number of receives.
And it was sent into the DLQ and in the DLQ we can go ahead
and look at this message and try to understand why
this message is making our application crash.
And that's it.
So I hope that was helpful,
I hope that was a good demo of DLQs.
I hope you liked it and I will see you in the next lecture.