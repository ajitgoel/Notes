
<v Lecturer>So before we go ahead and start</v>
creating our own VPC,
I want us to walk through the default VPC that comes with
all of our accounts when we create a new account in AWS.
As soon as you create your account you get a default VPC.
If you have an old account,
there's a chance you don't have one so try to work
within your account if you don't have one.
New instances will be launched by default
into default VPC if you don't specify any subnets,
and the default VPC comes with Internet connectivity
and all instances have public IP.
This is how we've been able so far to use our instances,
do YAML updates,
install APACHEE servers, etc., etc.
We also get a public and a private DNS
for each of our instances,
and this you think is a given,
but basically this was configured in the default VPC.
So now let's go and have a look at
what the default VPC looks like in AWS.
So my Management Console, I'm going to go ahead
and look at the VPC service.
Now in this VPC service we have the Dashboard
which shows the resources by region.
So as we see we have one VPC,
three subnets,
one route table,
one Internet gateway,
one DHCP options set,
one network ACL,
and 12 security groups
because I credit many security groups.
So, all these things we see right here
are basically created by default for us when we
do have a new account.
We can just play around and create a new account
and see what is going to be there.
In the end, in this section, we're going to
create our own everything,
but for now it's good to look at the state
of what is already there just to get a small idea
of how things work.
If you click on Your VPCs, the first thing you see
is that we have a VPC right here that has been created,
and this is the default VPC.
It says here "Default VPC: Yes."
If you look at the Ipv4 CIDR, we see that
this is this CDIR.
So we are interested. We're intrigued.
We want to know what this CIDR is,
so we'll go to our website, calculate it,
and we see the first IP is this one,
and the last IP is this one,
and we get about 65 thousand IPs in this CIDR.
Okay, so this is pretty good.
We have a VPC,
it has one Ipv4 CIDR block,
and there is no flow logs, there is no tags,
the description seems to say that there is
a network ACL, a Route table, DHCP options set, etc., etc.
So this looks like when we create a VPC we're defined
just a CIDR.
Now we go to subnets, and here we know we
can launch instances into three different availability zones
and into three different subnets,
so here they are.
We have Subnet one, two, and three.
And these subnets have their own CIDR as well
so we can see that each subnet, for example,
if we take this one, it may be different for you,
but if we take this subnet,
and we calculate this CIDR,
we can see that the first
instance IP is
172.31.32.0,
and the last one is 172.31.47.255.
We get a total host of 4096,
but in here we get available IP 4091,
there's five IP of differences,
we'll see why in a future lecture.
It looks like each subnet in there is basically
having a CIDR that is within the VPC CIDR,
and it looks like all these subnets have
a non overlapping CIDR.
Now, each of these subnets, we can look at it,
it belongs to the VPC we have available,
and we have no flow logs,
we have a Route Table, basically that is in this VPC
and so we'll have a look at this Route Table in a second,
and then for Network ACLs, we get allow all traffic
as a Network ACL and allow all down traffics
it looks like all traffics is allowed in our VPC
and your subnet, and then we're good.
Now if you look at Route Tables,
it looks like we have a Route Table,
there's only one of it, and it's a main route table,
it belongs to the default VPC,
and basically in terms of subnet association,
it's associated not explicitly,
but it is associated with these three subnets.
Look at the routes defined in this route table,
basically define how our subnets will get access
to the Internet.
And if you look at the Internet,
it looks like one of these targets is an Internet Gateway.
So Internet Gateway is right here and
it's attached to the VPC,
and there's not much we can do with it,
but it looks like the Internet Gateway's
going to give us Internet.
So, that's all we need to see right here just to get started
but we look like a default VPC right now maybe we don't
understand anything we see and maybe we don't
understand what is route table,
where is Internet Gateway,
and don't worry, we'll do this one-by-one.
But I want you to realize what a Default VPC comes with
before we go ahead and create our own VPC.
A Default VPC basically comes with a bunch of these
four little menus right here,
it comes with a VPC, three subnets, one route rable,
one Internet Gateway, and then one Network ACL list
that allows all inbound and all outbound.
We'll see in details what this means
and how this works,
but before we go ahead into the next lecture,
please have a look at the Default VPC.
Try playing around, try and see if it means anything to you,
and I will see you
in the next lecture to create our own VPC.