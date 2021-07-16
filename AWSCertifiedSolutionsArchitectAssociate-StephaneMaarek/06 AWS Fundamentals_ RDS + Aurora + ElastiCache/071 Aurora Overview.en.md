
<v Stéphane Maarek>So let's talk about Amazon Aurora</v>
because the exam is starting to
ask you a lot of questions about it.
Now, you don't need deep knowledge on it
but you need enough high level overview
to understand exactly how it works.
This is what I'm going to give you in this lecture.
Aurora is going to be a proprietary technology from AWS.
It's not open sourced
but they made it so it's going to be
compatible with Postgres and MySQL.
And basically your Aurora database
will have compatible drivers.
That means that if you connect, as if you were connecting
to your Postgres or a MySQL database, then it will work.
Aurora is very special and
I won't go too deep into the internals.
But they made it cloud optimized
and by doing a lot of optimization and smart stuff,
basically, they get 5x performance improvements
over MySQL on the RDS or
3x to performance of Postgres on the RDS.
Not just that but in many different ways,
they also get more performance improvements.
To me, I've watched it.
It's really really smart but
I won't go into the details of it.
Now, Aurora storage automatically grows and I think
this is one of the main features that is quite awesome.
You start at 10GB but
as you put more data into your database
it grows automatically up to 64TB.
Again, this has to do with how they design it
but the awesome thing is now as a DB or a CIS ops,
you don't need to worry about monitoring your disk.
You just know it will grow automatically out with time.
Also, for the re-replicas, you can have up to 15 replicas
while MySQL only has 5
and the replication faster, the way they made it,
it's much faster.
So, overall, it's a win.
Now, if you do Failover in Aurora,
it was going to be instantaneous.
So, it's going to be much faster
than a Failover from Multi-AZ on MySQL on RDS
and because it's cloud native, by default,
you get high availability.
Now, although the cost is a little bit more than RDS,
about 20% more, it is so much more efficient,
that at scale it makes a lot more sense for savings.
So, let's talk about the aspects that are super important
which is high availability and read scaling.
Aurora is special because it's going to store 6 copies
of your data any time you write anything across 3AZ.
Aurora has made such assets available so it only
needs 4 copies out of 6, for writes.
That means if one AZ is down, you're fine
and it only means you have 3 copies
out of 6 needed for reads.
Again, that means that it's highly available for reads.
There's some kind of self healing process that happens,
which is quite cool,
which is that if some data is corrupted or bad,
then it does self healing with peer-to-peer replication
in the back end and it's quite cool.
You don't rely on just one volume,
you rely on hundreds of volumes.
Again, that's something for you to manage.
It happens in the back end
but that means that you just reduce the risk by so much.
If you look at it, from a diagram perspective,
you have 3 AZ and you have a shared storage volume
but it's a logical volume
and it has replication, self healing, and auto expanding,
which is a lot of features.
So, if you were to write some data, maybe blue data,
you'll see 6 copies of it in 3 different AZ.
Then, if you write some orange data,
again, 6 copy of it in different AZ.
Then, as you write more and more data,
it's basically going to go again,
6 copy of it in 3 different AZ.
The cool thing is that it goes on different volumes,
and it's striped, and it works really really well.
Now, we need to know about storage and that's it
but you don't actually interface with the storage.
It's just a design that Amazon made
and I want to give it to you as well,
so you understand what Aurora takes.
Now, Aurora is like multi AZ for RDS.
Basically, there's only one instance that takes writes.
So, there's a master in Aurora
and that's where we'll take writes.
Then, if the master doesn't work,
the failover will happens in less than 30 seconds,
on average.
It's really really quick failover.
On top of the master, you can have up to
15 Read Replicas all serving reads.
You can have a lot of them
and this is how you scale your Read work load.
Any of these can Read Replicas can become the master,
in case the master fails.
It's quite different from how RDS works
but by default, you only have one master.
The cool thing about these Read Replicas is that
it supports Cross Region Replication.
If you look at Aurora, on the right hand side the diagram,
this is what you should remember,
1 master, multiple Read Replicas,
and their storage is going to be replicated,
self healing, auto expanding,
little blocks by little blocks.
Now, let's have a look at how Aurora is, as a cluster.
This is more around how Aurora works
when you have clients.
How do you interface with all these instances?
So, as we said, we have a shared storage volume
and it's auto expanding from 10GB to 64TB.
Really cool feature.
Your master is the only thing
that will write to your storage.
Because the master can change and failover,
what Aurora provides you is what's called a Writer Endpoint.
It's a DNS name, a Writer Endpoint,
and it's always pointing to the master.
Even if the master fails over,
your client still talks to the Writer Endpoint
and it is automatically redirected to the right instance.
Now, as I said before, you also have a lot of Read Replicas.
What I didn't say, is that you can have auto scaling
on top of these Read Replicas.
You can have 1 up to 15 Read Replicas
and you can set up auto scaling,
such as you always have the right number of Read Replicas.
Now, because you have auto scaling,
it can be really really hard for your applications
to keep track of, where are your Read Replicas,
what's the URL, how do I connect to them.
For it, you have to remember this absolutely,
if you're going for the exam.
There is something called the Reader Endpoint.
A Reader Endpoint has the exact same feature
as a Writer Endpoint.
It helps with connection load balancing
and it connects automatically to all the Read Replicas.
Anytime the client connects to the Reader Endpoint,
it will get connected to one of the Read Replicas
and it will load balancing done this way.
Make sure, just notice that the load balancing
happens at the connection level,
not the statement level.
This is how it works for Aurora.
Remember Writer Endpoint, Reader Endpoint.
Remember auto scaling.
Remember shared storage volume that auto expands.
Remember this diagram because once you get it,
you'll understand how Aurora works.
Now, if you go deep into the feature,
you'll get a lot of things that I already told you.
Automatic failover, backup and recovery,
isolation and security, industry compliance,
push-button scaling, by auto scaling,
automated patching with zero downtime.
So, it's kind of cool (mumbles) they're doing the back end.
Advanced monitoring, routine maintenance,
so, all these things are handled for you
and you'll also get this feature called Backtrack,
which is giving you the ability to restore data
at any point of time.
It actually doesn't rely on backups.
It relies on something different.
But you can always say,
"I want to go back to yesterday at 4 PM" and you say,
"Oh no, actually I wanted you guys to do yesterdays 5 PM"
and it will work as well, which is super super neat.
For security, it is similar to RDS
because it uses the same engine.
We have Postgres and MySQL.
We get encryption as rest using KMS.
We have automated backups, snapshots, and replicas
that are also encrypted.
Encryption in flight using SSL
and this is the exact same process
we have for MySQL and Postgres,
if you wanted to enforce it.
We have, also, authentication using IAM tokens,
which is the exact same method we have seen for RDS,
thanks to the integration with MySQL and Postgres RDS.
You are responsible still for protecting the instance
with security groups and you cannot SSH into your instance.
Aurora security, all in all,
is the exact same as RDS security.
Now, we have a new service called Aurora Serverless
and this is quite awesome.
This is an automated database instantiation
with auto scaling fixture capability
based on your actual usage of Aurora.
It's really really good if you have infrequent,
intermittent, or unpredictable workloads.
So, anytime on the exam you see these kind of key words,
think Aurora Serverless.
The beautiful thing is that
you do not have to do any capacity planning.
It works for you and therefore,
it can be a lot more efficient
because you pay per second and
you have a lot of cost savings associated with it.
What does it look like?
We have a shared storage volume and our clients.
Our clients want to access our Aurora database
but it is server less.
What's going to happen is, in the back end,
there's gonna be an Amazon Aurora,
created by Aurora Serverless,
and there's a proxy fleet, managed by Aurora,
that our client will connect to
and then transfer it to our Amazon Aurora database.
But the beautiful thing is that, if we get more load,
more Amazon Aurora databases will be
created for us automatically.
If we get less load, then less databases will be going,
all the way up to 0 Aurora databases,
if we don't have any usage.
It's quite awesome when you think about it.
Aurora Serverless really gives us the power
of a relational database,
while giving us some serverless attitude
because we have no scaling to do.
We don't do any capacity planning
and it will scale based on demand.
Okay, so that's for Aurora Serverless
and now we have Global Aurora.
This is Aurora two ways,
to have Global Aurora across multiple regions.
The first way is to have Aurora Cross Region Read Replicas
and they're useful for disaster recovery
and they're very simple to put in place.
You just create a Read Replica in another region
and there you go.
That is the simple way.
But now there is a new way called, Aurora Global Database,
which is the recommended way, by the documentation.
You have one primary region,
where all the reads and the writes happen,
and then you have up to 5 secondary read-only regions,
where the replication lag
is going to be less than 1 second.
You can have up to 16 Read Replicas per secondary region.
That's a lot of replication you can do all around the world.
It will definitely help decrease latency.
And if you ever wanted to
promote another region for disaster recovery,
because the main region had a massive outage,
then you have a RTO,
which is recovery time objective of less than 1 minute.
That means, in less than 1 minute,
your new Aurora database in your secondary region
will become primary and will be ready to take on writes.
This is really really fast.
So, as a diagram, what it'd look like.
For example, in us-east-1, which is our primary region,
we have our database, the main one,
and our applications do read and write to it.
Then, we want to define a secondary region in eu-west-1
and so we'll define an Aurora Global database,
which will perform some replication
with up to 1 seconds lag,
and this is asynchronous replication.
Our applications in eu-west-1 can directly
read from this database and perform read only workloads.
So, that's it for Aurora.
It's a very dense subject, I know,
but it's really important that
you know everything going into the exam
and I will see you in the next lecture.