
<v Teacher>So let's get into a newer kind of storage</v>
offering from AWS, which is called Amazon FSx.
And Amazon FSx is awesome,
and it comes in two different flavors
that you have to know for the exam.
And so before introducing you Amazon FSx for Windows,
File Server, which is the first type of FSx,
I want to introduce you to a problem.
So remember EFS?
EFS for a default system, it's a shared POSIX file system.
That means that it's gonna be used
only by Linux EC2 instances, or on-premise machines.
Therefore, you can not use EFS with your Windows servers.
So how do you share storage between your Windows servers?
Amazon came up with FSx for Windows.
It's a fully managed Windows file system share drive.
It supports two important things, remember it,
the SMB protocol and Windows NTFS.
It supports Active Directory integration,
because it's a Microsoft thing
it makes a lot of sense, ACLs, and user quotas.
It's built on top of SSD, it has a massive scale,
it can scale to 10s of gigabytes per second,
millions of IOPS, and hundreds of petabytes of data.
So it's a scalable file system for,
distributable file system,
for Windows, that is managed by AWS.
It can also be accessed from your on-premise infrastructure,
and it can be configured to be Multi-AZ
and gets high availability.
Finally, data is backed up daily to Amazon S3,
so you can always recover your file system
directly from S3.
So Amazon FSx, think anytime you have shared storage
for your Windows instances,
this is Amazon FSx for Windows.
And there's another Amazon FSx
which is totally different,
I wish they named it differently but anyway.
So Amazon FSx for Lustre.
And Lustre is a type of parallel distributed file system
for large-scale computing.
So you need to know what Lustre means,
Lustre is derived from the term Linux and cluster.
So now it makes a lot of sense,
so Lustre is for Linux instances,
and because it comes from cluster
it's meant for large-scale computing.
And I think as soon as someone teaches you
what Lustre means, Amazon FSx for Lustre
is super easy to remember.
So what do we use Lustre for?
We use Lustre for Machine Learning,
High Performance Computing or HPC.
And you will find HPC to be mentioned
in the exam quite a few times.
So anytime you need a file system to perform
these High Performance Computing
then Lustre would be a good answer.
So we can also do video processing,
financial modeling, electronic design animation,
anything that requires a high level of distribution
for your file system and your computation.
So this is just for file system though,
and it scales up to hundreds of gigabytes per second,
millions of IOPS, and has sub-millisecond latencies,
so it is really meant for High Performance Computing,
or HPC, and has a seamless integration with S3.
That means that you can read your S3
like it's as a file system through FSx for Lustre,
and you can write the output
of whatever computation you're doing back to S3,
again through using FSx for Lustre.
So FSx for Lustre is a way to expose your S3 buckets,
as a file system as well, to your Linux instances.
It can also be used from on-premise servers
if you need it to.
So these two offerings from Amazon Web Services
on FSx for Windows and FSx for Lustre,
they're very different, but you need
to remember both use cases, so FSx for Windows
is going to be around a distributable file system
for your Windows instances, and FSx for Lustre
is going to be for Linux, and it's going to have
a cluster, a High Performance Computing cluster,
that has a file system that is shared,
with high IOPS, high throughputs,
very low NC, and integration with S3 as a backend, okay?
Well that's it for this lecture.
I hope you liked it and I will see you
in the next lecture for a hands-on on FSx.