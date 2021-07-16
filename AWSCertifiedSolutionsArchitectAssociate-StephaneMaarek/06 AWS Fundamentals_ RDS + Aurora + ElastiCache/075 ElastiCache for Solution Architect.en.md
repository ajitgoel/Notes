
Okay. So some extra bits going into
the solutions architect exam for ElastiCache.
The first one is around cache security.
So all caches in ElastiCache support
SSL in flight encryption and do not support
IAM authentication.
So if the exam question tries to trick you
into thinking that ElastiCache can be
authenticated using IAM, it is not true.
IAM policies on ElastiCache are only used
for AWS API-level security.
So that includes creating a cluster,
deleting a cluster, updating the configurations,
and so on.
Redis now has authentication and it's called Redis AUTH.
And you can create something called a password
or a token when you create a Redis cluster.
And this is an extra level of security for your cache
on top of security groups.
So any client that does not have
this password or this token
will not be able to connect to your Redis cluster
and therefore will be rejected.
So this is called Redis AUTH.
By default, Redis does not have any AUTH
and anything or anyone can connect to your
Redis cluster.
And that's why it's super important to use
security groups as an extra level
of security for your cache.
To make sure that only the networks
you have authorized can access your Redis cluster.
From Memcached, a little bit less important,
but still good to know,
it supports something called SASL-based authentication
that is quite advanced
and I haven't seen it yet at the exam,
but still, Redis AUTH is quite mentioned.
So at a high level, what it means
our EC2 clients for example
or applications running on EC2
are running inside of an EC2 security group
and they want to connect to our Redis cluster cache
and therefore there is going to be
a Redis security group around it.
So we are going to make sure that the
Redis security group allows the
EC2 security group in.
And also our clients will be using
maybe SSL encryption for encryption of
data in transit. And as an extra level of
security for Redis, we can enable Redis AUTH
to make sure that the EC2 clients
will have the right password before
connecting to our Redis cache.
Next, let's talk about the different
patterns for ElastiCache.
So we have three of them
and you don't need to know them in depth
but it is good to have seen them at a high level.
The first one is called Lazy Loading
where you will read all the data
and all the data that has been read
is automatically cached
in which case data can become stale in the cache.
Write Through, where you add or update
data in the cache when it is written
to a database, in this case you have no stale data.
And Session Store where you can store
temporary session data in the cache.
We'll see this in the solution architecture sections.
And we can use a TTL feature on top of it
to expire data in your Session Store.
Overall, caching is really hard
that's why they'll make such a big deal out of it.
There's only two hard things in computer science
it's a quote.
There's cache invalidation and naming things.
So caches are really really hard to use
and that's why I don't want to overload
you with the patterns, but I'm just
going through Lazy Loading as an example.
So we have our application
and we have ElastiCache and we talk
to RDS in a database.
So our application maybe is going to
request some data and hit the cache.
So if the data already exists in the cache
it's called a cache hit, in which case it works.
If it doesn't hit the cache it's called a cache miss
and so it will miss the cache
then it will fetch the data from the database
read it and then it will store it
into the cache and this is called
Lazy Loading.
And this is one strategy
and I haven't illustrated what Write Through
looks like, but it's different.
But at a high level just know what
Lazy Loading, Write Through and
Session Stores are, the fact that
you can use TTL and the fact that
caching is really really hard.
All right that's it for this lecture
I will see you in the next lecture.