
<v Narrator>So let's practice using SQS.</v>
So let's go into the SQS console,
close this message and create a queue.
So, when we create a queue in SQS,
we'll see we have two choices, Standard and FIFO,
and FIFO we'll see in it's own time.
So, for now we'll just focus on Standard.
Okay, now we have to name the queue.
So I'll call this one DemoQueue,
and we need to configure that queue.
So the queue has a lot of parameters,
we'll see the visibility timeout impact in the next lecture
we'll see delay as well in the next lectures,
we'll see this as well in the next lectures.
A lot of things we'll see very soon.
The message retention period is four days
but we can set it anywhere between one minute and 14 days.
So this is how long the message will stay
in the queue waiting to be processed
before being dropped automatically out of the queue.
And the maximum message size as you can see,
the very maximum is 256 kilobytes,
but it could be anywhere between one kilobytes and 256.
Okay, so next we have to define an access policy.
And the access policy is who can access the queue.
By default, we can...
Only the queue owner can send a message
to the queue and receive message from the queue.
But you can, if you use these drop-down,
you can set other accounts, roles,
or IAM users that could send messages into the queue,
which is very helpful if we do some integrations
with Amazon S3 or Amazon SNS.
But for now, we'll just keep it to only the queue owner.
And if you knew what you're doing,
you could just directly go
and edit this JSON policy in-line,
to say who can write to your SQ SQ.
We'll use the basic one,
but as you can see,
this JSON policy right here,
looks a lot like an S3 bucket policy
because they have the same purpose.
This is to define who can access,
an Amazon SQ SQ if you do cross-account
or different roles or stuff like that.
Okay, so for now we'll keep it as basic.
This is a basic hands on.
Queue encryption is possible.
So we have in-transit encryption enabled by default,
but you can add at-rest encryption
by enabling server-side encryption,
in which case we have to choose a CMK.
And so we can ensure the default CMK,
or we can choose an alias if we create our own key.
But for now, I'm just going
to use the default CMK,
to get encryption on this queue.
And the data key reuse period is,
how long the same data key should be used
to encrypt the data.
For now, you can just leave it as five minutes,
this is fine.
Okay, dead-letter queue we'll see as well later on.
So let's create this queue.
And now the queue is successfully created.
So, we can go ahead and send and receive messages from it.
So we get a lot of different panels in this UI.
But what we want to be doing is to go
to the top right-hand side
and click on send and receive messages.
So here is a facility for us to send messages
and then at the bottom to receive them.
So as we can see right now in the queue,
we have zero messages available.
But if I enter hello world in the message body,
and then send the message.
As you can see the message is sent,
is ready to be received.
Now we have a messages available one.
And so in here, as soon as I click on poll for messages,
the messages will appear.
So let's have a look.
I click on poll for messages,
and yes, we did receive that message right here.
As we can see, we have a message ID,
and if you want to look at the content of the message,
I click on the message details,
and I can have some information.
So there's a lot of metadata around that message.
For example, the hash of the message,
who sent it, how many times it were received.
So just one time right now,
because we have...
This is the first time we posted this message,
the size in bytes, and if we go and want
to receive the body itself,
we can see that whatever I sent before hello world,
has ended up right here in the message I just read.
If we created attributes for the message,
there was a message attributes panel that we didn't look at,
we could create key values and read them from here as well.
So, very simple what you would expect,
when you send a message and then read it,
you get the exact same message.
But we have decoupled
because a producer has sent some information,
and a consumer has received that information.
Now we can see that the message has been received twice
because we didn't process it in enough time.
So after 30 seconds, the lowest,
the message went back into the queue,
and we received it again.
So if I poll for messages,
now the message received count is three.
So it has been read, yet again another time.
So to be done with this message,
because say we've processed this hello world message,
I'm going to click on it,
and then I'm going to click on delete.
And by deleting the message from the queue,
we have signaled to the SQ SQ,
that the message has been successfully processed.
And therefore,
we have zero messages available in the queue,
and if we poll again,
we will not receive the same message again
because we have deleted it.
So you start seeing the power of queues.
We could go ahead and send,
many times different messages,
hello world, and so on,
and you can just play with it,
and this is how you would set message attributes,
but this is out of scope for the exam.
And here, you would receive these messages,
and you can receive many messages at a time.
So if we send hello world,
we'll send that message again,
and hello world 2, for example,
and send that message, and hello world 3,
whatever you want really in that message.
As we can see, as soon as I refresh this window,
we can see that the number of messages available is three.
And so if I poll for messages,
I will get three messages available in here,
to be processed.
And again, you can take them all
and delete them to signal to SQS
that they have been processed.
So fairly easy, but you've seen the power
of producers and consumers.
Now back in the queue,
with just a few options as well,
we can see out.
So we can edit this queue
to edit all the configurations
that we've seen from before.
Or you can purge the queue,
this will delete all the messages in the queue.
And so to delete all the messages,
you just need to type purge,
and it will go ahead and remove everything,
which is very helpful when you do developments.
But I don't think you should do this in production.
And then you get some information around monitoring,
for example here, which gives you some information
around how many messages are in the queue,
what's the approximate age of the oldest message;
which could be another way to scale your SQ SQ
if you have an Auto Scaling group reading from it,
and so on.
And finally, access policy,
which is who can access the queue and how
and encryption we have enabled,
which is saying we use this encryption key
to encrypt the messages at-rest.
So that's it for the overview of SQS.
We'll have a look at a few more options in a second
but I hope that by now you understand better how this works
and I will see you in the next lecture.