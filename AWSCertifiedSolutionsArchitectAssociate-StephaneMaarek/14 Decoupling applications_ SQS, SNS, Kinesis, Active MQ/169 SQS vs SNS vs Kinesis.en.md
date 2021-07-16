
<v Instructor>So this is quite a common exam question</v>
and it's going to ask you to choose
within SQS, SNS or Kinesis and which one is the best fit.
And so I wanted to give you a quick high level overview
that probably brings it all together to understand
which technology is the best in which case.
And sometimes the lines are a little bit blurred
but hopefully it makes sense.
So first SQS, the consumers pull data
and the data is going to be deleted
right after being consumed.
You can have as many consumers as we want,
so we can have 10,000 workers if we wanted to.
And you don't need to provision throughput,
it will scale automatically for you.
There is no ordering guarantee unless you use the FIFO que,
but if you use the FIFO que then you get limited throughputs
And there is an individual message delay capability
so you can take a message and say be consumed in 15 minutes.
So that's it for SQS at a high level right.
Now SNS, this is more of of pub/sub
so you push data to many subscribers.
You can have up to 10 million subscribers to one topic.
And the data is not persisted,
so that means that it's lost if not delivered.
And pub/sub as I said, you can have up to 10,000 topics.
You don't need to provision the throughput in advance
and if you wanted to persist the data out,
deliver it to many SQS ques,
you can use a fan-out architecture
to integrate it with SQS, and we've seen this before.
And now Kinesis, in this case.
So again this is a pull of data,
so like SQS we pull data, SNS was pushing data.
So in Kinesis we pull data.
We can have as many consumers as we want
but we can only have one consumer per shard.
And the possibility to replay data is available
so I we wanted to, you know,
reprocess a whole day of data we could.
This is more meant for real-time big data,
analytics and ETL, so anytime you see these keywords
in the question we wanna do real-time ingestion of data
of IOT, blah, blah, blah.
So anytime you see real-time big data
this is sort of a question hinting you should use Kinesis.
There is ordering but it's at the shard level.
And the data expires after X number of days,
so there is some data retention but it's temporary.
And you must provision your throughput in advance
so you can say, I want 10 shards and that gives you,
you know, 10 megabytes per second of write
and 20 megabytes per second of read.
So this is the fundamental differences
but hopefully now you see which one would go into
which use case.
Overall I think it's pretty easy once you get the hang of it
so have a good look at this slide again,
but for me that's all.
I hope that was helpful and I'll see you
in the next lecture.