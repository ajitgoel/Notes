
<v Instructor>Hey so let's have a lecture on how to compare</v>
all the storage options we have in AWS,
because that may be a lot of information for you,
and you may want to take a step back and understand
at a high level what everything means.
So S3 is going to be an object storage,
it's going to be serverless,
you don't have to prove incapacity ahead of time.
It has some deep integration with so many database services.
It is awesome!
And Glacier is going to be for object archival.
So this is when we want to store objects
for a long period of time.
Retrieve it very very rarely,
and when we retrieve these objects,
they're going to be taking a lot of time
to get back to us because they are archived.
Now EFS is Elastic File System,
and this is a network file system for Linux instances.
It is a POSIX file system so that means for Linux again.
And it is accessible from all your EC2 instances at once.
So it is something that is going to be shared and across AZ.
FSx for Windows is the same thing as EFS, but for Windows.
So it's a network file system for your Windows servers.
FSx for Lustre is Linux and cluster,
so it's for High Performance Computing Linux file system.
This is where you're going to do your HB seek running.
You only have insanely high IOPS,
insanely big capacity.
And it has integration with S3 in the back end.
EBS volumes is your network storage
for one EC2 instance at a time only.
And it is bound to a specific availability zone
that you create it in.
And in case you wanted to change the AZ,
you will need to create a snapshot,
move that snapshot over,
and create a volume from it.
Instance Storage is going to be physical storage
for your EC2 instance.
And so, because it's attached from the hardware,
then it's going to have a much higher IOPS than EBS.
EBS volumes, as we remember,
it is up to 16,000 IOPS or 64,000 IOPS for io1.
But for Instance Storage,
because it is physically attached to your EC2 instance,
you can get, for some, millions of IOPS.
Um, it's going to be very high.
But the risk is that if your EC2 instance goes down,
then you will lose that storage permanently.
Storage Gateway is going to be transporting files
from on premise to AWS.
So we have File Gateway,
Volume Gateway for cache and stored,
and Tape Gateway.
Each with their use cases.
And then finally,
Snowball/Snowmobile to move large amount of data
to the cloud physically into S3.
And Database which is a way of storing data.
It's for more specific workloads,
and usually it's going to be mixed with some indexing
and some querying.
And I have a whole section on databases
where we can have a deep look at which database is right.
So hopefully that makes sense.
As you can see, there's a lot of different options
with a lot of different use cases on AWS,
but hopefully that makes sense for you.
And going into the exam,
you will be able to understand what each one means
at the right moment.
Alright, that's it.
I will see you in the next lecture.