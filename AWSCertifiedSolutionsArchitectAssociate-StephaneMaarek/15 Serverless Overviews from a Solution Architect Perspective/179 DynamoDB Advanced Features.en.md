
<v Narrator>Okay, so let's talk about</v>
advanced features for DynamoDB.
Now, you don't need to know how to use them properly,
this is more for the developer exam.
But for the solutions architect exam,
you need to know that they exist
because it's really important
for you solution architecture to make decisions accordingly.
So, the first one is DAX,
and it stand for DynamoDB Accelerator,
and this is basically a cache that's seamless,
that's enabled. You don't need to rewrite your application,
and basically the cache writes will go,
the writes to DB will go through DAX,
and then the reads will be cached,
and you have micro seconds latency.
So the idea is that you solve what thing's
called the Hot Key problem,
when you get too many reads on one value in DynamoDB.
DynamoDB can go a bit crazy
and you may get provision through both exceptions.
Each cache entry has a five minutes TTL by default.
So that means that anytime you read something
from DynamoBD, it's gonna be cached for five minutes in DAX
and that really allows you to
relieve pressure off of DynamoDB if you need to.
You can get up to 10 DAX nodes in the cluster.
And it could be multi AZ
so you need three nodes minimum recommended for production.
And it's super secure,
you get encryption at rest, you get VPC integration,
IAM, CloudTrail and all this stuff.
Okay, so how does it look like where we have DynamoDB
and we have maybe lots of tables in our application.
And will thus directly talk to DynamoDB accelerator or DAX
and DAX will talk to our table
and basically, will make the caching wherever necessary.
So DAX is a great way to speed up reads in your application
and start caching your DynamoDB data,
Now DynamoDB Streams is whenever you want to intercept
changes in DynamoDB, for examples whenever something happens
to a table, that could create and update or delete of a row,
you want it to end up in DynamoDB Stream.
And the idea is that once you have this in a DynamoDB Stream
it's going to create a changelog of everything that happened
to your table and that changelog can be read by AWS Lamda.
And then we can do some really cool intergrations.
We can react to changes in real time, for example
we can send a welcome email to new users.
We can do some analytics in real time.
We can create derivative tables and views.
We can do anything that we can get creative with.
Or even insert this into ElasticSearch,
if you wanted to use another database.
So here it's just shown with the Lambda integration.
Another thing, is if you do cross region replication,
you need to enable Streams for that.
And Streams has twenty four hours of data retention,
so that's just something to remember.
But, overall, Streams is mostly used with a Lambda function
to be integrated.
Now, new features of DynamoDB.
And this is something that may not be on the exam just yet,
but will come very very soon, so I'm telling you about it
right now.
The first one is transactions. This is very new.
November 2018.
And so, it's an all or nothing type of operations.
I mean you can coordinate inserts, updates and deletes
across multiple tables. And so, either all these things work
or none of them work.
So it's something really new and really cool.
And you can include up to ten unique items
or up to four megabytes of data total.
So you really get some good chance to write,
to all tables at a time or none.
For example, if you have financial transactions,
you want to update everything as part of one transaction.
Now there is on demand, it's another feature.
It's new from 2018. Remember I said it was WCU and RCU.
That was true up until this date,
and they said 'okay so we're going to have on demand'
So you don't need to do any capacity planning anymore.
It scales automatically.
You get any reading, any write, working no matter what.
But, the catch is that it's 2.5x more expensive
than provisioned capacity. So you need to use with care.
So, when would you use on-demand?
Well, you basically use it when you have spikes
and it's unpredictable. You work less,
or scaling doesn't do a good job.
Or when you're application is so low throughput,
that it's actually cheaper to use on-demand
because you have so may low reads and writes.
So, these two things, will happen in the exam very soon.
I'm sure.
Now, DynamoDB, security and other features.
So the first one is security.
You get VPC Endpoints, to access DynamoDB
without the internet.
You can access all the DynamoDB security using IAM policies.
And you get encryption at rest using KMS.
You also get encryption in transit, using SSL and TLS.
So, it's all encrypted all the way.
Now there's a backup and restore feature.
We can do a point in time restore like RDS.
And there's no performance impact.
And you can enable global tables.
That means you have multi region, fully replicated,
high performance tables, and that may help with latency.
Finally, you can use DMS,
it's just a database migration service,
to migrate to DynamoDB, maybe if you have a MongoDB,
Oracle, MySQL, S3, whatever.
You can migrate your data to DynamoDB
and start using DynamoDB today.
Finally, really cool thing to know is that you can
actually launch your own local DynamoDB on your computer.
If you were to development against it
and this is more something if you're a developer, obviously.
Maybe a bit less if you're a solutions architects.
Finally, two more other features you need to know.
The first one is round Global Tables,
which is cross region replication.
So, what does that mean? It is active active replication,
that means that all the regions will get
to all the other ones.
You must enable DynamoDB Streams before you get that,
and it's very useful when you want low latency
or want to have this for recovery.
So, let's have a look. We have the table an it's a
global table, so it's in us-east-1,
and ap-southeast-2.
And so if some writes happen to our table in us-east-1,
they will be automatically replicated to our table
in ap-southeast-2. And likely, if some writes happen
on our table in ap-southeast-two,
then they will be replicated back to us-east-1.
So with this global tables,
we have region replication happening from all the regions.
And because all the tables are able to be written,
to get to each other,
it is called an active active type of replication.
Finally, for capacity plannings. So I was mentioning to you,
you can provision your WCU and RCU in advance.
And you can also enable auto scaling,
so this is quite helpful. You only have planned capacity.
But if you have, a more erratic, sporadic type of workload,
you may want to have on-demand capacity,
where you get unlimited WCU and RCU,
so no capacity planning to do at all.
You will not get any throttle,
but it's going to be a lot more expensive.
So the question is, do you want to have some
very rare workloads and you just want capacity for that?
maybe on-demand is a great option.
Or can you have some more predictable, more smooth workloads
that can maybe order scale? In which case, planned capacity
with WCU or RCU and auto scaling would be a great option.
So that's it for all you need to know on DynamoDB
for the exam.
And I will see you in the next lecture.