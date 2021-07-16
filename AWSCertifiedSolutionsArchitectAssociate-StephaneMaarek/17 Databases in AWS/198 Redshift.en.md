
<v Narrator>Redshift is a database</v>
that we have not seen in this course just yet.
And, that's fine.
As, in this course, you don't need to know
all there is to know about Redshift,
you don't need to know how to use it.
But what you need to know,
in which cases it's going to be useful.
So in this lecture, I'm going to give you an overview.
Just a bit more details that you need to know,
but at least it'll give you a good idea of how Redshift is,
what it works, and what are the use cases for it.
So, Redshift is based on PostgreSQL.
That's the underlying technology,
but don't get that wrong, it's not used for OLTP.
OLTP, remember, is Online Transaction Processing.
So, Redshift is not a replacement for RDS.
Redshift is OLAP.
OLAP stands for Online Analytical Processing.
That means that Redshift is used for analytics
and data warehousing.
Now, if you want to stop this lecture,
you can stop right here,
I've said everything there is to know for the exam.
Redshift equals analytics and data warehousing.
But, if you're interested into knowing more,
let me tell you a bit more about Redshift.
So, Redshift is going to have 10 times better performance
than other data warehouse technologies.
And, Redshift is meant to scale to petabytes of data.
So petabyte, one petabyte is 1000 terabytes,
so that's a lot of data.
The way Redshift stores data
and what makes it good for analytics and not good
for transaction processing,
is that the data is stored in columns.
So, it's called a columnar storage of data,
whereas Postgres and RDS and MySQL maybe,
they will be using row.
So even though Redshift is based on Postgres,
it's a heavily modified version of Postgres.
And so, in Redshift, the storage is stored in a column.
And so that's all you need to know,
but it's a great optimization when you do analytics.
On top of it, it's highly distributed.
And so, because it's distributed when you run a query,
it's going to run it in parallel across so many instances
and so many cores.
And as such,
it's called a Massively Parallel Query Execution, or MPP.
And that makes the database highly available as well
because it's distributed.
So you're going to pay as you go based on
the instance provision.
So here, you have to choose the right cluster size,
and use it as much as you can,
because you don't pay per the query.
You pay for whatever you provisioned,
and Redshift can use SQL interface
for performing the queries.
So, it's the same interface that you know,
you can do your jobs, your aggregates, your sounds, etc.
so using SQL to perform your analytics.
So, Redshift is a great tool to use when you have a BI,
so business intelligence tool, to use on top of it
such as AWS Quicksight for doing visualizations,
or Tableau if you're looking for another more professional
or different type of technology that's not as native.
Okay, so let's learn about more.
How do we load data into Redshift?
Well, Redshift has integrations to pull data from S3
or DynamoDB, but you can use DMS,
and that's Database Migration Service,
or even you can pull in from other databases.
So you can even pull this, for example,
from the Read Replica in RDS.
So, it's a really great way, for example,
when have an RDS database
but you want to do analytics on it,
to create a Read Replica to pull the data
from the Read Replica into Redshift,
and to do the analytics into Redshift.
Okay, so in terms of Redshift scale,
it can go from one node up to 128 nodes.
And each node has so many cores.
And so, each node by itself has 160 gigabytes of space.
So if you do the math, it gives you a lot of space overall.
There's two types of nodes in Redshift,
there's a leader node,
and the leader node is used for finding the queries
and aggregating results across all the compute nodes.
So the compute nodes are going
to actually be performing the queries
and they will send the results back to the leader.
If you have one node,
then that node is both a leader node and a compute node.
Okay, there's this other option,
which is called Redshift spectrum,
in which you don't need to load the data
into Redshift first.
You can perform the queries directly against S3,
so it's a great way to do ad hoc queries.
Remember, it's not like Athena
because in Athena it's server less, whereas in Redshift,
you still need to provision your cluster.
And then, if you use Redshift Spectrum,
then you can perform the queries directly against S3.
So, there's also all these good features you would expect
from a database in AWS.
So there's backup and restore.
There's going to be security at the VPC, IAM, and KMS level,
and you're going to get cloud watch monitoring out
of the box.
Finally, there's this feature, you need to remember it,
it's called Redshift Enhanced VPC Routing.
So if you enable it, basically, all the copy of data
from whatever stores you want into Redshift, or UNLOAD,
which is from Redshift back to S3, goes through VBC.
But it gives you enhanced, basically, security
and maybe better performance,
as well as your data doesn't go over the public internet.
Next, we have to talk about Redshift in regards
to the snapshots and disaster recovery.
So, snapshots are point-in-time backups of your cluster,
and they will be stored internally in Amazon S3,
and they will be incremental.
So, only the stuff that has changed in your Redshift cluster
will be saved.
You can restore a snapshot into a new cluster,
so this is all very similar to RDS,
and you can have automated snapshots as well
every eight hours, or every five gigabytes,
or on a schedule, and you would set the retention for this.
You can also do manual snapshots,
and in case you do that,
the snapshot will be retained until you manually delete it.
And so, the cool thing about Redshift,
is that you can configure Redshift
to automatically copy snapshots,
either automated or manual,
of a cluster to another AWS region.
So, this provides you a good disaster recovery strategy.
You just do these snapshots,
configure them to be in another region,
and if an entire region goes down,
you can restore your Redshift cluster very quickly
elsewhere.
So, this is quite cool.
The other really, really, really awesome feature of Redshift
is called Redshift spectrum.
And, for Redshift spectrum, the really cool thing
is that you can query data that is already in Amazon S3
without loading it in advance into your Redshift cluster.
So, you query the data while it's in place in S3,
but to use it, you must have a Redshift cluster available
to start the query.
So, this is not like Athena,
where you can just go ahead and query data in S3.
First, you have to create the Redshift cluster.
And then, you need to launch your query against S3
with Redshift Spectrum.
And then the query, the cool thing, though,
is that it will be submitted to thousands
of Redshift Spectrum nodes that will perform
that massively parallel query for you.
So as the diagram would then look like,
you have your Amazon Redshift cluster in the middle,
and you're going to do a query on S3,
so this is going to be a Redshift Spectrum query,
And automatically, Redshift will decompose that query
and send it to Redshift Spectrum nodes,
which can be thousands of them.
And these nodes will automatically,
and they're managed by AWS,
automatically talk to Amazon S3, and run your query for you,
and the results will be aggregated back
into your Redshift cluster,
which will give you your response and your right data.
So, the cool thing about Redshift spectrum
is that it's somewhat serverless,
and it allows you to scale to massive queries
without having a huge Redshift cluster in the beginning.
So, now from a solutions architect's perspective,
what do we have?
Well, operations is going to be similar to RDS
and security as well is going to be similar
to RDS reliability, then we get highly available clusters.
And there's a auto healing feature, so basically,
once you provision a Redshift cluster,
you can expect it to be pretty solid.
Performance is going to be huge,
so this is meant for analytics, and so,
at least Amazon says,
there's 10x performance increase compared
to other data warehousing solution.
And on top of it, if you want,
in Redshift you can use compression,
so you can compress the data into very, very small amounts,
and that will also help you with performance,
and your storage space, and your performance queries.
In terms of the cost, well,
you're going to pay per node provisions.
Okay, you don't pay by the query like for Athena,
here, you pay by the node provision, like for RDS.
And even though I think Redshift is expensive,
according to AWS, it is 1/10 the cost
of other traditional enterprise data warehouses.
So, that makes Redshift a really good candidate
as a data warehouse for you if you use the Cloud.
So, overall, out of this lecture,
what do you need to remember really for the exam?
Well, Redshift is going to be used for analytics,
business intelligence, and data warehousing, okay?
Well, that's it for this lecture.
I hope this gives you a better idea of what Redshift is,
and I will see you in the next lecture.