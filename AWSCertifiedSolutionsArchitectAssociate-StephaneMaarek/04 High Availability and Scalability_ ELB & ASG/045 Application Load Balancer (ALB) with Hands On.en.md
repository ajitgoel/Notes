
<v Narrator>Now, let's get into the second kind</v>
of load balancers we'll see,
is the Application Load Balancer.
So, it's a Layer 7 only load balancer,
so that means HTTP,
and it allows you to route
to multiple HTTP applications across machines.
And these machines are going to be grouped
in something called a target group,
and it will make a lot of sense
once we get into the hands-on.
It allows you to load balance to multiple applications
on the same EC2 instance so using containers
and using ECS as we'll see.
And it has support for HTTP/2 and WebSocket.
It supports redirect as well,
so if you wanted to redirect traffic
from HTTP to HTTPS automatically,
it could be done at the load balancer level.
It also supports root routing,
so there's routing based on different target groups.
For example, you can route based on the target path
of your URL.
For example, example.com/users
and example.com/posts.
/users and /posts are different routes in your URL,
different path, and so you can redirect these two things
into different target groups.
We'll see what that means in a second.
You can also do routing based on the host name of the URL.
So, if your load balancer is accessed
using one.example.com or other.example.com
it could be routed to different target groups.
And you could also be routing based on the Query Strings
and Headers, so for example,
example.com/users and id=123 and order=false
could be routed to a different target group.
So ALB, and this is the short
for Application Load Balancers,
they're great when you have micro services
and container-based application.
So as soon as we'll go into learning what Docker is
and Amazon ECS, ALB are going to be the go-to
load balancers.
Because they have a port mapping features,
which allows you to redirect to dynamic port
on the ECS instance, and again,
more on that directly into the ECS section.
And in comparison, if we wanted
to have multiple applications, okay,
behind a classic load balancer,
we would have to have multiple Classic Load Balancer,
we would need to actually have one per application,
whereas with load balancers, we're able to have one
application load balancer in front of many applications.
So maybe a graph will help.
So we have our external application load balancer,
it's public facing, and behind it we have our first
Target Group made of EC2 instances,
and this one is going to be routing for the Route/user.
And we have a second Target Group made
of EC2 instances again, and this one is going
to be our Search application,
and there's going to be a Health Check as well with it.
And it's going to be routed through Rules
for the /search Route.
So as you can see here, we have two independent
micro services that do different things.
The first one is the user application,
the second one is a search application,
but they're behind the same Application Load Balancer,
which knows how to intelligently route
to these target groups based on the route that is being used
in the URL.
So, the target groups, what are they?
The first one is that they can be EC2 instances,
and they can be managed, as we'll see very very soon,
they can be managed by an Auto Scaling Group.
It could be ECS tasks,
and we'll see this in the ECS section.
It could be Lambda functions, and this is something
that's not very known, so Application Load Balancers
can be in front of Lambda functions,
and we'll see what Lambda functions are
in the future section,
but they're the base of everything
called serverless and AWUS.
And finally, it can be a front to IP addresses,
and they must be private IP addresses.
So ALB can route to multiple target groups,
and the Health Checks are going to be done
at the target group level.
So good to know before we go into the hands-on.
The first one is that you also get a fixed host name
with your Application Load Balancer,
just like the classic one.
The application servers don't see the IP
of the client directly.
The true IP of the client is going to be inserted instead
in the header called X-Forwarded-For.
And so you can also get the Port using X-Forwarded-Port
and the protocol being used using X-Forwarded-Proto.
And so what that means is that our client's IP,
which is 12.34.56.78 is directly talking
to our Load Balancer, which performs something called
a connection termination.
And when your Load Balancer talks to your EC2 instance,
it's going to use the Load Balancer IP,
which is a private IP into your EC2 instance.
And so for the EC2 instance to know the client's IP,
it will have to look at these extra headers
in your HTTP request, which are called
X-Forwarded-For, -Ports. and -Proto.
All right, that's it, now let's go to the hands-on
and create our first Application Load Balancer.
Okay, so let's go ahead and create
our Application Load Balancers.
So I'm going to go back to Load Balancers
and create a Load Balancer.
This time it is Application Load Balancer,
which is for HTTPS and HTTP traffic only.
I click on Create, and then I'll call it MyFirstALB.
It's going to be internet-facing
and the IP address type is ipd4.
For the Listeners, which is what is exposed
on your Load Balancer, is going to be HTTP on Port 80.
And then for the AZ, I'm going to say yes,
I wanted an eu-west-3a, 3b, and 3c.
Excellent, click on Next.
Now for the Security Settings,
again we get the same warning
because we haven't configured HTTPS, but this is fine.
And then click on Security Groups
and we're going to choose an existing Security Group.
We're going to use the my-first-loadbalancer Security Group,
which we know is already pre-configured to allow Port 80,
and also is well configured with my-first-security-group
attached to the EC2 instances.
So next click on Configure Routing,
and we're going to create a new Target group,
I'll call it my-first-target-group.
And as you can see, we have three types,
EC2 Instance, IP, or Lambda function.
In our case, we'll use Instance.
The Protocol is HTTP, and the Port is 80.
The Protocol for the Health Check is HTTP again,
and the Path is /, which makes sense.
And then we could override
the Advanced health check settings.
So the Healthy threshold is five,
Unhealthy is two, that's good.
Timeout is five, Interval, we're going to set it as 10.
And Success code is 200.
So, as we can see, we have slightly more options.
Now click on Register Targets,
and we have to register some targets into our Target group.
So right now I'm just going to register only two targets,
so eu-west-3c and eu-west-3a.
And click on Review.
Everything looks good, and I'll click on Create.
So now we can go directly into our console
and wait for our first Application Load Balancer
to be provisioned.
Go back into my ALB, it is now active,
and if I copy the DNS name and open a new page,
I get a 503, so that means something is mis-configured,
but that's okay, we'll figure this out.
So, our ALB is good, I mean we're able to access it,
it's just returning us an error.
So that means that something is happening
at the target group level.
So we click on the left hand side for Target groups,
and we have my-first-target-group right here.
And so, as you can see, it's well configured,
so this is fine.
And we'll go to Targets, and yes,
okay, this is a problem, I probably missed that.
So we don't have any targets assigned to our Target group,
so that's just saying, hey there's no instances
to send traffic to so you need
to configure your instances first.
So I'll edit this, and I'll re-add my 3a and 3c,
and click on Add to registered, I probably missed that step,
Add to registered, and click on Save.
And now my two instances are being registered
into my Target group.
And so it's going to go and Health Check them,
so let's just wait for a little bit.
Now my two instances are healthy,
because the passed a Health Check.
And so if I go back to this and refresh,
now we're able to see the Hello World
from our two different instances,
so as I refresh, it is changing the Hello World message
from one instance and the other, so this is perfect.
And so what I said is that we can have
multiple target groups.
So I'm able to create my-second-target-group,
so this is not going to be a functional demo,
but I think it will show you what I mean.
So we have a second Target group,
and this one, I'm able to register another target,
so I'm able to register maybe this instance right here,
and add it to registered.
I'm not sure if that's the last one, but anyway.
So now we have two different Target groups,
and they're both have different instances,
and so if I go back to my Load Balancer,
I'm able to go to Listener and edit the rules.
So remember how I told you about the rules?
Now this is the place where you should go ahead
and edit these rules.
So let's go ahead and view and edit the rules.
And see, here we are saying that by default
the action is that you should forward
to my-first-target-group.
But I can click on Edit in here to insert a new rule,
and we're saying okay, based on the host,
the Path, the Http header, the Query string,
the Source IP, and so on.
So pretty well we can say based on the Path,
if the Path is test, then action, Forward to,
and we can say my-second-target-group.
And the cool thing about it is that now we're able
to set up a bunch of rules, so I'll click on Save,
although it's not going to work because /test
doesn't exist for my-second-target-group.
But we're saying, okay if the Path is /test,
then forward to my-second-target-group,
and also if the Path is anything else,
then forward to my-first-target-group.
So this is the rules that is going to be working.
And you can also add tons more rules,
so we can say if the Path is, for example,
/constant, then add action.
And we can return a fixed response saying 404,
and I'll just say can't find this page,
and our ALB right here will be returned a fixed response.
So let's go ahead and test these and see how that works,
so this is MyFirstalb, and if I refresh,
I get my two EC2 instances.
If I do /constant, then I get 'can't find this page',
which is the fixed constant message we want to set.
And if I do /test, I'm going to get a 404 Not Found
because if the target group is not well configured
and we need to set up the EC2 instance a bit further
to make this work.
But I wanted to show you through the listeners
is that we're able to have many, many rules
and these rules allow you to redirect,
not just to one target group,
but to multiple Target groups,
and that's the whole power
of the Application Load Balancers, okay?
So just to make things more simple,
I'm going to go ahead and remove some rules.
So I'm going to remove these two rules right here.
Click on Delete and now they're gone.
And for our Target group in here,
I can delete the second Target group.
And what I'm going to do in the first Target group
is to edit it and add the missing instance,
I can't remember which one it is,
so I'll just add the three, here we go,
and click on Save.
And now we have three instances in my-first-target-group.
And so, what that means, is that if I go back
to the full URL, once my instance passes the Health Checks,
then we'll be all good and all set.
Okay, so that's it for this lecture.
I hope you liked it, and I will see you
in the next lecture.