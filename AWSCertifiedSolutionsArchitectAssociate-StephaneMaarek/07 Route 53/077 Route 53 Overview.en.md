
<v Instructor>So let's learn Route 53</v>
which is a very important service
in AWS.
It is a managed DNS,
and D-N-S stands for Domain Name System.
So, what is a DNS?
Well, a DNS is a collection of rules
and records which will help clients,
so that could be for example
a web browser,
understand how to reach a server through its domain name.
So in AWS, there are four common records
that you should know.
There is the A record
which maps a host name,
for example myapp.example.com
to an IPv4.
There is quadruple A
which is mapping a host name
to an IPv6 address.
CNAME, and I've a whole lecture dedicated
to CNAME, which maps a host name
to another host name.
And finally, Alias which maps a host name
to an AWS resource.
So, we have to remember
these four types of records,
but don't worry,
we're going to practice those
into this section.
Okay.
So, let's do a deeper dive
and look at a diagram
of how Route 53 will work.
So, we have a web browser,
and it wants to access our application.
And our application is on an application server
which has an IPv4
which is 32.45.67.85.
And, we wanna be able to get access
to that server.
So, behind the scenes,
our web browser is going to make
a DNS request
to our DNS system
which is Route 53 in this instance.
I was going to say, hey,
for myapp.mydomain.com,
I'm giving you
a DNS request
to Route 53 and I want you
to tell me where this is located.
So, we have a host name and Route 53 will say
here is the IP you should be looking at.
It is 32.45.67.85
and this is, therefor,
an A record because we have mapped a host name
to a IP.
And then, the web browser has finished
the DNS request,
and it say, okay I know where to go now,
so I'm going to do an HTTP request,
and I know the target IP,
and I'm gonna do a HTTP request,
and the server will then receive the request,
and say okay, here is your HTTP response.
And, this is the basics of how a DNS works.
Now, obviously a DNS can be way more complicated,
but at high-level, this is what you get.
A web browser making a DNS query
to a DNS system such as Route 53,
and then, the web browser is able
to reach your server where it is located.
So, Route 53 can use different things.
It can use public domain names that you own
or buy.
And then, you can have
whatever you want, application1.mypublicdomain.com
or a private domain that can only be resolved
by your instances within your VPC.
So for example, this domain application1.company.internal
that's not something you can purchase on the internet.
You'll have to make this a private domain,
and that only your applications can resolve this thing.
Now, Route 53 has a lot of advanced features.
Some will be load balancing, and will see it
how that works, through different kinds of records.
There will be health checks and we'll
also see this in details.
And then, there is routing policy
that we'll see as well in details
such as simple, failover, geolocation,
latency, weighted and multi value.
So, last thing you should know is
that you are going to pay 0.50 dollars,
so fifty cents per month per hosted zone.
So, Route 53 is not something that's free,
there's no free tier,
and if you go ahead with this tutorial
and buy a domain name,
you will also have to pay for that domain name
about twelve dollars.
So, just so you know, if you go along with me,
in this lecture then,
you will have to pay a little bit of money.
So, that's it for just the overview,
we'll do a deep dive
into many of these advanced features as well,
but for now let's go ahead.
Create a domain name and try out a small record.