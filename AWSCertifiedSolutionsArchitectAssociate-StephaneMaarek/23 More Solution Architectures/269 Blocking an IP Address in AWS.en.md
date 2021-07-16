
<v ->Okay, so this is going to be more a lecture</v>
around network discussion and security,
but very important because I want you
to really understand what goes on
when a request comes from the clients
and goes all the way to your application.
So sometimes we may want to block an IP address
from a client because it's going to be a bad actor,
maybe it's trying to access our application
and so we want to know the line of defenses
so let's start from this very simple solution architecture
in which we have an EC2 Instance,
in a security group, in a VPC, and that instance
has a public IP so is publicly accessible,
and this is how our clients get into our EC2 Instance.
So say you wanted to block that client,
the first line of defense would be
the network ACL in our VPC, which is at a VPC level,
and in this network ACL, we can create a deny rule
for this client IP address, very simple, very quick
very cheap and the client will just be ejected.
Then for the security group of the EC2 Instance
we can not have deny rules we can only have allow rules,
so if we know that only a subset
of authorized clients can access our EC2 Instance,
then it is good in our security group
to just define a subset of IP
to allow into our EC2 Instance.
But if our application is global
we obviously don't know all the IP addresses
that will access our application
and so the security group here will not be very helpful.
Finally, you could run an optional firewall software
on your EC2 to block from within your software
the request from the client.
Now obviously, if the (stutters) request has already reached
your EC2 Instance, then it will have
to be processed and it will be a CPU cost
to processing that request.
So its a very simple use case but we see already
the difference between a NACL,
a security group and a host firewall.
Now lets push this one step further,
we introduce an Application Load Balancer,
so again this ALB is defined within our VPC
and we still have our EC2 Instance,
but now we have two security groups;
we have the ALB security group
and we have the EC2 security group.
And so in this case our Load Balancer
in this architecture is going to be
in between our clients and our EC2 and it will
do something called Correction Termination
So the clients actually connects to the ALB
which will terminate the connection and initiate
a new connection from the ALB into our EC2 Instance.
In this case, our EC2 security group
must be configured to allow the security group
of the ALB, because the EC2 Instance
can be deployed in a private summit
with a private IP and the source of
the traffic it sees comes from the ALB, not the client,
so from a security group perspective here,
we only allow the ALB security group
and we're safe on this side.
Now for the ALB of the security group...
The security group of the ALB,
we need to allow the clients and again
if we have a range of IP we know
that we can configure the security group,
if it's a global application, we have
to allow everything and in their line of defense
is going to be at the Network ACL level.
Okay, this makes sense and this should
be something you already know.
Now lets look at the NLB in example
and this is something I have not covered yet
in this course because it is an events concept
but for the Network Load Balancer it does
not do Connection Termination.
The traffic; and this is an over-simplification
actually goes through our Network Load Balancer
and so as such there's no such thing
as a security group for a Network Load Balancer,
the traffic is passed through so that means that
the clients originating IP is going
to go all the way to our EC2 Instance
even if our EC2 Instance sits within
a private sublet and has a private IP.
So this can be complicated, but the idea here
is that if we again know the source IPs of all the clients
we can define it in the EC2 security group
but if we are trying to deny one IP address for our clients,
the only line of defense here we have is our Network ACL.
So super important, this can be a difficult concept
to get it but the Network Load Balancer
does not have a security group
and all the traffic goes through it so our EC2 Instance
sees the client public IP at the edge.
Okay, so now lets get back to our simpler case
which was to have the ALB, something we can do
to deny an IP is to install WAF, or Web Application Firewall
now this WAF is going to be a little bit more expensive
because this is an additional service and a firewall service
but in here, we are able to do some complex filtering
on IP addresses and we can establish rules
that will count the requests to prevent a lot
of requests going on at the same time from the clients,
and so we have more power over our security or our ALB.
So WAF is not a service in between your client
and your ALB, it is a service we have installed
on the ALB and we can define a bunch of rules.
So this is one more line of defense.
Similarly if we use CloudFront in front of the ALB,
CloudFront sits outside our VPC, okay?
So as such, our ALB needs to allow
all the CloudFront's public IPs coming from
the edge locations and there's a list of it online,
but that's it, so coming from the ALB,
it does not see the client IP, what it sees
is the CloudFront public IP, and so as such
the Network ACL here which sits at
the boundary of our VPC is not helpful at all
because it can not help us block the client IP address.
And so in this case if we are trying
to block a client from CloudFront we have two possibilities:
say we are attacked by a country; then we can use
the platform's geo-restriction feature to restrict
all the country from our clients to be denied on CloudFront.
Or if there's one specific IP that annoys us
we can again use WAF, or Web Application Firewall
to induce some IP address filtering just like we did before.
Well so as we can see, based on the architecture we have,
we have different lines of defenses
to block an IP address, and they're normal,
once we put everything together it all makes sense,
but I think its so good to show you exactly,
through a diagram what happens from a network perspective
how to properly configure a security group
and where to set up your IP address filtering.
Okay, I hope you understand this lecture,
I hope it makes sense
and I will see you in the next lecture.