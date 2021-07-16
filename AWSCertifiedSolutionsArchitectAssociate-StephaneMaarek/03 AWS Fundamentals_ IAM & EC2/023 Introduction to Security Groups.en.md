
<v Narrator>Now we are ready to get</v>
an introduction to security groups.
So security groups, they're fundamental
of the network security in AWS
You'll hear them more and more and more.
They control how traffic will be
allowed into your EC2 Machines.
And as such, they're super important.
So we have the www so the nets and the EC2 Machine
and our security group and basically
we'll control the inbound and the outbound traffic.
It's honestly the most fundamental skill
to learn to troubleshoot networking issues in AWS
and if you understand security groups
you'll understand a big part of the Amazon cloud.
So in this lecture, I want to show
you how to use your allow, inbound, and outbound ports
just to give you a feel of how things work.
So let's get started.
Okay, so we have our EC2 instance
and as we can see, the inbound rules
of our security group says that port 22 is allowed.
So if we go into our terminal,
and we SSH into it, it works, great.
But what happens when we start
messing around with the security group?
So you can click on it
and you're taken directly to the security group page.
By the way, on the left hand side,
you can quickly get back to it under network and security
So we are security group and it has a name
it has a description and we have inbound, outbound and tags.
Now under inbound, this is all the
rules that will allow traffic into our EC2 machine.
And so by default, there's no rules, okay?
And we have to add rules and the rules we've added
when we created the EC2 instance was this SSH rule.
If we go to outbound, by default
all traffic is enabled out of the machine.
And so that means that machine
can communicate everything, everywhere.
This is fine, by the way.
Finally, tags is if you want to add
a name tag or whatever you want
for your EC2 for your security group
But this is fine, we won't play with it.
Now what happens if we just delete that rule?
So we'll just remove that rule,
save it, and now we have no more
inbound rules into our machine.
Now what happens is that if we go ahead
and try to SSH again, while the port 22 is not allowed
and as you can see we'll just wait
and wait and wait
and this is called a time out
And so I could just show you this screen
for the one minute, nothing's going to happen.
So I'm just going to stop that command.
Basically, by changing the security group inbound
and by removing it, we basically
have not allowed anything to go through port 22.
And so we can't SSH into our machine.
So to fix this we go to edit and we can add
a custom TCP rule in which we can say
the protocol, the port range so you can
say one zero port or a range and the source
which is a custom like this CIDR, IP or security group
my IP, and you get a description.
There is a quick little shortcut
in case you want to use SSH or HTTP
or whatever you want really,
you're free to do whatever you want.
So for us, we'll do SSH on port 22
and the source can be either my IP, so from my workstation,
or anywhere which is 000/0
and this little bit right here is basically when use IP E6
Okay, so we'll just do custom
and I'll do 000/0 and basically
we'll say SSH allowed from anywhere, great
So this is good enough, we'll save that rule
and now that the SSH rule is added back in
we can do SSH into the machine
and as you can see, things are working.
So I have entered the machine.
So that's a quick intro into how security groups work.
But as you can see, anytime you get
some kind of time out and you can't get to your machine
not just on port 22, but any ports,
this is probably a security group issue.
So I hope that was helpful
and I will see you in the next lecture.