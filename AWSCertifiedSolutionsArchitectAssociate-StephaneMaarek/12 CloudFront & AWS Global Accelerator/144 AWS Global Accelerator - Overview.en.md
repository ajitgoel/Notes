
<v ->Okay, so in this lecture, we are going to talk about</v>
a newer kind of service for AWS called
the AWS Global Accelerator.
But before we do so,
I want to introduce the problem to you
that we're trying to solve and how we're going to solve it.
So, say you have deployed and application,
and it's global and you've global users
who want to access it directly.
But our application is only deployed in one region.
So, for example here in India,
I have deployed a public application advancer.
But my users are all over the world.
They're in America, in Europe, in Australia.
And so as they access the application,
they want to go over the public internet.
And that can add a lot of latency
due to many hops through the routers. Okay?
So, I'm obviously overplaying this,
so you can see that in America,
there's five hops of routers or servers
before we get to the public ALB in India.
And that's because it goes over the public internet.
Same for Australia, many hops.
And same for Europe, many hops.
So you can see these hops I introduce a bit of risk
connection can get lost,
they also add a little bit of latency,
and they're not as direct as possible
into our amazon infrastructure.
So what we want to do is to wish to go as fast as possible
through as soon as possible the AWS US network
to minimize latency. And so before we do so
and use the global accelerator for this,
I want to introduce to you another concept
which is Unicast and Anycast IP.
So first, Unicast IP is what we know.
One server holds one IP address.
So our clients when they talk to two server
one has starting IP address is the left hand side
number 12 and the other one is 98.
Then if you refer to the IP address that begin with 12
we will be sent to the server on the left hand side.
And for the other one if you use the other IP
then we will go to the server on the right hand side.
This we know it makes a lot sense.
But for Anycast IP, is a little different.
All servers will hold the same IP address
and the client will be routed to the nearest one.
So this is contra-intuitive but this is how it works.
So our client has two servers
and these two servers as you can see in the bottom,
they have the same IP.
But our client when it tries to connect to this Anycast IP
will be sent to the server that is the closest to itself.
And as surprising as this is, this is how it works.
So Global Accelerator uses that Anycast IP concept to work.
So how does it work?
We're able to leverage the AWS internal global network
to route to our application.
So we have the same idea,
we want to route to India
and we have users all around the globe.
And is going to happen is that instead of sending it
through the public internet in America,
it's going to come to the closest edge location.
And from edge location,
it's going to go all the way straight to our ALB
through the internal AWS network.
Same for Australia, so it goes to closest edge location
near to Australia
and then it goes over the private AWS network
to get to the ALB and same for Europe.
So the idea with this is that,
we're going to use an Anycast IP
and there's actually going to be two of those
that are going to be created for your application
and they're global.
And the Anycast IP will send the traffic directly
to the closest edge location of your users.
And this is the power of Anycast IP.
So the edge location will then send the traffic
to you application, (mumbles)
For example,
through the private AWS network which is much more stable,
has less latency and so on.
So the Global Accelerator is absolutely unique
because it really allows to give two static IP addresses
all around the globe for the users
for whatever application you may have.
And right now I'm showing one ALB in one region
but it could be global as well
it could be multiple ALBs in multiple regions.
So it's a game changer to me.
So, what does it work with?
It works with Elastic IP, EC2 instances,
Application Load Balancer, Network Load Balancer
and they can either be public or private.
There is consistent performance
because we go over the network
so we have intelligent routing
to the lowest latency edge location
and we'll have fast regional failover
in case anything goes wrong.
There's no issue with client cache
because the client doesn't cache anything
the IP, the two Anycast IP we're using don't change.
It's internal AWS network to go after the edge location
so it's perfect.
And then we have health checks.
So the Global Accelerator will perform a health check
on your application and then make sure
that the application is global
and if health check fails for one ALB and one region
then there is automated failover in less than one minute
to a healthy end port.
So this is really, really great.
And it's amazing for disaster recovery,
thanks, to the health checks.
Now for security,
it's appropriately secured
because we only have two external IP
that needs to be whitelisted by your clients.
And you get DDoS protection automatically
through the Global Accelerator,
thanks to something called
AWS Shield that we'll see in the security session.
So this is great.
So you're really asking me what is the difference
between Global Accelerator and CloudFront?
And hopefully you already see the difference,
otherwise I failed but I want to outline these differences
very, very clearly.
So, Global Accelerator and CloudFront
they both use the same global network
and they will both use edge locations all around the globe
that AWS has created.
They both integrate with Shield for DDoS protection
so they both receive the same thing
but now their difference.
CloudFront is going to improve the performance
for both cacheable content such as images and video,
and also dynamic content such as,
API acceleration and dynamic site delivery.
And the content is going to be served
from the edge locations.
So once in a while the edge locations
are going to fetch the content from the origin
but most of the time hopefully CloudFront
will deliver cache content from the edges.
So here the users are getting content from the edges.
Whereas, for Global Accelerator,
it improves the performance of the wide range of application
over TCP or UDP.
But the packets are being proxyeed from the edge locations
to the applications running in two one or more AWS regions.
So in that case, all the request still make it
to our application end.
There is no caching available.
So it's a really good fit if you have a non-HTTP uses cases,
such as gaming, IoT or Voice over IP
or it's also really good if you have and HTTP use case
that require a static IP addresses globally.
Okay?
Or in case you need to have deterministic
and fast regional failover.
So, Global Accelerator is a newer kind of service
and it will appear in your exam.
I hope you like this lecture.
I will see you in the next lecture for some hands on.