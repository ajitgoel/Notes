
<v Instructor>Okay, so we're getting into</v>
the very interesting concept of Private and Public IP.
That may be too basic for you, I'm sorry that is,
but some people need help with this
so I rather help everyone.
So networking is to sort of have IP, there is IPv4 and IPv6.
IPv4 is what is most common probably, you know already
it's basically four numbers separated by three dots.
IPv6 is a bit less common, it has this very long,
strange string of exotic symbol numbers, and letters
and basically, in this course, we'll be using just IPv4,
but know that AWS has support for IPv6 as well.
IPv4 right now is still the most common format used online
IPv6 is more for IoT or the Internet of Things
and basically, it solves a lot of problems but not for us
we don't have any problems with IPv4 so far.
IPv4 allows for 3.7 billion different addresses
in a public space and that's almost running out
of IP addresses, and basically, each number can vary
between zero and 255 each, where the dots
so if you do the math,
you get 3.7 billion different addresses.
Now, let's have an example of what that means
if you have a web server and it's public,
that could be our EC2 instance or have a public IP
and we can have another server with another public IP
and using the public IP, these servers
can talk to one another, which is great.
Now, when we have a company, for example, my company
and it has a private network, the private network, basically
has a private IP range, and private IPs
have this very specific way of being defined
but basically, that means that all the computers
within that private network
can talk to one another using the private IP.
Whereas, when you touch an internet gateway,
which is a public gateway, well, these instances
also will get access to other servers, and so on
and so that's a common pattern in AWS.
Now, basically, if you have another company
it will also have a private network
and within the private network,
every computer can talk to one another
and maybe also have an internet gateway with an IP
and basically can connect all over the internet
and talk to other servers, okay.
So basically, the difference I wanna show you is that
when you have a public IP, you're accessible
over the internet and when you have a private IP
you only accessible within your private network.
So some differences, public IP, as I said,
means that the machine can be identified
on the internets, and the public IP must be unique
across the whole web, so not two machines
can have the same public IP, and I think that makes sense.
And an IP usually gives you an IP, you can just Google it
and you can find a geolocation.
Whereas a private IP, it means that
the machine can only be identified
on the private network only and the IP
must be unique only across the private network
but two different private networks
so two different companies can have the same private IP
that is absolutely not problem.
And machines, when they're on the private network
they will connect to the Internet through a NAT device
and an internet gateway that will act as a proxy.
And finally, only a specified range of IPs
can be used as private IPs.
Finally, for Elastic IPs, basically when you start
and you stop an EC2 instance, it will change its public IP
and we'll see this in the hands on.
And if you have a fixed public IP for whatever reason
for your instance, what you are going to need
is something called an Elastic IP.
So the Elastic IP is what, it's a public IPv4
and you own it, as long as you don't delete it.
Basically, you can attach it to one instance
at a time only obviously, and basically,
when you have an IP address and it's elastic,
you can basically use it to mask the failure
of an instance or software, by basically quickly moving it
from one instance to another, but it's quite
an uncommon pattern, because you can only
have five Elastic IP in your accounts.
Now, you can ask to AWS to increase that
but it's quite rare to use them.
Overall, I would recommend to try avoiding using Elastic IP,
they're often referred very poor architectural decisions
and instead, you should use a random public IP
and assign a DNS name to it.
Now DNS, we'll see them route 53 and is something
that's gonna be much more in control for us
and much more scalable, or later, as we'll see,
we can also use a Load Balancer and not using public IP
at all, which is the best pattern you can have for AWS.
Now, let's go ahead and do a quick Hands On,
so we can get a good feeling for all these things.
By default, our EC2 machine will come with a private IP
for the internal AWS Network,
a public IP, for the WWW, so the World Wide Web
and then when we're doing SSH into our EC2 machines
we cannot use a private IP because we're not
on the same network, unless you have a VPN.
We can only use the public IP if you don't have a VPN
and if your machine is stopped and started,
the public IP can change.
So now let's go and observe all these behaviors.