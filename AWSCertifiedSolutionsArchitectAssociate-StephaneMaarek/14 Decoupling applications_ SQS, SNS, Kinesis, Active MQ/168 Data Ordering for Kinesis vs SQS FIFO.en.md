
<v Instructor>So let's have a lecture about</v>
how data is being ordered for Kinesis and SQS FIFO.
Because even though these technologies look similar
and have some similar capabilities, they're actually very,
very, very different.
So let's have a little case study.
Imagine you have 100 trucks on the road,
and each truck will have a truck ID.
So truck one, truck two up to truck 100
and they're on the road and they're going
to send their GPS positions very regularly into AWS.
So we want to consume that data in order for each truck so
that we can track their movement accurately,
we wanna know where there've been in order obviously, right?
So how should we send that data into Kinesis?
Now the answer is you should use a partition key.
And the value of that partition key is the truck ID.
So the truck one will send it for the batching key truck one
and then truck two will send
for partition key truck two et cetera, et cetera.
Why?
Because if we specify the same partition key
then the same key will always go to the same shard.
Now let's have a look at a diagram
to better understand this.
So we have our Kinesis Data Stream and it has three shards
one, two, and three.
And to simplify things, I'm not going
to show you 100 trucks, but five should be enough.
So we have five trucks, and they're on the road
and they're sending the data into Kinesis.
As I said, we choose the partition key to be truck ID.
So that means that my truck one,
when it's sending it's GPS data, it will send it to Kinesis
with the partition key, truck one and Kinesis will say,
okay, partition key truck one, I will hash it
I mean we'll do a computation.
And in this instance, it figures out that truck one
should go into shard number one.
So my data will go into shard number one.
Then the truck two will be sending its data as well
and will send a partition key of truck two.
And Kinesis will look at this partition key
and say I've hashed it and now it looks like you should go
into shard two.
Same for truck three so truck three will be on the road.
And it will send truck three as the partition key.
But this time, the Kinesis Data Stream service will hash
that truck three as the key and say you should go
to shard one and that's fine.
It just says it doesn't have to be shard three it just says,
this partition key should go to shard one.
Now for truck four, it will go to shard three
and for truck five, it will go to shard two.
So this is the idea now we have a repartition
and it's called partition hence the name partition key
of each truck on each shard based on the partition key.
And because truck one
keeps on sending the same partition key which is truck one,
then the data will always go to the same shard.
Hence so on the next data point for the truck one
will be in shard one and the next data point
for truck three will be in shard one as well and so on.
So anytime the truck one sends data, it will be in shard one
and anytime the blue truck,
the shard three sends data
then it will be in shard one as well,
because we are specifying
to use the same partition key over time.
So we see here is that truck one
and three will always have the data into shard one.
Now if we look at the shard two, then only truck two
and five will have the data into shard two.
And if you look at shard three, in this example,
we only have the truck four that will send its data
into shard three.
So now imagine you have 100 trucks and maybe five shards,
then each shard on average will have about 20 trucks.
But there is no linkage directly,
you can tell between the truck and each shard.
Kinesis will have to hash the partition key
to determine which shard to go to.
The idea is though that as soon
as we have a stable partition key,
then each truck will be sending this data to the same shard
and therefore we will have the data in order
for each truck at the shard level.
Make sense?
Next we are talking about SQS.
So for SQS standard as we know there's no ordering
and that's why we have SQL FIFO,
which is First-In-First-Out.
And so if we don't use a group ID in SQL FIFO,
then all the messages will be consumed in the order,
they were sent and we can only have one customer.
So in this example, we have a bunch of options,
and they're being sent into our SQS FIFO queue.
And so the order they're being sent in
will be the order a consumer will receive them.
And as we can see, we only have one consumer here,
it consumes two batches of messages,
the first one and then the second one.
And so as we can see, this is a First-In-First-Out
and it's very easy to reason about.
And so we can only have one consumer.
So if we had trucks,
then all the trucks would be sending data into a FIFO queue,
but they can only be one consumer.
So sometimes you may want to scale the number of consumers
and you want the message to be grouped when they are related
to each other.
So for this, we can use a group ID which is very similar
to the concept of a partition key in Kinesis.
So now using a group ID, our FIFO queue,
will have two groups of FIFO within.
And so for each group that you define,
you can have a different consumer.
So in this example, we have two groups, group A and group B.
And two consumers consumer one
and two can read independently, the group one
and the group two.
And so the idea here is that the more group IDs we have,
the more consumers we can have.
So this is a very different model from Kinesis.
Let's have a look, so if we have Kinesis versus SQS,
and we have 100 trucks, five Kinesis shards
and one SQS FIFO queue.
So if we have Kinesis Data Streams, then on average,
you'll have about 20 trucks per shard,
thanks to the hashing, so each truck
will be designated one shard
and will stay in that shard forever.
And the trucks will have their data ordered
within each shard.
But the maximum amount of consumers
we can have in parallel can be only five
because we have five shards
and we need one consumer per shard.
So the Kinesis Data Stream though because it has five shards
can receive up to five megabytes per second of data,
which is quite a high throughput.
Now in regards to SQS FIFO,
you can only have one SQS FIFO queue okay?
So you don't define shards or partitions
or anything like this, you just have one SQS FIFO queue.
And because we have 100 trucks,
then we can create 100 group ID, each equal to the truck ID.
And that means that because we have 100 group ID,
we can have up to 100 consumers, okay?
Each consumer will be hooked to one specific group ID.
And in terms of scale as SQS FIFO can have
up to 300 messages per second, or 3000,
if we use batching.
So these are different model of consumption,
of production, of ordering.
And so what you have to remember is
that based on the use case, sometimes is going
to be better to use SQS FIFO.
If you want to have a dynamic number of consumers
based on the number of group IDs,
and sometimes it could be better to use Kinesis Data Stream
if you have say 10,000 trucks and you need
to send it lot of data,
and also have data ordering per shard
in your Kinesis Data Stream. So I hope that was helpful,
like I know it can be complicated
to understand these things and they're more low level
but the exam is starting to ask you questions about that
and so I wanted to make sure
that you understand very clearly what this would entail.
So I hope you liked it
and I will see you in the next lecture.