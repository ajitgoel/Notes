
<v Instructor>Okay, now we're getting to DynamoDB.</v>
So DynamoDB is going to be
a pure cloud-based technology.
It's proprietary to AWS,
you can't find it anywhere else,
and it's a managed, NoSQL database.
The idea is that it's serverless,
you provision the capacity, you get auto scaling,
on top of it, if you want it to,
and now, as of November 2018,
you can get on demand capacity.
So it really scales,
based on your workload,
and really gives you the
optimal pricing and performance that you need.
It can be a replacement for ElastiCache,
for storing key value stores.
So for example, if you want storing session data,
you could use that DynamoDB.
The advantage that you would get,
is that it's serverless,
so you don't have to worry about
provisioning ElastiCache and maintaining it.
Here at DynamoDB, it's all managed
and serverless for you.
What you get is, is you don't get
sub-millisecond performance on DynamoDB,
you get single digit, so between
1 and 9 millisecond of performance,
which is still really good,
and that makes it a very accessible
keyvalue store for storing session data for example.
In terms of DynamoDB,
well it's all managed and it's perfect.
It's highly available, Multi AZ by default.
The Reads and the Writes are decoupled,
so you can provision read capacity units
and write capacity units,
and in terms of, if you want it
to have a caching technology in front of it,
you can just one click,
and enable DAX,
and DAX is going to be DynamoDB accelerated cluster,
and that will give you a read cache,
which is really good,
and will improve the performance
and decrease the number of reads that actually happen
on the DynamoDB database itself.
Reads, you have two options,
because it's a distributed database,
you have two options,
either you choose eventually consistence,
or strongly consistence.
So that means, are you willing to accept all data,
stale data or do you want to get
always the newest data.
That's what it means.
The security, authentication and authorization,
is all done through IAM.
So it gives you a one stop shop
to manage security on DynamoDB,
which makes it really, really nice,
and if you wanted to integrate with AWS Lambda,
you can use DynamoDB Streams
to stream all the changes that happen in DynamoDB,
all the way over to your function,
and basically react, based on some events that happened.
You get a backup and restore feature,
just like any database on AWS,
and you even have this feature
of doing a Global Table,
and that's really awesome,
and this can only happen once
you've enabled DynamoDB Streams.
On top of it, you get
monitoring integration with CloudWatch,
and the one downside of DynamoDB though,
is that you can only query on primary key,
sort key or indexes.
So what does that mean?
That means that you need to be very careful
when you start designing your DynamoDB tables,
and it does require some practice as a developer.
Now all things are reviewed in details,
in the developer course,
but for now, all that you need to know
is that you cannot query on any attribute,
you can only query on a few select things.
So when do we use DynamoDB?
Well, we use it when we have serverless
application developments,
and when the actual rows are small,
we're talking less than 400 kilobytes,
and we want maybe,
a distributed, serverless cache,
that's a very popular option,
and remember, it does not have
the SQL query available,
and as of November 2018,
it has transactions capability,
so be careful when you read a question,
now DynamoDB can do transactions.
Okay, so from a Solutions Architect's perspective
and the five pillars, what do we get?
Well, number one, operations.
You don't need to do any operations,
if you enable auto scaling
or if you enable on demand,
and it's serverless, so don't you worry
about managing servers whatsoever,
which is awesome.
Security is awesome as well,
it's all done through IAM policies,
you can enable KMS encryption at rest,
and you get SSL in flight,
so what that means,
is that it's a one stop shop
for you to manage all your access to your tables,
which I think is really, really, really cool.
In terms of reliability,
well you have Multi AZ and backups,
so that means that you really will survive
AZ going down and if you want it to have
some disaster recovery, well you can enable backups,
and restore from these backups later on.
Performance, as I said,
it's single digit millisecond performance,
so it's really, really good,
so that's why you can use it as a cache in some ways,
and if you wanted to enable an actual cache,
for your database reads,
then you can have DAX as well,
and the cool thing about DynamoDB,
is that it's made so that performance
won't degrade if your application scales.
So DynamoDB can scale to hundreds of terrabytes
in your database, and you will still get
that really good, single digit millisecond performance.
In terms of cost,
well here you're going to pay for the provision capacity
and storage usage,
and so if you use auto scaling,
you don't guess in advance the capacity.
It will scale down if you don't need it,
and scale up if you do need it,
so in the end, you can expect to cause
a cost to be paid for exact usage,
which is really nice,
because if you have an application
that does nothing, you don't pay much,
if it does a lot, you pay more,
but at least you don't need to think about
provisioning in advance, which is great
from a Solutions Architect's perspective.
Okay, so that's it for DynamoDB,
I hope you enjoyed it,
and I will see you in the next lecture.