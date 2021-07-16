
<v Instructor>Okay, so let's build on the previous lecture</v>
and discuss how we can make a bastion host highly available.
And there are different ways of doing it
and I'm trying to represent them to you in this one graph,
so bear with me.
So we have a VPC and we have two AZ.
And in each AZ will going to have a public subnet
and a private subnet.
Now we know the whole idea behind the bastion host
is that we want to be able to SSH into our EC2
instances that sits in a private subnet.
And to do so our clients, which is in the public Internet
needs to access a bastion host being deployed
in the public subnets,
will do SSH into the bastion host on port 22.
And then from the bastion host,
we'll do SSH into the private subnets, very easy.
And the cool thing is that we can also have a EC2 instances
in the private subnet of another AZ and have the bastion
host also do SSH directly into these instances.
But so the whole idea is that we want to make
this Bastion host highly available.
So this is kind of the same problem we had before.
It's an EC2 instance, it's self managed
and you could be in one AZ, you could be in another AZ
and we're going to be able to is make it highly available
by creating a new Bastion host in another AZ.
So once we have two Bastion host, how do we make our clients
talk to one Bastion host or another one,
without really thinking about it too much?
Well, something we can do is for example,
creates a network load balancer.
And network load balancer will just transmit the TCP level.
So it's layer four because it's TCP, the TCP traffic
into the bastion host in each AZ.
So this network load balancer can be deployed
in two different public subnets.
So this is represented right here.
And so by connecting to the network load balancer
which is a fixed IP, we can directly connect to the NLB
in the first AZ and then gets rerouted to the bastion host.
So the bastion hosts are going to be registered with the NLB
but this also happens at new clients can also be redirected
to the NLB in the second AZ, which will be directly
connecting to the bastion host in the second AZ
and then connecting to the EC2 instances behind them.
So what we see here is that, because we have a bastion host,
we cannot use a, for example, a application load balancer
because an application load balancer works for HTTP level
traffic, but SSH is lower level is TCP.
And so we would need to use something like an NLB.
So we have different options here for the bastion host.
We can run two across two AZ and then we have a network
load balancer with it.
Or we can run one across two AZ with one ASG running
in one, one nodes.
So one min, one max one desire
and to route to the bastion host, we have multiple options.
If we only have one Bastion host, then we could go back
to what we see before and just using the elastic IP
and then use a EC2, to use a datascript
to access your Bastion hosts.
Or if we have two Bastion hosts or more in once you have
a very highly available fleet of Bastion hosts
with multiple running in multiple AZ,
then it's a great idea to use a network load balancer
which is layer four deployed in multiple AZ
and then our clients will just connect directly
into the network load balancer.
And with it, actually what we can do
is making the bastion host
live in the private subnets directly.
So if we had a network load balancer, the bastion host
can be pushed into the private subnets
and that would even simplify our task
and make it even more secure.
But that's just a small detail or small,
real life tip I'm giving you.
Finally, note that we cannot use an ALB as I said,
because the ALB is layer seven, which is HTTP protocol.
And the SSH protocol requires you to be layer four
because it's TCP based only, okay.
So that's it for this lecture, very simple,
but it builds on to what we learned from before
and we saw a great use case for an NLB, for an NLB
and hopefully you liked this lecture.
I will see you in the next lecture.