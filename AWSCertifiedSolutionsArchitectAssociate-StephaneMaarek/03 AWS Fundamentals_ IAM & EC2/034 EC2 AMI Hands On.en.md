
<v Instructor>Okay, so let's create an AMI</v>
from MyFirstInstance, and for this we're just going to
install a small web server on it.
So let's go ahead and take the public IP,
and I'm going to ssh into it, so I'll just disconnect
just so we have ssh.
It just applies ssh, and you put the public IP,
and we're in.
Okay, excellent.
So what we want to do is install
a very, very small web server on it to display a web page.
So we'll do is we'll do sudo su,
and that's to become privilege user,
and then we do yum update minus y
to update all the packages,
then we'll do yum install minus y httpd,
so it's to install something called apache,
and then finally, systemctl start httpd,
and systemctl
enable httpd.
Okay, so now we have started apache,
and we just need to write a small file,
so we'll say, echo hello world,
and we'll just do this into a file,
and that file will be called var www html index.html.
Okay, so now that file should be accessible port 80,
so if you do curl localhost:80,
then we should see "Hello world,"
and then we will see if that works on my web browser,
so for this, we'll go to the IP address right here,
port 80, and we get a time out.
Obviously, because if you's following,
the timeout comes from the fact
we have not opened a security group rule.
So what we go ahead is go to ssh group,
and we're going to modify it.
And I will add here a HTTP rule
from anywhere, so I can view my websites.
So here, I'll say, Apache Server.
Okay, we save it.
Now we go back and, there you go, hello world.
So we have hello world, and we basically modified that AMI,
we've modified our system to install httpd.
So now what we want to do is create an image from it.
So for this, we'll right-click onto the instance,
image, and then create image.
And so here we go, we have our instance ID,
and we'll just call it "My Apache Server."
And this is image that
creates and starts
an apache server.
I may have to remove the space, I'll just do,
"My-Apache-Server", before that works.
And then we'll say, okay, the very important thing
is that we need to take our root value
and make a backup of it,
because this is where we have installed our apache server.
So, click on create image, and now we say,
create image request received and we click
to see how long it will take for the image to be created.
So we have to wait a few minutes for this to be happening,
so I'll just pause the video.
The AMI is now available and it's ready.
So I can right-click and we can do a lot of things,
we can copy it.
We're going to copy it to a different region,
so as I said, the AMI is locked to a specific region
but we can copy it to different region,
which is kinda neat.
We also can modify image permissions to allow other people
or other AWS accounts to see it.
And, we can obviously deregister it,
or if you want to remove it or whatever.
What we want to do right now is just launch
a new instance based on it.
So we launch it to micro, and then for the instance details,
we're fine, we'll just leave everything as default,
same for storage.
But now you can see that the root value
is coming from the snapshots,
and the snapshot is my AMI.
Excellent, click on tags, click on security groups,
and we'll select the existing security group
we have created from before.
Review and launch, and now we're ready to launch it,
and we'll see what happens.
So now our instance is launching, and I'll go back
to my entire thing, so this is my second instance,
I'll just call it MySecondInstance.
And now that the instance is ready and running,
what I should be able to do is to use
that new public IP, this one IPv4 Public IP
and we should be able to access our httpd server from it.
So before, we had a hello world on the first IP,
but I just launched a new server, which has a new IP,
and if we press enter, I also get hello world.
So that's awesome, because we launch our second instance
from the AMI of the first instance,
and then, all the things we did on the first instance
were automatically done on the second instance as well,
because it was a backup, it was a snapshot.
And so this is really cool!
That's what AMIs are for; basically, we can do a lot more
than just saying hello world.
With AMIs you can set up a little software,
you can set up security, you can set up whatever you want,
and then you make your own AMIs,
and you can just use these AMIs for whatever you need.
So I hope that was helpful for you, hope that makes sense,
and I see you in the next lecture.