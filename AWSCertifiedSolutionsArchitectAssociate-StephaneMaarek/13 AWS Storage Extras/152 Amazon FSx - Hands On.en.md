
<v Narrator>Amazon FSx is not something we can play with,</v>
because there is no feature for it,
but I still want to show you, through the console,
the different options we have to play with FSx
and see the kind of file systems we can create.
So, I am in US West too.
Maybe I should select a region a bit closer to me.
So, I'll select something in Europe, for example, Ireland.
And here we go.
So, I'm going to create a file system,
and we have two options.
We have FSx for Windows File Server
and FSx for Lustre.
So, let's go ahead with FSx for Windows File Server.
And if I scroll down,
it tells you exactly what I told you right now,
so no need to read it.
Click on next.
And we have to specify our file system,
so FSx File System for Windows.
Do we want a multi-AZ or single-AZ deployment?
This is for high availability.
The storage capacity, so you can see here
that we have to provision the storage in events,
so the minimum is 32 gigabytes
and the maximum is 64 terabytes.
So, I can say, for example, I want 32 terabytes
of storage for my Windows,
and then, the throughput capacity.
So, do we want to have the recommended throughput
at half a gigabyte per second,
or do we want to specify the throughput
and go all the way to two gigs per second
or all the way down to eight megabits per second?
And, obviously, the pricing will depend on these things.
But so, as you can see, this FSx File System for Windows
is not something that's elastic.
It's something that we have to provision in vents,
in terms of capacity, and in terms of storage.
For network and security,
we have to deploy this within our VPC,
and attach a security group to control
who can access your file system.
And there is preferred subnets and the standby subnet.
The standby subnet is going to be
because we have multi-AZ,
and we want to have fellow virtual standby subnet,
in case something goes wrong.
Then, do we want to have Windows authentication?
Is it gonna be through
AWS Managed Microsoft Active Directory,
or a self-managed Active Directory,
where we have to enter all the connection information?
And we don't have any of those,
so we can't really do anything with it.
Do we want encryption of our file system?
Do we want the FSx default key
or a key that we create ourselves?
And then, some options for maintenance
around backups and so on.
And then, some tags if you wanted to tag our file system.
Now, this would cost us a lot of money
if we tried to create this,
so I'm not going to try to create
our FSx File System for Windows,
but we saw the options and we understand better what it is.
Then, if I go back to FSx and create a file system.
This time, I'm going to choose for Lustre,
and this is for high-performance computing
for your Linux machines.
So, let's click on next
and see the options.
So, again, FSx for Lustre as the name.
The storage capacity, now, is 1,200, 2,400 gigabytes,
or incremented of 3,600 gigabytes, so 3.6.
So, I can do 7.2 terabytes.
I can do something like this,
and then, automatically, the throughput capacity
is going to be computed as the storage capacity,
in terabytes, times 200 terabytes per second.
So, we get 1.4 gigabytes per second in that case.
So, if I keep on increasing the storage,
so, for example, I can do this.
Storage, I am gonna get more throughput capacity.
And, obviously, I think you can go really, really high
on the capacity, so let's have a look
if we can increase the capacity of something really high,
such as 108 terabytes.
Yes, we can.
And what about even something better?
How about petabytes?
Yes, we can.
So, we can really have a really, really big file system
for FSx for Lustre, and the throughput capacity
of that system is 210 gigabyte per second,
which is huge.
Then, the security, same as before,
a default VPC, a security group, and a subnet.
So, this one is not multi-AZ.
And in encryption, it is automatically encrypted at rest,
so we don't even have an option to select no.
Do we want to integrate with Amazon S3
as a source for our data repository,
and do we want to have a specific bucket?
And this is awesome,
because now FSx will integrate with our S3 bucket.
So, I'm just going to say, "no."
And maintenance preferences
for the weekly maintenance windows.
So, do we want to have no preference,
or do we want to, say,
define the maintenance window we need?
So, that's it.
Again, I cannot create
this file system.
It will cost me an insane amount of money,
but you get the idea of how it works
and hopefully that gives you a better idea
of what is the difference between FSx for Windows
and FSx for Lustre.
And when you go into the exam, you will have a easy way
of selecting the right one.
All right, that's it.
I will see you in the next lecture.