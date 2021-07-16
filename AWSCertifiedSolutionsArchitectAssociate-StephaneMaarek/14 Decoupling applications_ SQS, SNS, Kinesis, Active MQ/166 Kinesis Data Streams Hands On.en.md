
<v Instructor>So we are going to play with Kinesis.</v>
But Kinesis is something you have to pay for.
So if you wanna remain within the free tier
do not do this tutorial,
just the watch the video.
Otherwise you're going to start incurring costs for Kinesis
and Kinesis can be expensive very quickly.
So here you can get an overview of Kinesis.
Basically it shows you all the data that should flow
in your system.
And so on.
So let's click on get started.
And so we can get different use cases.
The one that we have
is we're going to create a data stream
but you can create something called a delivery stream
so that's Firehose.
Analytics applications, so that's Kinesis analytics
and then you can even do video streams.
It's something I haven't mentioned but it's possible
to do with Kinesis.
But I think it's out of this scope for the exam.
So the first one we want to do is to create a data stream.
Now the stream name is going to be my-first-stream.
And the shards
is how many times we want throughput capacity.
So again, each shard will ingest
up to one megabyte per second
or 1000 records per second.
And you it will emit up to two megabytes per second.
So we need to ensure
that we have enough shards for what we want
and there's a little nifty calculator right here
to compute the number of shards you should need.
For my purpose I'm going to go low on cost
and going to create only one shard.
Because I don't want to overpay.
But you can go up to 200 shards.
Don't put in 200 shards until you have
really really high throughputs.
So now with this number of shards
I get one megabyte per second
which is more than enough.
1000 records per second or two megabytes per second
on the read side.
This is great.
I'm going to create that Kinesis stream.
Remember that you are going to pay for shards,
so be careful when you create one.
Now generating a shard usually up to a minute
so this is something that is not immediate.
Because a lot of things happen on the back end.
So I'll just pause the video.
So my stream has been created.
And now I'm able to click on it
and see the details.
So I can see the ARN, I can see that it is an active,
it's actually suggesting me how to use
to send data using the Kinesis Producer Library or KPL.
And how to receive data and so on.
If you scroll down we can see that we have one shard
that is currently open.
So one shard is used, zero shards closed.
I have not enabled server-side encryption but I could.
And how long I want to retain my data for,
so I can go up to 168 hours but I'm going to pay more.
I'm just going to keep it at 24 hours right now.
So I get one day of retention of data,
after this data goes away.
And if I wanted to,
I could have shard level metrics.
To basically capture all of these metrics saying,
incoming bytes, incoming records, outgoing bytes
outgoing records, which is very nice
when you start basically setting the stream.
The next thing I want to do is go to monitoring.
And so these would be basically all the metrics
that I get will appear right here.
As you can see right now, I don't have anything
because I haven't started producing data clearly.
So we have all the limits,
this is going to be the limit for my get bytes,
and this is going to be my limit for my incoming data
so we can visually see if we're going to hit these limits
and get these provision throughput exceeded errors.
Now we have tags
which is interesting if you wanted to manage your streams.
And then something called enhanced fan-outs
which I would just leave for now.
So let's go ahead and we want to basically produce
to that stream.
So in my CLI I'm going to use aws Kinesis
and I will type help.
Help will give me the commands there are
and so there is a create-stream command,
we will not use it.
Delete-stream, we will not use it as well.
There's describe-stream that's going to be interesting.
There's going to be a list-shards,
that's going to be interesting as well.
List-streams and so on,
so let's start by list-streams.
So we'll do list-streams and then help.
And this is how to get all the streams in our accounts.
And I don't need to set any of these parameters right here.
So I'll just do
aws Kinesis list-streams.
What we get out of it, is the stream name,
my-first-stream, so this is the one we just created.
Now there was a describe-stream as well
that we'll want to get information on ,
so I'll just use the help.
And for the describe-stream,
it takes one parameter which is
the stream name.
So I'm just going to use this.
I'll say the stream-name is
and we can get the stream name right from above,
my-first-stream.
And here we get a bit more information around
what our stream is.
So we can see that we have shards
and we only one shard right here
the shardID is 000 so that's the first one.
And we can get information around the stream name,
how long my data is going to be retained,
the kind of enhanced monitoring I have enabled,
if there's an encryption, and so on.
So this is great.
We have our shard but now we would like to send data to it.
So let's go back to the help of Kinesis.
And look if there's anything that would allow us
to do this.
And if you scroll all the way down, there is a
put-record call.
So let's use put-record
to see if we get any good information out of it.
And let's go to help.
Okay.
So we've put-record,
we're going to see what parameters are needed,
we need to provide a stream-name which we have.
The data
which is a blob
and so it needs to be, the payload before
base64-encoding.
So we'll just have just some data we want,
and then finally, the partition-key
which is how do we assign the data to whatever partition
or shard.
So let's just go have a look with this.
So I'll go and copy this entire thing,
just not to forget it.
And quit this
So let's list the streams again
and then we're going to set aws Kinesis put-record.
And so what we want to do is the partition key,
I'm going to say user_123
because we have the user ID 123.
The data is
we'll just say user signup.
But it's just whatever you want it to be.
The stream name is going to be my-first-stream,
straight from here.
And then I'm going to put this into one line,
to have put-record.
Okay this is our put-record.
And I've used it so now I send the data,
user signup,
and I've used a partition-key user_123.
And what I get out of it is the shard it went to,
so it went to my first shard,
and I only have one shard so that makes sense.
And the SequenceNumber, I guess,
so this is the whole sequence number for this data
so it's a pretty long number, should I say.
If I send another message for example,
I'll say user login.
I get an other SequenceNumber,
if you look at the end I had 46 before,
now I have 58.
So I can send as many records as I want.
Maybe after my login,
he just visits homepage
and I get all this stuff.
So I can send as many messages as I want
and this is great.
What we want to do now
is to retrieve these records.
So let's go back to the Kinesis help.
This is always helpful to know what happens.
And so if we scroll down,
there is a get-records and get-shard iterator.
Now I know how things work,
we need to use get-shard-iterator first
and then we'll use get-records.
So let's have a look at the get-shard-iterator help.
So aws Kinesis get-shard-iterator help.
And we scroll down and this is basically to get started
on reading a stream.
And we have to use the stream name,
the shard ID we want to consume from
and the shard-iterator-type which is going to say
if we scroll down,
for shard-iterator-type we get the option
to start consuming at a specific SequenceNumber
after a SequenceNumber at a timestamp,
TRIM_HORIZON which is basically starting
from the very very beginning, the oldest data in our system,
or latest, only read new records.
So for us, we'll use TRIM_HORIZON.
So let's go
and just scroll up just to make sure we don't forget this.
Okay I'll quit and so I'll paste this.
So the shard-iterator-type is going to be TRIM_HORIZON.
The shard-id I just don't remember exactly
how it was written
so we'll get it straight back,
and the stream-name is my-first-stream.
I'll put this into one line.
And I'll just save this command
so let's get back our streams as to describe
to get back the stream.
And so the shard-id is right here
so I'll just use this shard-id.
That I'll input and paste here.
Press enter.
And so now what I get out of it,
is a shard-iterator.
So this shard-iterator is going to be very helpful
when we get records.
So for this, the command line is get records,
and we'll need to also do the help
just to make sure we do it correctly.
So get-records and I'll view the help.
And so in get-records if we scroll all the way down,
we just need to provide a shard-iterator
and then we'll get some values.
So let's do this, shard-iterator,
and I'll just copy this entire blob of text
so I'll just copy this with the quotes as well
and press enter.
And here we go, I'm getting three records.
So we can see that we have record number one,
two, and three.
And we can see that PartitionKey was what I said before,
so it's user_123 for the three messages.
And we can see the ApproximateArrivalTimestamp
so we can know when the data arrived
into the Kinesis system.
And we get the data.
But the data isn't really what we had sent to Kinesis,
is it?
It's this weird blob of text.
Well this is something called base 64 encoded data.
So to deal with I have to go and type base 64 decode online
and get the first website.
S0 I get my data from the right side
that I put into the Base64 decode and I click on decode
and what I get out of it is user signup.
I could do the very same thing
by copying this whole blob of data in here
and remove the previous one,
click on decode and here I get user login.
So we're able to decode the data from the right side
given by Kinesis using this website
but you could use it programmatically as well.
And this basically allows us to read our records in Kinesis.
So that's about it
and then just you finish with Kinesis,
you would go in the stream and to ensure we are not going
to be overpaying our stream,
we can just go to the stream and delete that stream
and say delete and this way we're done.
Because we pay for the provision shards, remember.
So that's it for Kinesis,
it's a very light introduction
but we saw how to produce, receive and use streams
using the CLI.
I hope that was helpful and I will see you
in the next lecture.