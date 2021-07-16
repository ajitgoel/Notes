
<v Narrator>Okay, so now let's talk</v>
about DNS Records Time to Live, so TTL.
So TTL is basically a way for web browsers
and clients to cache the response of a DNS query.
And the reason we do this is not to overload the DNS.
So we have Route 53, and that's our DNS for us,
and we're going to make a DNS request
from myapp.mydomain.com.
And what's going to happen is that
the Route 53 will send back the IP: 32.45.67.85,
which is a A record, because it's domain to IP.
And then, on top of it,
it's going to also send back the TTL.
And the TTL is something we can configure,
as we'll see in the hands-on.
For example, we can set it to 300 seconds.
And what's going to happen is that
the web browser will cache that DNS request
and the response for the TTL duration.
So, as soon as we receive that reply,
it's going to be valid for 300 seconds.
And any time we request myapp.mydomain.com,
the web browser will just look internally,
and in some cases, you will not ask Route 53 again.
So then, basically, after this TTL happens,
and if we have something changing on the Route 53 side,
for example, the IP back is now 195.23.45.22,
then our cache will be updated,
but only after the TTL has expired.
And then, we will have the chance
to have an updated DNS Record in our web browser.
So what's good to see here, is that
as soon as you operate a change
on the Route 53 DNS Record, that doesn't mean necessarily
that all the clients will see that change right away.
They have to wait for the TTL to expire
before they can see that change.
So high TTL is considered to be something like 24 hours,
and what that means is that
you get way less traffic on your DNS,
so Route 53 will have less queries
because records are cached for 24 hours.
But there's a possible chance of out-dated records,
especially if you change them on Route 53.
Low TTL, for example, 60 seconds,
will incur a lot more traffic on your DNS,
but also, the records will be out-dated for less time.
And it will be very easy to change the records.
So TTL is something you have to make a decision on,
and basically, based on what your application is and does.
And it's mandatory for each DNS record to specify a TTL.
So let's have a look at how that works on Route 53.
So we're going to create a new record,
and I'll call it TTL demo.
And this is going to be an A record,
and the value of it will be pointing,
for example, to my instance in Ireland.
So I'll choose my instance right here,
I'll select the public IP, and this is where I'll put it.
So my ttldemo.stephanetheteacher.com is pointing
to my IP address in Ireland.
Now, let's look at the TTL seconds.
By default, it's 300, so five minutes.
But let me set it to 120 seconds, so two minutes.
I clicked twice on one minute to get 120,
but you can also enter whatever number you want in there.
So here is my TTL, I'll click on create, and here we go.
We have TTL demo, which is right here.
So what happens is that,
if I go to ttldemo.stephanetheteacher.com,
I get the Hello World back from my instances eu-west-1c.
Excellent.
But if I also get this record and use the dig command,
so I'll use dig and then this host name,
so I have to remove the http://, so dig and the host name.
You get the response, 34.255.122.72.
And this number right here, 119.
I don't think you can see it easily on the NS look-up,
so that's why I use dig, but it's just to show you.
This number represents how long this record is cached
on my computer.
So if I do a dig again on this same record,
as you can see, here it says 101,
so that means that this record, this section,
this answer right here is cached.
It's still cached for 100 seconds.
So if I just do it again, 90 seconds left.
And so that will expire in 90 seconds.
So while we wait for it to expire,
let's change the record to point to us-east-1.
So I'll select this, and I'll go back to my Route 53.
In my Route 53, and I'll update this record,
save the record sets, and so now this points to us-east-1.
So if I go and refresh the TTL demo page,
I still see eu-west-1c.
And if I go to my dig and query the same URL,
I still see, many seconds have expired,
so I get a new record, obviously,
but after the record was expired,
only then did I get a chance
to basically see the updated IP.
So that's really really cool, because now
if I go back to my web browser and wait 120 seconds,
this will automatically get updated.
So let me wait a little bit.
And so, after a little bit of time,
now we can see the Hello World,
basically, was done from the us-east-1a,
and I used the same ttldemo.staphanetheteacher.com.
So what we've seen through this lecture,
is that our DNS records, basically through dig
we can see it very easily.
They're cached for a specific amount of time
on our computer.
And through the web browser, we saw directly
that we only got access to the other EC2 instance
only after waiting for the TTL to expire,
so that was 120 seconds in our case.
So it's really really go to know,
because going into the next lectures,
I'll be playing a bit with the TTL,
and setting it to different values,
and you need to understand why I'm doing it,
and I hope that this helps.
So remember, low value means more queries to Route 53,
so possibly more pricing, more traffic on Route 53.
And if you set something like one day,
that means it's going to be really really hard
for you to change the values and have the changes
to be propagated very very quickly.
All right, that's it.
I hope you enjoyed it,
and I will see you in the next lecture.