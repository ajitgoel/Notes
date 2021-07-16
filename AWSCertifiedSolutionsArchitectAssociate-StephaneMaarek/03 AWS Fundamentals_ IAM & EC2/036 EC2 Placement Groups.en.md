
<v Instructor>So, now let's talk about placement groups.</v>
Placement groups are a little bit more advanced,
and we want to use them when we want to have control
over how our EC2 instances are going to be
placed within the AWS infrastructure.
So, that strategy can be defined
using these placement groups,
so we don't get direct interaction with the hardware of AWS,
but we let AWS know how we would like our EC2 instance
to be placed compared to one another.
So, when you create a placement group
you have three strategies available for you.
You have the cluster placement group,
in which your instances will be grouped together
in a low-latency hardware setup
within a single availability zone.
This is going to give you high performance with high risk.
We'll see this in detail in a second.
Spread means that your instances are going
to be spread across different hardware,
and there is a restriction on this that means
you can only have seven EC2 instance
per placement group that's spread per AZ,
so you would use a spread placement group
when you have critical applications.
Finally, the last one is a new kind of placement group
that is really helpful, it's called partition.
It's similar to the spread,
meaning that you want to spread your instances,
but here they're spread across many different partitions,
and these partitions rely on different
set of racks of hardware within an AZ.
What that means is that they're still spread
but they're not isolated one from another failure,
but a partition should be isolated
from another partition of failure.
The idea with this is that you can scale
to hundreds of EC2 instances per group,
and that allows you to run applications
such as Hadoop, Cassandra, or Kafka.
Now let's have a look into each
of these placement group in details.
For cluster that means that all our EC2 instances
are on the same rack, which means same hardware,
and it's in the same availability zone,
so as you can see, all these instances are on
the same hardware, and so why would we do this?
Well, basically we would place them on the same rack
because we want to have a cluster,
we want to have super low latency,
and we want to have maybe 10 gigabytes of speed network,
so that means that we have an amazing network, right,
but as a drawback of this great network that we get
we get the con that if the rack fails,
if there's a failure on the hardware
then all the EC2 instances will fail at the same time,
so we have increased our risk to have a failure
that's going to be propagated across our entire stack.
So, when would we even use this?
What's the benefit to getting this increased risk?
Well, we get great network, and so for this
that means that we can have a big data job
that we'll need to complete very fast,
or maybe we have a requirement to have an application
that needs extremely low latency and high network throughput
and we're willing to take on the risk to have this failure.
And so this is something you have to realize.
It's not for every kind if application,
but if your application needs super high
bandwidth and low latency, placement groups
is kind of a nice, the cluster placement group
is kind of a nice way of doing it.
Now, spread is the complete opposite.
In spread we want to minimize the failure risk,
and so in this case when we ask for spread placement group
all the EC2 instances are going to be
located on different hardware,
so as you can see here, we have three AZ
and we have six EC2, and each EC2 instance
is on a different hardware, so what does that mean?
Well, what we get is that we can span across multiple AZ
and there is a reduced risk of simultaneous failure.
Why, well because if my hardware 1 fails
I'm pretty sure my hardware 2 will not fail,
and so we've separated the risk of my two instances
in the Us-east-1a to fail at the same time,
and so that's the benefit from it.
The con is that from this configuration
we're limited to seven instances per AZ per placement group,
so there's a limit to how big your placement group can be,
and so you need to have an application
that's gonna be of good size, but not too big.
The use case would be an application that needs
to maximize high availability and reduce the risk,
and in general for critical applications
where your instance failures must
be isolated from one another.
Remember, here we have a limitation
of seven instances per AZ per placement group.
Now, for the partition placement group
within the AZ we'll have different partitions,
so partitions are sets of racks,
and so we have here, in this example, three partitions,
but we can create up to seven partitions
in a partition placement group.
So, on each partition you will have different EC2 instances,
so in this example I have four EC2 instances per partition,
and here we can see that within a partition
all these EC2 instances could fail together,
but across two partitions there is no failure that's shared,
so this is why you would have partitions
and an application that can tolerate
a whole rack going down,
as long as your data is as well partitioned.
So, what can we know about this?
Well, there's up to seven partitions per AZ,
and up to hundreds of EC2 instances
as part of that placement group,
and that is the difference versus
the spread placement group.
The instances in a partition do not share
the racks with the instances in other partitions,
and therefore a partition failure can affect many EC2,
but won't affect other partitions.
EC2 instances can get access to the metadata
representing which partition to belong to,
and the use cases for this kind of set up is going to be
for distributed big data applications, really,
so HDFS, HBase, Cassandra, and Kafka.
All right, so let's have a look in the UI
about how we can create placement groups.
So, let's go ahead with creating our first placement group.
For this, the menus on the left hand side under network
and security you will find placement groups.
Create a placement group, and the first one
is going to be called my-high-performance-application,
and because this is a high performance application
we want to create, and I just name it this way,
I want to use the cluster strategy.
Remember, cluster groups my instances together
so that they have high network
communication between the two of them.
So, here we go, I've just created my first placement group,
which is a cluster placement group.
I can create another one, and this one,
for example, will be my-critical-application,
and it's critical because I want
to run it as a spread cluster,
and here our application's going to be
spread out as much as possible,
but remember we can only have
seven instances per spread group, okay?
And finally I will create one last one,
my-distributed-application, and this one
is going to be a partition strategy,
and I have to select the number of partitions,
and the tool tip tells me that
the maximum number of partition is seven.
I will just go ahead and create three.
Click on create, and here we go.
We get some information around all
the placement groups we have,
but how do we use these placement groups?
Well, for this we'll go to instances and launch an instance.
We'll create an Amazon Linux 2 instance
and we won't go all the way with creating
the instance just to show you the option.
I'll select a t2.micro, click on configure instance details,
and here on the left hand side there's placement group,
and I can tick the box and add
the instance to the placement group.
Here I can create a new placement group
or add to an existing one,
but we'll choose one that's existing,
so we could select spread, and spread
allows us to launch up to seven more
instances into this placement group,
so there will be seven of them
will be spread out across our AZ.
There will also be partition,
and here we can specify the target partition
we wanted to, one, two, or three,
or we could have an auto distribution
if you wanted AWS to try to equalize
the partitioning of our EC2 instances,
or as you can see, cluster is not showing up
because cluster is not available for t2 type of instances.
So, if I select something a little bit more,
something like m5a.24xlarge,
and I'm not going to launch it, obviously,
so I'll say yes, I would like to continue with this,
then I'll say OK, and this time
you're going to launch it as a cluster,
and so the cluster placement group right now
is available only for instances types that are quite high.
So, here we go, I could select
my cluster type and we'll be done.
So, that's it, this is how you would
assign an EC2 instance to a placement group,
and you can create many EC2 instances
within a placement group,
and then you would click on review and launch,
but we're not going to do this
because I don't want to pay for an m5a.24xlarge, okay,
but at least I hope you understand how placement groups work
and how we can use them through the console.
Hope you liked this lecture.
I will see you in the next lecture.