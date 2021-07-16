
Okay, see we are getting into the first fun
service of AWS which is Amazon EC2.
So when you start with AWS you kinda want
to start over there because
that is kind of the basis of AWS.
That's how Amazon used to work for a very long time.
Now it's no more Serverless as we'll
see in this course as well.
But EC2, you have to start there.
So, it's one of the most popular of AWS server accesses
and basically it consists of the capability of
launching virtual machines in the cloud,
okay, but also storing data on virtual drives,
that's called EBS, distributing load across machines,
that's called ELB, or load balancing,
and scaling servers using an auto-scaling group, or ASG.
So it uncompasses a lot of different services.
Knowing EC2 for me, it's fundamental to understanding
how the Cloud works.
This is where the revolution started,
it's the ability to just start a machine right away,
and we need to start there to understand how Serverless
later on makes a difference.
So, in this first hands-on,
I want to launch an EC2 Instance running Linux.
And so we'll be launching our first server
and we'll use the AWS Console
and this will give us a high level overview
of the various parameters that we'll have in this course,
and for the EC2 launching.
But, we will go over them one-by-one
in much great details in the next lecture.
We'll learn how to start, stop, and terminate our instances.
Okay, that's super important.
Just to get a feeling of how things work.
So without further ado, lets get started.
Okay, so I am in my AWS Console,
and all the EC2 link is right here.
I want you to get used to writing EC2 in the search bar
and just getting the first link.
So, first make sure that you are in the region
that's close to you, okay, for me it's EU Paris.
But based on where you are in the world,
please choose the region that makes the most sense
for you to use EC2 in.
So we are in the EC2 Console, and as you can see,
pretty much nothing's happening,
we have zero running instances,
a bunch of things in one security group.
So basically, this is the basis of things,
but the first thing we want to do is to launch an Instance.
So there's this big blue button right here
to launch an instance.
Now, when I click on it, the first thing I land on
is creating an, choosing an AMI.
So AMI stands for Amazon Machine Image.
And this is basically the software and the operating system
that will be launched on that server.
Now, there is a bunch of distribution that you may recognize
such as Ubuntu or Redhats or Microsoft Windows,
et cetera, et cetera.
In this course it's for the certification.
It's much better if we go using the Amazon Linux AMI
because they come with a lot of Amazon specific stuff.
Especially recently, Amazon Linux 2 came out,
and to me, it's kind of what you have to use today.
Because it's for how Amazon sees you using Linux.
And so we'll use Amazon Linux too.
And the thing is, I'm telling you this because
if you use Amazon Linux for this tutorial,
the commands are going to be slightly different,
and because I want you to use the exact same setup as me,
the exact same tooling,
I would like you to choose Amazon Linux too.
Now if you notice something on the left-hand side,
it says Free Tier Eligible.
So yes, we are going to try to remain
all the way in the free tier
when you start your A list accounts.
So when you start working with Amazon,
they give you a bunch of free stuff
to try out their services, such as we are doing right now,
and it's much better for me and for you
if we manage to remain free.
So we'll choose something that is Free Tier eligible.
We'll choose Amazon Linux 2.
We'll select the AMI,
and now we have to choose a type of machine we have.
So when you select an EC2 machine, you can select the type.
And basically the type is saying,
"how powerful you want your machine to be?
How many VCP views do you want it to have?
And how much memory do you want it to have?"
If you scroll down this page you can see there is a lot
of different machine types, okay, a lot of them,
but only one of them is free tier eligible.
So we'll just go for t2.micro.
In the next lecture, we'll learn about the differences
and why there are so many names,
but for now, lets just go and use t2.micro.
Now I could go ahead and click on review and launch,
it's the big blue button and it's quite tempting,
but I will just do Next Configure Instance Detail.
That's because I want to show you
all the parameters that are available for you.
So now, we're getting into a lot of parameters,
and you may be overwhelmed right now, but don't worry,
overtime, over the lessons, and the next lectures and so on,
you will become much more familiar with them.
Number of Instances we want to launch is 1.
That sounds about right.
I will not Request Spot Instances,
we want an on-demand instance,
so we'll not check this box.
Now the Network, is around VPC and Subnet.
Now, when you create the name of this accounts
it comes with something called a default VPC.
So we'll just use the default VPC right here,
and the subnet is basically saying
in which AZ, availability zone,
do you want your Instance to be?
So, I'll say no preference because I have no preference.
But as you can see, what from before,
when I talked about AZ,
we can see now we have eu-west-3a, b, and c,
and we can choose to launch our Instance
in one of these data centers, or AZ.
Same wise, I will auto-assign a Public IP,
and I will just use the subnet setting.
Now we don't need a IAM role,
we'll see IAM roles in great depth in the next section.
The shut down behaviors,
that if I shut down a machine it will stop, and so on.
All of this looks good.
All of this are pretty much advanced parameters
that we'll see in the later on.
Then there is admin's details and spin code user data,
and I have a lecture dedicated to this.
Now click on storage, basically when you start an Instance
okay, right now, we started with pretty much
all the default settings.
When you start a Instance,
it has to have it's operating system somewhere,
and that's a disc, and basically that's called storage.
So, storage is EBS volume.
And currently, we just want the root storage,
so that's where our operating system is going to run.
And we'll leave it at /dev/xvda.
We'll leave it at eight gigabyte of space,
and we'll leave it as SSD.
All of this is very important.
And as you can see, by default, when this is terminated,
so is the root volume because this is ticked,
and I'll leave it like this.
Finally, you'll see it's not encrypted.
We'll talk about EBS encryption later on.
Now when you launch an instance, we can add tags.
And Tags are basically key value pairs,
which allow you to just identify that
Instance and classify it.
For example, the first type that is going
to be very important is the name tag.
And, we'll say, My First Instance, okay.
And, you can have it whatever you want.
You can add another tag and say, you know,
another tag, another key, and then another value.
It's whatever you want, okay, you're free to have
tags of whatever you want.
But the name tag is going to be quite important
because it's going to show in the UI.
Now security group wise,
this is basically going to be a firewall
around your Instance, okay.
And so, when we get started with our Instance,
the first thing we want to under Linux
is make sure we can SSH into it.
So there's an SSH rule, and then you can define a port,
and you can define a source.
Currently, I will go and create a new security group,
okay, which, um, in terms of name I'll just
call it, My First Security Group, okay.
And in the description I'll say,
created with my first EC2 instance.
And I will allow SSH, on Port 22, and the source currently,
I'll just leave it as 0.0.0.0/0,
it's got quite a bit criterias you could setup as my IP
if just you wanted yo use that port,
but to make things super simple right now and not
overload you, we will set it as Custom 0.0.0.0/0,
which means, any IP.
Now description, is something new, but you can say SSH
to the instance, and if you don't want know what SSH is,
just wait until the next lecture.
Now we'll review a Launch it, and we'll get a big warning
saying "Your security group is open to the world."
So, 0.0.0.0/0 is not best practice,
so we get a bit of a warning here, but that's okay,
and here we can review all the parameters that we've had.
Okay.
So, everything looks good, okay.
Just make sure you have a t2.micro,
and make sure you use Amazon Linux 2, okay,
But everything looks fine.
So we'll click on Launch.
And the last thing we have to do when we click
on Launch is to create a key pair.
Now, basically a key pair is what's going to give
you access to log in to, or to SSH into the,
a machine you just launched.
And so right now we have no key pair so you can
import key pairs if you already have key pairs.
But, for this case, we will go and create
a new key pair.
And for this key pair, I'll call this EC2 tutorial.
The next step is for me to download that key pair,
and it downloads a EC2T tutorial.pem file,
and then I click on launch instances.
So that's about right, and then we click
on view instances in the bottom right,
and we end up with our first instance starting.
So as you can see now, our instance is started,
we can see the instance type, it's my t2 micro,
the availability zone it was launched in,
so for me it's eu-west-3c, and the Instance state
which is pending so it's being created.
Everything looks good, and we'll see how we deal
with the IP's in the next lecture.
As we can see the tag here, My First Instance was used
under the Name column, so basically our Instance
was being named , which is great,
and so we are good to go.
Now one thing I want to show you is that once
the Instance is started, we have a green running, okay.
And green running means that Instance is started
and you can be billed.
This is a t2.micro so it's a free tier user
so you won't be billed for this Instance,
but basically if it was another Instance
you start getting billed.
If you right click on it, you can stop, reboot,
or terminate an Instance.
If you stop it, it will just not bill you for it,
and the Instance will be stopped.
If you reboot it, it's what you expect it to be ,
like your computer it will reboot it.
And if you terminate it, you basically saying,
"I want it no more , don't save the data,
just take it away from me,"
and basically you won't be able to access
your Instance ever again, okay.
So this is very very quick.
For now, we'll just keep the Instance running
because we have to do tutorial with it.
So, we'll see you in the next lecture to show
you how we can access it, SSH into it from either
Linux, MAC, or Windows.
So see you in the next lecture.