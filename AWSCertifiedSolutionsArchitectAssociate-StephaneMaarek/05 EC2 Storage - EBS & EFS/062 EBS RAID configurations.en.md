
<v ->Alright, just a few more things</v>
you need to know about EBS.
So EBS has RAID options.
And so RAID is usually, traditionally,
used with disk on your own data center
but EBS is a bit special because
EBS is already some form of redundant storage.
It's already replicated within your AZ.
But if you wanted to increase your IOP
to say 100,000 IOPS, how would you do that?
Or what if you wanted to mirror your EBS volumes
because you didn't trust Amazon
for making your storage redundant?
What if you wanted to mount volumes
in parallel using RAID settings?
And that's something you can do.
And so RAID will be possible as long as
your operating system will support it.
So that means Linux or Windows.
And you have many RAID options out there.
There's RAID 0, RAID 1, and these are the ones
that they will ask you about at the exam.
But there's also RAID 5 which is not recommended for EBS.
You have to see the documentation why.
And RAID 6 which is also not recommended
for EBS, see documentation.
And so, also RAID 10 but we're not talking about it.
So in this lecture we're just going to focus
on an introductory to RAID 0 and RAID 1 for EBS, okay?
So what is RAID 0?
And you need to know about it.
It is a way to increase performance.
So if you need to make a mind map.
RAID 0 means performance.
So we have our EC2 instance and it has one logical volume.
But that volume is a bit special
because it is backed by two or more EBS volumes.
So we have EBS Volume 1 and EBS Volume 2 in this example.
And so when you do it right, it's either going to
EBS Volume 1 or it will be going to EBS Volume 2.
So when you write data, for example
I'm writing blocks A, B, C, and D,
as you can see they get distributed between the two volumes.
And so you combine these two volumes
into one logical RAID 0 stripe
and what you get out of it is the total disk space in IO.
So if your EBS Volume 1 is 50 gigabytes
and EBS Volume 2 is 50 gigabytes, you get 100 gigabytes.
The idea though is that if one of these disks will fail,
you lose all your data, all your logical volume is gone.
So, when you have this, you increase performance
but you are risking more.
You are increasing your risk to have faults.
So use cases for this would be
an application that will need maybe
a lot of IOPS and doesn't need fault tolerance.
Or maybe a database that has already replication built-in
and can leverage a bit of fault tolerance as well.
So, using this mechanism,
we can have a disk with a lot of IOPS.
We can go all the way to 100,000 IOPS
if you wanted to by using 10 volumes with 10,000 IOPS each.
So here's an example.
If you have two 500 gigabytes Amazon EBS io1 volume
and each of them has 4000 provision IOPS
they will create a 1000 gigabyte RAID 0 array
with an available bandwidth of 8000 IOPS
and 1000 megabytes of throughput.
And so that's a cool thing.
Here we get to see how things work
and we get to see that, yes,
if we do have two EBS volumes in RAID 0 mode,
then it is going to sum-up the size
of the disk space and sum-up the IO.
Now, similarly, there is RAID 1
and this one is to increase fault tolerance.
So RAID 0 was for performance.
RAID 1 is for fault tolerance.
And so the diagram is kind of similar.
We have an EC2 instance
and has one logical volume exposed to it.
But this time we have EBS volumes one and two
and we are going to write to both at the same time.
So anytime we write a block A on volume 1
it will also go to Volume 2.
B and C.
And so they're also going to happen from to OS side.
So your EC2 instance will be writing
to both volumes at the same time.
And so this is RAID 1 and it's called mirroring.
So you can mirror a volume to another
because Volume 1 and Volume 2 have the exact same data.
The idea is that if one of these volume fails
then our logical volume is still working
because we have a copy of the data somewhere else.
So we have to send the data out
to two EBS volumes at a time.
That means that we have to use
two times the network throughput.
So it is something to really make sense of
because if you use RAID 1,
you're going to need an EC2 instance
that has more network throughput to handle
the writing to two EBS volumes at a time.
Use cases for this will be an application
that needs to increase volume fault tolerance
and you don't trust AWS,
or an application maybe where you need to service disks.
So, for example, if you have
two 50 gigabytes Amazon EBS volumes io1
with 4000 provision IOPS each
they will create a
just one 5000 gigabyte RAID 1 array
and it will have the exact same IOPS, 4000 IOPS,
and will have 500 megabytes of throughput.
So the only thing that you've added here is fault tolerance.
You haven't added any performance to it.
So you need to really remember these two, RAID 0 and RAID 1.
And it's not something that lives in the AWS console.
It is something that you have to do on the OS,
on your Linux or on your Windows.
So we have to go through some configuration.
Now in the documentation there is a way to do it
and you can just walk through it on your own for practice.
But for the SysOps exam they don't expect you
to know how to do it, they just expect you
to know that you can use EBS volumes
in RAID 0 or RAID 1 setting.
And here's how they work.
So I hope you enjoyed it.
I hope you like it.
And I will see you in the next lecture.