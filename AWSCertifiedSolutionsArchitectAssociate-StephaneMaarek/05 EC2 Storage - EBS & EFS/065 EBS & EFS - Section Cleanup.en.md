
<v Instructor>Okay, so let's just clean up</v>
this entire section.
So for this I'm gonna go to Action on my file system
and delete it, and for this I have to enter
the file system ID, so I'll just copy and paste this.
And so okay, we're gonna get rid of our file system.
Perfect!
Now into our EC2 instances, make sure to terminate
any running EC2 instance, so that's good.
Then in terms of volumes, we're going to have to
clear up volumes as well, so any volumes that is available
you have to terminate it, so I'll right-click
and delete all these volumes.
Okay.
Now for snapshots, you've made a few snapshots,
so let's just go back and delete every snapshot you have.
Just so that you can get rid
and not pay for any storage for snapshots.
Okay.
And then finally, security groups.
If you want to, because it's going to get a lot of
security groups right here,
you can basically delete so many of these security groups
except the one for default, so just don't delete that one.
So you can go ahead and delete these security groups.
And they will only be deleted once you have, basically,
deleted all your EC2 instances associated with those.
So maybe these won't be deleted right away
but you can just keep on trying until it works.
So I'll delete this security group now.
Yes this one works.
I'll delete the load balancer for the security group.
Yes that worked, and this EC2 for EFS,
it's still used by my instances
so I have to wait for my instances
to be shutting down properly before I can go ahead
and delete that last security group.
So I'll have to wait a little bit, but that's it.
Once you've cleared up everything
you're ready to go for the next section.