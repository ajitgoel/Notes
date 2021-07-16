
<v Narrator>Okay, so now we're going to talk</v>
about EBS volumes.
And you may know already what they are,
but just bear with me, you may learn a thing or two.
And in this section, we'll go actually
do a deep dive on a few concepts.
So the idea is that if you have an EC2 machine
and you terminate it for whatever reason,
it will lose its root volume by defaults.
And so that means that all the data on it will be lost.
And so sometimes unexpected terminations might happen
from time to time.
AWS will tell you, but you never know.
So you need a way to store your data safely somewhere.
Okay, you don't want your main data
to be on your root volume.
You want it to be on an attached volume.
And that attached volume is going to be an EBS Volume.
It's going to be a network drive
that you can attach to your instance while they run,
and you can persist your data on it.
So you can place whatever data on your EBS Volume.
For example, if you have a database,
it would be really smart to place the database data
onto your EBS Volume.
So you already know this, but it's a network drive.
It's not a physical drive.
So think of a USB stick, but over the network.
So we'll use the network to communicate to your instance,
so there might be a bit of latency.
And it can be detached from an EC2 instance
and attached to another one very quickly,
as long as they're in the same AZ.
That's because it's a network drive,
because it's just mapped over the network.
It's locked to an AZ, so by default a volume
that will be created in us-east-1a
will not be able to be attached to a us-east-1b.
Now you can play around and you can move a volume across,
and we will see this in the hands-on in this section,
but first we need to create a snapshot of our EBS Volume,
and we'll see this.
Finally, when you create an EBS Volume,
we need to provide a provisioned capacity.
So we need to say how many gigabytes we want
and how much IOPS we want.
And you are going to get billed for all the capacity
that you provision, not that you use.
So if you provision one terabyte of a disk,
but you only use one gigabyte,
you're still going to get billed for one terabyte.
And that's super important that you understand.
So over time, this is a new capability,
and we'll see this in hands-on as well.
We can increase the capacity of the drive as we go along.
So it's very smart to start small and then increase bigger
as we start using more data for EBS Volumes.
So quickly, visually, us-east-1A,
we'll have three EC2 instants.
And the first instance goes by EBS Volume,
the second one has two EBS Volumes and 100 gigabytes,
and 50 gigabytes.
The third one is nothing.
And then in us-east-1B, the second incidence will have
an EBS Volume of 50 gigabytes.
Just an example, but what we can see here
is that our EBS Volumes are scoped to a specific AZ.
I cannot attach my volumes of us-east-1a
to an instance in us-east-1b.
It just does not work.
Now we'll do a volume deep dive into the next lectures,
but right now, you just need to know that EBS Volumes
come in four types, GP2, which is for general purposes,
SSD, which is quite balanced, good price, good performance.
IO1, which is highest performance SSD,
which means super low latency or high throughput workloads,
so you're usually running your critical database on IO1.
ST1, which is going to be a low cost HDD volume
so it's going to be more around looking more throughput
and running big data workloads,
and SC1, which is a co-volume, which is also for big data
but for less frequently accessed workloads usually.
So each volume will have the characteristic in size,
throughput, IOPS, which is I/O Ops per second.
And then when you're in doubt,
always look at the AWS documentation.
It changes all the time, they always improve the EBS Volumes
so my slides may be outdated very quickly.
And by the way, when you create an instance,
you can only choose GB2 and IO1 to be used as boot volumes.
All right, now we're ready, so let's go in the next lecture,
in which we will be creating an EC2 instance
and attaching a few volumes.
So see you in the next lecture.