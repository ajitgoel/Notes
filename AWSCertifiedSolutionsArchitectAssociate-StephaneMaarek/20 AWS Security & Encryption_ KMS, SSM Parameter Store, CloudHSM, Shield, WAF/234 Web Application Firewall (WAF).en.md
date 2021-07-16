
<v Narrator>So now let's talk about WAF</v>
or Web Application Firewall.
It is a firewall that will protect your web application
from common web exploits and they're at the Layer 7.
So what is Layer 7?
Well, Layer 7 is for HTTP,
versus Layer 4 that I said maybe in this course,
which is for TCP.
So Layer 7 is a higher level,
and has more information into how a request is structured
than Layer 7, which is just around the protocol
of the transport mechanism.
And WAF can be deployed on three things,
and you have to remember them going into the exam.
The first thing is an Application Load Balancer.
So newer generation, HTTP level Load Balancer,
so you can remember this easily,
API Gateway, and finally CloudFront.
Just these three things and nothing else.
And then to use WAF,
you need to define something called a Web ACL,
a Web Access Control List
and in the Web ACL, they can be rules on multiple things.
And these things include, for example, IP addresses,
HTTP headers, HTTP body or URL strings.
So for example, we could create a firewall rules
which will restrict an IP address from accessing
our websites that is deployed on
an application Load Balancer.
We can also get protected using WAF
from common attacks that can be done at the HTTP level.
And those include SQL injection, and Cross-Site Scripting
or XSS and you have to remember those
as well going through the exam room
just at a high level, okay?
Then you can also put some constraints
around the size of a query.
So maybe you don't want a query to be bigger
than five megabytes, in which case,
a size constraint ACL will really help
decrease the amount of load your website can have
due to miss forms or bad queries.
You can also have geo-match to block specific countries
from accessing, for example, your API gateway
by attaching a web ACL on to your API gateway
and blacklisting a country you don't want it to be
going onto your website.
Finally, WAF can also be used to protect yourself against
DDoS and so it can give you DDoS protection.
How by including some rate-based rules.
So in these cases,
we don't look at each request individually,
we look them in bulk.
And so we're going to count the occurrences of events,
for example, per IP and we want to say, okay
an IP should not do more than five requests per second.
Otherwise, it looks like it's an IP, that's a bot,
and it's going to attack our infrastructure.
And so in this case, using rate-based rules
can help for DDoS protection directly within WAF
and so we can see WAF can help us with HTTP defense,
thanks to the fact that an HTTP request is more structured.
And we can defend ourselves again for IP addresses,
SQL injection, Cross-Site Scripting, geo-match,
rate-based rules and DDoS protection.
So this is great.
And Firewall Manager is to manage all the rules
of all your WAFs within an AWS Organization.
You define a common set of security rules
and the WAF rules applies to the exact same thing.
So ALB, API gateways and platforms,
but also Shield events, which applies to ALB, CLB,
Elastic IP and platforms,
your security groups for EC2 and ENI resources in VPC.
So it's a centralized way
to manage all these things together
within your organization.
Now, what does it look like now
for the Simple Reference for DDoS Protection
and other exploits protection.
Then we have something like this,
we have the users that go through route 53
for the DNS service, which is protected by Shield.
And then they go for cloudFront Distribution,
again, which is protected by Shield.
And we can also install WAF to control the type of request,
that get to CloudFront and maybe deny them at the edge.
And if they all go through,
then they go to your Load Balancer,
which is also protected by Shield.
And finally, to your auto scaling group
that hopefully scales if you're experiencing an attack.
So this is the very common simple architecture
for protecting yourself against attacks and DDoS.
I hope that makes sense and in the next lecture,
we'll just do a quick hands on
to see how Shield and WAF work.
Alright, that's it.
I will see you in the next lecture.