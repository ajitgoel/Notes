
<v Instructor>A better alternative to NAT Instances</v>
is a NAT Gateway.
Why? Because AWS will manage this NAT for us,
we'll get higher bandwidth, we'll get better availability,
and overall, no administration required.
We're going to pay by the hour
for the usage and the bandwidth
and the NAT will be created in a specific AZ,
it will use an EIP, but we don't have to worry
about any of that.
It cannot be used by an instance from the same subnet
where we created it, only from the other subnet,
which is fine.
And it will require an Internet Gateway to be set up,
but we already have one.
So the trick is that the private subnet will talk
to the NAT Gateway, which will talk to the Internet Gateway,
and this way we'll get internet connectivity
for our private subnet instances.
We get five gigabytes of bandwidth with automatic scaling
up to 45 gigabytes so it can scale to tremendous bandwidth,
and overall we don't have any security group
to manage, or that is required.
So, overall it seems like it's a no-brainer
compared to the pain that it was
to set up a NAT Instance in the previous lecture.
So let's have a look at the diagram.
It is exactly the exact same thing,
but the difference is now we'll have a NAT Gateway
in our public subnet that is automatically connected
to the internet thanks to the route table.
And then our route table for our private subnet
will have a direct link, a direct route
to our VPC NAT Gateway.
The NAT Gateway, it is resilient,
but only resilient within a single AZ.
And if you want high availability,
then you are going to need a NAT Gateway in multiple AZ.
And that will give you fault-tolerance.
So let's have a look at our diagram.
We have two AZ.
Each AZ will have a public and a private subnet,
and we want to make sure we have one NAT Gateway in each AZ,
so that we have high availability.
So in this case we're going to set up a NAT Gateway
in public subnet of AZ A,
and we'll set up the according route tables
to make sure the traffic is routed properly
to the internet.
And we'll do the exact same thing on AZ B.
So it's a very symmetrical set up.
But the idea here is that because now we have two
NAT Gateways and two different AZ,
there is no cross AZ failover needed
because if an AZ goes down,
it doesn't need a NAT at all, right?
So let's have a look. We just zap this entire AZ.
It's completely gone, so imagine it's gone.
And we still have access to the internet from AZ B.
But if we didn't have a NAT Gateway here,
and if the NAT Gateway was going from AZ B to AZ A,
and AZ A was going away, then AZ B would lose access
to the internet.
The bottom line is, for saying something simple
in a complicated way, but bottom line is,
if you want high availability for your NAT Gateway,
you need to make sure you set up your NAT Gateway
one in each AZ.
So let's have a look at how we can set this up right now.
Okay, so let's get back to our VPC now.
So, we go back to VPC console in here,
and the first thing we're going to do is
to completely delete this NAT instance.
So we don't want this NAT instance anymore.
So we're going to terminate it.
Here we go. Go away. That's been terminated.
And so what we should see is that
when the NAT instance is down,
I should lose internet connectivity.
So here I am on my instance in my private subnet,
and if I ping google.com right now, it's not working.
If I do curl for google.com,
it should not be working as well.
So it has completely lost internet connectivity.
Now if we go to our VPC, and we go to our route table,
and we take the route table
from the private route table in here,
right now this target is active to the ENI,
but I'm just going to wait a little bit to show you
what happens once the instance is terminated.
So my instance is now terminated,
and we can see from the route table that
this destination is now a black hole.
So any time, basically, a route does not lead anywhere,
anytime the target is down or whatever,
we're into a black hole state.
And this is bad, that means that
basically our instance did indeed lose internet connectivity
because this destination does not lead anywhere,
it leads into a black hole.
But we're going to fix this right now.
So what we're going to do
is that we're going to create our NAT Gateway.
So we click on NAT Gateways, create NAT Gateway,
and we select the subnet in which
we want to create our NAT Gateway.
So we have to remember this subnet list
which is always tricky sometimes when the subnet names
are not shown, so let's go back to our subnets,
and we'll select our demo VPC,
we'll take our PublicSubnetA, which is this subnet.
I'm going to copy the subnet ID,
and paste it here, just so I can find it.
Here we go. I found my subnet.
And then we can either enter an allocation ID,
if you already have an Elastic IP,
or we just say create new EIP and automatically a new EIP,
Elastic IP, was assigned to this NAT Gateway.
Okay. Create NAT Gateway.
The NAT Gateway has been created.
And now we can edit our route tables to include
a route to the following NAT Gateway.
So we'll close this,
we'll do the routing automatically on our own,
so we'll go back to our route table,
and private route table,
and this is where our black hole was.
We're going to edit this one.
So instead of pointing to our instance
which does not exist anymore,
we're going to remove this entirely.
And now we're going to say, okay,
this route should point to a NAT Gateway,
and this NAT Gateway right here, save it,
and now the route has been successfully edited,
and this route is active.
Now we have to wait for this NAT Gateway to get ready
and to be up and running,
so we have to wait maybe 15 minutes,
so I'll just pause the video until then.
Okay, so our NAT Gateway has been created.
And so if I go back to my ec2 instance,
and curl google.com, yes, I get back access to the internet.
And can I ping google.com? Let's try this out.
Yes, I can also ping google.com and it's working.
So, perfect! So this NAT Gateway basically give us access
to the internet in our private subnet,
but without the whole problems
of managing a separate ec2 instance for this.
So I think that these lectures are enough
to understand the differences
between NAT Instance and Gateway,
but there is still a very interesting table
on the AWS documentation, where there's a comparison,
so let's have a quick look at it.
So this table compares a NAT Gateway to a NAT Instance.
So let's have a look at a few very important points.
The first one is high availabilities.
So the NAT Gateway is highly available,
and you can have one in each AZ,
and they're implemented with redundancy,
and so this is how you basically make sure
that your set up is resilient to failure,
whereas NAT Instance, you need to have a script
to manage failover between instances.
In terms of bandwidth, the NAT Gateway can scale up
to 45 gigabytes per second, which is huge.
Whereas this one can depend on the bandwidth
of the instance type.
So if you have a T2 Micro, then you have very low bandwidth.
For maintenance, this is managed by AWS,
so no need to do anything.
But NAT Instance is managed by you,
so it's up to you to patch DOS, et cetera, et cetera.
Performance. Software is optimized for handling NAT traffic,
whereas this one is just a generic Amazon Linux AMI,
so there's maybe an overhead on it.
And then you can look at all these kind of things here.
But this is really interesting to see,
and for security groups, for example,
you cannot associate a security group with NAT Gateway,
whereas here, you have to associate one,
and manage that security group on its own.
So, I think it's super interesting to look at this table
on your own time, so have a look.
But overall, I think it is clear
that a NAT Gateway is a clearer choice.
And sometimes the exam will ask you a question
about NAT Instances,
usually around disabling source check destination--
source destination check, sorry, under that instance,
but that's about it.
Overall, these two things allow your instances
in private subnets to get access to the internet
by offering a route to it. Okay?
So that's it! I will see you in the next lecture.