
<v ->So now let's talk about VPC peering.</v>
A VPC peering allows you to connect two VPC privately
directly using AWS's network and to make them
behave as if they were in the same network.
For this, you need to have non-overlapping CIDR so be
very careful when you create your CIDRs and your VPC.
Make sure they are different, make sure they don't overlap.
So let's take an example, we have VPC-A and VPC-B
and we want them to be connected. Somehow we have to create
a VPC peering connection between the two and then update
some route tables and we're done.
So VPC peering connection is not transitive.
That means that for every VPC that needs to connect
to another VPC, you need to establish
a VPC peering connection.
So if you have VPC-C and it needs to talk to
VPC-B we establish a VPC peering connection
between B and C, but in this case
A and C are not connected.
Because for them to be connected
we need to create a special, dedicated VPC peering
connection between A and C.
And it's super important for you to understand this.
It's not transitive, okay?
So we can do VPC peering with another AWS account if we
wanted to. And when we do VPC peering,
super important for each VPC subset we want to peer,
we need to change the route table.
Otherwise, the instances will not be able to communicate.
So the transitiveness and the updating route tables part
are very tricky exam questions that they ask all the time.
So be very wary of this, we'll see these on the hands on.
Obviously.
A few elements that are good to know for VPC Peering
the first one is that it works inter-region, cross-accounts
so you can peer across region and across accounts
and you can also reference a security group
of a Peer VPC cross-accounts
so this is really good for your security.
So for example if you have a security group and
these are the rules for example, it allows HTTP on port 80
from security group in your account maybe in another VPC
or if it's another account entirely you have
a HTTP rule on port 80 and it references the security group
slash the account number that the security group accounts
the belongs to. So it's really really good because you can
really enhance your security group and make sure that only
other security groups in peer VPC have access
to your application. So this is where we are
in our hands on so far we have just seen network
access control list on the left hand side we're
going to add VPC Peering to default VPC and
we'll start to complete the diagram a little bit more.
So let's get started. So what I would like you to do here
is to connect my default VPC to my demo VPC.
So if you go to our VPC and we remove the filter
we have this two VPC and they have non-overlapping CIDER
and would like them to be able to communicate.
So first let's prove that they can't communicate.
For this I'm going to create an instance,
I'm going to launch an instance then next T2 micro.
I'll configure the instance detail and
this time I will launch it in my default VPC.
I don't care about this subnet it doesn't matter and
I'm fine I'll add storage I'll add tags configure
security group and I will just have port 22,
this is fine. Review and Launch, launch and
I will launch this session to it directly.
So now let me wait for my instance to get started,
I will get the IP address and get association to it
My EC2 instance now running all codes default EC2
just to know that it's in the default VPC and so here's
the IP address the public one so I'm going to go and
type in SSH into this instance so on the left hand side
I will SSH into the instance that is in my created VPC
in the public subnet and on the right hand side,
I ssh into the instance in the default VPC.
So let's just see if the works. That worked,
okay here we go. So we can look at the IP this one is
the IP 10-0-0-108
where else this one is the
IP 172-31-26-26
This one if we curl local host port 80
we should see hello world because
there is a hello world webpage. So the idea is
that we want to be able to do the exact same thing
but from this instance. So if we curl 10 0 0 108
Port 80
we wanna hello world, but right now we don't see
hello world because we can't access this network
from this network. So we need to peer our VPC
to access each other's network. Now that we see
the problem, Let's look at the solution.
We go to VPCs and on the bottom left there
is a peering connection. So we create a peering connection,
we call it DemoPeering and then we have to set up a VPC
requester so that is the VPC you own so DemoVPC and
then you select another VPC to peer with it could be in my
account or another account, it could be in this region or
another regions you get lots of flexibility here.
So select one for my account for this region and
the accepter VPC is going to be my default VPC.
So it looks like, yes the CIDR is right here they
do not overlap. So I create the peering connection
and the peering connection will only work when it
gets accepted so right now this is pending acceptance.
So we have to accept it and so for this I right click
and I will accept the request. So this looks fine
I will accept this request that peers this VPC from
this account to this VPC in this account. Yes I accept.
Okay, it says your VPC connection has been established but
to receive traffic across this VPC peering connection,
you must add a route to the peered VPC, so yes.
Let's have a look now if I do my curl it still
doesn't work because we're missing the routes.
Okay, let's get back to it. Now I'm going to my route
table and so we basically have to update my
public route table and my default VPC route tables.
Let's go update the public route table first.
There is my demoVPC, so here's the route and
I'll say okay I will edit it and I will say for
this CIDER and I need to find the CIDER so let's have a look
at what the other default CIDER is. This is the default
CIDER from my default VPCs so let's go back to route table.
I'll say okay for route I'll edit it, I'll add one and
I'll say for all traffic that goes to this kind of CIDER,
and the target is going to be my peering connection
and it makes sense now. We are saying okay if we start to
hit that IP then you use this VPC peering connection, save
routes. And it's not in enough to do it in one route table,
you need to do it in the other route tables, so we've done
it on the demo VPC side but we have to do it in the default
VPC side. So here's the route and I'll say, this time when
the destination is 10 0 0 0/16 which is basically my demo
VPC that we created in this exception then the target is
going to be peering connection and save route as well.
So now basically, we have route going both ways from a
public to my default and from my default to my public
and so this should be good enough to have the instances
being connected but let's try it out. We are going to curl
this URL press enter and we get hello world as a response
so now my instances in my default VPC are connected and
peered to my instances in my demo VPC. So pretty awesome
right? We just connected the two, it was really easy but
what we need to see is that we need to create a peering
connection and accept it and then update the route tables.
Okay that's it for this lecture
I will see you in the next one.