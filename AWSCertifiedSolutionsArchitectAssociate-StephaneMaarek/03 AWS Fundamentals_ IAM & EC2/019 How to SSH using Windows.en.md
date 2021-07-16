
<v Instructor>Okay so we are going to</v>
learn to how to SSH into our EC2 instance
using Windows
and for this we used to say, what is SSH?
Well, SSH to me is one of the most important function.
Especially when you deal with Amazon Cloud.
It will basically allow you to control a machine remotely
all using the command line.
Okay?
And so what does it look like?
Well basically we have our EC2 machine,
and its running Amazon Linux 2,
and it has a public IP,
and I don't know if you remember,
but we had an SSH security group on it,
and basically we allowed SSH on Port 22 to any IP,
which basically allows our Windows machine
to connect over the internet
directly into the machine and control it
using the command line.
So we'll see how to do the requirements
for parameterizing basically our Windows.
And so we'll use PuTTY to do SSH.
So this is a free tool available online
and, as you can see, it's a little bit tricky
to use the first time,
but we'll get used to it
and we'll learn how to SSH into a Linux using PuTTY.
So let's get started.
So I am in my Windows machine
and the first thing I'm going to do is download PuTTY.
So I google PuTTY, and take the first link,
and you can see you can download PuTTY here,
so I'll go ahead and download it.
And I'm under Windows so you can choose whatever,
64 bit or 32 bit installer.
I'll just use the 64 bit
and run it.
Then you may get a little warning
when nothing runs to install,
but the installation process overall
should go really smoothly.
So you go ahead and click on Next.
Next, Next again, and Yes.
So it goes ahead install PuTTY
and then we don't need to see the Read me
and we finish.
So the first thing you have to do
is to go into Windows,
scroll down and all the way to the bottom
we see a PuTTY folder,
and underneath we have PuTTY Gen.
Now using PuTTY Gen we are going to convert
the key we have downloaded from the EC2 console
and we're going to convert it into a format
that PuTTY likes, which is called PPK.
So we'll go and click on File
and click on Load private key.
Now we need to go wherever you downloaded your private key.
So for me, it's on my Desktop.
Click on the Desktop
and you need to open all files.
Here is EC2tutorial.pem
and basically it says successfully imported foreign key.
Okay?
And basically it says to use this key with PuTTY
you need to save private key command.
So the way I did it, again, is doing Load
and make sure to scroll down and click on
All Files to see the file that you've just downloaded.
So here is our key and it's imported.
And what I'll do is, as they said,
click on Save private key.
Here we get a warning saying
are you sure you want to save this key
without a passphrase to protect it?
Yes, for me this if fine.
I don't need a passphrase,
but if you want extra security you can say No
and you can save with a passphrase.
So here on the Desktop I will say EC2 tutorial
and then you see dot PPK.
Okay, so this is a PuTTY private key file.
We click on Save
and now we have done the conversion of our key
from a PEM file to a PPK file.
So we can close this and this is something
we just have to do once.
Then if we go back to Windows and scroll down
and look for PuTTY.
One more time here is PuTTY.
Here we can now go ahead and open the program PuTTY
and here is our PuTTY program.
Now we need to go ahead and basically enter
the IP address of our EC2 machine.
So for this, under my EC2 machine
we see there is a IPv4 public IP
and this is what we'll use.
So I'll just copy the public IP
and paste this under Host Name.
Now we also need to add a username.
So I'll do EC2 minus user at the IP address.
EC2 user is basically the host name we'll use
to log into our EC2 instance.
Now what way I can go ahead and save this.
And so I'll give it a name.
I'll call it MyEC2instance.
So we save it, but we're not done yet.
So click on MyEC2instance, obviously,
and we click on Yes
and so we get a little
server host key is not cached in the registry,
and then we get an error saying
no supported authentication method available,
because we haven't linked our private key file.
So if you get that error, you can close this.
We go back to PuTTY
and I like to show you errors
before I show you how things work
because these are errors you can have all along.
So we click on MyEC2instance, click on Load,
and now we need to reference the PPK file.
So for this we go to Connection, SSH.
We open this
and there is Off.
And then under Off there is a private key file
for authentication, which you can browse,
and then we go to Desktop,
or wherever you have saved your PPK file
and reference your EC2tutorial.ppk file.
Now we're almost done, don't click on Open just yet.
We go back to Session and we save it again.
This way our MyEC2instance save session
will have the PPK file.
Now we click on Open
and all of a sudden things work.
We are inside the machine.
So we have a nice terminal
and we can see that we are inside the machine.
For example, if I type who am I
I say, I am EC2 user, great.
And if I ping Google.com
I can see that Google.com is responding
and we get information from it.
So control + C
and then to exit you can just press Exit
or exit using the way you prefer.
So I'll just go and press Exit
and as you can see, things just exited.
Now if I go back and one last time to PuTTY.
Just to verify that thing worked properly.
If I click on MyEC2instance,
load the profile.
Usually, if I go to SSH and again Off,
now the private key file should be saved
and so we're good to go.
We can just directly click on Open
and we have SSH into the machine.
Now what we'll do is that we'll do this pretty often
so make sure you have the hang of it
and we are ready to go into the next lecture
to do some more fun stuff with EC2.
So see you then.