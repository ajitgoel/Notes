
<v Narrator>Okay, so now let's talk about</v>
another architecture for Big Data Ingestion Pipeline.
So ideally we want the application ingestion pipeline
to be fully serverless, fully managed by AWS,
and we want to collect data in real-time,
we want to transform the data, we want to query
the transformed data using SQL
and the reports we create using these queries,
maybe they should be stored in S3,
and then we want to load that data into a data warehouse
and create dashboards on it.
So overall, the usual big data problems
of ingestion, collection, transformations,
querying and analysis.
So how do we do this?
And, there's some technologies, we may not have seen them
directly in this course, but that's Okay,
I'll just introduce them to you in this pipeline,
because they really help.
So, IoT Devices, let's assume that the producers of data
are IoT Devices. And so there is this really cool services
in Amazon Cloud services and it's called IoT Core,
and IoT Core helps you manage these IoT devices,
so remember this if you go into the exam.
Now these devices can send data in real-time,
to IoT Core and IoT Core directly into a Kinesis Data Stream
So data stream for Kinesis, remember,
it allows to basically pipe big data, in real-time,
very fast into this Kinesis service.
Now Kinesis can be talking to Kinesis Data Firehose
and Firehose allows us to, for example, every one minute,
put and offload data into an Amazon S3 Bucket
and that will be an Ingestion Bucket.
So here, what we've done here
is that we've had a whole pipeline to get a lot of data
from a lot of devices in real-time,
and put it every one minute into an S3 Bucket.
On top of it, it's possible for us to cleanse
or really quickly transform the data,
using an AWS Lambda function,
that is directly linked to Kinesis Data Firehose.
So now we have that Ingestion Bucket,
what can we do with it?
Well for example, we can trigger and SQS topic,
an SQS Queue, sorry, and it's optional
and maybe the SQS Queue can trigger an AWS Lambda function.
I say optional because Lambda can be directly triggered
by our S3 Bucket, but I just wanted to show you
the possibility of invoking SQS for that slide.
So, Lambda will trigger an Amazon Athena SQL query,
and this Athena query will pull data
from the Ingestion Bucket and will do an SQL query
that's all serverless and their outputs
are this serverless query, will go into
a reporting bucket, maybe again in Amazon S3
as different Bucket.
So from this we have the data, it's been reported on,
it's been cleansed and analyzed,
we can either directly visualize it, using QuickSight.
QuickSight is a way for us to visualize the data
into an Amazon S3 Bucket, or we can load our data
into a proper data warehouse for analytics,
such as Amazon Redshift.
Now please not that Redshift is not serverless,
and so this Redshift data warehouse can also serve
as an in point for QuickSights.
But this shows you, overall, what you can expect
in a Big Data Ingestion Pipeline at a high level,
including real-time ingestion, transformation,
serverless Lambda and some data warehousing using Redshift
and visualization using QiuckSight.
So, let's discuss about this pipeline.
IoT Core allows you to harvest many data
from many IoT devices.
Kinesis is great real-time data collection,
and Firehose helps you with data delivery
to S3 in near real-time,
so one minute is the lowest frequency you can choose.
Lambda can help Firehose with data transformation,
and then, Amazon S3 can trigger notifications to SQS,
SNS or Lambda.
Lambda can subscribe to SQS, but we could, as I've said,
connected S3 to Lambda, and Athena is a serverless
SQL service, and we can store the results
of Athena directly back into S3.
And the reporting buckets contain analyzed data
and we can use reporting tools, such as QuickSight,
for visualization or Redshift,
if we want to do more analytics on it.
So that's it for Big Data Ingestion Pipeline
but at a high level from a Solution Architecture perspective
It's really good to know how these things work.
I hope you liked this
and I will see you in the next lecture.