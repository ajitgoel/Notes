
<v Man>All right. So now, let's do a deep dive</v>
into our different instance
(stammers)
volume types for EBS volumes.
So the first one is gp2,
and is the recommend for most workloads,
it's the least expensive for an SSD,
and you can use it as a system boot volume
for having really good performance.
It can use virtual desktop,
low latency interactive apps,
maybe development and test environments
so you can think of a lot of use cases.
The size can range from one gigabyte
to 16 terabytes so a lot,
and a small gp2 volume can burst IOPS up to 3000.
Now we'll have a long lecture on burst
so you don't remember this right now
but it's important to know
that gp2 volume is like a T2 instance.
There's a burst aspect to it.
The max IOPS you can ever get on the gp2 right now
as of today is 16,000.
But that means that because you get three IOP per gigabyte
and that's a rule for gp2.
That means that when you have a gig-
(stammers)
a gp2 volume of 5334 gigabytes,
you are already at the max IOP.
So, any size after this increase
will not increase the number of IOPs.
So let's go have a look in the console.
So here I am in the console.
and what I'm going to do is go to volumes,
and in volumes I am going to create a new volume,
and here we have a dedicated page to creating volumes.
So I'm going to create a gp2.
And so let's have a look.
Yes, the min size is one gigabyte.
The last, the max size is 16 terabytes.
And I can choose a size and gigabyte.
So here, I say 100 but I could say 50.
And so as you can see, as I decrease
(stammers)
my size, my IOPs decreases.
So, if I have 10, I have 100 IOPS,
if I have 50, I have 150 IOPS,
if I have 200-
400,
I have 1200 IOPS.
And so the idea is that you get three IOPs per gigabyte.
You get a minimum of 100 IOPS.
But even if you set one gigabyte,
you still get 100 IOPS
and you can burst to 3000.
Okay, so here I have one gigabyte,
(stammers)
a hundred IOPS and a burst to 3000 IOPs.
If I go to say, 1000 gigabytes,
now I get three IOPS per gigabyte
and I'm at 3000, so there's no more burst.
The burst only happens when you're below 1000
so 9999 would give us a little bit of burst to 3000.
And so I can increase the size all the way
to 16 three eight four.
that is the maximum size of my IOPS volume
and as you can see,
right here, I reached a max IOPS which is 16,000,
because it says-
because my volume is bigger
than 533 gigabytes.
I already have the max IOPS of 16,000.
Pretty cool.
Now for the A-Z, I am locked to one-
to choosing an A-Z,
so volume is again locked to a specific A-Z.
It's not applicable to see
the throughput megabytes per second for the gp2 type.
And then we could
(stammers)
create it from the snapshot and encrypt it's volume,
but for now I just want to show you how
the size does impact the IOPS and vice versa.
Then we have the io1 volume and
so this is going to be for critical business applications
that will require sustained IOPS performance
so we need IOPS to be very consistent with it.
And usually, if you need more than 16,000 IOPS per volume,
so, which is the gp2 limit,
then you would have to go to io1.
So, you would use this for large database workloads
such as MongoDB, Cassandra, Microsoft SQL Server
MySQL, PostgresSQL, Oracle
basically when you have a critical database,
I would always recommend to use io1.
The size can range from four gigabytes to 16 terabytes.
And the IOPS is provisioned,
so it's called provision IOPS or PIOPS.
The minimum you can have is 100.
The maximum is 64,000.
Only for this very specific type of instance combinatorial
out of scope for this course, else, the maximum is 32,000
which is almost every other instance has a maximum IOPS
or 32,000.
Okay.
And then the maximum ratio of provision IOPS
to requested volume sizes is 50:1.
So, for each gigabyte you can request 50 IOPS.
Now let's go have a look at how this is in the console.
So now I'm going to choose io1 as my volume type.
And here I get both inputs for size and IOPS.
So let's see, I can say size of 1000, if I wanted to,
and this wouldn't change anything.
And then IOPS, I can go between 100 IOPS
to up to 64,000
but I'll just put 30,000 because
whatever it's going
to be maxed for my instance
so I'm not going to quit the volume by the way,
but, so the cool thing to see is that you cannot
have 50 times more IOPS per, for the size.
so if I say I want 10 gigabytes,
the max IOPS, I guess,
exceeds 500 like automatically.
It set 500. If I say 600 because I really want
it says no.
The maximum ratio is 50:1 permitted between IOPS
and volume size.
So you still need to,
You can't just have a very small volume
with a large amount of IOPS,
you still need to increase the size
as you increase the IOPS.
That's the idea.
The rest of the options are exactly the same.
And so invite you to just play around with these settings
to see how they work.
Now a bit less popular in the exam
but it's still good to know is st1
which is for streaming workloads
that need fast throughput at a low price
so we're talking big data, data warehouse
log processing Apache Kafka.
This cannot be a boot volume because it
has a very specific kind of workloads.
The size of ranges from a minimum of 500 gigabyte
to 16 terabytes.
You get a max IOPS of 500 and the idea is
that you can still get a lot
of throughputs up to 500 megabytes per second,
and has a burst as well.
So if we go here and go to st1,
we see that here the minimum size is 500 gigabytes
and the max is 16 terabytes.
And so I could increase to whatever I want.
And so,
if I say 4000, basically
the throughput megabyte per second increases
so we get 40 megabytes per terabytes.
And so, as I increase my size,
so, if I go to 10,000,
I will increase my throughput megabytes
so here I get 391 megabytes per second
with a burst up to 500.
And if I say a really, really big volume.
Say this much, I just get 500 all the way to 500
so this is the maximum throughput 500 megabytes per second.
So still cool to see not something you should know,
on your heart for your exam but st1 is for throughput
optimized HDD and they will give you basically a lot
of throughput in terms of megabytes per second.
Finally, your against you have sc1,
and this is going to be for storage of data
that is infrequently accessed
but still need high throughput.
So this is a scenario when you need the storage cost
to be quite low.
And this cannot be a boot volume as well.
Still the same size requirements as st1.
The max IOPS is even lower, it's 250.
And then, what we get is a max throughput
of 250 megabytes per second.
and this, you also have a burst capability
so it's like a less good st1.
I would say cheaper.
So again, we could play here and go to sc1,
and here, we can see that if we set the size
to be 200, no, 2,000.
Then we get a throughput megabytes of 24 baseline
and 157 burst and you can just play around with the size.
I'm not going to spend too much time doing this
but have a play.
Okay, so just as a summary,
gp2 is for general purpose volumes and it's cheap
and it provides you three IOPS per gigabyte
with a minimum of 100 IOPS, and it can burst up
to 3000 IOPS and the maximum is 16,000 IOPS.
That means that if you add a terabyte, okay,
you get an extra 3000 IOPS, so it's a good metric to know.
And again the volume says can be between one gigabyte
all the way to 16 terabytes.
And then for io1, This is provision IOPS
and it's more expensive.
The min IOPS is 100 the max IOPS is 64,000
If you use nitro instances, otherwise 3200-
32,000 IOPS and the size is going to be
between four gigabytes and 16 terabytes.
And this time for io1, the size of the volume
and the number of IOPS are fully independent.
This is why it's called provisioned IOPS.
For st1, this is throughput optimized HDD
where you get between 500 gigabytes and 16 terabytes
and this is measured in terms of throughput
so you get 500 megabytes per second max
and for sc1 which is Cold HDD for infrequently access data.
then you get between 250 and 16 terabytes
and 250 megabytes per second for throughputs.
Alright, that's it.
I will see you in the next lecture.