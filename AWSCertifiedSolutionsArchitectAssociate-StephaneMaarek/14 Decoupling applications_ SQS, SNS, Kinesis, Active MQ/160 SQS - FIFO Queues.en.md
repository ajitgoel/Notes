
<v Instructor>So let's talk about</v>
the other kind of queues available in SQS
called the Amazon SQS FIFO Queues.
FIFO means first in first out.
What this means is that the messages will be ordered
in the queue and the first message to arrive in the queue
will be the first message to leave the queue.
So this is more ordering guarantee that we can get
from a standard queue.
So let's take an example of a producer
sending messages into your SQS queue,
the first message, then the second,
the third and the fourth.
And because we have an SQS FIFO queue,
then the consumer will pull the messages
from the SQS FIFO queue and receive the messages
in the exact same order.
Now, because we have such a constraint
and guarantee about ordering,
this SQS queue has limited throughput.
So you get 300 messages per second without batching.
Or if you send batches of messages,
you can get a throughput of up to 3,000 messages per second.
But thanks to FIFO queue,
we get more guarantees and more constraints.
So we have exactly-once send capability
by a feature that allows SQS FIFO queue
to remove duplicates.
And we also know that the messages will be processed
in order by the consumer.
So FIFO queue is something you should see
whenever you have decoupling,
but also the need to maintain the ordering of messages,
and also make sure that you are
on this throughput's constraints
that you are not sending too many messages into SQS, okay?
So let's go ahead and create our first FIFO queue.
So let's go and create a queue
and I will create a FIFO queue.
So as you can see, it's first in first out delivery
and the message ordering is preserved.
Okay, so I will name it demoqueue.fifo
and you have to end it with .fifo.
Otherwise, you will not have the ability
to create this queue.
It has to end with .fifo.
Now, if we look at the configuration,
it looks very similar to before,
but we have one more setting
called content-based deduplication.
This is to deduplicate the messages
if the same is sent twice
in a very small five-minute window.
Access policy will be left the same.
Encryption and so on will be left the same.
So I'll create this queue.
And now if I go to send and receive messages,
we can have a look at the message body.
I can say, Hello World 1.
And then I will have to specify a message group ID.
I'll call this one demo
and we'll use the same message group ID all along this demo.
So demo is sent and a deduplication ID,
excuse me, I will say it's my message number one,
so I'll say ID one.
Send this message.
I'll do Hello World 2, the same message group ID,
and I will say deduplication two.
And then message a third one
and I will say three in here
and finally the fourth one and I will say four.
Okay, so now the messages have been sent
and they're ready to be received.
And so we have four messages available.
And if I pull four messages, we look at all the messages.
And if I look at this one, it's actually in the wrong order.
So if I look at the bottom one, which is the first one,
it says, Hello World 1.
Then if I look at the second message, Hello World 2.
The third message I have Hello World 3.
And the fourth message I will have Hello World 4.
So this is a guarantee that you get thanks to FIFO queues.
Then you go ahead and delete these messages and you're done.
So that's it.
I hope that was helpful.
And I will see you in the next lecture.