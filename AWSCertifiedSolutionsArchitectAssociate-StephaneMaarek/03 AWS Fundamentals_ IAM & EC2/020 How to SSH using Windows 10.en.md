
<v Lecturer>So if you are on Windows 10</v>
or a very new version of Windows
then you may be able to use the SSH command
instead of using PuTTY
to log on to your EC2 instance.
So I have a Windows 10 right here
and I want to show you how we can do it.
So if you go to PowerShell for example
and you type SSH
and then you get this command back
the usage of SSH and a lot of options,
that means that you have access to SSH.
If you don't have PowerShell,
you just have the Command Line editor
and you type SSH,
you see the exact same thing, that means that you have SSH.
If you see SSH command not found
that means that you don't have SSH installed on your Windows
and that means that you will have to use PuTTY
as we saw in the previous lecture
to connect to your EC2 instance.
But say you have the SSH command.
Then we can do the exact same command
as what we do on a Linux or a Mac computer
to log on to our EC2 instance.
So what we have to do is do SSH -i
and i stands for Identity file.
So we need to provide the location
of our Identity file.
For me this is my EC2Tutorial.pem file.
And I'm just going to copy the entire location
so the location right here is copied.
And I'll paste it here
and then I'll add the EC2Tutorial.pem.
Okay.
Next we have to decide what user we are going to use
to connect to our EC2 instance.
So if we go back to our EC2 instance
we launched an Amazon Linux 2 AMI,
so the user to log on to the EC2 machine
is always EC2-user.
That is something you have to do
when you use Amazon Linux.
This is why we have EC2-user in here.
And then @, which corresponds to the IP of the machine.
So here we go to the Public IPv4
and you'll copy it.
And remember that this IP will change
if you restart your machine.
Start and stop.
So we'll just paste this here, and here we go.
So now we've doe SSH -i, the whole path to the PEM file,
and then the EC2-user, because we use Amazon Linux 2,
@ the IP of our machine.
Let's press Enter.
And we're prompted with the fact
that we want to verify the authenticity of the host.
Because we were never connected to it before,
the Windows needs to know that we can trust this host.
So I'm just going to say yes and press Enter.
And now I get an error.
Warning, unprotected private key file.
So you may or may not get it,
but it's important that if you get it
you know how to resolve it.
So this is the same problem that we have
when we have a Linus or a Mac.
We want the private key file, so the PEM file
to be protected correctly
and to have the correct permissions.
And so how do we fix this on Linux and Mac,
we use our command CH mod.
But for Windows this CH mod command does not exist.
Therefore we need to use something else.
So I'm going to clear the screen,
and we have the command right here already.
But I'm going to go to my PEM file.
So right here, in my downloads
right-click and click on Properties,
and then I'm going to go to Security.
And in here we can see who has access to this key.
But in there there is an Advanced tab.
So click on Advanced,
and you are getting into the Advanced Security setting.
So the first thing you have to do is make sure
that the owner of this key is yourself.
So I'm going to go here and I'm going to look for Stephane,
and check the names and here I am.
I'm making myself an owner of this key.
So the owner has to be you.
And then you should remove any other user.
So this one I can't remove
and this one I can't remove as well.
Because it has inheritance.
So I need to disable inheritance right here.
And so, okay, convert inherited permissions
into explicit permissions.
And now I can remove the SYSTEM
and I can remove the Administrator.
So here now, this file, EC2Tutorial.pem
has inheritance disabled
and only me is able to control this file.
So I click on Apply
and then I have said OK.
Now in here, I need to make sure I have full control.
So yes I do have full control, this is perfect.
And if I didn't, I could click on Permissions
and then add myself to full control.
So now we have done something that
so that's the properties of the Security file
is just us having full control over this file.
So that's perfect.
And now if you try this command again
and press Enter
we are logged on to our Amazon Linux 2 EC2 instance.
And the reason it worked now
is that we had the right permissions for security
and we were not prompted with a yes/no question
because we already told Windows to trust
this EC2 instance and this IP.
So this is really cool.
Now what I can do is show you that it works
exactly on the Command Line.
So I go to the Command Line and paste the command.
Oops.
I need to do it again.
I'm going to the Command Line
copy this and paste this.
Press Enter.
And again it will work right away.
Again, no yes/no question to Enter the instance
because Windows already trusts that instance.
And no security error because we had fixed
the security for these downloads.
So now you've seen how to do it
on Windows using SSH command.
Hopefully that covers all the use cases you may have
and all the issues you may encounter.
And you have to remember that
you can only do this on Windows 10, on Mac or Linux.
But if you have an older version of Windows
you cannot install SSH on it.
You have to use PuTTY as we saw in the previous lecture
to log on to your EC2 instance
back by Amazon Linux 2.
So that's it for this lecture.
I hope you enjoyed it.
I hope that was really helpful
and I will see you in the next lecture.