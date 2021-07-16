
<v Instructor>So, let's talk about Bastion Hosts.</v>
So, this is the diagram.
We have our Bastion Host users,
we SSH into the Bastion Host,
which is in a public subnet
and then from the Bastion Host,
we're able to SSH into other Linux instances.
So, the Bastion Host is used
to SSH into private instances
and it sits in the public subnet.
And the reason we do this is
that because the public subnet is connected
to all the other private subnets.
So what we need to do is make sure
that the security group of the Bastion Host
is super strict to only allow the IPs that need to go in.
So, as an Exam Tip,
you'll get this as the exam,
make sure the Bastion Host
only has port 22 traffic coming from the IP you need,
so your own IP,
and not from other security groups from other instances.
The only thing the Bastion Host needs
is port 22 coming from your IP.
So, let's have a quick hands on on this.
So, it turns out that we've already used Bastion Host
without really knowing about it,
but when we have a public instance,
well, that public instance is also a Bastion Host.
Why, because we did allow SSH access into it,
so we allowed SSH
and it sits in the public subnet so we can access it,
and from this Bastion Host,
weave SSH into our private instance.
So, let's have a look at how this works.
So, let's go back.
So, let's SSH into our public instance,
our Bastion Host,
and from there we ran the SSH command
to SSH into our private instance.
Now, this is not perfect
and there are ways not to use the private key pair
onto the Bastion Host directly,
to pass it more as a proxy.
There's ways to improve this,
but it gives you the general idea
of how a Bastion Host is used
and I hope that was helpful for you.
I will see you in the next lecture.