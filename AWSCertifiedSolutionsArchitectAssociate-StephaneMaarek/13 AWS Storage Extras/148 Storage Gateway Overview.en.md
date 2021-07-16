
<v Instructor>This is a lecture on Storage Gateway.</v>
So first, let's talk about Hybrid Cloud.
So AWS is now pushing for Hybrid Cloud
so what does that mean?
That means that part of your infrastructure
will be on the cloud on AWS
but also if you've been operating for a long time,
part of your infrastructure will also be on-premise.
This can be due to many reasons,
maybe you have a long cloud migration,
or security requirements or compliance requirements,
maybe it's your strategy to be half and half, so hybrid.
The idea is that S3, for example,
as we've been talking about it,
it's a proprietary storage technology.
It's not like NFS, which is standardized.
So how do we expose the S3 data when we are
with on-premise servers or on-premise computers?
So that's the whole idea behind AWS Storage Gateway.
It's going to give us access to S3
through a gateway which will expose standard API's.
So if we look at AWS how the storage works today in
the Cloud-Native way, well we have Block Storage
which is EBS or EC2 Instance Store,
that's basically our volumes.
Then we have file storage.
That's when we dealt with EFS and we're storing files
on a network file system.
Then we have object when we were storing files
and objects directly on S3 and Glacier.
So all these three things are different.
I know it's hard to see, but they're actually different.
So, the idea is Storage Gateway will bring a bridge
to these solutions.
So let's have an example.
So the use cases where we wanna maybe bring
the on-premise data into S3 or bridge it,
is to do disaster recovery, back up
and restore, or maybe tiered storage.
So we get three types of Storage Gateway
and for the exam, you'll need to know the three of them.
The number one is a File Gateway
which will basically allow us to view files
on our local file system on-premise,
but it will be backed by S3.
There will be Volume Gateway to do
the exact same thing, but with volumes.
There will be Tapes for backups and recovery.
So all these things are going into the Storage Gateway
and we'll have details on it in a second
and it will go straight into EBS,
S3 or Glacier, but behind the scenes.
We don't have to handle this,
Storage Gateway will do this for us.
So the idea is that we need to know
when to use Storage Gateway.
For the exam, you need to know the difference between
File Gateway, Volume Gateway, and Tape Gateway.
So let's make sense of all of them right now.
Now File Gateway is when you have S3 buckets
and you want them to be accessible using maybe
the NFS protocol or the SMB protocol
and these are standard protocols.
So NFS is for Network File System,
we've seen this before using EFS,
but this time it's to expose an S3 bucket using NFS.
This will support S3 standard, S3 IA, One Zone IS,
which supports all modes of S3
and each bucket will need to be accessed
by the File Gateway and it will have it's own IAM role.
The cool thing about it is that through
that File Gateway, we access our files in S3,
but it exposes NFS API.
The most recently used data
will be cached into the File Gateway.
So the cool thing about it is
that the File Gateway will take our most active S3 objects
and cache them locally.
This File Gateway, because it's NFS,
it can be mounted on many servers.
So usually a diagram helps.
So we have our data center on the bottom left
and we have our Application Server.
It wants to use the NFS protocol
for Network File System, maybe v3 or v4.1.
So it's going to talk to the File Gateway.
So we have to setup a File Gateway on-premise.
The File Gateway automatically goes
and talk to the AWS cloud to S3, S3IA, or Glacier
and basically gets the files we need
and caches them locally onto the File Gateway.
So the cool thing is that from our applications perspective,
it seems like we're talking to a local network file system,
but the File Gateway actually does
some magic behind the scenes and talks to S3 or Glacier.
So that's the idea behind File Gateway.
Now we have Volume Gateway.
This is when you own to have Block storage.
This usually in the exam will say iSCSI protocol
and they will be backed by S3.
So the idea is that the EBS snapshots
will be made from time to time and they will be NS3.
This will help us restore on-premise volumes
if we wanted to.
So we have two options for Volume Gateway.
We have the Cached volumes and
that's basically going to give you a low latency access
with the most recent data on your volumes
or Stored volume which is going
to be an entire dataset that will be on-premise
and it will have scheduled backups to S3.
So from time to time it'll go to S3.
Again, diagram may help, but we have our customer premise
and usually we mount volume using the iSCSI protocol.
So the idea is that our application server is going
to mount a volume from the Volume Gateway
and for on-premise, it will look like
it's just the local volume, but the magic happens again
with the Volume Gateway.
It basically will store this as
Amazon EBS snapshots backed by S3.
So again the idea is here we provide
on-premise servers access to Volume Storage, Block storage,
and the idea is that the Volume Gateway scales a lot thanks
to being backed by the Amazon Cloud.
So again, we would have to setup the Volume Gateway.
You have again two options,
either you cache the volume,
so that means you have low latency access
to the most recent data, or you have Stored volume where all
the dataset lives on the Volume Gateway
and from to time you will get schedule backups to S3.
Finally, for Tape Gateway.
Some companies still have processes
to use physical tapes.
So with Tape Gateway, basically you use
the same processes but it's going to be backed in the cloud.
For this, you build a VTL, or Virtual Tape Library
and it will be backed by Amazon S3 and Glacier.
The idea is that if you have existing processes
or software and they use sometimes the iSCSI interface
then it will work as well with Tape Gateway.
So Tape Gateway is for a backup reason
and so we would have a backup server in the Backup software
and it will be connecting directly using iSCSI
to the Tape Gateway and automatically
the Tape Gateway is smart
and will basically create a
Virtual Tape library stored in S3 or Glacier.
So the idea here is that if you see anything around backup
and Virtual Tapes, think Tape Gateway.
So for the exam, I know this may be complicated
and for me, even me, it took me a lot
of time to wrap my head around it
and I try to explain it best.
For the exam tip basically read
the question well, it will hint at which gateway to use.
So if you get a general question around,
we need to bridge on-premise data into the cloud,
think Storage Gateway at a high level.
If you get a more detailed question,
then if it says we want to have file access
or NFS, think File Gateway.
File Gateway is, remember, is backed by S3.
If it says we want volume or Block Storage
and there is iSCSI in the question,
think Volume Gateway, it will be backed
by S3 with EBS snapshots,
but you don't need to know this for the exam.
Then if you see VTL Tape solution,
if you see Backup, the word Backup with iSCSI,
think Tape Gateway.
So if you just learned this one slide,
make a screenshot of it, I don't know, just remember it,
then you should be all set for the exam,
but I wanted to give you details around
how it worked in the back ends.
So remember, Storage Gateway on-premise data to the cloud.
File access or NFS will be File Gateway.
Volume, Block Storage, iSCSI will be Volume Gateway.
VTL Tape Solution, Backup with iSCSI will be Tape Gateway.
Alright, you know everything about Storage Gateway.
I will see you in the next lecture.