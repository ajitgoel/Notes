
<v Instructor>So now let's have a look</v>
at EC2 Instance Connect.
So if we click on our Instance,
and just click on Connect,
we have the option to connect to our Instance.
And we can connect using the standalone SSH client
and we've seen how to do this,
using the different tutorials from before,
or to use PuTTY.
But also we can also use something called
EC2 Instance Connect, which is
a browser-based SSH Connection.
We just specify the username, which is ec2-user,
for Amazon Linux 2.
Click on connect.
And automatically, we're in, nothing to do.
So this is quite magical, I know, but it works!
And now from the browser, I can issue some commands
and things would work.
So I can clear this (inaudible) and so on.
So the really cool thing is that I've done
that from a browser, and this is the exact
same equivalent to doing the SSH,
but I don't have to use a terminal,
and I don't have to worry about keys.
So, behind the scenes, the AWS
will upload a key to your EC2 Instance, that allows
me to connect to it temporarily.
So it's pretty cool right?
So, this does not work if you block the SSH port.
So if you go to our launch wizard, and we go to the inbound,
and we delete any SSH rule, I'm just gonna delete
everything regarding SSH.
And I try to connect again, using EC2 Instance Connect,
this one time, it will not work.
The screen will remain black and it will be a timeout.
And this is because I still need to have
my SSH port 22 rule in there, for it to work.
So I go back to my security group, and I'm going to
have port 22 and then the source is gonna be anywhere.
Click on save.
And now I can close this tab and try again.
Click on connect, and connect again, and I'm able
to go directly into my EC2 Instance using
EC2 Instance Connect.
So, pretty cool right?
The only last thing you need to know, is that
this only works right now with Amazon Linux 2,
so if you click on the AMI ID right here,
it says Amazon Linux 2 AMI 2.2.201,
so it needs to work with the recent Amazon Linux 2 AMI,
which is the one you have when you launch
an Amazon Linux 2 AMI.
So, please make sure in this tutorial,
and all the tutorials we do, that we do use
Amazon Linux 2 AMI, and so if you don't want to use
PuTTY, or if you don't want to use the SSH utility,
and just want to do everything from within your browser,
then you know how to do it, now using EC2 Instance Connect.
Well that's it.
I hope you liked it and I will see you in the next lecture.