
<v Narrator>One of the most useful routing policy</v>
is going to be called latency.
Latency, as this name indicates,
will redirect the user to the server
that has the least latency close to us.
That's super helpful when latency
for the users is your priority.
And latency is going to be
evaluated in terms of the user directly
to the AWS region.
That means that if a user is in Germany,
If the us-east-1a, for example, region
is the least latency for that user,
then that's where it is going to be redirected.
So let's look at a map.
This is a map of all the AWS regions
and the numbers represent number of AZ per region.
Say we have two EC2 instances,
one on the west of the United States
and one in Sydney in Australia.
And we have all these users around the world.
Well it turns out that maybe
based on the Latency Routing Policy,
the four users on the left-hand side of the map
will be redirected to the US,
while my users on the right-hand side of the map
will be redirected to Australia.
So this is how a latency routing policy would work.
Let's just prove the points through the hands-on.
So I'm going to create a record set.
This time I'll call it latency.
And this is going to point to an IP address.
And the first one is going to be eu-west-1
So I'll just select this
put the value, the routing policy will be latency.
And here, as you can see, the routing policy
is asking me, okay where is this IP belonging to,
and which region is this located?
And so this is an eu-west-1.
And I'll just say, okay Ireland instance.
Perfect. Now click on create.
Let me create other record set
cause on a latency-based policy
you have to create multiple record sets.
So I'll create a second one.
I'll call this latency, and then I'll have
a second value so I'll put in this instance
In us-east-1.
So I'll just say okay here is this value,
the routing policy is latency.
And automatically it's really smart
because it is an EC2 instance and
recognizes the region of it.
So we'll say okay this is America,
okay perfect.
And click on create.
And then finally, select one last
this is for Tokyo,
so I'll just put create record set, latency
stephanetheteacher.com
the value is this, and the routing policy is latency.
And it knows it's ap-northeast-1
I'll call it Tokyo.
Excellent. So now for this latency,
we have three record sets
and as we can see here, this is a latency-based
and we have the instance ID right here
and the region it's linked to.
So now, I'm in Paris so I'm in Europe,
so if I go to this URL, guess what instance
is going to reply to me?
Well it should be the one in Ireland
because that's the one that's the closest to me
so it should have the least latency to the one in Ireland.
Let's have a look, yes, I'm in Europe
and it looks like I'm in eu-west-1c
and yeah this is perfect,
this is where my closest latency is.
But let me try something else.
I have a VPN solution, and I can basically
connect to any country in the world,
so I'm going to connect something like Costa Rica,
for example which is on the American continent
because I don't want to choose the US
but I want to show you that even in Costa Rica
I'm going to connect to the US.
So let me now refresh this page,
and now it looks like I'm in Costa Rica.
So if I refresh this, now automatically
I get the Hello World from us-east-1a.
Excellent. And if I just do one last test using my VPN
which is NordVPN by the way,
so if I just do one last test, and want to connect
for example to a last region
maybe I'll connect to Japan.
So I'll choose Japan as a country.
And wait for me to be connected
okay I'm now connected to Japan.
Let me refresh this page and hopefully we should see that
yes I get redirected to ap-northeast-1a.
So all of this is working, that's really awesome
and it just shows how latency policies work
so I get redirected to my closest,
lowest latency position.
And this NordVPN thing was for me to
trick myself into- to trick my web-browser
to thinking that it came from a different region
of the world.
Okay, so that's it for latency.
I hoped you enjoyed it
and I will see you in the next lecture.