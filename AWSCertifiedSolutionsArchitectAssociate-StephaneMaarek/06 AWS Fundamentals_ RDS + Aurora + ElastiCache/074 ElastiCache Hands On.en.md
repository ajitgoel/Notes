
<v ->So, let's try creating a ElastiCache cluster.</v>
So we'll go to the ElastiCache service.
And then we'll click on "Get Started Now".
So we have two options for the cluster engine,
we can either choose redis or menceched.
So, if you're redis, this is what we know,
it offers Multi-AZ with Auto-Fellover
and enhanced robustness.
And we can even enable cluster mode, if we wanted to.
To add even more robustness and scalability.
So, because it's redis and it has persistence,
we can use it as a database, cache, and message broker.
Where-as if you choose Menceched, then it's a high
performance distributed memory object caching system,
and this is really intended to serve as a pure cache.
While Redis can also be used as a database.
So, for the sake of this exercise,
we're going to go ahead and just create
a redis cluster engine, but I invite you to explore
the options for Menceched.
So, we'll say, okay, My First Redis.
And My First Redis instance.
The engine version compatibility,
I'll just choose the latest one.
The port is the standard port for Redis so, "6379".
The Parameter group, I'll just choose the default.
And the node type, because I don't want to over pay,
I am not going to choose a cache.r4.xlarge,
I'm going to go into cache.t2.micro,
which is within the free tear.
I'll click on save.
And for a number of replicas,
right now I don't want anything,
I'll choose zero, otherwise I'm going to pay more money.
So, as you can see at two there was more options,
there will be a Multi-AZ with Auto-Fellover option,
or even if I have it as one, I should have that setting,
here we go, it's still here,
but if as soon as I have it as zero,
you can see that I am losing the Multi-AZ,
so lets have it at zero,
and we'll lose the Multi-AZ setting.
So, with one I have it, and zero I lose the Multi-AZ.
So we'll keep it as zero because we want things to be free,
but there you go, if there is a replica obviously
you can have Multi-AZ.
Then you need to create a sub-net group, and I'll call it
"my-subnet-group"
"my-first-subnet-group"
And "my-first-subnet-group".
I'll choose my APC-ID,
and I'll select one for these subnets, maybe eu-west-3a.
I don't have any preferred availabilities on.
I'll scroll down.
In the security group, I can have a default one.
We want encryption at-rest.
Using KMS, and do we want encryption in-transit,
and if we do select encryption in-transit,
then we can interval Redis auth,
and with Redis auth, I am able to set a token.
So I can set whatever I want,
and this token will be necessary for my applications
to connect to Redis in order to work with Redis,
but if I disable encryption transit,
I have no options for Redis-AUTH.
Finally, do we want to import into your cluster node,
do we want back-ups, absolutely.
So, we'll say yes, we want back ups.
And we want one day of retention.
And this is a Redis only feature,
we don't get backups with Menceched.
And maintenance window, that's fine, we won't specify it.
And I'll click on create.
And there we go.
Our ElastiCache Redis structure is one instance,
so not it's not really a cluster,
but it's one instance anyway,
is being created.
And to use it,
I'm sorry I can't really demonstrate that to you.
This is more an application specific concern,
you need to download the Redis driver, and start
interacting with your Redis Cache, but as far as we're
concerned from a exempt standpoint, we have seen how to
create a Redis cache, we've seen all the configuring options
and now the cache is just creating, but I don't need it.
So, what I'll do is just when this is done, I will remember
to delete it.
And so now, we are able to click on the actions and then
delete my Redis cluster once it has been created.
I can create a final back-up,
I'll just say no, and I am done!
All right, that's it for this lecture,
I will see you in the next lecture.