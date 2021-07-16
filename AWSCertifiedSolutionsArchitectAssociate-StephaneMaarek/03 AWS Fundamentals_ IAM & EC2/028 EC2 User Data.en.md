
<v ->Okay, so we are going to learn about EC2 user data.</v>
So, it is possible to bootstrap
our instances using an EC2 user data script.
So, what does bootstrapping mean?
Well, bootstrapping means launching commands
when the machine starts.
So, that script is only run once
and when it first starts,
and then will never be run again.
So the EC2 user data has a very specific purpose.
It is to automate boot tasks.
Hence the name, bootstrapping.
So what tasks do you want to automate
usually when you boot your instance?
Well you want to install updates,
install software, download common files from the internet,
or anything you can think of, really.
Anything you can think of.
So it could be whatever you want.
But, just know that the more you add
into your user data script,
the more your instance has to do at boot time.
Simple, right?
By the way, the EC2 user data scripts
runs with the root user.
So, any command you have will have the sudo rights.
Okay?
So, let's get hands on, and what are we going to do with it?
Well, we're going to make sure that our EC2 instance,
when we launch it, it will have
the Apache HTTP server installed on it,
and we'll display the simple web page we've been having.
So for it, we'll just pass in the user data scripts.
And this script, as I said,
will be executed when the instance first boots.
So let's get started.
So what I'm going to do first is terminate our instance.
Yes, we're in the cloud, so we can start
and terminate instances as we wish.
It doesn't really matter,
we're not gonna get billed.
It is fine.
So, now that this instance is getting terminated,
we'll go ahead and launch a new instance,
and that's really the power of the cloud.
So we'll use Amazon Linux 2 AMI, and select it,
and we'll use, still, t2 micro.
Which is free tier eligible.
And then we'll configure the instance details.
Now in there everything looks fine,
but we'll scroll all the way down
and there is a sneaky advanced details in the bottom-left.
If you click on it, underneath you see user data.
I don't know why user data was hidden so much,
but here it is, hidden under advanced details.
So we want to input user data,
and we'll input it as text.
So we need to, basically, paste a whole script in there
to automate the startup of our instance.
Thankfully, I have a script.
So the first thing we have to do,
is to copy the bin bash sign right here.
Otherwise, things will not work.
So we have the bin bash, top of the script,
and then we can just copy
all the lines from line 10 to line 15.
So, we'll go ahead and copy all these lines
right here.
And, basically, this is saying, okay, update the machine,
install HTTPD, then start HTTPD, enable it across reboots,
and create that hello world HTML page.
So basically, all the commands
we just run in the past lecture,
are going to be automated at boot time using the user data.
So when you do this, make sure to add that first line.
It's very, very, important.
Okay?
That input is, basically, going
to get base 64 encoded.
It is just for you to know a piece of trivia.
But basically, this will get passed on to the machine
and the machine will run that script.
So this looks good.
We click on add storage, and this looks fine.
Click on add tags.
This looks fine as well,
and for the security group,
this time we're going to select an existing security group.
Which is, my first security group.
Yes, even though we terminated our first instance,
the security group was still there.
So we can still reuse it,
and this is perfect because it allows SSH
and the port 80, which we configured from before.
So, we'll click on review and launch,
and click on launch.
And now we say, ah, we can choose an existing key pair,
EC2 tutorial, and I tick this box saying
yes, I do have access to that key pair.
Now click on launch instances,
and the instance is launching.
If we go back to our view instances panel,
now we can see that we have
one instance that was terminated,
and this one, I'll just name it my second instance.
Right here, it's named my second instance,
and the instance state is pending.
Okay, so we need wait for it to start.
And now my instance is running.
So if everything goes well, rolling drums,
we can go to this IPv4 public IP,
open a web browser, paste the IP, and press enter,
and, yes, it worked.
We get hello world from IP
and we get out entire DNS name
that we have for this EC2 machine we just started.
And so basically what this proves,
is that the EC2 user data script worked,
was started at boot time, and installed
the Apache web server for us right away.
Which is quite awesome, to be honest.
Now, similarly from before, because we
have setup the keys correctly,
we should be able to SSH into our machine.
So let's write that out.
Say yes, and we are SSH into our machine.
Finally to verify thing was done properly,
we can go to cat, the var,
www, HTML file,
and we see the indexed HTML,
which says hello world from
and the DNS name we have from before, the host name.
So this is perfect.
We have a machine, it was configured automatically
at boot time using EC2 user data.
I wanted you to get a feel for it,
about what EC2 user data is.
It is extremely important when you start using EC2
because it will be used everywhere.
So I hope you liked it
and I will see you in the next lecture.