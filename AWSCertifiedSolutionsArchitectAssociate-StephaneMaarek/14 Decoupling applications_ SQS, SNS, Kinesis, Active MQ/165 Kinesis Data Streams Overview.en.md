
<v Instructor>So Kinesis has become</v>
an increasingly popular exam topic.
And you don't need to know it in and out
but you need to know what it is, how it works,
and a few details so this is what I'm going to give you.
So Kinesis is a managed alternative to Apache Kafka.
Now if you don't know Apache Kafka that is fine.
Kinesis is quite simple to reason about.
Basically it's a big data streaming tool which allows you to
collect application logs, metrics, IoT, clickstream,
basically anything that is real-time big data.
It's compatible with many streaming processing frameworks
so you may have heard of Apache Spark, Apache NiFi, etc.
Basically these are frameworks allowing you to perform
computations in real time on data
that arrives through a stream.
Now something you should know about Kinesis
is that the data is by the way automatically replicated
to 3 Availability Zones.
Kinesis overall is you know associated with
big data real time.
That's for the exam.
Now in terms of the breakdown of the component
there's three sub-Kinesis products.
They're actually quite simple to understand.
The first one is Kinesis Stream and this is what people also
just call Kinesis which is how to ingest streams at scale
with a low latency.
Now there's Kinesis Analytics and this is to perform
real-time analytics on streams using SQL.
So this allows you to basically perform filters,
computation, aggregations in real-time
just using the SQL language.
Finally, you have Firehose which is to load your stream
into other parts of AWS such as S3, Redshift,
ElasticSearch and so on.
The main focus on the exam is going to be on Kinesis Streams
and this is what we'll explore in this lecture.
But I'll give you a quick rundown in the next lectures
on analytics and Firehose.
Now if we look at Kinesis at a high level,
what does it look like?
We have Kinesis in the middle.
And it's composed of Kinesis streams.
Now how do we get the streams?
Basically our clickstreams, IoT devices and metrics and logs
will be producing data directly into our Kinesis streams.
Now that we have the data into Kinesis streams,
Kinesis wants you to process the data and maybe the form
fraud, computations, metrics, monitoring, alerting,
whatever you want and for this you will need to perform
some computation in real-time.
So this is Amazon Kinesis Analytics.
And then once these computations are done,
it's good to have them stored somewhere into you know,
S3, database, Redshift, et cetera.
And so you would use Amazon Kinesis Firehose.
For example to put it in S3 or in Redshift.
So the high level Kinesis is in the middle
for the streaming real-time data.
And it allows you to basically quickly on board
data in mass in real time from your big data use cases
all the way to the analytics and to the final store
where you want to keep your data for a long time.
So let's do dip dive into Kinesis Streams.
And this is the really important part for the exam.
Streams are divided into ordered Shards or Partitions.
So a Shard is basically think of it as one little queue.
Okay and so we have our producers and it's going to produce
to a Kinesis stream maybe this one has three shards.
And so the data is going to go into either shard
and the consumers will be consuming
from either shard as well.
So if we wanna scale up our stream we just add shards right.
Think of like lanes in a highway.
The more lanes we have on the highway the more throughput
we'll have on the highway, the more cars can go through.
Same with shards right now we have three shards,
but if wanted a higher throughput
we would increase the number of shards.
Now in this shard the data is not there forever.
By default it's here for one day.
We can set it up so each shard
can keep your data up to 7 days.
So why would you have such short data retention?
Well because Kinesis is just a massive highway,
it's a massive pipe.
And so you want to process your data do something
and put it somewhere else as soon as possible.
Kinesis is just a tool which allows you to have that
throughput in real-time.
Now Kinesis is also awesome because it allows you to
reprocess and replay data.
And so that's a big difference with SQS.
SQS once the data was consumed it was gone.
But with Kinesis the data is still there.
And it will expire after some time.
So you're able to reprocess, replay data.
Go back a little bit in time to do whatever you need to do.
You're also able to have multiple applications consume
the same stream so sort of like an
SNS of a mindset right here.
We need to just have one stream with a stream of data
and we can have many applications,
many consumers consume the same stream.
So now this enables you to do real-time processing
and you have a real scale of throughput
because you can add shards.
Now something you should know
is that Kinesis is not a database.
Once the data is inserted into Kinesis you cannot delete it.
It's called immutability.
So you add data it's called a log, you add data over time
and then you process it using consumers.
The data will stay in Kinesis for one to seven days
and then you do something with it.
So that's the idea of Kinesis at a high level.
Now if we go into shards, basically,
we know that streams are made of many shards.
But a shard represents one megabyte per second
or 1000 messages per second on the right side.
So the producer can write up to 1000 messages per second
or one megabyte per second.
On the read side you have two megabyte per second
throughput per shard so it's very simple right.
If you need five megabytes per second of throughput
for the read side, how many shards do you need?
Probably three and for the right side, five.
So this is how you scale your shards.
Now the shards are provisioned and so you're going to pay
for how much shards you provisioned.
And you can have as many shards as you want
but if you over provision your shards and you're not using
them up to their full capacity you're going to overpay.
Similarly if you have more throughput than your shards
then you're going to have throughput issues.
You have ability to batch the messages and the calls.
And this allows you to basically
efficiently push messages into Kinesis.
The number of shards finally can evolve over time
and it's actually encouraged for you to add and remove
shards and to enable some kind of
other scaling for your Kinesis stream.
So finally the records will be ordered per shard okay.
So in SQS we had no order, in SQS FIFO we only had one queue
and all the records were going to that queue.
Kinesis is sort of in between we can have many shards
and the records are going to be ordered per shard.
So how does it look like for the increasing the shards
and merging the shards with a producer.
And with three shards maybe someday we can get a higher
throughput so we add a shard, this is called resharding.
And then maybe one day we get less throughput so we go back
to three shard is called merging.
And maybe the throughput goes even lower
and we have two shards we merged again.
And the consumers and the producers know
how to react to the exchanges
and change their consumption patterns.
Now producer aside, there is something call put records.
And put records is a way to send data to Kinesis.
And for this you need to send data in a partition key.
So your data is the gray box
and the message key is the orange box
and the message key is whatever you want as a string.
And this key will get hashed to determine the shard ID.
So the key is basically a way for you to root the data
to a specific shard.
And so the rule is that the same key
always goes to the same partition.
And so if you want to get all your data in order for a same
key then you would just provide that key to every data point
and they will be in order for you.
Now when your data is produced, now the messages know
where to go which shard because of the message key.
And so your data will be produced to shard one, two, three
or four okay but not all of them at the same time.
Your data only goes to one shard at a time.
So the messages when they're sent to a shard,
they get a sequence number and that sequence number
is always increasing okay.
And if you need to choose a partition key,
you need to choose one that is going to be
highly distributed that is again an exam question.
You need to know that your partition key must be very
distributed that prevents the hot partition.
Because if your key wasn't distributed,
then all your data will go through the same shard
and one shard will be overwhelmed.
That's called a hot partition or a hot shard.
So if we have an application and you have one million users,
user ID is a great key right because we have one million
users and so realistically all the users will do actions
in different times but we're gonna get ordering for that
user ID which is our message key
and so user ID is a good one.
Very distributed, very active
and useful from a business perspective.
But if you have country ID as a field and it turns out
that 90% of your users are in one country say
The United States then it's not good because
all your country ID will go to one shard.
And so you get 90% of your data onto one shard
and that shard will be overwhelmed
and it'll be a hot partition.
So the bottom line is you want to choose something
that is going to be well spread
with a diverse range of data.
Now you can use batching with put records to
reduce costs and increase throughput.
And if you get an exception called
ProvisionedThroughputExceeded
that's when you go over the limits.
And for this you can just use retries
and exponential backoff.
Now to produce messages while seeing a lecture we'll use
CLI, but you can use the SDK or producer libraries
from various frameworks.
Now the exception is when we get that exception,
the ProvisionedThroughputExceeded, this is happening
when we send more data than what was provisioned.
Okay so we exceed the number of megabytes per second
or transactions per second.
And so we need to make sure we don't have a hot shard
that our partition key is good instead of bad.
Because otherwise too much of that will go to one partition.
And so the solution is to do a retry with backoff
or to increase the number of shards
or to ensure that the partition key is a good one.
Now after producers we have consumers.
And so you can use a normal consumer
using the CLI, the SDK,
or you can use something called the Kinesis Client Library
which is available in Java, Node, Python, Ruby or .Net.
And so it uses also something called DynamoDB
that we haven't seen yet,
but it will use DynamoDB to checkpoint the offsets
and KCL will use DynamoDB to track other workers
and share the work amongst shards.
So basically this is our Kinesis stream.
We'll have a DynamoDB table and the Kinesis app
that uses KCL the client library.
We'll checkpoint the progress through Amazon DynamoDB
and then they will synchronize their work
between them to consume messages from different shards.
Now that's a little bit events but just remember,
that the KCL basically enables
to consume from Kinesis efficiently.
Finally I want to briefly touch upon Kinesis Security.
So we can control access and authorization to Kinesis
using IAM policies.
We get encryption in flight using HTTPS endpoints.
We get encryption at rest using KMS.
There is a possibility to also encrypt and decrypt
the data client side but it's much harder to implement.
You need to write your own code.
And you can also have VPC Endpoints available for Kinesis
to access privately within a VPC.
So that's it for a high level overview of Kinesis.
Don't get overwhelmed with this.
Kinesis is just very simple.
Remember what a shard is,
remember what's the purpose of Kinesis,
that it's a big data, that it's real time.
And let's go in a quick lecture just to practice.