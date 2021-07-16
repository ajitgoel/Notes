
<v Instructor>Okay, so we have now my first instance</v>
that we've been using all along.
As we see, this has a public IPv4.
Let's make sure that it works.
If we do SSH ec2-user@ and then the public IP,
then we are able to get into our instance.
Obviously, if you're on Windows,
maybe you're using PuTTY and so on.
So, we are into our instance
and we are SSHing to it,
and it says we can issue command from within.
But now we can also see the fact that
it has a private IP on the left-hand side.
This starts by 172.31.
I cannot use that private IP to access my instances.
Let's make sure of that.
Let's go and type SSH and do ec2-user at this private IP.
As we can see, nothing is happening,
it's going to time out because this is a private IP
and I am not on the private network of AWS,
I'm on my own personal private network.
This doesn't mean anything on my private network,
so the private IP here does not work.
But if we use the public IP
to SSH into our instance
and then we look at the name of our instance,
it says, ec2-user@ip-172-31-33-185.
So, we can that this private IP
is helping our instance to be
identifiable on the private network of AWS.
We can also look at ifconfig-a,
and it's going to give us some information
around our net interfaces.
As we can see here,
this first line right here, it says that
my eth0, so this is the primary virtual interface
for network of my EC2 instance,
is showing the IP 172.31.33.185.
This is the whole meaning of a private IP.
I used the public IP to access my EC2 instance
from my own personal laptop,
but then on the network,
this machine on the private (mumbles) work as this
private IP.
So, this is great.
Now let's disconnect from our machine
and let's have a look at what happens
to the public IPv4 if we stop and start the instance.
You have to stop it, you cannot just restart it,
you can stop it.
It's going to lose its IPv4.
Right now it's 35.180. something.
After I stop my instance,
the public IP is going to disappear.
Let's just wait a little bit.
My instance is now stopped, so I'm going to start it.
So, Instance State and then start it.
Something we can see is that the private IP has not changed.
It's still 172.31.33.185.
My private IP in this instance has not changed.
But if we look at my IPv4 public IP,
and now if I refresh,
I see that there is a new IP.
There's this one, 35.180.196.137.
That's slightly different from the one from before,
so we have obtained a new public IP.
If you get the same public IP as before,
it's maybe because you've done this too fast.
So, stop it, wait a minute or two, and then restart it.
You're gonna get a new public IPv4.
This shows you that if you stop and start your instance,
then the public IPv4 will change.
That's a common beginner's mistake in AWS.
Now that the public IPv4 has changed,
if you wanted to SSH into your instance,
you will need to update the SSH command
or your PuTTY command with the new IP.
Now we are able to get into our instance
just like we did from before,
and here I am into my instance.
If you (mumbles) the same ifconfig as we had from before,
we can see the private IP has not changed.
What we've shown here is that
the public IP does change when you stop, wait a bit,
and then start your instance,
so it's not stable.
But your private IP is, obviously, stable.
Last thing we've seen is about elastic IP.
How do we make sure that the public IP
remains the same across reboots?
The way to do it is to go directly into the Elastic IP
menu on the left-hand side under Network and Security.
We're going to allocate an elastic IP address.
We have three options.
We can use one IPv4 from Amazon, which we will do,
or you can bring your own IPv4 if you had it.
We'll click on Allocate.
Now we have assigned a new public IPv4 address
which will be elastic.
Now we have to associate that elastic IP
with our EC2 instance.
I'm going to click on Action,
and then Associate Elastic IP Address.
Here, we have to choose our EC2 instance
to associate that IP with.
I'm going to choose an instance.
For the instance, I'm going to choose
my first instance that is running.
Then we are going to click on Associate.
Now let's get back into our EC2 console
and see what has changed.
Back onto instances,
I have with my first instance right here.
As we can see now, the IPv4 public IP
is the same as my elastic IP
and has a little link right here because it's special.
So, if I wanted to SSH into my instance,
what I would have to do
is to write the new IP into my SSH command,
which is now done, and I am able to SSH into my instance.
But, even better, now if right-click
and I'm going to stop my instance,
as we can see,
and we'll need to wait just a little bit
for the instance to go down,
as we can see,
even though the instance is now in stop state,
there is still an IPv4 public IP
and an elastic IP assigned to it
because now we want to make sure that this remains stable.
That's the whole point of elastic IP.
Right now if I go ahead and start my instance,
it's going to keep the same private IP, obviously,
but also going to keep the same IPv4 public IP
because we have attached an elastic IP to our instance.
Now that our instance is running,
what I'm able to do is just go
and run the same SSH command as before,
and I should just (mumbles) right now,
and now it works and now I'm in my instance.
It was a connection refused because the SSH utility
has not yet started onto my EC2 instance
that's why you saw it.
But nothing, (laughs) not a thing to be worried about.
And that's it.
We've seen how elastic IP works,
and so what we're going to do is just release
that elastic IP.
If I right-click and do Networking,
and then I'm going to disassociate elastic IP address.
We're going to remove that IP address away from my instance.
As we can see now, we have gained a new IPv4 public IP
as soon as we did this.
Now if I go to my elastic IP,
this is something you get charged for
when it's not associated with a running instance.
We don't leave it here,
otherwise it's going to cost us some money.
Again, what you need to do is go click on this IPv4
public IP from elastic IP pool,
and you're going to click on Action,
and then you're going to release that elastic IP address
to not pay for it because it's being unused.
When it's been released,
you're good to go and there will be no charges
incurred into your accounts.
That's it for elastic IP, public IP, and private IP.
Hopefully, that was very helpful,
put a lot of things into perspective.
I will see you in the next lecture.