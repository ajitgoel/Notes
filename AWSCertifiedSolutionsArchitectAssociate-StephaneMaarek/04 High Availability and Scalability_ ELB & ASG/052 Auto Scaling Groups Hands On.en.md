
<v Instructor>So let's have a play</v>
with Auto Scaling groups,
but before we do so, make sure to terminate
all your instances, so I'm going to go ahead
and terminate all the EC2 instances
that I have created from before and also if you go
to your load balancers make sure to only your application
balancer available and if you had a CLB
or ALB please make sure to delete them as well.
So the idea now is that if we go
to our target group, this one should have zero targets.
So if we go to the low balancer right now
and try the DNS we should get something like a 503
because the we don't have any instances
to serve any traffic.
So this is perfect.
Now let's go and create our first Auto Scaling group.
So we are in this Auto Scaling group page
and we have to create our first Auto Scaling group.
So there is a new design
and I'm a new design so that the video
will look like it's using the new redesign
of Auto Scaling group console.
And this will look like the video
is more updated so let's do it.
So I'm going to create an Auto Scaling group
and we can choose a launch template
or a launch configuration.
So they are very similar.
Launch template is the newer version, launch configuration,
is the older version.
Launch templates allow you to use a spot fleet
of instances and launch configuration
allow you to just specify one instance type.
So for the sake of this because we want to make
sure we are more geared towards the future
we'll use launch templates.
But if you see launch configuration or launch template
in the exam they are only the same thing.
So I'll first type MyFirstASG
and then I can use a launch template.
Now we can switch to launch configuration
or create a launch template.
So let's just go ahead and create
a launch template very quickly.
And the launch template describes
how to create EC2 instances, so I'll call it
my first template.
And the description of the version my first template.
And then finally do we want Auto Scaling guidance?
No this is fine.
Then, we need to scroll down and select an AMI
so we'll say Amazon Linux 2, AMI
the instance type we can say
don't include the wills use t2.micro
to be in the feature so which is t2.micro, excellent.
The key pair I'll use EC2 tutorial
which is the one I have from before
and the networking platform I'll use VPC.
For security group,
I will use my first security group
so that EC2 instances launched
through my launch template use Amazon Linux 2
or t2.micro and inherit the same security group as before
and then for storage we'll have the root EBS volume,
this is great.
In instance tag we don't have anything,
but you can tag them if you wanted to.
Network interfaces we're not going to use
any special one besides the primary ones.
And advanced details will allow us to specify
more stuff so the IAM instance profile
If we wanted to and the most important thing
actually is at the very very bottom
which is the user data.
So we have to go and get our user data
so you can copy this entire script right here.
In EC2 use the data that we search
to make it a little bit simpler
and then when you have from the very beginning
bin bash all the way to the end, echo.
Then you are good to go to
click on create launch templates,
and it's successful.
So I will go back to my ASG console and refresh
and here I can select my first template
as the launch template.
So we can review it and it looks like everything is good.
We have security group IDs
which is good, the launch template is here,
the key pair is the one we have from before and so on.
Click on next and the purchase options and instance types.
So here, the cool thing with launch templates,
we can have a on demand or spot instances
or we can have the combination of on demand and spot.
So the cool thing is that from an architectural
point of view, we could have a best capacity
of on demand instances and in some spot capacity
to serve better.
So this is very helpful when you have a hybrid fleet,
but in our case we'll just adhere to the launch template
and we'll create just on demand.
So the subnets we'll select three subnets
to launch our EC2 into so we have eu-west-3a,
3b, and 3c so the EC2 instances
will be launched into 3 different az.
Click on next and now we have to specify load balancing.
So load balancing and health checks,
this is extremely important if we want
the load balancer we had from before
to serve the traffic in front of our EC2 instances.
So yes we do want load balancing so I'll enable it
and is it an ALB or NLB or is a CLB?
In our case, it's an ALB
but we can definitely use a CLB if we wanted to.
And with an ALB we have to specify a target group.
In this case, this is my first target group.
So that means that automatically,
so let me just go back to the EC2 console,
and go to my target groups.
That means automatically when an instance will come up
it will be registered as a target
within this target group.
So great, this is perfect.
And the health checks are optional,
but we have two types of health checks.
The first one is EC2 health checks,
which is meaning that if the EC2 instance
itself fails then it will be replaced.
But we can have an ELB health check
and this is the one that I'll check
and that means that if the ELB health check itself
from within the target group doesn't pass
then the application of the Auto Scaling group
sorry will terminate
that instance automatically and recreate
a new one maybe.
So this is definitely the kind of area we want
and we'll click on next.
Okay, now we have group size and scaling policies.
So we'll have a very big lecture on scaling policies
but for now we'll just consider group size.
So the desired capacity is one
which is how many EC2 instances we want?
Minimum is one, which is the minimum capacity,
and maximum I'll set it to three.
We can change these as we go along
as we'll see in the hands on.
Scaling policy for now I will set it to none
but the whole idea behind auto the scaling group
is that the scale automatically.
And so we will be setting a scaling policy later on.
But I wanna cover that in a separate lecture.
Okay, scaling protection we will not enable it
and we don't need it as far as we go right now.
Notifications as well we don't need them.
So we'll click on next, and tags this is fine.
I'll click on next as well.
So everything looks good.
This is the new way of creating an Auto Scaling group.
So I'll click on create Auto Scaling group
and we're good to go.
So this is the new console
and right now our Auto Scaling group has zero instances.
The status is updating, but the desired count
of instances, the desired capacity, is one instance.
So what I'll do
is that I will adjust right a little bit and here we go.
So let me click on this one and we can see some activity.
So as I click on this ASG we can see
the desired capacity is one,
the minimum capacity is one, and maximum three.
So this is all the things we have said from before.
And we have our launch template which is great.
And the load balancing is set up properly.
So if I scroll all the way up and look at activity.
In activity history I will see what is happening
for my Auto Scaling group.
So as we can see right now, it was successful
and it launched a new EC2 instance.
So it was launching because the desired capacity
was zero, was one, and the actual capacity was zero.
Therefore, a new instance was being created.
So that was very quick.
And if I go to instance management
I can see now that I have one instance
in my Auto Scaling group.
And this is perfect.
So if I look at this instance itself
into my EC2 management console,
we can see it's appearing here and it's working.
So now the beautiful thing is that if I go back
to my target group and refresh this
I should be seeing the appearing instance right here.
So the target is registered.
And right now it's unhealthy but hopefully
it will become healthy very very soon.
So let's just wait a little bit to see
if the health check passes.
Oh, my instance is now healthy
and thankfully and so now if I go back to my ASG
we can in here that the instance is registered
and on the right hand side we can see it's also healthy.
So it's showing the right health status.
And so because it is registered to the target group,
I should be able to go to my load balancer
and I should be able to open my ALB.
So I'll open the DNS name
and here we go, we get the Hello World.
So this is working.
So automatically this EC2 instance
was being created by our ASG, our Auto Scaling group.
And so the cool thing we can do now
is we can go to this, edit the configuration
and set desired capacity is now two.
And so this will do and I'll just go
all the way down and say update
and so what this will do is that it will tell
the ASG to increase the capacity
by one because we our desired is more
than our actual capacity.
So I'll go to activity
and look at the activity history, and hopefully
very very soon it should start to create a new EC2 instance.
And as we can see now, a new instance
has been launched so it's pre inservice
because the desired capacity was asking the group
to change from capacity one to two.
So I'll refresh this and it' successful.
The instance has now been launched.
So if I go to instance management
I should see two instances and they're both healthy.
So if I go back to my ALB and refresh
now I should be seeing, hopefully very soon,
two instances so that may take a little bit of time.
And let's make sure that stickiness is not enabled in here.
So this looks fine, our target group as well
in the description, this looks fine.
It is disabled so very, very soon
usually one target is still unhealthy
so I need to wait a little bit for the health check to pass.
So once this is done this will be okay.
And my target is now deemed healthy.
So going back to my ALB, I refresh
and now I see my two IPs changing over time.
So everything is working great.
And so finally for Auto Scaling group,
if we were to change the capacity
from two back to one, this is called a scale in
because we have to remove an instance,
so I'll update this and what will happen
is that now we have two instances
but the desired capacity is one
and therefore, in the activity history
it should start telling me very, very soon
that it wants to terminate an EC2 instance.
So let's refresh again.
And here we go, we have a new activity history
where it is waiting for the ELB connection draining
but then it will terminate our instance accordingly.
Alright so that's it for this lecture.
I hope you liked it and I will see you in the next lecture.