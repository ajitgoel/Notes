
<v ->So let's talk about routing policy</v>
And the first one is going to be simple routing policy.
We have a web browser and route 53.
And we just say, okay, we want to know
where's foo.example.com
route 53 will reply, it is an A record
and the IP is 11.22.33.44.
Excellent, So we just use it basically,
when we need to redirect to a single resource,
it's very easy, simple routing, right.
And the thing is, with simple routing,
you cannot attach health checks.
So we have not seen health checks just yet.
We'll see them in a few lectures.
But health checks cannot be attached
to a simple routing policy.
So it's dead easy, very simple.
That was named simple.
In simple though,
you can return multiple values to a client,
in which case the client sees all the values
and the clients will choose a value at random to use.
So let's have a look at how this works in practice.
So in this example, I'm going to create a record sets
and I'm going to call it simple
that's defined that to come.
It's going to be an A record
and the teacher is going to be set to 60 seconds only.
and the value is going to be my URL in,
for example, ue-west-1, so I'll just choose this one.
And I'll paste it in, click on Create, and we're done.
Okay, so this was a simple record.
And we have a low TTL of 60 seconds to one minute.
And so as you can expect,
if I go to simple.stophanetheteacher.com
what we see is a "Hello World" directly coming
from us-east-1a.
If I use dig to basically query for this URL,
what do we learn?
Well, we'll learn that and then don't need to use HTTP,
otherwise, things will not work.
So let's try again, we'll learn that yes,
we have 59 seconds of TTL left,
and the IP result is 3.86.116.186.
Okay, that's as simple as simple gets.
But we can make this a little bit more complicated
basically by going and adding another IP.
So for example, here, instead of just having one IP address,
I can have multiple IP addresses.
So I'll just choose another one from my instance,
in Ireland, I'll select this IP address.
And as we can see here, you can
basically enter multiple IP addresses on separate lines.
So here we have two IP addresses.
And what this means is that
when the web browser will query
for simple.stephanetheteacher.com,
it will receive two addresses back,
and then my browser will choose to which IP to go,
it could be very helpful, basically,
if you want the web browser
to start doing some load balancing,
it's called client side load balancing.
So if I use dig, and now query for this little domain,
as we can see now, the answer I'm getting back
is that I have two answers.
I have two air records
and two different IP addresses available to me.
Similarly, if I go and open up the back,
my simple.stephanetheteacher.com URL
With a bit of luck, I've been transferred to eu-west-1c.
And so if I refresh this page for 60 seconds,
it's for sure always going to go to eu-west-1c.
But after 60 seconds,
my web browser will make another DNS request,
and there's a chance I will fall back to this value again.
So it's something very important to see.
It's simple.
But as we go along in this section,
we'll see more complicated policies
and it's always nice to start
with something a little bit simple.
So have a play,
play with a TTL play with the different IPS
play with dig or nslookup
and I will see you in the next lecture.