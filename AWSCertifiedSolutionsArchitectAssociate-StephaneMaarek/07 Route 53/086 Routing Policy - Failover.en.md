
<v Instructor>Okay, so let's talk about</v>
a failover routing policy.
So we have Route 53 in the middle,
and we have two EC2 instances, for example,
but it could be whatever you want again.
One will be called a primary EC2 instance,
and the other one will be a secondary EC2 instance
meant to be used only if the primary fails.
And the second one is used then for disaster recovery.
So this is the failover routing policy,
so hence the name,
we need to use a health check.
And that's mandatory.
So Route 53 will have a health check
pointing to the primary, associated with the primary record.
And it will check the health all the time.
And in case that health check fails,
automatically, Route 53 will failover
to the secondary instance when there is a DNS query.
So when our web browser does a DNS request,
basically the answer that Route 53 will give it
is either the primary if the health check works,
but if the health check doesn't pass,
then automatically Route 53 is smart enough
to send back the secondary disaster recovery response
back to the web browser.
So let's have a look at it in this lecture.
Okay, so we have three health checks.
And now, we're going to go back to our hosting zone
and create a record that will failover.
So we'll create a record set
and I'll call it failover dot Stephane the teacher dot com
and the first URL is going to be my instance in Ireland,
so here it is.
And after you recreate this failover
and I'll paste in the value and the routing policy
is going to be failover.
So in failover, I say either the record type
is primary or secondary.
And as the name indicates, you can only have one primary
and one secondary.
So this one is the primary and we set the ID
to be failover primary,
and we have to associate this with a health check.
So, I'll just say.
TTL of 60 seconds, by the way,
and we have to associate it with a health check,
otherwise it won't work.
If I say create now, basically it says
a non-alias primary resource record set
must have an associated health check.
So, let's go back and say yes,
associate this with a health check.
And the health check I wanna associate this with
is one I've created in the past lecture.
So I'll associate this with the Ireland Health Check.
And the IP I just checked is wrong,
so I don't wanna make a mistake.
Let me just take this one from this list.
Here we go.
Now the value is here.
Okay, I'll click on create.
And that's basically my primary resource record.
So for my failover is here,
and this is my primary, but I'll create
a new record set for failover dot
Stephane the teacher dot com.
And this time, I will say okay,
the value is going to be America,
so I'll just choose America right here, this IP.
Excellent.
And I'll say one second, one minute as well
for the TTL, and the routing policy is going to be
failover, secondary, and this one we actually
don't have to associate this with a health check.
It doesn't matter.
So you could go ahead and create a secondary record
and it doesn't need to be associated with a health check.
Okay, so now we have two record sets
for failover dot Stephane the teacher dot com,
and as we can see on the right hand side
if I scroll back, one is failover primary
and the other one is failover secondary.
Okay, excellent.
So, let's try it out.
If I go to this URL, because my health check is healthy,
I should be redirected to eu-west-1,
so this is perfect.
I'm in eu-west-1 and this is great.
But now what I'm going to do
is stop my EC2 instance, so I right click on it,
and stop it, and basically this should make my
my health check fail because my instance is now stopped.
And it will not be able to respond to my health checks.
So let's go back to my health check console.
Just you see things happening live,
so right now everything is healthy,
but let me wait a little bit
and we should see the Ireland Health Check
become unhealthy.
Okay, so my health check is now unhealthy.
And as you can see in the monitoring tab,
we can see that for example, the health checkers
that report the endpoint healthy
percentage has decreased and then you reach
40 percent and you will go all the way
to zero at some point.
And so that made my health check switch
from one to zero.
So because my health check is unhealthy,
now if I go back to my failover endpoint
and refresh this page, what I expect
is to be now taken to the U.S. instance.
So let's try it out and refresh this.
And now it says welcome from the us-east-1a
so basically I failedover just like
the record name indicates to the right instance.
So it's perfect.
Now we've seen how through health checks
we're able to basically have Route 53
interact with those and redirect us
to an instance that we know is working.
So really, really cool.
Alright, just for this lecture
I'm just going to start back my instance.
And we're all good!
I will see you in the next lecture.