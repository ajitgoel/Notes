
<v Lecturer>So now, let's talk about ElastiCache.</v>
And ElastiCache is Managed Redis or Memcached.
And so the idea is that ElastiCache is for cache
what RDS is for Postgres, for example.
And so, it kind of has a similar feature,
so the way you see it is that ElastiCache is for cache,
and it works like RDS.
In your mind it should be this way.
So what is a cache?
Well, it's an in-memory data store,
and has really, really good performance.
We're talking about sub-millisecond latency,
so it's really high performance.
And the way it works is similar for RDS.
We need to provision an EC2 instance type.
And we have support for Clustering
so it's called Multi AZ, Read Replicas as in RDS
it's called Clustering in Redis
and Read Replicas is provided through these clustering.
So it's called sharding in the ElastiCache world.
Security is done through IAM, Security Groups, KMS,
and there is no IM authentication to the database,
but we can use something called Redis Auth
if we talk to Redis.
Now there's still the feature of
Backup, Snapshot, and Point in time restore if we wanted to,
and we get Managed and Scheduled maintenance.
All the monitoring is done through CloudWatch,
so very similar to RDS.
So when we would use ElastiCache?
Well ElastiCache is not a SQL database, okay,
it is a Key/Value store.
In-memory Key/Value store.
And so it's going to be very different Use Cases.
So here we can use it as a Key/Value store,
when we have frequent reads and less writes.
Maybe want to cache also database results for queries,
so it's called a write-through pattern.
Maybe we want to store session data for websites.
And remember we cannot use SQL in ElastiCache,
so it's really here to improve performance,
or use as a cache, you know it's a cache, to summarize.
So it's very different from a data base.
So this is what you need to remember,
and it's Key/Value store,
so that means that you retrieve data by key.
You can't query data on fields
or whatever you can think of.
So from a Solutions Architect perspective,
Operations would get the exact same as RDS
so we won't go over them.
Security, the same thing as RDS,
except this time we don't get IAM
authentication to ElastiCache.
We get Redis Auth if we wanted to.
Reliability, we will get this Clustering feature,
sharding feature, and Multi AZ.
And performance, it's really good for a cache
with sub-millisecond performance, in memory,
and you have read replicas for sharding.
So, it's a very popular cache option.
So, if you see sub-millisecond performance, at the exam,
in memory, think ElastiCache.
The cost is going to be a similar pricing as RDS,
So, we're going to pay per hour
based on the EC2 instance type,
that we provision and the storage usage.
So that's it for ElastiCache.
I think we've seen it in-depth in the solution architecture
in terms of the Use Cases.
I think it should be clear in your mind,
but it's good to have a reminder.
I hope you like this lecture
and I will see you in the next lecture.