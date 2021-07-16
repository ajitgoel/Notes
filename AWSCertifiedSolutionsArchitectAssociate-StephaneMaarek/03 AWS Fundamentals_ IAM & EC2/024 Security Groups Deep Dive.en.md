
<v ->Okay, so let's do a deeper dive into security groups,</v>
because there's so much I haven't told you yet.
Security groups: they're basically firewalls
on EC2 instances and you know this already.
They will regulate access to ports;
They authorize IPs for IPv4 and IPv6;
They will control the inbound networks,
from anywhere else to the instance,
but also the outbound networks,
that means from the instance to other places.
And basically everything will look under
a nice table where you can see your different rules.
Maybe HTTP or SSH and a custom TCP rule for example.
And the description and the source and so on.
Making sure your security groups are great
and upstanding is very important
to maintaining security into your accounts.
Now if we look at a diagram what does that look like?
Well basically we can have our EC2 Instance
and it has one security group,
but I've just separated logically
the inbound rules and the outbound rules.
And this is your computer and it has an IP
and it's authorized on port 22.
So what happens is that when you connect
to your EC2 Instance, the security group says
that's fine, your IP is authorized, go through.
But if it's another computer and it's not authorized
on port 22, say you just restricted your security group
rule just to your IP then it will be blocked
by the security group as you can see it's red
and the EC2 Instance would actually never see
that network request coming through.
So the security group is really firewall outside
your EC2 instance.
Now if you've WW, so just any IP,
any port and your instance wants to connect to it
by default, as I've said, it is possible,
because all the outbound rules are open
and working and this is what we would expect actually
from a server, so that's great.
So this is what you should remember as a diagram.
Now, good to know.
What do you need to know with security groups?
Well they can be attached to multiple instances, okay?
There is not a one to one relationship
between security groups and instances
and actually an instance can have multiple
security groups too.
Security groups are locked down
to a region/VPC combination, okay?
So if you switch to another region,
you have to create a new security group
or if you create another VPC and we'll see
what VPCs are in a later lecture,
well, you have to recreate the Security Groups.
The security groups live outside the EC2,
so as I've said: if the traffic is blocked
the EC2 instance won't even see it, okay?
It's not like an application running on EC2,
it's really a firewall outside your EC2 instance.
To be honest? And that's just an advice to you
from developer to developer that it's good
to maintain one separate security group just for SSH access.
Usually SSH access is the most complicated thing
and you really want to make sure that one
is done correctly so I usually separate
my security group for SSH access separately.
If your application is not accessible
so time out, we saw this in our last lecture,
then it's a security group issue, okay?
So if you try to connect to any port
and your computer just hangs and waits
that's probably a security group issue.
But if you receive a connection refused error, okay?
You actually get a response saying connection refused
then the security group actually worked
the traffic went through and the application
was errored or it wasn't launched or something like this.
So this is what you would get
if you get a connection refused.
By default all inbound traffic is blocked
and all outbound traffic is authorized, okay?
Now there is a small advanced feature
that I really like and I think it's perfect
if you start using load balances,
and we'll see this in the next lecture as well,
which is how to reference security groups
from other security groups.
So let me explain things: so we have an EC2 instance
and it has security group what I call group number one.
In the inbound rules it's basically saying
I'm authorizing security group number one inbound
and security group number two.
So why would we even do this?
If we launch another EC2 instance,
and it has security group two attached to it,
well by using the security group one rule
that we just set up we basically allow
our EC2 instance to go connect straight through
on the port we decided onto our first EC2 instance.
Similarly, if we have another EC2 instance
with a security group one attached,
well we've also authorized this one
to communicate straight back to our instances
and so regardless of the IP of our EC2 instances,
because they have the right security group
attached to them they're able to communicate
straight through to other instances
and that's awesome because it doesn't make
you think of IPs all the time.
And if you have another EC2 instance
maybe with security group number three attached to it,
well because group number three wasn't authorized
in the inbound rules of security group number one
then it's being denied and things don't work.
So that's a bit of an advanced feature,
but we'll see it when we're dealing
with load balancers 'cause it's quite a common pattern
I just wanted you to know about it.
Again just remember this diagram
and by now you should be really good at security groups
and understand them correctly.
I hope you liked it and I'll see you in the next lecture.