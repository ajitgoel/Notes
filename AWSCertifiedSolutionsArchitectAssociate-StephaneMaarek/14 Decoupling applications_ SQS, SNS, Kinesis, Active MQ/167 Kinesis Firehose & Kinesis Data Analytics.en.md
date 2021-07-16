
<v Man>So a theory lectures on two other kinesis offerings</v>
and the first one is Kinesis data firehose.
So Kinesis data firehose is a fullly managed service.
There is no administration needed, it scales automatically,
and it going to be fully serverless.
We're going to prevision anything in advance.
What is Firehose used for?
It is used to load data into Redshift, Amazon S3,
ElasticSearch and Splunk.
And you need to remember the four here.
So Redshift, Amazon S3, ElasticSearch and Splunk.
It's going to be near real time.
So it's different from kinesis that extremes that
was real time.
This is near real time.
That means that 60 seconds latency minimum
for non full batches.
So if you send some data, it goes through Firehose,
it can take up to 60 seconds to be loaded
into Redshift for Amazon S3 and so on.
Or Firehose will write about 32 MB of data
as a minimum, at a time to load into these stores.
So what you need to remember that it is
near real time.
It's support many formats, conversions,
transformations, and compression.
So it's quite handy regarding if you have CSV,
Jason and so on.
And you only pay for pay the amount of data
going through Firehose.
So you don't pay for provisioning Firehose.
But you do first data streams.
So then fire is a great, great way ingest data
into Redshift, Amazon S3 in a serverless way
and only pay for what goes through Firehose.
So as a diagram, we have Firehose in the middle,
and we have data sources it could be
Kinesis Producer Library, a kineses agent,
a kinesis data stream so they are important.
Both the agent and the kinesis data streams
can send data directly into the data firehose.
Or it can even be CloudWatch Logs or
CloudWatch Events.
And then you can do some transformations
using a Lambda function.
And finally kinesis can send data to
Amazon S3, Redshift, ElasticSearch and Splunk.
So that make Kinesis data firehose a great service
to transport data and do data ingestion
in near real time into these data sinks.
From and exam perspective you need to
really remember, that it can do it in
Amazon S3 and Redshift.
But it is possible that ElasticSearch and Splunk
will come up as well.
So you may have a question, "what is really
the difference between kinesis data streams
that you showed me before and Firehose?"
Well streams is going to be when you write
custom code.
You need to write your own producer,
your own consumer most of the time.
And it's going to be real time.
About 200 ms latency.
You must manage scaling yourself so you must
do something called shard splitting or
shard merging.
And so that means that you have to do
capacity planing over time.
But the cool thing is that you can store data
in streams so it can store data
and it is going to expire between one to seven days
and you can configure this.
Thanks for this you can do replay capability
and it's multi consumers.
So if you need a place to just store data
for three days.
kinesis data streams is a great way of doing it.
For Firehose, it's a little bit different.
It's fully managed, you're only provision capacity,
and you send data to S3, Splunk, Redshift
and ElasticSearch.
It's serverless so data transfromations
with Lambda.
It's near real time so the lowest buffer time
is going to be one minute or sixty seconds,
and there's automated scaling.
And finally good to know this,
there is no data storage.
So you cannot replay from Firehose.
Firehose and it's store in data.
It's just here to help you ingest that data
but first into the target syncs you want.
So the voids very clear what is the difference
between Streams and Firehose.
And you need to know obviously to distinguish
in the two going into the exam.
So if there is a scenario that tells you
hey we need to move data into S3 in near
real time.
Firehose is great.
But we need to analyze a stream of data
in real time maybe data kinesis, data streams
is a great option.
Talking about analyzing streams in real time,
there is something called Kinesis Analytics.
Conceptually Kinesis Analytics can take data
from kinesis data streams and kinesis data firehose
and perform some queries.
Some rather complex queries.
And the idea is that the output of these queries
can be analyzed by your analytics tools, rear outputs.
So it's going to perform a real time
analytics using SQL.
And for kinesis data analytics it's going to be
auto scaling, managed so no servers to provision,
continuous it's going to be real time
and you only pay for the actual consumption rate
of kinesis data analytics.
So out of these queries,
you can create new streams
so they can be consumed again by consumers
or by kinesis data firehose and so on.
Then you can start combining all these kinesis
things together.
So hopefully that makes sense into the overview
of all the different offerings of kinesis.
So we kinesis data streams, Firehose,
and data analytics.
I hope that was helpful and I will see you
in the next lecture.