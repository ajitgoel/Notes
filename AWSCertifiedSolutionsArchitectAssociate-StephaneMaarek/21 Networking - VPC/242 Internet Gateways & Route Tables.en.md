
<v Narrator>Okay so our subnets are created,</v>
so why don't we go ahead and try to create a EC2 instance.
So we go to EC2 and we wanna create an EC2 instance
maybe in one of our public subnets.
So we'll create one in public subnet A.
So I'll go to EC2 instances, launch instance
and here I'm going to choose the Amazon Linux AMI 2,
t2.micro this is great.
Instance details, so here we go,
this is where we are going to change some things.
So here in network we're going to choose our demo VPC
and then for subnet, we get to choose which subnet we want.
So we'll choose a PublicSubnetA eu-west-1
and it says there's 251 IP Adresses available
so that's great.
For auto-assign Public IP
it says use subnet setting disable.
So it turns out that in subnets you have a setting
and you can right click and modify the auto IP setting.
So because these are public subnets,
we want our instances to have a public IP.
So I'll modify this setting and enable auto-assign
public IPv4 address.
Click on save, and I'll do the same for PublicSubnetB.
This way, when create and instance, automatically
by default it should get an IPv4 address.
Okay, so this is done.
Now we go back to our EC2 console.
We're just going to refresh,
select our demo VPC and I'll select my PublicSubnnetA
and now you see auto-assign Public IP is enabled.
Okay, because we changed that subnet setting.
Great, so we have this ready.
All this is good.
Nothing is changed, I'm not going to
set any user data for now.
And I'll click on add storage.
Add storage is fine.
Add tags, configure security group
will allow for 22 in from anywhere.
Review and launch.
And launch and here we say yes I do have my key pair.
Launch my instances and here we go.
So my instance is now starting.
And as we can see it has a private IP of 10.0.0.108,
so that is within our cidr for our subnet.
And the IPv4, Public IP is this one.
Now I'm going to pause until it is started.
So my instance has been created, it's running,
it has an IP address so why I don't try to SSH into it.
And so I'm going to type my SSH command, press enter
and nothing happens, this is sort of a time out.
So this is weird, right?
Timeout means security group issues
but I'm pretty sure my security group does
allow port 22s if we look at inbound rules,
port 22 is open and has a public IPv4,
so what's happening?
Well, what's happening is that it doesn't have
internet connection.
So this goes into this sec lecture where we're
going to set up an internet gateway.
So internet gateways, they will help our instances
in our VPC connect with the internet.
And they will scale horizontally,
they will be high availability and redundant
and they will be created separately from our VPC
so this is something we have to do in the UI
from a separate way.
Now one VPC can only be attached to one internet
gateway and vice versa.
And it turns out the internet gateway is also a NAT
device for the instances that have a public IPv4,
which is exactly what we need.
Okay.
On their own though internet gateways do not allow
internet access.
We'll also have to edit route tables.
So first, let's take a look at our diagram,
we're going to add an internet gateway
at the very top of our VPC
and this should provide internet access for our instances.
So let's do this right now.
So back into my subnets console I'm going to
go to the left hand side and click on internet gateways.
I'm going to create an internet gateway.
Name tag is going to be DemoIGW for internet gateway.
Click on Create.
It was being created.
Excellent.
So I'm just going to remove the filter of my VPC so I can
see two internet gateways, one is attached to my default
VPC and one that I've just created is currently detached.
So for it I right click and attach to VPC.
I also like to VPC ID this one.
And if you wanted, here is the command line to do it
if you wanted to do it from the CLI.
Okay, click on attach.
And now my internet gateway is attached.
And VPCs can only have one internet gateway attached
to them, so if you try to create a new internet gateway
and attach to the VPC it will just not work.
So one internet gateway per VPC,
that is a common exam question.
Okay, so we have attached our internet gateway to our VPC
and it looks like it should work right now.
So let's go to our SSH, try again,
and still nothing happens.
So what happens?
We've created an internet gateway,
but it still cannot SSH into our instance.
Well, it turns out if you did follow my slide,
that I said that we also have to change the route tables.
So let's go ahead and change the route tables now.
If we take a look at what we have,
we have our EC2 instance, it's public,
it has a security group attached to it.
But what we have to do is edit the route table
for our subnets and make sure that it points
to the internet gateway for a specific IP range.
And then from there, our EC2 will get routed
directly into the internet gateway and we'll be able
to access the internet www.
And so we'll be able hence to SSH into our public EC2.
So let's give this a try.
So back into our UI.
We're going to go to route table and we see if we select
our VPC demo VPC, we have one route table
and this is the main table.
Now I don't really like the main table,
this is basically the default and anytime you create
a subnet and you don't associate it with a route table,
it will directly go within the main route table
and I don't like to edit this main route table,
I'll just leave it as is.
I'm going to create two route tables,
the first one is going to be PublicRouteTable,
so this one is going to be for public for my demo VPC.
And click on create and I'm also going to create a
PrivateRouteTable for my private subnets
in the same VPC.
And the reason I'm doing this is because I don't personally
like having a main default table, but it's up to you to
keep this main and not have a private route.
Anyway, for this public route table, we basically
want to associate it with our public subnets.
So this one is my public and this one is my public,
so I've associated my public subnets
with my public route table.
And then for my private route table, I'll also edit
the association and I basically associate my private
here and here with my private route table.
Okay, so everything is associated
and now we have to take care of routes.
So a route table is going to do routing,
so it a route tab, we basically see how things work.
So, it says that any IP that has a destination 10.0.0/16,
so anytime I hit an IP within this cidr, which is my whole
VPC cidr, the target is going to be local.
That means that, well it turns out that we know
that all this IP belongs to this network,
so this is a local network.
And for private route table, this is fine,
'cause we don't want them to be accessible
from the internet.
But for PublicRouteTable, we need to add another route.
So I click on PublicRouteTable, I click on edit routes.
And here I'm going to add a route and this one
is going to be 0.0.0.0/0 which means any IP,
so if you talk to any IP then the target is going to be,
and here we get a lot of choice,
we're going to chose an internet gateway,
and this is the one we've created.
So we're saying, okay, anytime you hit a private IP
in this cidr, then this is the local network,
but anytime you hit any other IP, then definitely
talk to the internet gateway because it will
know what to do for you.
So we save the routes and now we should be able to have
given access to our EC2 instance internet.
So if we look at it, this public route table
is associated with our public subnets.
Our instance has been launched into our public subnets.
And so now, it should be accessible from the internet.
So if we go back to our SSH command, try it,
here we go, now it works.
I've just basically logged into my EC2 instance.
And if I do a sudo yum update,
let's see if it can connect to the internet,
yes it's getting some information
and there's no update available for me.
But here we go, we've basically given access
to the internet to our EC2 instance that go
into the public subnets.
Right now the private subnet instances will not get
any internet access either.
So we've solved part of the problem, this is great.
And I will see you in the next lecture to keep
on building our VPC to be really solid.