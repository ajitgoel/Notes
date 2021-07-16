
<v Stephane>All right, so now we're going to SSH</v>
into our EC2 Instance using our Linux or our Mac computer.
And you're gonna say, what the hell is SSH?
What are you talking about, Stephane?
Well, SSH is one of the most important functions
when you deal with Amazon Cloud.
It basically allows you to control a remote machine
or a server all using your terminal or your command line.
So how does that look like with a diagram?
Well, we have our EC2 machine and we launched
Amazon Linux two on it, and our machine has a public IP.
Now we want to access that machine, and so for this,
I dunno if you remember, but we have a security group,
and on it we allow the port 22 of SSH.
So what's going to happen is that our computer,
so my laptop for you, for me, or whatever for you,
that will access over the web through that port 22,
it will access the EC2 machine,
and basically our command line interface is going to be just
as if we were inside that machine.
So let's get started.
Okay, so I am in my instance console, and as we can see
on the bottom right, we have a public DNS, and a public IP.
So this is basically how I can connect from my computer
over the web to this instance.
And this is why we have a public IP, so 35-180-100-144.
So we have to go ahead and copy this and we'll use it, okay?
The other thing that's super important is that of we look
at our security group and click on view inbound rules,
we should be seeing that port 22 is open on the protocol tcp
and the source is 0.0.0.0/0 which means anyone, okay?
So let's go ahead and SSH into our instance.
For this you need to open a terminal,
so use whatever you have on Mac or Windows.
I used, for Mac, I use iTerm, if you're a bit interested.
And so what we have to do is SSH into our machine.
Now, we do ssh ec2-user@ and the IP.
Ec2-user is basically the Linux user into our Amazon Linux
machine, and @ basically defines the IP.
Now that that's all right, we click on OK, and it says,
okay, do you want to continue?
That sounds fine, say yes.
And then it says, wait, permission denied.
So it seems like we can't really SSH into our machine.
Well that makes sense, right?
We just launched a machine right here,
and it's using a public IP and the port 22 is open,
but we don't want anyone to get into that machine, right?
We just want ourselves to get into that machine,
and so this is why we had downloaded a key file, okay?
The EC2 Tutorial.pem file, and so we are going to have
to use that key to get into our machine.
So what I did is that I took that key, and I placed it
into my directory called aws-course, but you can place it
anywhere you want.
Now we basically have to say, okay.
I want to get into this machine, so I want to run
this SSH command, but I also want to reference my key
so that I can tell the machine that, hey, here's my key
which allows me to get into the machine.
So to use the key you do -i, and then you reference
the pem file, so ssh -i EC2Tutorial.pem
and then the instance user name @ the instance IP.
Click on enter, and now we get another warning.
It says, warning: unprotected private key file!
And so that's a very common exam question which says that
when you first download a file, the permission is something
called 0644, and that's too open,
and basically the private key can leak, okay?
So basically because the private key is accessible by others
it will say bad permissions,
and it will not allow you to SSH into that machine.
So to fix this very common question, you do chmod 0400
and then you reference the key name, so just like this.
And now, if we run again this command, ta-da!
We are in the machine, so we get Amazon Linux 2 AMI
and we are in the machine.
Now if I go and clear the screen, and type whoami,
I can see that I am ec2-user.
Okay, so you can do a lot of things.
You can go ahead and ping Google.com if you wanted to
and and as you can see, it works.
Google.com is talking to us.
So this sounds about right.
So this is how I SSH into the machine.
Now I'm basically into my ec2 server, and I can run commands
from here, and as you can see, in this course we run lots
of commands from our ec2 machine,
but it's super important for you to know.
Now, to exit you can just press exit, or you do control D
to log out, and then you see the connection is closed
and I am back to my directory, okay?
So these commands you're gonna have to run them very often.
Again, remember ssh -i, the name of the key file,
and then the user name and then the IP.
So that sounds right.
You just learned how to SSH.
I will see you in the next lecture.