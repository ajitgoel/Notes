
<v Instructor>So, now let's discuss EBS versus EFS.</v>
So EBS volumes can be attached
to only, one instance at a time,
and they are locked into a specific Availability Zone.
So here's an example,
we have our EC2 instance in the first AZ
and the EBS volume, as we can see,
really is within that AZ
and is only attached to one EC2 instance at a time.
So we seeing we have different types of EBS volumes,
some important ones is gp2,
where the IO will increase as the disk size increases.
Or the io1, where we can increase
the IO independently from volume size,
and this is great if you're running a critical database.
If you want to migrate an EBS volume
across different Availability Zone,
then you first need to take a snapshots,
and then, once you have the snapshots
you're going to restore the snapshot into another AZ,
and that will create a new EBS volume into that AZ.
And so while you do this, EBS snapshots, EBS backups,
that will use all of IO on your EBS volumes,
so it should be run only when your instance
is not actively using your EBS volumes
otherwise, you may get performance issues.
Finally, the Root EBS Volumes of your instances
will get terminated by default
when your EC2 instance gets terminated,
but this is a behavior
that you can disable, if you want it to.
So this should be something you master right now,
this is very easy, this is EBS,
and this is all you need to know.
And now, you should know that EFS
is, its very, very, very different.
So EFS is your Elastic File System,
and this one can be mounted to hundreds or thousands,
or instances across multiple Availability Zone.
So these instances are running Linux,
and as we can see the EFS in this case,
sits outside of our AZ because it is multi-AZ.
So, you can use EFS Mount Targets
that are going to be in specific AZ,
to mount between your EC2 instances
all the way to your EFS drive.
And so, we can use EFS to share website files
such as WordPress,
and as I said, it is only for Linux Instances
because it is a POSIX file system,
so it does not work for Windows.
EFS is going to be more expensive than EBS,
about three times more expensive,
but if you want it to do some cost saving,
you can use EFS-Infrequent Access as a storage tier
and using a lifecycle policy,
to have these enhanced cost savings.
And again, what you remember is that for EFS,
you do get billed only for what you use on your EFS,
whereas for EBS, you have to provision in advance
a size that you know for EBS drive,
and you pay for the provision capacity
not the actual use capacity.
So, now you should remember,
EFS is really for a network file system
to be mounted across multiple instances.
EBS is for a network volume,
then it should be mounted only on one instance
and it is locked to an AZ.
An Instance Store is to get the maximum amount of IO
onto an EC2 instance,
but is something you lose, if you lose that instance,
so it is an ephemeral drive, okay.
Well that's it, I hope you liked it,
and I will see you in the next lecture.