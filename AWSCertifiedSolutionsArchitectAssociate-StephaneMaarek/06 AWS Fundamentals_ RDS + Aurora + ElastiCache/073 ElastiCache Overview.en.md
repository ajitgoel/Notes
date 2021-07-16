
<v Instructor>Now we're getting</v>
an AWS ElastiCache Overview.
So the same way RDS is to get a managed Relational Database,
ElastiCache is to get a managed cache,
in this case, Redis or Memcached.
And caches are basically in-memory databases,
so they run on RAM, and they have really high performance
and usually really, really low latency.
And their role is to help
reduce the load off of databases, by caching data.
And so that the read-intensive workloads
read from the cache, instead of reading from the database.
So basically, it also helps
make a bunch of application stateless,
by storing states in a common cache.
And it has a Write Scaling capability using sharding.
It has a Read Scaling capability using Read Replicas.
It has Multi AZ capability with failover, so just like RDS.
And it has AWS taking care of OS maintenance,
patching, optimizations, setup, configuration,
monitoring, failure recovery and backups.
So basically, it looks a lot like RDS
and there is a very good reason.
It is pretty much the exact same thing.
It's an RDS for caches, and it's called ElastiCache.
Okay, that's what you should remember.
So there is Write Scaling, Read Scaling, and Multi AZ.
Now, you may be asking,
"How does this fit into my Solution Architecture?"
And at first I was troubled too,
and really this diagram that I created
really helps put things into perspective.
So, when we have our application,
it communicates to RDS, as we've seen from before.
But we're also going to include an ElastiCache.
And so our application
will basically first query ElastiCache.
And if what we query for is not available,
then we'll get it from RDS and store it in ElastiCache.
So let's call it cache hit,
when you get into ElastiCache, and it works.
So we have an application, it has a cache hit,
and we get the data straight from ElastiCache.
In that case, the retrieval was super quick, super fast,
and RDS did not see a thing.
But sometimes our application requests data,
and it doesn't exist.
This way it's a cache miss.
So when we get a cache miss, what needs to happen?
Where our application needs to go ahead
and query the database, that our case
will go ahead and query the DB,
and RDS will give us the answer.
And our application should be programmed
so that it writes back to the cache,
or results in ElastiCache.
And the idea is, that if another application,
or the same application will ask for the same query,
well this time it will be cache hit.
And so that's what a cache does, it just caches data.
So the caches will help relieved the load in RDS,
usually the read load, definitely.
And the cache must also come with an invalidation strategy,
but that's up to your application to think about.
So that only the most current data
and most relevant data is in your cache.
Now, another Solution Architecture you must have
is User Session Store.
And so in this case,
our user basically logged in to our application,
and our application is stateless,
so that means there is a bunch of applications running,
maybe they're running into an order scaling group,
and so all of them need to know that the user is logged in.
So the process is such,
the user logs in to one of the application,
and then the application
will write the session data into ElastiCache.
So, this is it, the application, the first one,
just wrote the session data into ElastiCache.
Now the user hits another instance of our application,
okay, in our auto scaling group for example.
Then that application
needs to know that our user is logged in.
And for this, it's going to retrieve the session
off of Amazon ElastiCache, and say, "Oh yes, it exists,
"so user is logged in."
And basically, all the instances can retrieve this data
and make sure the user
doesn't have to re-authenticate every time.
So that's basically another very common
solution architecture and pattern with ElastiCache.
It is basically number one, to relieve load off a database,
and number two, to share some states,
such as the user session store into a common ground,
such as all the applications can be stateless
and retrieve, and write these sessions in real time.
So now let's talk about
the difference of Redis and Memcached.
So Redis is going to have a Multi AZ feature,
that means that you can have it
in multiple availabilities on,
with Auto-Failover feature.
So that means that if one AZ is down,
you can failover automatically to another one.
You can also enhance your read scales
by creating Read Replicas,
and so you have more reads and high availability.
And you can enable Data Durability using AOF persistence.
So even if your cache is stopped and then restarted,
you can still have your data
that was in the cache before stopping it, available to you.
And that's because of AOF persistence.
That means that you can backup,
and restore your Redis clusters, okay?
So if think Redis, think of two instances,
one being the primary, the second being the replica
and think data persistence,
think backup, think restore, okay?
Very, very much similar to RDS, I would say.
So Redis, RDS, kind of similar, right?
Think of like, memo technique.
But Memcached is very different.
Memcached is going to use multiple-node
for partitioning of data, so it's called sharding.
There's gonna be a non persistent cache,
that means if your Memcached node goes down
then the data is lost.
There is no backup and restore features,
and it's a multi-threaded architecture.
So if you want to conceptually see Memcached,
it's around sharding.
So a part of the cache is going to be on the first shard,
and another part of the cache
is going to be on the second shard,
and each shard is a Memcached node,
conceptually speaking, okay?
So they're very different.
One is going to have more industrial RDS type features
so Redis is going to be more like RDS,
while Memcached is going to be a pure cache
that's going to live in memory,
but there's going to be no backup and restore,
no persistence, multi-threaded architecture, and so on.
So try to remember these going into the exam,
so you can make the right decision,
based on not if you want backup and restore,
based on not if you want Multi AZ,
and based if you want sharding or Read Replicas, okay?
Well that's it, I will see you in the next lecture.