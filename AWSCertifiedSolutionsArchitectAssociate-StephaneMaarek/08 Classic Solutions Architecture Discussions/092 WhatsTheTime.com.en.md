
<v Stephane>Okay, so let's get started</v>
with our first solution architecture discussion,
and I'm really excited 'cause we're going to see
so many different topics all together,
and we'll really understand how they fit
and what other challenges we have as a solutions architect.
So the first website is WhatIsTheTime.com,
and WhatIsTheTime.com allows people to know what time it is.
I know, it sounds stupid,
but at least it's so easy that everyone understands it,
and we'll be able to talk about it at length.
So we don't need a database because it's so simple.
Each instance, each server knows what time it is,
and we want to start small.
We're willing to accept downtime, but overall,
maybe our app will get more and more popular.
People really wanna know the time around the world,
and so we'll need to scale vertically and horizontally,
maybe remove downtime,
and let's go through
the Solutions Architect journey for this app.
You'll see, we'll see a lot of things on how we can proceed.
So let's start really simple.
Okay, let's start from the very beginning.
You're a social architect and you say,
you know what would be great?
You have a t2.micro instance and you have a user,
and the user says what time it is,
and say okay, it's 5:30 p.m.
Done, this is my app.
So we have a public EC2 instance,
and because we wanna make the EC2 instance
have a static IP address in case something happens
and we need to restart it,
then I will attach an elastic IP address to it.
So this is my first PoC.
It's written really great.
Our users are able to access our application,
and we're getting great feedback.
So now, what's happening is that our users
are really having a good time using our application,
so they said to their friends,
hey, you should also use the application.
So another friend comes in and says what time is it?
And 7:30 p.m.,
and another friend comes in, what time is it?
6:30 p.m.,
and so we realize here that
our application is getting more and more traffic,
and certainly, the t2.micro instance isn't enough,
and so, as a solution architect, we say, wait a minute.
Maybe we should replace that t2.micro instance
by something a little bit bigger
to handle the load, so that's called vertical scaling.
Maybe we'll make it an m5.large type of instance.
So what we do is that we stop the instance,
we change the instance type,
and then, we start again the instance,
and here we go.
This is an M5 type of instance.
So what happened here is that is has the same public IP
because it has an elastic IP address,
so people are still able to access our application,
but we have experienced downtime
while upgrading to an M5,
and so, our users were not really happy.
During that moment,
they were not able to access our application.
So this works, but this isn't great, right?
So next, we're going really popular,
and it's time to scale horizontally,
so we get, remember, this application M5
has one public IP, elastic IP attached to it,
and now, we're getting tons of users,
and so, they're all asking what time is it?
And so now, we wanna scale horizontally,
so we start adding EC2 instances.
They're all m5.large,
and they all have an elastic IP attached to it.
So now, on top of having three EC2 instance,
we have three elastic IP,
and so our users, they need to be aware of the,
the exact values of these three elastic IP
to talk to our instances,
and so, that's called horizontal scaling.
We're doing not bad, but we see we starting kinda
reach some limits.
Now the users need to be aware of more and more IPs,
and we have to manage more infrastructure,
and it's, it's pretty tricky, right?
So okay, let's change the approach.
Now we have three EC2 instances, M5,
and let's remove elastic IP
because it's something that we can't really manage.
There's only five elastic IP per region per account
by default so it's not real lot,
and so, instead, our users, what they're going to do
is that they're going to leverage Route 53,
so we've set up Route 53,
and the website URL is api.whatisthetime.com,
and we've decided it's going to be an A Record
with a TTL of one hour.
An A Record means that from a DNS like this,
it's going to give me a list of IPs,
so remember, Route 53, A Record is IP.
So great, so the users query Route 53,
and then, they get the IP addresses of our EC2 instances,
and they can change over time.
It doesn't really matter
because Route 53 will get updated.
We'll update it and keep it in sync,
and so, our users are now able to access our EC2 instances,
and we don't have any elastic IP to manage anymore,
so using Route 53, we've done some good improvement,
but what happens is that now, we wanna be able to scale,
you know, and be able to add and remove
instances on the fly,
and so, when we do remove an instance, aw, what happens?
Well, it seems like these users at the top,
they were talking to this m5.large instance,
but now, it's gone,
and it turns out that if they do a Route 53 query,
because the TTL was one hour,
they're using the same response for one hour.
So for one hour, they'll try to connect to that instance,
and that instance is gone,
and so, here, it's not really great
because even though these users are having a good time,
and maybe after one hour,
these user will be able to connect to these two instances,
they're not having a good time right now
'cause they think that our application is down,
and that's really, really bad.
So okay, so this is an architecture,
and we see the limit of it.
So how can we push this a little bit further?
So let's talk about adding a load balancer.
So instead, now having,
we don't have public instances anymore.
We have private EC2 instances,
and we're going to launch them in the same Availability Zone
because we don't know any better.
So we've launched them manually.
We have three m5.large instances,
and we are following this course,
and we said okay, let's use a load balancer,
and you know what?
On top of it, it's going to have health checks
such as if one instance is down or not working,
at least we won't send traffic
from our users to the instance.
So okay, we're linking the two together,
so my ELB is going to be public-facing,
whereas my private EC2 instances are in the back,
and so, they restrict traffic between these two
using maybe a security group rule that we've seen before,
using security group as a reference.
Okay, that sounds pretty good.
So now, our users, they're going to query
for WhatIsTheTime.com,
but this time, it cannot be a A Record
because a load balancer has its IP changing all the time,
and so, instead, because it's a load balancer,
we can use an Alias Record,
and this Alias Record is perfect
because it will point from Route 53 to the ELB,
and everything will work really great,
and so, here we change our DNS, but now,
the users connect to our load balancer,
and our load balancers redirects us to our EC2 instances
and balances the traffic out and it's really great
'cause now we can add and remove these instances,
and we just sort them with our load balancer,
and we won't have any downtime for our users
thanks to the health checks feature.
So really, really good,
but now, adding and removing instances manually
is pretty, pretty hard to do,
so what about, we just leverage something
we just learned in this class,
and we'll launch an auto-scaling group.
So now, we have our API on the left-hand side.
It's the same thing, a Route 53, ELB,
but on the right-hand side now,
we're gonna have an Availability Zone,
and we're going to launch private EC2 instances,
but this time, they're going to be managed
by an auto-scaling group,
and so, this allows our auto-scaling group
to basically scale on demand.
Maybe in the morning, no one wants to know the time,
and maybe at night, when people want to leave work,
they wanna know the time.
So we're able to scale based on the demand,
scale in and scale out,
and this is really, really great
because now, we have an application, no downtime,
auto-scaling, load-balanced.
It seems like a really stable architecture, and it is,
but what happens is that, ugh!
There's an earthquake that happens,
and Availability 1 goes down, Zone 1 goes down,
and guess what?
Our application is entirely down.
Our users are not happy,
and so, Amazon comes to us and says,
yes, it's because you haven't
implemented a multi-AZ application,
and we recommend you to implement multi-AZ
to be highly available.
So okay, we say all right.
Let's change a little bit the things.
Now we're gonna have to ELB,
and on top of having health checks,
it's also going to be multi-AZ,
and it's going to be launched on AZ 1 to 3,
so three AZs for this ELB,
and our auto-scaling group as well
is going to span across multiple AZ,
and this allows us maybe to have
two instances in AZ 1,
two instances in AZ 2, and one instance in AZ 3,
and so, the cool thing now is that,
ah, great, like, if AZ 1 goes down,
well, we'll still have AZ 2 and AZ 3
to serve our traffic to our users,
and we've effectively made our app multi-AZ
and highly available and resilient to failure.
Pretty awesome, right?
Okay, how far can we go with this?
Let's keep on going.
So we have two AZ,
and we know that at least one instance
will be running in each AZ,
so why don't we reserve capacity?
Why don't we start basically
diminishing the cost of our application
because we know that for sure,
two instances must be running at all time during the year?
And so, by reserving instance,
maybe for the minimum capacity of our auto-scaling group,
then we're going to save a lot of cost in the future
whereas the new instances that get launched,
maybe they're gonna be temporary, so on demand is fine,
or if we're a bit crazy, we could even use spot instances
for a less, less cost,
but we might have the instances being terminated,
and so, it's really interesting, right,
because we've seen an architecture
going from a very small application
all the way to a, you know,
load-balanced, auto-scaling group,
multi-AZ, health checks,
reserved instances that with our application,
and so, to me, that's,
as a solutions architect, your journey.
It's up to understand what are the requirements?
And what should we architect
in returns to these requirements?
And this is where the exam will test you.
Now this is the first architecture discussion.
Trust me, there will be many others in the next lecture,
but for now, let's just review what we've discussed.
What we've discussed, for example,
what it is to, for an EC2 instance,
to have a public IP and a private IP.
You know, where does it fit in our architecture diagram?
We also seen what is the benefit of having an elastic IP
versus using Route 53 versus maybe using a load balancer
for our application.
We've also seen that thanks, because of the Route 53 TTL,
we couldn't really use A Records,
so we had to use an load balancer and Alias Record
and so that we'll be able to see
how Route 53 can fit in this whole picture.
We've seen how to maintain EC2 instances manually,
and then, we say, all right, it's too much maintenance.
Let's use auto-scaling groups, and you know what?
It's actually gonna provide us even better costing
because it will just scale on demand,
and we'll just have the perfect amount
of EC2 instances at any time,
and then, we said okay, let's go into multi-AZ.
We can survive disasters this way,
and let's enable ELB health checks
such as only the instances that are correctly responding
do get traffic,
and we've seen how to set up security group rules
so that the EC2 instances will only receive traffics
coming from the ELB,
and finally, we said, you know what?
Let's look at capacity.
Let's do some cost-saving.
We always know that we want two EC2 instances
running at any time,
so let's reserve these instances,
and they will bring lots of cost savings,
and so, all this discussion right here,
there's the thing called
the Well-Architected Framework in AWS,
and we'll be talking about it
at length as well in the dedicated section,
but there's five pillars to it,
and there's cost, performance, reliability,
security, and operational excellence,
and so, through these discussion,
I want to educate you
that we have actually seen these five pillars.
So cost, cost has many different purpose,
so maybe we're scaling up our instance vertically.
Maybe we're using ASG to just have
the right amount of instances based on the load,
and maybe we wanna reserve instances as well
to optimize cost.
In terms of performance, well, we've seen vertical scaling.
We've seen ELBs, we've seen auto-scaling groups,
basically how we can adapt to performance over time.
Reliability, we'll seen how Route 53 can be used
to basically reliably direct the traffic
to the right EC2 instances,
and maybe using multi-AZ for the ELB
and multi-AZ for the ASG as well.
For security, we've seen how we can use security groups
to basically link the load balancer
to our instances reliably,
and operational excellence,
how we can evolve from a very clunky, manual process
all the way to having it fully automated
with auto-scaling groups, et cetera, et cetera.
So really awesome.
I think this is a good discussion,
and we'll have many others,
but as a solutions architect,
start understanding what other technology we've seen
and how they fit together and how they solve problems
all together when, when configured correctly.
So that's it.
I hope you liked it, and I will see you in the next lecture.