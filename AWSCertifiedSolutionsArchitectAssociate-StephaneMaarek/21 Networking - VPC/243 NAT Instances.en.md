
<v Instructor>We have our instances in our</v>
public subnet that have internet connectivity
thanks to the internet gateway.
But for our instances in our private subnet,
they cannot access the internet.
If they were to access it through the internet gateway,
they would also be directly accessible from the internet.
So for this, we need a better solution,
and that solution is a NAT.
NAT stands for Network Address Translation.
Now NAT comes in two flavors, it comes with NAT Instances,
which is really outdated, not recommended, but still
gonna appear at the exam, and you also have
NAT Gateways that we'll see in the next lecture.
So in this lecture it's all about NAT Instances.
These NAT Instances will allow our other instances
in the private subnet to connect to the internet.
Our NAT Instances must be launched in a public subnet
so that they have internet connectivity, and you must
disable an EC2 flag called Source Destination Check.
We'll see this in the hands on.
You also must attach an Elastic IP attached to it because
our route table will be going to directly a fixed IP.
And the route table must be configured to route traffic
from the private subnets to the NAT Instance.
That's for the theory, let's look at it in a diagram.
So this is what we have so far, our public EC2
can connect thanks to the route table to the
internet gateway and then to the internet.
Now if we have an instance in a private subnet,
right now I cannot connect to anything.
And so for this, we have to make a NAT Instance
in our public subnet, it will have an Elastic IP
attached to it, that's what the little arrow means,
and it has it's own security group.
And then this NAT Instance, thanks to the router
that already exists in the route table, will be able to
talk to the internet gateway and access the internet.
Now we need to basically do a bridge between
our private EC2 and our NAT Instance and for this,
we're going to change the route table in our private subnet,
and basically this route table is going to point
to the NAT Instance directly, and this will allow
our private EC2 to be directed to the NAT Instance
which will be directed all the way to the internet.
So that's for the theory, let's go with the hands on now.
So let's go ahead with creating our NAT Instance.
For this, we'll go to the EC2 measurement console.
We're going to launch our instance.
In the search bar I'm going to type in NAT, N A T,
and we have directly, pressing enter, recommendations,
22 in the marketplace and 326 results
in the community AMI, we're going to use the community AMI.
And the first one is provided by Amazon,
which is a VPC NAT on HVM, this is a recent enough date,
so we'll just choose this one.
We'll click on select, we'll run it on a T2 Micro,
and then click on configure instance details.
We'll launch one instance, network-wise,
we'll launch it on our demo VPC, and subnet-wise,
just for fun, we'll launch it in our public subnet B.
Okay, we'll use the subnet setting and
auto assign and public IP, this is great.
Then I will scroll down.
We don't change anything right here,
everything looks good, and then I click on next.
Okay, that's storage, this storage looks good as well.
Add tags, this one I'll just name it NAT Instance
just so we can recognize it in our UI.
Click on the configure security group,
and here we have to create a new security group,
I'll call it NAT SG, NAT Security Group,
and so we have to allow a few rules, so let's get started.
The first rule is SSH, and you can restrict
it to your IP if you wanted to.
Then I'm going to add HTTP, and this rule basically
should allow port 80, but not coming from everywhere,
it should just be coming from our VPC,
so our VPC is defined as 10.0.0.0/16 if you remember,
so I will just allow HTTP from VPC.
HTTP from VPC, just so we remember, and here again,
we're going to add one last rule,
for HTTPS from the VPC as well so I'll just copy
this entire sider and we'll allow HTTPS from the VPC.
And these are the necessary security group rules
when you define a NAT Instance.
Click on review and launch, and this is great, we're just
going with the recommended, and click on next, and then
click on launch, and then I'll say okay acknowledge.
Okay.
So now our instance is launching, and while this happens
I'm going to launch one last instance.
I'm going to launch a private instance.
So for this, I'm gonna go to Amazon Linux AMI,
click on select, I'll select a T2 Micro.
Okay, click on configure instance details,
and then I will select the network to be demo VPC,
the subnet this time I'm going to make it in
private subnet A, and I will not have an IP address,
our public IP is disabled by default because
it's not a public instance anyway.
Okay this looks good, now I'll click on add storage,
add tags, I'll just name this instance Private Instance,
and click on next configure security group.
Here we can configure security group and we can
just have port 22 coming from everywhere, or we can say
only port 22 coming from our VPC Vericles,
so SSH only from within the VPC because this is a
private instance so it does not expect anywhere else
to have an SSH connection from, and click on review
and launch, I will launch it as well.
I acknowledge and I will basically instead of
using the same key pair, I'll create a new key pair,
and this key pair name, I'll call it private instance
key pair because this is something that's gonna be
just specific to my private instance and
I'm going to show you in a second so
I want to be able to create a new key pair.
So here is my private instance key pair that
has been downloaded, I'll click on
launch instances, and here we go.
Now we click on view instances, and
let's have a look at what happens.
So we have a NAT Instance in EUS 1B,
and we have our private instance in EUS 1A,
this is all, these two in public subnets,
this one is in the private subnets,
and this one remember, because this is a NAT Instance,
we have to make sure that it has
disabled source destination check.
So for this, I right click on it, click on networking,
and click on change source destination check,
and this is something you should keep enabled
for every instance except NAT Instances because
they're very special, so let's say yes, disable.
And this is what the documentation recommends,
so if you type source destination check NAT Instance
in the documentation it just says however a
NAT Instance must be able to send a receive traffic
when the source destination is not itself.
Therefore, you must disable source
destination text on NAT Instances.
So we've done that, now let's go ahead
and first SSH into our private instance.
For this, I'm going to SSH into my public instance,
and from my public instance I will be able
to SSH into my private instance, so let's do this right now.
I'm in my public instance right here,
and the first thing we have to do, is to basically
recreate the key pair I have just downloaded
onto this EC2 Instance, so I'm going to open a new tab,
and I'm going to cat the content of my downloaded,
my new key pair, so this one.
I'm going to copy this, now remember this is not
something you want to do in production,
we have better ways of doing these kinds of things,
but right now I'm just doing it manually.
So I'll copy this RSA private key, and I will just
basically put it on to my EC2 instance.
We could use SCP if you wanted to if you knew what SCP is,
but right now we'll just do things manually,
so I'll just do nano, and then private,
what's the name of that file again?
Private instance KP dot PM, and I'll just
paste the content, control X, yes, enter.
And now I'm going to do a chmod just to be able to
set the right permissions on this file, so here we go.
And now using this, I should be able to SSH
from my public to my private, so I'll do
SSH EC2 user at, and now I need the private IP
as my private instance, so my private instance
is right here, and it has a private IP,
so I'll copy this, paste it, minus I and I'll just
specify my instance key and click on yes.
And here we go, I am into my instance, LS,
so I am on to my private instance right now,
IP 10-0-21-95, and if we try to just, for example,
ping google.com, so if you want to access
google.com it doesn't work, it does not have
internet yet, which is what we expect.
But we have created a NAT Instance, so we should
be able to provide that instance with internet.
So how do we do this?
This didn't work.
So how do we do this?
Well, we go into our route table, and for our private
route table, we're going to create a new route.
And so, I enter edit routes, and then I'll click
add routes and 000/0 so any connection outgoing
to the internet, this time is not going to
the internet gateway, because that would make my
instances public, instead it's going to an instance,
and this is a NAT Instance, and I'll just
click here and say NAT Instance.
So now we're saying for all my instances in my
private subnet, anytime you hit an IP that's not
local, then talk to this NAT Instance.
Save the routes, routes have been saved successfully.
And so now, in our private route table, it turns out
that the destination for public traffic should go
through this ENI, and if you click on this ENI
we obviously get redirected directly to our NAT.
So now I can go into my instance, and I can do
curl google.com and this just gives me a URL,
so it says it has moved, so I can curl www.google.com
but basically my private instance does get access
to the internet, which is amazing, but if you try
to ping google.com, we see it's not working.
So we know we have internet connectivity,
but the trick is in your instance, your NAT Instance,
your security group, you can also add the protocol
which allows you to use the ping, you add a rule,
and this is going to be all the ICMP for IVP four,
and will allow this coming from our VPC,
so I'll just say allow ping from VPC, save this security
group rule, and now if we do a ping of google.com,
we do get an answer back, and we see it's working.
So this was a long lecture, I know.
But we set up basically a NAT Instance,
which allowed our private instance to talk
to it and to get internet access.
Now I have to say, all this thing is very hard to manage
and as you can see, there is a lot of moving parts,
so let's see what that means for the exam.
To comment on the setup, so we've been using an
Amazon Linux AMI that came pre-configured
with NAT capabilities, and this is nice, but what we did
was not highly available, it's not really resilient.
If we lose our NAT, we lose our internet connectivity,
so we need to set up maybe an ASG that is multi-easy
with a resilient user data script, maybe use
an Elastic IP to guarantee some IP addresses
even though it is going to be stable,
I mean it could be horrible.
And then the internet traffic will depend
on our EC2 instance performance, so right now
we have a T2 micro, so we don't expect to have
very high network throughput, but if we have
a larger instance, we're going to pay more
and get better networking, but overall,
it's so tricky, and then we must manage
security groups and rules, so you see, I couldn't
ping Google right away, I had to add the rules.
So we need to set the inbound rules and some
outbound rules, et cetera, et cetera.
I mean, it's tricky.
It's really, really tricky.
So overall, NAT Instances are old, they're the
old way of doing things, and in the next lecture
we'll see NAT Gateways to see how we can do things
in a much better way, so let's get started.