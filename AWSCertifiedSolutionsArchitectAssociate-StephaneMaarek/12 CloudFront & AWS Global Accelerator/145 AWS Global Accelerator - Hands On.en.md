
<v Instructor>Okay, so let's have a play</v>
with AWS global accelerator.
And by the way, this hands on is not free.
So if you don't want to spend any money for this course,
then please don't use the service.
Otherwise, if you're really willing to spend a few cents,
then you can go ahead with me
and create this hands on global accelerator.
And for this no matter what the region
you're going to be in, so let's go to Frankfurt,
for example.
And if I try to log into AWS global accelerator,
as you can see, I will be taken
automatically to US west to Oregon,
it's because no matter what region you choose,
the global accelerator is global,
and therefore it goes into the same configuration region.
But before we can create a global accelerator,
we have to create our application.
So let's go to the EC to service.
And I'm going to choose my first region
for EC to maybe US East one.
So I'm going to use this one and I'm going
to create an easy to instance in that region.
There is going to expose an HTTP service.
So we've know how to do this.
Let's so let's try again together.
We create instance, Amazon Unix 2 AMI,
and then I will choose to
micro configure the instance details.
I will want one instance.
And I will scroll down and I will not some user data.
So the user data I'm going to use the same as before.
But this time, I'm going to also add something
so Halliwell from host name in US East one.
So just a little bit of text before
the brackets just so that we get some more
information in the index HTML file.
So we know which we are in.
And so US East one, perfect.
Click on that storage,
click on next Etags security groups and we are going
to create a new security group
and it's going to be for HTTP from anywhere.
So custom 0000 This is perfect.
And the name will be global accelerator Demo.
Okay, review your launch,
launch or instance.
And then you choose a key pair or you don't even need to
choose a key part because we won't
even login into our instance.
So we can proceed without a key pair and say yes,
I acknowledge it will not be able
to connect to my instance,
to SSH into it, but this is fine,
because we don't want to SSH into our instance anyway.
So this is our first instance,
that is in US East one, eight.
And well, it's launching and going to go to another region,
for example, Mumbai.
So Asia Pacific AP South one and I open this in a new tab.
And we have to repeat the entire same process.
So I'm going to go to instances, launching an instance.
And then I'm going to choose a T 2 micro.
So Amazon likes to teach you micro
and we have to reconfigure it.
So I'm going to copy and paste
a simulated ever this one I'll say from AP South one,
just we have more information into user data.
Click on that storage at tags security group
and we have to reconfigure a security group
because security groups are scoped by region.
So I call it global accelerator demo.
And again, we have HTTP allowed
from anywhere with your launch,
launch and there's no keeper found.
This is great. I will choose to
proceeded without a keeper and say yes.
I cannot SSH into my instance, so this is fine.
We can view the instances now and it is starting as well.
So let's go back to US.
This one, this one is running.
And if I take the public DNS ipv4 or the public IP,
and open this to a new tab, hopefully,
I should start seeing something so
maybe hasn't launched yet.
So let me wait a little bit of time
to see if it's launches in.
This took a little bit of time,
but we have our lol from IP in US East one.
So if you do the same for our instance in Mumbai.
So we take the public DNS for here,
open this new tab, go there and it will
take a little bit of time to launch.
And and now it's working.
We are getting the Hello World from AP, South One.
So excellent we have our two instances,
one in US East one and one in AP South one already to use.
So back into our management console.
We're using the global accelerator
and we are going to create our first accelerator.
So it's saying okay, we need to have
some basic configuration I'll call it
"my first accelerator"
And then click on Next.
Then we have to set up a listener,
which is what is the ports
and there's going to be listening and that protocol.
So I'll choose port 80 protocol TCP
because we have HTTP traffic, which is built on top of TCP.
And then client affinity is if you want to have
this less sort of a stickiness
to your global bouncer.
For example, if you want the same user
to go back to the same endpoint, and we
can choose by source IP, but for now,
we'll click on that.
Okay, and this is the only listener
we need that we could have multiple ones
if we wanted to click on Next.
And then we talk about endpoint groups.
So this is how to group endpoints by region.
And the first region we have is US East one A
sorry US East one,
and that's the one where I created this instance.
So I'll say okay,
and the traffic gel is 100.
So that means that's its value as a weight,
but 100% of the traffic will go to that region.
And for the health check for that region,
because we're using an easy
to instance it uses health check here.
So it's going to go on port 80 protocol TCP,
this is Perfect.
we can have HTTP as well.
HTTP slash, the check interval,
maybe every 10 seconds
and the threshold counts 3.
So this is perfect for this health check.
And Alternatively, if we are having endpoints,
that would be not easy two instances.
But they would be load balancer, for example,
an ALB.
Then it would look to medically leverage
the health check of that ALB, So this is perfect.
Okay, so next, we add another endpoint group.
And this one is going to be from Mumbai.
So AP South one, And we have also a traffic dial of 100.
And again, will configure the health check
to be HTTP on slash for the interval 30.
And the threshold counts of 3.
Click on Next.
And now we have two endpoint groups,
USD one and AP South one and we can add endpoints.
The endpoints can be an application load balancer,
and network load balancer and easy to instance
or an elastic IP address.
But for now, we only have easy two instances.
So we'll click on easy to instance,
will choose the instance ID that we have
and we can assign a weight against.
Okay, next, we can go to AP South one
and do the exact same thing at an easy to instance,
and choose HTTP instance to be this one.
And same with some white, we click on Create accelerator,
and voila, our first accelerator is being created.
So my accelerator is now created.
And the first thing we see is that
we have two static IP addresses these two,
and they're going to be my
global any cast IP addresses to access my application.
We also have an associated DNS name with it.
And now our status is deployed.
So if you go back to my accelerator, and we look at it,
we can see that we have one listener.
And then if I go to the listener,
we have two endpoint groups.
We have this first end point group right here,
and the health checks are still happening.
And right now it says unhealthy.
So it says a health status might take a few minutes
to update with the correct status.
So let's wait a little bit to see if that fixes itself.
So this took a little bit of time,
but now my instance is showing up
as healthy for this one listener.
For the other end point group in AP South one
is going to show as healthy again.
So this is perfect.
So our accelerator is ready, it's healthy.
And now we can go ahead and test it.
So I'm testing it from Europe, and I go to this URL,
and I am redirected to US East one.
That's because US East one is going to be
for me the closest and fastest region.
So if I keep on refreshing, I keep on going to US East one.
And so I can test if this
is working for a global application,
because I want to be able to go to the Mumbai region.
For example, So say I'm going to change
my location and have a VPN.
And I'm going to connect to a country
and when they connect to Indonesia, so Indonesia
is going to be closer to India, then America.
So let's wait a second, I'm going to connect to Indonesia.
And I am connected to Indonesia.
And I'm going to try again to refresh this page.
And now I get a response from a piece of one
so this is completely working.
So if I refresh again, I connected to AP South one.
This is a excellent.
But now we can also test your health checks.
So if I go to my region in AP South one,
and I'm going to change the security group
to make the health checks fail.
So I'm going to go to my security group
view the inbound rules, click on it.
And I'm just going to simply remove
this security group rule.
So that the health check will fail.
So I will edit, remove it, click on save.
Okay, here we go.
So now what I should be expecting is that at some points,
my first accelerator should very very quickly
realize that our instance is unhealthy.
So let's go to our listener ID.
And then I'm going to go to my endpoint in AP South one.
And so what we hope to see is that
this issue right now showing up as healthy.
But soon enough, within a minute,
it should show up as unhealthy.
And if it does so and I a refresh this page,
then it's going to show me US East one
instead of AP South one.
So let's wait a little bit of time
in this UI to see what happens.
Okay, so our instance is now unhealthy.
And so if I go back to my
global accelerator DNS name and refresh,
I should be seeing a response coming from US East one,
because we cannot connect to a piece of one.
So it's connecting.
And the response is coming from US East one.
So this is perfect.
Everything is working as expected.
And our global accelerator is doing exactly
what I told you it was doing.
So now to clean up with this hands on,
you can go to your EC 2 instances
and terminate both of them.
So I'm going to turn it this one in North Northern Virginia,
and I'm going to turn it to one in Mumbai.
And by the way, I should probably disconnect
from a VPN you have less latency.
So yes, I would like to terminate that instance.
And then I'm going to go to this one in Mumbai region
and right click and also terminate it.
And then finally to clean up the accelerator,
you need to go to your first accelerator,
and you need to delete it
and first you need to disable the accelerator.
And once that is deleted you type delete and it will
Go ahead to delete that accelerator all together.
And something that's interesting to see
is global accelerator pricing, just so you get an idea
of how much it will cost you.
And so we can see that we have a fixed fee.
For every full or partial hours when
an accelerator in running is running in your account,
you're paying 0.0 to $5 until it is deleted.
And then we have a data transfer fee.
And based on the region you are coming for,
and this destination,
it could be between $0.01 dollar per gigabyte
all the way to some very expensive fees,
for example for Australia $0.08 cents per gigabyte
of data transfer.
So this is definitely a very expensive service
and there's can be even more expensive in other regions,
but it is a very worthwhile one
and one that you're expected to know about in the exam.
So that's it, the global accelerator is deleted
and everything is cleaned up.
I will see you in the next lecture.