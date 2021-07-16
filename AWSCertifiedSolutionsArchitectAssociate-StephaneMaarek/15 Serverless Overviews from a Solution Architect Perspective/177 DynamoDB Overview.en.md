
<v Instructor>OK, so now we're getting into DynamoDB.</v>
And we're getting to our first serverless database.
So what is DynamoDB?
Well, it's a fully managed, highly available database.
And it has replication across 3 AZ by default.
It's a NoSQL database.
And NoSQL means not only SQL.
So it's not a relational database
like RDS where we can do joins.
This is not something we can do in DynamoDB.
The idea is that it scales to massive workload
and it's a distributed database, so it has
its own advantages and its own weaknesses, OK?
Now from a Solutions Architect perspective,
we don't need to know exactly how DynamoDB works.
This is more for a Certified Developer type of exam.
So there's millions of requests per second
that can be done through DynamoDB.
It can scale to trillions of row
and hundreds of terabytes of storage.
So basically what they're trying to say
is that it's a database that scales,
really, for no headache on your end.
It's managed already for you.
So it's fast and consistent performance.
That means even if you have a lot of data,
you can still get low latency on data retrieval.
And it's integrated with IAM for security,
authorization, and administration.
So this is one of these cloud-native thing on AWS side.
It enables event driven programming with DynamoDB Streams.
And we'll see this in a future lecture.
And it's low cost and has auto scaling capabilities.
So, overall, it's quite a good choice.
And Amazon is pushing for a lot
of DynamoDB usage in the cloud.
So the basics is that DynamoDB is made of tables.
And each table has a primary key.
And you decide of that primary key at creation time.
And so you note there's no creating of database.
The database is already available.
You just start directly by creating tables.
Now each table can have an infinite number of items,
or at least, that's what's advertised.
And so it's rows.
And so each row, or each item, will have attributes.
And they can be added over time.
And these attributes can be null.
So an attribute is like a column in a RDS database.
Now the maximum size of an item is 400 kilobytes.
So that means that you can store, you know,
pretty good sized item on that moDB
before you start storing images there.
And the data types supported is going to be scalar types.
So string, number, binary, Boolean, and null.
And document types such as list and map.
Set types, such as string set, number set, and binary set.
So you have a lot of different types of data
you can store on DynamoDB, and you're very flexible.
Now the important thing to know for DynamoDB,
if you're going into the exam, is provision throughputs.
So the table must have provision
read and write capacity units.
Now that's not entirely true.
There's this thing called on-demand DynamoDB.
And I'll show you, in a minute,
what that is in the next lecture.
But for now, let's just assume we're doing DynamoDB,
and we must provision read and write capacity units.
So what is it?
A Read Capacity Unit, an RCU, is basically
defining a throughput for a read.
So here's the cost for the RCU when I recorded this lecture.
And one RCU means that you have
one strongly consistent read of four kilobyte per second,
or two eventually consistent read
of four kilobyte per second.
So if you have 10 RCUs, you can do, maybe,
10 strongly consistent reads of four kilobyte per second.
That gives you an idea of how much throughput
you can get based on how many RCU you create.
And WCU is throughput for writes.
It's about five times as expensive than RCU.
So DynamoDB is better when you read more
than when you write more.
And one WCU is one write of one kilobyte per second.
So it gives you an idea of how DynamoDB works.
And you have to, basically, figure out
how many writes you want per second
and what's your write size.
And then you can figure out and compute the RCU and the WCU.
Now in the Developer Exam, you actually
have to remember all these formulae in your head.
But for the Associate Exam,
Solution Architects, you don't really need to.
You can just remember at a high level what they are.
Now there's an option to set up auto scaling
of throughputs to meet the demand over time.
And the throughput can be exceeded temporarily
using something called burst credits.
And if the burst credit are empty,
then you're going to get a ProvisionedThroughputException.
That means that you're requesting more than what you have.
And so, in this case, you can
do an exponential back-off retry to, hopefully,
get the read or the write working eventually.
So that's it for DynamoDB.
Very high level.
But, again, you don't need to remember too much about it.
We'll be discussing Solution Architecture with DynamoDB
in a whole section dedicated to it.
But now let's go ahead and see how it works with a hands-on.