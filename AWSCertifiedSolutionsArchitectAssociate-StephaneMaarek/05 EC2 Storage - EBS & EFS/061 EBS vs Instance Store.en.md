
<v Instructor>So let's talk about the difference between</v>
an EBS volume and an instance store.
So basically, some instances
do not come with Root EBS volumes,
they just come with something called instance store.
An instance store is equivalent to ephemeral storage.
So, what's the difference between
Instance Store and EBS volumes?
Well, an instance store is something
that is physically attached to your hardware.
Whereas EBS was your network drive.
And so imagine,
that's the big racks inside of Amazon's data centers.
Some of these machines, some of these EC2 instances we get,
they will have a physically attached disk
and that will be an instance store.
And the idea is that, why would we even use this?
Well, because there is no network,
you're going to get better I/O performance,
you're going to get a good utilization,
if you wanted to have a buffer, a cache,
you want a scratch data,
you want to store temporary content.
And if you wanted to, for example, reboot your instance,
that's fine, the data will survive your reboots.
But why would you not use an instance store?
Well, on stop or termination
your entire instance store data is lost,
so it's not very good.
And you can't resize the instance store on the fly
just the way we did from EBS volumes.
And if there are any backups you need to do,
you can't just right click and back up,
you need to do this yourself.
So instance store
do have a big use case for caches, or whatever,
but they're not for every different kind of use case.
So if you're in the exam, they ask you,
"Should we use an EBS volume or an instance store?"
Ask yourself, "Am I okay losing my data
"or is my data ephemeral?"
If not, use EBS.
Just want to reiterate what I already told you,
but it's very important
that I make sure you have this across perfectly.
So, the instance store is a physical disk
attached to the physical server where your EC2 is,
and it's very high IOPS because it's physically attached.
EBS volumes were network-based
and so there was networking between your instance
and so there is limited IOPS.
But with EC2 instance store it's really, really high IOPS.
Here's an example from the documentation.
If you consider, for example, an i3.8xlarge,
we're talking about 720,000 write IOPS
and 1.65 million read IOPS.
So this is huge and obviously it can go even higher.
To two million, three million IOPS on the read
and 1.4 million on the write.
So when you're in the exam, you think about,
high, high, high IOPS, maybe hundreds of thousands of IOPS,
you have to think local EC2 instance store.
EBS cannot achieve such IOPS for you.
They're limited up to 64,000 IOPS and that's for io1.
So the disk though, they're up to 7.5 terabytes.
That can change over time,
so maybe as EBS adds more instances, it will be bigger.
And they can be stripped to reach
all the way up the 30 terabytes.
And again, that number can change over time.
But once you set up a disk in local instance store,
it cannot change its size.
It's also block storage.
So you can have a file system on it, just like EBS.
So from your instance standpoint it's still a file system.
It's still just a disk.
The difference is that it's a physical disk,
not a network disk.
And so as I said, yes, it cannot be increased in size.
So once you provisioned your local EC2 instance store,
you cannot resize it over time or add new ones.
Whereas for EBS, you could change its size over time.
And finally, I've told you this again,
but I'll tell you it again,
there's a risk of data loss if your hardware fails.
That means if you stop your instance and lose it,
then you've lost the physical disk attached to it
and you've lost your data.
So make sure you don't store
very sensible data on your instance store,
as long as it's not replicated.
Make sure that if you use an instance store,
you're going to replicate your data
across other instance stores in other instances
to have some kind of redundance.
So if I wanted to go ahead and launch an instance,
from there, I'll choose Amazon Linux 2, I'll select this.
And in terms of the instance type,
I will choose something that has instance store.
So as we can see, for example, c5d.large
will have an instance store, so I will click on this.
Click on Configure Instance Details.
Click on Add Storage.
And as you can see now, we have a root volume right here,
which is still an EBS volume,
but then the volume type we have here
is called ephemeral0 so it's instance store.
So it's going to be named ephemeral.
And we have a 50 gigabytes instance store
that we can use, and the really cool thing about it,
it that's going to be high performance
for this 50 gigabytes.
So we could place some cache data, for example, there.
So this is what I wanted to show you.
I'm not going to ahead and create that instance
'cause there's no point and I'll spend money on it.
But, just so you see that to create an instance store,
backed EC2 instance,
you have to chose some kind of specific type of instance.
So I hope you liked it, I hope you enjoyed it,
and I will see you in the next lecture.