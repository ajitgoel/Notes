
<v Instructor>Okay so, now let's talk about EBS Snapshots</v>
'cause this is a very important exam point.
So, the snapshots are going to be incremental.
It's only going to backup changed blocks.
And the backups will use your IO of your EBS volume,
so you shouldn't run the backups while your application
is doing a lot of things, a lot of traffic.
You should backup usually
when you have a bit of downtime, or when it's quieter.
The snapshots are internally stored in S3,
but you won't directly see them,
but you get billed just for the S3 usage,
S3 rates for your EBS backups, or snapshots.
You don't have to detach the volume to do a snapshot,
but it's recommended to do so.
And you get a maximum 100,000 snapshots per account,
good to know.
You can copy your snapshots across AZ or Region,
and we'll have a look at how to do this.
And we can create AMIs directly
from a snapshot, so very nice.
EBS volumes that are restored by a snapshot,
though, you need to pre-warm them,
so we can use the fio command that we saw,
or dd command basically to read the entire volume
and that will pre-warm the volume,
make sure it gets its optimal performance right away.
And the snapshots can be automated
using Amazon Data Lifecycle Manager.
It's a very little known option,
but I'll show you it in a second.
Okay, so let's say I want to snapshot
my five gigabyte EBSDemo volume
and that one, if you remember,
just has a lol.txt file on the data for volume.
So, I right click on it and create the snapshots.
I'll just say back up of my EBS volume,
whatever you want to name it.
You can add some tags to it
and then click on create snapshots
and here we go.
A create snapshot request has succeeded.
So, what we see here is that the snapshot is starting
and so it's going to backup only the blocks that are used.
So, right now, we have to wait
and the backup may take a little bit of time
so we have the progress on the right-hand side
as a percentage.
And so, I'll just pause until it is done.
Okay, so my snapshot has now been created
and from it I can delete it, I can create a volume.
So, I can create a new EBS volume
straight from this snapshot.
I can create an image
so I can create a whole AMI, if I wanted to,
from this snapshot, which is super fun
and then I could copy it to a different place,
so I could copy it to a different region, if I wanted to
and I could also encrypt it.
We'll see this in a second.
But so that's what I want to you with the snapshots.
It's quite easy, as you can see.
I did a snapshot while on my EBS volume was still being used
and it was still working, so good to know.
Lastly, something that's not well known but I like to show
because I want you to learn real world skills
and not just learn how to pass the exam.
If you go to Lifecycle Manager below Snapshots,
you're able to,
and you probably never seen this before,
you're able to schedule and manage
a creation and deletion of EBS snapshots.
So, we can create a Snapshot Lifecycle Policy
and I'll just call it mypolicy,
and here we can say,
okay, we can tag volumes,
which have for example, the name equals EBSDemo
and we could automate the snapshots
of all the volumes that are named EBSDemo.
So, you could go crazy with your tags
and do whatever you want.
Then you can define the schedule,
so you say,
I want to create snapshot every x number of hours,
so 12 or 24,
when you want to start your snapshots
and basically you should choose
when it's gonna be low traffic for your application.
The retention rule,
so the number of snapshots that will be retained.
Maybe I only want to retain only seven snapshots
and backup everyday,
so that means that if I do 24 hours,
as it says,
the oldest snapshot will retained for seven days old
and we get the maximum of seven snapshots.
Then we can also copy the tags from the volume,
if we wanted to,
and add more tags to the snapshots,
if we wanted to as well.
Finally, we'll just specify an IAM rule
to perform that snapshot action
and that's it.
And so, the really cool thing is that using this policy,
which I won't create,
you would have an automated backup solution
for your EBS volumes.
So, very easy to do.
No need for an EBS landI,
you can just use this tool called
the Snapshot Lifecycle Policy
and so, something good to know is this helps
to save you a lot of time and frustration.
So, I hope you enjoyed it.
I will see you in the next lecture.