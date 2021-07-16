
<v Instructor>Okay so now let's talk about EFS.</v>
EFS is a service you need to know at a high level,
going in to the exam,
but it is very interesting from an architectural standpoint,
and has a really amazing set of features.
So, what is EFS?
It stands for Elastic File System,
and it is a managed NFS or network file system,
that can be mounted on many EC2 instances,
across many different availability zones.
So, as I said, it works with multi-AZ,
and this is a huge difference of EFS versus EBS.
EBS was locked into a single availability zone,
whereas EFS is going to be
mountable across multiple availability zones.
And so, as such, it's highly available, it's scalable,
but also extremely expensive.
It's about three times the cost of a gp2 drive,
but you only pay for what you use,
so if you don't store that much data,
it may actually be cheaper to use EFS than EBS
based on how well you manage your data set
and size on your EFS drive.
So, here is your EFS,
and this is a network file system,
and you attach a security group to it
to manage incoming connections,
and so you have different EC2 instances
across multiple AZ, so us-east-1a,
us-east-1b and us-east-1c,
and they will all be mounting the same NFS,
the same EFS on to their file system,
and they will all access the same files, okay.
So EBS was something that was
linked to one EC2 instance at a time,
and so, the data was not shared
between multiple EC2 instances,
but in this case, with the EFS, it's a network file system,
and as such, all the EC2 instances
have access to the same files onto your EFS drive.
So, use cases for this, well, content management,
web serving, data sharing, or Wordpress websites.
Now you need to know, it uses the standard NFSv4.1 protocol,
so it is a standard way to mount a network drive,
and to access the EFS file system
you need to use security groups,
so this is a network security.
EFS is only going to work for Linux based AMI,
so not Windows,
so this is something that's extremely important.
Windows instances cannot mount an EFS
onto their file system.
To encrypt the EFS you can use KMS keys at rest,
and so, again, as I said, EFS is going to be used
only for POSIX file systems, so basically in Linux,
and has a standard file API,
and the file system will scale automatically,
it's pay-per-use, no capacity planning,
so that makes it a very easy offering to use.
Now let's talk about some configurations
that you have for EFS,
and they're important to understand going into the exam.
The first one is around the scale.
So EFS is built for thousands of concurrent NFS clients,
so thousands of EC2 instances mounting the same NFS drive
at the same time,
and also, has massive scale,
we're talking about 10 gigabytes plus,
per second of throughput.
The way AWS advertises EFS,
is that it can grow to petabyte-scale network file system
automatically,
so that makes it something truly big.
In terms of performance mode,
you have two ways of setting it,
and you set it at creation time.
We have general purpose,
which is when you have
the default latency-sensitive use case,
so we have a web server, a CMS, etc.
So, this is going to be the default one for EFS,
but also Max I/O,
and this is going to give you more throughput,
is going to be more highly parallel,
but is going to be having a higher latency.
So, this is well suited for if you have a big data workload,
media processing, so, big files, huge files,
you know, not many small files,
and they can be accessed with a bit more latency.
So, do you need to be able to choose between job purpose?
Usually for anything web related, from Max I/O,
which can be anything processing related.
And then, extremely important,
and you have to remember this.
There are different storage tiers for EFS,
and so you have a lifecycle management feature
that allows you to move files between a different tier
to another tier after "N" number of days.
So, the standard storage tier
is for frequently accessed files,
so, files are going to be
frequently requested onto the file system,
and they're going to remain into this standard storage tier,
but in case you have some files
that are infrequently accessed,
you have the infrequent access storage tier
on the EFS called EFS-IA,
and that can come up at the exam.
And the idea is that
the files are going to be less accessed,
so it's going to be having a lower price
to store these files,
but in case you do need to
retrieve these files for whatever reason,
then you're going to have a retrieval fee,
and there will be a small cost, okay.
And so again, you need to remember,
maybe some files are going to be better off
to be on the standard source tier
and some files will be better off
in the infrequent access storage tier.
And that's it for EFS, I hope you like this
and I will see you in the next lecture.