
<v Instructor>So let's say you wanted to migrate a database</v>
from your on-premise systems to the AWS cloud.
In this case, you should use DMS,
for database migration service.
It's a quick and secure database service
that allows you to migrate your database
from on-premise to AWS.
But the cool thing is that it's resilient
and it's self healing.
And all alongside the migration
the source database remains available
and it supports many types of engines,
such as homogenous migrations,
so from Oracle to Oracle or Postgres to Postgres.
But also heterogeneous migrations,
for example if you want to migrate
from Microsoft SQL Server all the way to Aurora.
And it supports continuous data replication using CDC,
which is change data capture.
Finally, to use DMS, you need to create an EC2 instance
and that EC2 instance will perform
the replication tasks for you.
So very simply, your source database may be on-premise,
and then you're running an EC2 instance
that has the DMS software
and they will pull the data
from the source database in continuously
and put it in the target database.
So the question is, what are the sources
and what are the targets?
You don't need to remember them all,
but it's a good idea to just see them once.
The first one is going to be on-premise
and EC2 database instances,
such as Oracle, Microsoft SQL Server, MySQL, MariaDB,
PostgreSQL, MongoDB, SAP, and DB2.
Again, you don't need to remember everything, that's fine.
Azure which is going to be for Azure SQL databases.
RDS which is all the databases including Aurora.
And Amazon S3.
And the targets is going to be on-premise and EC2 instances,
such as Oracle, Microsoft SQL Server, MySQL,
MariaDB, Postgres and SAP.
Amazon RDS, Redshift, DynamoDB, S3,
ElasticSearch Service, Kinesis, and Document DB.
So, as I said, you don't need to remember everything,
but the idea is that you can transform a source,
which is on-premise, to a target,
which is usually AWS
and these targets are all the common databases on AWS.
So, what if the source database and the target database
do not have the same engine?
Then you need to use something called AWS SCT,
for schema conversion tool.
And it will convert the database schema
from one engine to another.
So, for example, if you're using an OLTP,
we can migrate from SQL Server or Oracle
to MySQL, PostgreSQL, or Aurora.
As you can see, on the left hand side,
the database engine is different
from the one on the right hand side.
But also, you can transform for analytic processes,
such as Teradata or Oracle all the way to Amazon Redshift.
So the idea is that here, the source database,
has a different engine with a target database.
In the middle we have DMS, but it's now also running SCT,
our schema conversion tool.
And the thing to know going into the exam,
is that you do not need to use SCT
if you're migrating to same database engine.
So if you're doing on-premise PostgreSQL
to RDS PostgreSQL, it is the same database agent,
it is PostgreSQL, and so this for you will not use SCT.
But if you're doing something such as Oracle to Postgres,
then you will need to use SCT.
So, just so you know, the database engine is PostgreSQL,
but RDS is just the platform that we're using
to run those database engine.
So going into the exam, that all you need to know.
DMS is a database migration tool.
And SCT can only be used, should only be used,
when you have different engines for your source
and your target database.