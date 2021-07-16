
<v Instructor>So now let's talk about</v>
solution architecture,
to see how we can make an EC2 instance
become highly available.
Because we know that an EC2 instance,
by default, it's launched in one Availability Zone,
and it's not really highly available,
but we can engineer something to make it highly available,
and that is the whole purpose of this lecture.
We'll see there're different ways of doing things,
and it all depends on your requirements
and the amount of work you wanna do.
So, let's say we have a Public EC2 instance
that's running a web server,
and we wanna be able to access the web server,
so what we'll do is that we'll attach an Elastic IP
to that EC2 instance,
and so our users can access our website
directly through this Elastic IP,
and they will be directly talking to the EC2 instance
thanks to it,
and we get a result from our web server, so this is great.
But now, what we want to do
is have a Standby EC2 instance,
just in case things go wrong,
that makes our EC2 instance highly available.
Now, we need to be able to failover
to our Standby EC2 instance, in case something goes wrong.
So how do we know if something goes wrong?
Well, you should think that anytime
you wanted to know that something is about to go wrong,
there must be some kind of monitoring in place.
So, we're going to create a CloudWatch Event
or a CloudWatch Alarm, based on an event we know.
For example, if we have a CloudWatch Event,
maybe we want to see if an instance is getting terminated.
Or if we are having a web server,
and we know the CPU can go all the way to 100%,
maybe you want to have a CloudWatch Alarm
that monitors the CPU,
and if we see the CPU is at 100%,
maybe the EC2 instance has gone wrong,
and we want to trigger an alarm based on that.
So there's different ways of monitoring your EC2 instance,
based on what your requirements may be.
Then, from the Alarm or the CloudWatch Events,
you could go ahead and trigger a Lambda function.
And that Lambda function,
will allow you to do whatever you want,
and that lambda function,
for example, can issue API calls
to start the instance if it hasn't been started yet, okay,
if there's no Standby EC2 instance.
And then, issue an API call
to attach the Elastic IP to my Standby instance.
So now the Elastic IP will be attached,
and it will be obviously detached
from the other EC2 instance,
because an Elastic IP can only be attached
to one instance at a time,
and the other EC2 instance, can be terminated or disappear,
and we have effectively failed over
to a new Standby EC2 instance.
But our users because they communicate to our architecture,
thanks to the Elastic IP,
they don't really see anything happening,
it's all in the back end.
And so that's one way,
of creating a highly available EC2 instance.
But there are more ways.
Okay, let's talk about a second way of doing it,
with an Auto Scaling Group.
So, we have an ASG in two Availability Zones,
and again, we're using the same concept,
where a user is going to be talking to our application
using an Elastic IP because it makes things
a little bit simpler.
So now how should we configure our Auto Scaling Group?
What if we configure it this way,
we say the minimum amount of instances is one,
the maximum is one, and we want one desired,
and we specify over two Availability Zones.
So, what does it mean?
That means we're going to get only one EC2 instance,
and that EC2 instance may be in the first AZ.
And that's what we get out of these settings.
So why would we use these settings?
Well, for example, we can say that
on the user data of the EC2 instance,
when it does come up,
its going to acquire and attach
this Elastic IP address based on Tags.
So this user data will issue API calls
and the Elastic IP will be attached
to our Public EC2 instance,
and our users will be able to talk to our web server.
But now, let's discuss that this instance
is being terminated, it goes down,
and so what the ASG will do,
is that it will terminate the first instance
and create a Replacement EC2 instance in another AZ,
and thanks to that,
what we get is that, the first instance is terminated,
and the second instance will run it's EC2 user data scripts
and attach the Elastic IP.
And we have effectively failover, so in this case,
we don't need a CloudWatch Alarm or a CloudWatch Event,
the Auto Scaling Group as soon as it sees
that one instance has been terminated,
thanks to its settings,
will create a new EC2 instance and another AZ.
And the reason we have one mix, one max and one desired
is that we'll never get more than one instance
running at the same time
in our entire ASG, which is great.
Finally, because our EC2 instance
does do API calls directly,
to attach this Elastic IP Address,
then we need to make sure that the EC2 instance
has an instance role, that allows it to issue API calls
to attach this Elastic IP Address.
So here we have a combo of using EC2 User Data
to attach the Elastic IP Address,
and also having an EC2 instance role
to make sure the API call will succeed.
So we can extend this pattern to another thing.
For example, our EC2 instance,
can be stateful and have an EBS volume,
so we can get even more complicated,
so let's get started with it,
so we have an Auto Scaling Group,
two AZ, our Public EC2 instance,
and an Elastic IP, so we already know this.
But now, we also have an EBS Volume
attached to our EC2 instance,
let's imagine for example,
that EC2 instance is a database,
and we're trying to make that database highly available.
So, all of our data is onto our EBS Volume,
and we know an EBS Volume
is locked into a specific Availability Zone.
So let's imagine that our EC2 instance is being terminated,
and now what should we do?
Well, we know that on termination,
the Auto Scaling Group can use lifecycle hooks,
and thanks to this lifecycle hook,
we can create a script to take that EBS Volume
and create an EBS Snapshot from it.
Because, it will be triggered
as soon as the EC2 instance goes down,
and so we know that the EBS volume will be frayed.
So we have an EBS Snapshot,
and we tag it properly,
and the ASG will be launching a Replacement EC2 instance,
we have the same settings as before,
and now, by properly configuring again
our Auto Scaling Group
to create a lifecycle hook on the Launch event,
then we can create an EBS Volume out of this EBS Snapshot
into the correct Availability Zone,
and then attach it to the Replacement EC2 instance.
And then the EC2 user now can just check that
and also attach the Elastic IP address directly,
and we need to make sure obviously the API calls are correct
so we need to have an EC2 instance role,
which as we can see here,
we've done a combo of EC2 user data,
and also lifecycle hooks
to make sure that the EBS Volume
was first getting Snapshots
and then being restored from the Snapshot
into a different AZ.
And that makes it a highly available EC2 instance,
with an EBS volume.
So as we can see the possibilities are endless,
but it's good to see them once
to see how these kind of architectures can work,
obviously, they're a bit more work,
they're a bit more custom,
but we can achieve great things with automation.
So that's it for this lecture, I hope you liked it,
and I will see you in the next lecture.