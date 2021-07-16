
<v Lecturer>Let's get into the last load balancer,</v>
which is network load balancers.
And they're layer four load balancers,
that means that they allow you
to forward TCP or UDP based traffic to your instances,
so it's lower level.
It allows you to handle millions of requests per second,
so they're extremely high performance,
and the latency is a lot less than for the ALB.
So just some numbers to give you an idea,
400 milliseconds would be some average latency
for an application or balancer,
whereas for a network load balancer,
we get around 100 milliseconds of latency.
The NLBs are also very different
because they expose one static IP
per availability zone on the outside,
and that is very helpful
when you want to white list specific IP.
And also, they support assigning elastic IPs
instead of getting the ones given by the NLB itself.
So that means that you can use NLB
when you want you have two entry points, for example,
that are dedicated specific IP for your application,
and then the NLB will forward that traffic
into your EC2 instances.
That is different from the ALB or CLB,
which did not have aesthetic IP but had aesthetic host name.
Now the NLB,
the use case,
your lead in the scenery questions is going to be around
when you want extreme performance
or you want TCP or UDP level traffic.
And for the handle that we're going to do very very soon,
the NLBs are not included in the AWS for each year.
So if you do the hands on with me,
then you will pay some money.
So if you don't want to pay any money,
then don't do the hands on with me.
Very simple.
Now the network load answer is layer four and so
what that means is that's your target groups
just like before it can be EC2 instances,
but now your TCP based traffic
will reach your target groups.
And so it could be from the external and we can also have
some rules around how to redirect
to your target groups, okay?
So let's go into the hands on to see how
network load balancers are being created.
So let's go ahead and create our load balancer.
And this one is the network load balancer for TCP,
TLS and UDP and TLS is secure TCP.
And what I want you to remember out of this is that
if you go ahead and do this hands on with me,
then you will pay some money.
So if you don't want to pay any money again,
please don't do this with me.
Okay.
Now I'll just call it my first NLB
for network load balancer.
It's going to be internet facing on TCP protocol for port 80
and as you can see, the options I have are not HDP in here.
It's TCP,
TLS for security CP,
UDP and TCP UDP.
Okay.
For the AZ I will say yes,
I want to have it in multiple AZ.
So eu-west three A three B and three C.
And then I'll click on next.
I'll click on configure routing and I can choose
a new target group and I'll call it
my target group NLB because
it's going to be an NLB target group
and it could be instance or IP.
So I'll choose instance
to have my EC2 instances redirected to.
And then for the health check setting,
as we can see now is going to just check the TCP traffic
into your instance,
so the health checks are a little bit less powerful
and it will choose the interval
to be 10 seconds to have faster results.
Now click on register targets and I can see my three
instances that I all will add into my target group.
And this time I will do this correctly, so here we go.
And I'll click on next review,
create, and we should be good to go.
So my ALB is now created,
and it's right here.
It's the second one.
So my first network load balancer is being provisioned.
So let's wait a little bit and then
we'll get into testing it.
Our NLB is now provisioned,
and let's test it out but I can tell you right away
it's not going to work.
So as we can see,
it's connecting, but it isn't loading.
And we'll see why in a second.
So let's have a look.
When we created this NLB,
there was no security group being attached to it.
When we have an ALB,
there was a security group,
but for the NLB's case,
there is no security group, okay?
So this is a little bit of a different beast.
So if we go to the load to the target group attached
with my target group NLB,
and we look at the targets,
as we can see they all unhealthy.
So this is a problem.
They're all unhealthy
because they don't allow any
traffic to come in through port 80 from anywhere, okay?
Because from this 10 points of load balancer
for the network load balancer,
it's a little bit more complicated.
But the instances don't see traffic coming from the NLB,
they see traffic coming from the outside.
So what we have to do to fix this
is to go to one of our instances,
this one and then I will go to the security group,
which is my first security group.
So I'll click on it.
Inbound.
And here, I will edit the rules and I will add a rule.
Okay.
And this one is going to say
for TCP on port 80 from anywhere, so anywhere.
Allow traffic from the outside.
And this is going to be an NLB specific rule.
And so what we're seeing here is that we're saying,
okay,
you can access our EC2 instance from anywhere
because through the NLB, it actually looks like the
traffic is coming from the outside and this is what
the documentation recommends.
So what we have to do now is to wait a little bit
for the health checks to pass and
hopefully if they pass then our NLB will be functional.
Now thankfully our instances
are all passing the health checks.
They're all healthy.
And so if I go back to my network load bouncer and refresh,
now we see the Hello World coming from our instance and
it looks like it's just sending to one of them because
it probably chose one of them to be
our targets and keep the connection sticky.
Okay.
So this is really good.
The NLB is actually working and this was quite
a different beast to make work.
And as you remember, NLB is going to be one you want
to have a private, static IPV4 address
that's going to be facing,
or when you want to have extreme performance.
Okay.
And something I didn't show you is when we go ahead
and create that load balancer
and we'll just say blah, blah, blah,
and we'll say the subnets,
here the IPV4 address,
you can either assign it by AWS or we can choose
an elastic IP if you wanted to assign an elastic IP
to our load balancer,
and right now, as we can see,
this is something we cannot change afterwards
due to this temporary limitation
where we have to choose very carefully the subnets and
the IP we want to have
for being internet facing well in advance.
Okay.
So the recommendation is if you want to use
an elastic IP, create it in advance,
and then have it here to be assigned directly
to your network load balancer.
Okay.
That's it.
So our NLB is created,
but we will not be using it any further.
So you can go ahead and right click and delete this NLB,
and likewise for the target groups,
you can go ahead,
right click and delete the target group.
And from a security standpoint for security groups,
we can also remove that rule
allowing port AD from anywhere and click on save.
And we are done with this hands on.
All right.
So that's it.
I will see you in the next lecture.