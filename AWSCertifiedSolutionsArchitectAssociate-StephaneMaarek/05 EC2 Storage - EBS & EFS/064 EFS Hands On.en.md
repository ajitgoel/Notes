
<v Instructor>So let's go and create</v>
our first EFS network file system.
So let's type EFS and we are in the EFS console.
So let's create a file system.
And as we can see,
we have a very simple dialogue and you can click on create,
and this will just go ahead and create it,
but we wanna go through the options,
so we'll click on customize to look at all the options
for our elastic file system.
So the name is optional, so we'll leave it empty.
We can enable automated backups to just have a backup
of our network for our system, which is nice.
And we have a lifecycle management tab.
So here we can use something called
a EFS infrequent access storage class.
And the idea is to say, okay, if a file has not
been accessed in 30 days, it looks like it's a file
that is infrequently access,
therefore move it to the EFS IA storage class
in order to save some costs, and that makes sense.
So you can say seven days, 14 days, 30, 60, or 90, okay.
So we'll just leave it as a default of 30 days,
then we get different performance modes.
So we have general purpose or max IO.
And general purpose, as the name indicates
is ideal for latency sensitive use cases
such as web serving environments
and content management systems.
So if you have a WordPress, for example,
this would be a great use case.
And max IO scales to higher level of aggregate throughput
and operations per second, with a bit more latency,
this is better for a big data or processing
file processing type of use case.
So we'll just leave at general purpose for now.
The throughput mode can be either bursting,
and that means that the throughput will scale
with the file system size, allowing you for short bursts,
or if you won't determine this stick throughput
for your EFS file system maybe because you know
you have a small EFS file system,
but you need high throughput,
then you can provision how many megabytes you want
up to 1024 MIB, so megabytes per second.
We'll just leave it as bursting as well.
We can enable encryption at rest for our EFS file system
and scroll down.
Now let's click on next.
Very important, now are the network access settings.
So we are operating in our VPC and we can mount it
across multiple different availability zones.
So EFS is a network file system,
and we can have it across different AZ
as I'll demonstrate you in a second.
And so for each AZ,
you should define a security group.
And so right now I'm going to go ahead
and create the security group we need.
So let's go into the EC2 console and I will go into
the security group steps on the left hand side.
Create a security group and I'll call this one my EFS demo.
And for now, no inbound rules and I will go ahead
and create the security group.
Okay, so security group for EFS and create it.
So now we'll use my EFS demo into this dialogue.
So I will remove all these security groups
and I will choose my EFS demo, which I probably have
to refresh this page so let me do this right now.
I'll refresh this page and very quickly scroll down,
click on next and here we go.
So I will choose now my EFS demo right here
to be the security group
for each different attachment points.
So, okay, and the last one, my EFS demo, good.
So we'll see what that security group impacts in a second.
Then I will click on next.
File system policy is optional and this is out of scope.
So I will just go ahead and skip this.
And finally, we can review everything so we can review
and create, so everything looks good here.
We have encryption, we are in our VPC.
We have IA enabled.
We have three availability zones that are going to work
with our EFS file system and they all have the same
security group that we just created.
And I will just go ahead and click on create.
So now my file system is creating and while that happens,
I can go ahead into my EC2 and I want to create
two EC2 instances that are going to be accessing
that EFS file system.
So as you can see, let's go ahead.
The file system is created.
It is created and so if we look at the size,
we can see that we are using six kilobytes
and we'll only pay in EFS for what we're using.
So we're using six kilobytes,
So this is what we're going to pay for.
And we can go also to get some information around the size
and EFS infrequent access,
so how many files have been moved into that lower,
much lower price tier in EFS, okay.
So everything looks good right here.
Now let's go ahead and create our EC2 instances.
So I'll click on launch instance.
I will choose Amazon Linux 2, AMI.
T2 micro to remain within the free tier.
And then I will choose one instance
and I will launch this one in EU West Two B, for example,
as my first AZ.
If you scroll down, you can see that there's file system
and you can add your EFS file system here,
but we'll not do that,
I wanna show you how it's mounted.
So don't click here.
We'll click on add storage.
We can leave the storage as is, add tags, this is fine.
I'll go ahead and create a new security group
for my instance and I'll call it EC2 to EFS
because this is my EC2 instance that's going to access
my EFS network file system.
We're going to allow SSH, review and launch,
launch, and yes I have this key pair, launch my instance.
So now this instance is launching and I'm going to launch
a similar one, but in a different availability zone.
So I right click, instance sorry, launch more like this.
And then in my instance details,
I will edit the instance details and I will set it
in EU West Two A, to be a different availability zone.
Review and launch.
Launch, and launch this instance.
So here we go.
Now we have two instances that have been launched
in two different availability zones.
So this one and that one, and we want it to be,
we want them to be able to access
our EFS network file system.
So I'm going to SSH into each of these instances.
So this first one is right here.
I'm going to launch my SSH commands.
So EC2 tutorial PEM and then EC2 user at my IP.
I'm into my first host.
And I'm going to see this IP of my second EC2 instance
and launch a similar command.
So here we go.
EC2 user at the IP, okay.
So I've done SSH into both instances
and they're both in two different availability zones.
Next I need to install EFS on these instances.
So the easiest way is to go back to the EFS console
and on top right there is attach.
And this gives you some information
around how you can attach EFS into your instances.
So as we can see, we can mount via DNS or mount via IP,
we'll use mount by DNS and we'll use the EFS mount helper.
So to use this thing,
we have to go into the user guide in the documentation
and install a small package onto our EC2 instances
called the Amazon-EFS-utils package.
So we click on installing the Amazon-EFS-utils package
on Amazon Linux 2.
And as we can see, we can scroll down
and do this sudo yum install commence.
So let's go ahead and do this yum install command
onto both my instances,
and this is going to install the necessary packages
to use this EFS mount helper.
Okay, so this was very quick, now back into EFS.
We need to create the EFS directory.
So to do so, very simple,
we're going to do mkdir EFS and mkdir EFS.
So now, if we look into both of our instances,
they both have an EFS folder.
Next I'm going to run this command right here
to mount the EFS drive using TLS.
So they will be in-flight encryption
and I will mount it into this EFS directory.
So let me copy this command right here
and paste it, press enter.
And as you can see, there is a timeout.
That's because we need to modify
the security group settings.
So let's stop this command and I'm going to go
into my ECU console and we need to modify
one security group.
So if we remember, we have attached a security group
into our EFS network file system, which was this one,
my EFS demo.
And currently my EFS demo in terms of inbound rules
does not allow anything.
What needs to happen is that my EFS demo
needs to allow inbound from EC2 to EFS.
So very simply let's edit the inbound rule, add a rule
and it will look for NFS.
And the source of it is going to be EC2
to EFS security group.
And so we allow EC2 instances into EFS.
We'll save this rule, and now that this rule has been done,
we should be able to go back into EFS,
try this command again.
And then it should succeed.
And it has succeeded.
I can apply the very same commands in here
on the right hand side, and it has succeeded as well.
Okay, good, so what did happen?
Well, let's go into the EFS directory.
So I just change directory into the EFS directory.
And currently we can see there are no files,
but what if I create a hello-world.txt file in here?
Well, I don't have enough permission,
so we'll do sudo touch hello-world.txt, that should do it.
Now, if I look into the files,
I have a hello-world.txt file here.
And if I look now on the right hand side
and list the files into EFS,
we can see the same Hello-World file as been created.
So if I do sudo echo,
if I do sudo nano hello-world.txt
to just edit and say hello world from the first instance
and save this file.
So if we look into the content of this file
hello-world.txt, it says hello world
from the first instance.
And if we look into the content of the very same file
onto the right hand side and since it also Hello-world
from the first instance.
So this file system mounted on the left hand side
and the right hand side is the same.
It is a shared network file system,
and that is the whole power of EFS.
And that's it, very simple.
So when you're done with this,
you can go ahead and delete the EFS file system, obviously.
And you could go ahead and terminates these EC2 instances
if you needed to.
So you click on these two instances, action
and then terminate, and you'll be good to go.
So that's it from me, I hope you liked it.
And I will see you in the next lecture.