
<v Narrator>Let's first start with our</v>
Classic Load Balancers
and these may not be as prominent in the exam
but they may still be mentioned
and they're still very valid load balancers.
So they support two things,
the TCP or traffic or
HTTP and HTTPS.
And TCP is called layer four
and HTTP and HTTPS is called layer seven.
I'm not gonna get too deep about what these layers
mean but just know that TCP is layer four
and the other two are layer seven.
So the health checks are either TCP based
or HTTP based and what you will get
out of a load balancer or classic load balancer
is a fixed hostname and we'll see this
in the hands-on as well.
So what we'll set up in this lecture is a client
talking to our classic load balancer
on an HTTP listener.
And internally that CLB will be redirecting
the traffic into our EC2 instances.
So let's have a look at how we can do this in the console.
We have my second instance that's already created
and running our HTTP server.
And so if you go to this IP and press enter we get back the
Hello World from our instance so this is correct.
Now let's go ahead and create our classic load balancer.
So for this I'm going to scroll down
and go to load balancers.
And I'm going to go ahead and create a load balancer.
So we have three choices and we're going to choose
classic load balancer which is the previous generation
but don't worry we will get to application load balancer
and network load balancers which you can see
from this screen AWS is kind of pushing for
us to use the ALB and the NLB more than this CLB.
Okay?
But for this exercise we'll just use classic load balancer.
Click on create and then we have to give it a name
so my first CLB and then we need to choose the VPC
so I'll choose my default VPC.
Is it an internal balancer or external one?
If it's internal we're not going
to be able to publicly access it
so we'll leave this un-ticked.
And do we want advanced VPC configuration?
For now we will not tick this box.
The listener configuration is saying what is our CLB
going to be listened onto?
So it's going to have the port 80 which is HTTP
and it will be back-talking to our
instance on port 80 on HTTP.
So this looks good, this is classic.
And I'm going to assign security group.
Here I'm going to create a new security group,
and I'm going to call it my first load balancer
and it will be my first load balancer security group, okay?
Now what it will allow is to allow anyone on port 80
from anywhere to access our load balancer
which is what we need because we want to access our
newly created load balancer.
Then for security settings there is nothing on HTTPS
so we get this warning but this is fine.
Then for health checks, we need to
set up a health check for our instance.
So it's saying okay you need to use the HTTP
protocol on port 80 and then need to
ping on this specific path.
And if I leave this as /.index.HTML will this work?
Let's add /.index.HTML and press enter.
As you can see this still works so we can keep
this ping path as is.
But if we wanted to we can also just
not have index.HTML and remove that part.
That's all up to you, it's the exact same thing
in this example.
Now for the advanced details,
how long are we waiting for a response?
How often do we want to talk to our instance?
Maybe you want to talk to it every five seconds.
After how many failed health checks is
my instance going to be unhealthy?
We'll set it as two.
And after how many successful health checks is it healthy?
We'll set it as five.
Click on add EC2 instances and here we're about
to add our second instance directly
into our classic load balancer.
And click on add tags.
And click on review and create and create.
Now the load balancer is being created
and we need to review and resolve this.
Obviously the health check is no good so
we need to have a interval of maybe ten seconds
so that it is greater than the response time out obviously.
So I'll just fix that real quick and go again.
And click on create and now everything should be working.
Okay, so our CLB is now being created and we
have to wait for it to be provisioned
so as you can see now it is being provisioned.
Our classic load balancer is now created and if you
go to instances one of them is in service.
It took it a while to get in service but now it's
in service, that means that it's passing the health checks.
And therefore my load balancer is ready.
So if I use this DNS name right here,
copy this entire DNS name, open a new tab and add it.
As we can see using this DNS name,
we get the Hello World from the same IP as before.
So if I go back to my EC2 instance and refresh this page
I get the exact same message so this CLB is working
because it is responding the exact same way
as my EC2 instance because it's actually
my EC2 instance responding behind my load balancer, okay?
The thing is now we have a load balancer and it's
in front of our instance and we're able to access
both our instance and our load balancer at the same time.
So this is kind of problematic,
we want to be able to only access our load balancer
to expose that and not expose our EC2 instances directly.
So for this we need to go back to security groups
and do a little bit of changes.
So let's go to security groups
and here we have my first load balancer security group
and my first security group
which was attached to our EC2 instance.
So I'm going to click on my first load balancer,
inbound, and this looks good.
We're saying that any traffic on HTTP
on port 80 can access our load balancer.
But if we got to my security group this is too open,
we're saying anyone, anywhere can access HTTP.
But what we want to do is change this
and say not anyone from anywhere
but someone from, and you type sg,
someone from my first load balancer only
can access my EC2 instance.
And so instead of saying allow HTTP traffic
from anywhere we can say from my load balancer only.
And so once this is done and we save this,
now we're saying okay
just traffic that is coming from my load balancer
can go into my EC2 instances.
So if I go back to my CLB, and refresh,
as you can see this still works.
I still get the response Hello World,
but now if I go to this and press on refresh,
you can see here on the top of my screen this is spinning.
And so this looks like a time out and as you remember,
whenever there is a timeout issue
that means that this is a security group working
and not providing access to our instance.
So that our EC2 instance right now
is not accessible directly,
it can only be accessed through our CLB and it
will time out if we try to access the IP directly.
So here we have set up a much better security mechanism,
because the only entry point into our EC2 instances
is through our load balancer.
So this is quite cool.
And something we can do now is add more instances.
So if we go back to our instances right here
and I right click, and I do launch more like this,
and I can look at the instance details
and there is some user data so this is perfect.
It's going to reuse the same user data.
We say okay, we're going to launch one of them.
And we have one more and maybe we should launch another one.
So I'll actually launch this instance again.
Right click, launch more like this.
And then I will actually edit my instance detail this time.
Just to review it so,
let's click on previous, previous, previous
and what I want to change is the availability zone
so right now it's going into EU west 3C
but I want to launch it in a different one, 3A for example.
And go back and review and launch.
Okay, everything looks good.
So now our three instances are being launched right here.
And what I have to do is go to my load balancer,
which is on the left-hand side.
And here I need to edit my instances.
And I'm going to add these two instances right here
so up, they're all going to be added, and click on save.
And now we have three instances
attached to our load balancer.
Two of them are out of service
because they are still launching
so let me wait a little bit
until they have checked passes.
So now our three instances are in service.
We have two in EU west 3C and one in EU west 3A
and so if I go to my load balancer and refresh this page,
I should be seeing the IP changing every single time.
So as you can see because the IP changes every single time
that means that our load balancer is actually getting
responses from our three EC2 instances one at a time.
And so this is really cool because right now we are showing
what it's like to do load balancing okay?
Whoa that's awesome.
All right so that's it for this lecture.
I will not be using this CLB in the future
so what you can do is right click and then delete.
And then we'll be done with this CLB.
But we'll keep our EC2 instances for the next hands-on,
so I will see you in the next lecture.