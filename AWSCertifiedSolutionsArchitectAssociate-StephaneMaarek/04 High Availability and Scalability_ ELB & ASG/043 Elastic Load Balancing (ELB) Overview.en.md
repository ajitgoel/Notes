
<v Narrator>Now, let's learn about load balancing.</v>
So, first of all, you may be asking me,
"But, what is load balancing?"
Load balancers are servers that will forward
internet traffic to your multiple backhand EC2 Instances.
So, as a diagram, what does it look like?
Well, say we have three EC2 Instances
and they have our application.
Our load balancer is going to be in the middle
and it's going to divert traffic from the users
to some of these EC2 Instances.
So, for example, my first user is going to go directly
to my first EC2 Instance through the Load Balancer,
and the EC2 Instance will respond something
to the Load Balancer
and the Load Balancer will respond something back
to the user, okay.
But, that happens for another user, User 2, for example,
may do the same kind of request mechanism,
but this time, the User 2 will be served
in the backend by the second EC2 Instance.
And, User 3, again, will be served
by the third EC2 Instance,
and as we can see here, the users just interface
with the single point of entry,
which is our Load Balancer,
and in the backend, we can scale our EC2 Instances
and have many of them serve the traffic.
And, this is why, because a load is balanced,
it's called a Load Balancer.
So, why should we use a load balancer?
Well, as I just said, we can spread load
across multiple downstream instances
and we can expose a single point of access, DNS,
to your application.
So, we don't need to know about, all the backend EC2,
we just need to know about the point of access,
the host name of your load balancer.
It's going to be able to seamlessly handle failures
of downstream instances through health checks
and, as I said, it is going to regular health checks
on your instances.
So, it knows when not to send traffic to your instances.
It's also going to provide you SSL termination,
or HTTPS security, for your website
directly on load balancer site,
and we'll see this in details in this section.
And, also helps you enforce stickiness with cookies.
We'll see what that means.
Give you high availability across availability zones.
That means that your load balancer
can be spread across multiple AZ and can your EC2 instances,
and it's going to be able to cleanly do a separation
of traffic that is public facing from your users
to your load balancers and traffic that is private facing
which is going to be from your load balancer
into your EC2 instances.
So, you may be asking, "Why do we want to use an ELB
from Amazon and EC2 Load Balancer?"
Well, it is a managed load balancer,
and so, AWS guarantees that it will be working.
AWS will take care of all the upgrades, the maintenance,
and the high availability,
so we don't have to worry about any of that.
It will provide us some few configuration knobs
to make sure that the behavior we get is the one we expect.
And so, while it would cost lot less money
to do your own load balancer on your end,
it will be a lot more effort and it probably not scale.
And so, using a managed AWS load balancer is the way to go,
and it's because it's also integrated
with so many AWS offerings and services,
it's a no brainer.
Use load balancers all the time on the AWS.
So, let's talk about the health checks.
The health checks are super important
for load balancers and why.
Because they enable your load balancers to know
if the instances that it sends the traffic to are healthy,
and by healthy, we mean, available to reply to requests
in a good way.
So, the health check will be done by the load balancer,
and you have to specify a port and a route.
Usually, from the real world, real world tip, /health,
is quite common.
And, if the response is not 200 OK,
then the instance will be deemed unhealthy.
And so, this showed here, our load balancer,
here I showed you a classic load balancer,
will be doing a health check on your EC2 Instance
on Port, say, 4567 on the Route /health,
and if the EC2 Instance says 200 OK,
it means, I'm healthy.
Then, it'll announce it will mark the instance as healthy,
and it will be able to send traffic to that EC2 Instance.
If it's not healthy, it will stop sending traffic.
And so, with health check, the beautiful thing
is that they happen every five seconds,
you can also configure that
to happen every five, ten, seconds.
And so, continuously, your load balancer will try
to make sure that your EC2 Instances are available
to respond to request.
So, load balancers.
There are three types on AWS
and you will have to know the different between these three.
So, they're all managed and the first one
is the Classic Load Balancer.
It's called a v1.
It's older generation,
and it was first created by AWS in 2009.
And, it supports HTTP, HTTPS, and TCP traffic.
Then, we have our application load balancers,
and they're v2.
They're newer generation,
and the exam will make sure that you choose, more often,
the newer generations' load balancers.
And so, the first one is the Application Load Balancer.
It's from 2016, and it supports HTTP, HTTPS, and WebSocket,
and you have to remember these things.
And, the Network Load Balancer,
which is also newer generation, from 2017,
this one supports TCP, TLS, which is secure TCP,
and the UDP protocol.
We'll do a deep dive on all these load balancers,
so don't worry too much right now.
Overall, it's recommended
to use the newer generations' load balancers
because they provide more features.
There are more intuitive in AWS,
and they are the way forward, really.
You can set up two kinds of load balancers on AWS,
either it's an internal load balancer,
which means that it's private within your account
and you cannot access it from the public web
or you can have it as an external, public load balancer
or ELB and this will allow your users to access,
for example, if it's your website,
it will access your website through that load balancer.
So, one last thing on security before we get started
with some more deep dive.
So, security is that you have your users talking
to your load balancer talking to your EC2 instance.
And so, your users may be talking to your load balancer
through HTTPS or HTTP from anywhere.
So, as such, if you want to set up a security group
that's going to be reasonable,
we should set something like this,
where we allow HTTP on Port 80 of source 0.0.0/0
which means anywhere, so we mean,
okay, HTTP is Port 80, so come from anywhere
and then, HTTPS, same thing, is Port 443 from anywhere.
So, this is a very classic and easy security group.
Now, the more interesting part
is between the load balancers and your EC2 instance.
So, there is going to be HTTP traffic between these two
because your load balancer has
to talk to your EC2 instances through HTTP,
but this time, we want that traffic
to be strictly restricted to your load balancer.
What that means is that your EC2 instance expects
only your load balancer to send traffic to it.
And as such, we can have an application security group
which allows only traffic from the load balancer.
And so here, the interesting this is that it says,
okay, HTTP on Port 80, the source of which
is a security group,
you see there is a long security group with an ID.
And, that security group ID represents
the load balancer security group ID.
So, the load balancer here has a security group.
Your EC2 instance has a security group.
The EC2 instance security group references the one
from the load balancer, which is right here,
and the line from the load balancer has the rules
which allows the users to access from anywhere
on HTTP and HTTPS.
So, I hope you see that this setup
is the most secure one, okay.
Now, good things to know before we go into the hands on.
The load balancers can scale but they're not instantaneous,
and so, if you have a massive scale to do,
you need to contact AWS for a warm up.
And, for troubleshooting,
if you get a 4xx type of errors,
they are client induced errors.
5xx, they are application induced errors.
And then, load balancer error 503 means
that the load balancer is at capacity
or that these is no registered targets,
so it's overloading.
And, if the load balancer cannot connect
to your application, you need to check your security groups.
So, this would be something
that would be common troubleshooting,
for example, in the hands on, in the next lecture.
And, we've seen in the previous slide,
how to set up your security groups.
For monitoring, well the ELB access logs
will log all the access requests so we can de-bug
every single request that gets to our load balancer.
And, we have something called CloudWatch Metrics
that gives us metrics in your accounts,
and it will give you aggregate statistics
of your load balancers, for example,
how many connections are currently ongoing
for your load balancer.
All right.
That's it.
So, just for the theory, but we'll go in the next lecture
to the deeper dive on classic application
and network load balancer and do some hands on as well.
All right.
I will see you in the next lecture.