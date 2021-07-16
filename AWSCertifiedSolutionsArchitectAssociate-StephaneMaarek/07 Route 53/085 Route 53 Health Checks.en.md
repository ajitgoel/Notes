
<v Narrator>So there are health checks in Route 53,</v>
and the idea is that if an instance
is unhealthy, just like an ELB,
Route 53 will not send traffic to that instance.
So how do we know if a health check failed?
Well, basically, an instance is,
or an IP or URL, whatever you want,
is deemed unhealthy if it fails
three health checks in a row,
and it's deemed healthy if it passes
three health checks in a row.
So, pretty easy.
Now, the default health check interval is 30 second,
but there is something called a fast health check,
which is 10 seconds, but those will lead to higher cost.
And then when you do a health checks,
somehow AWS basically launches
about 15 health checkers in the background
that will check the health endpoint.
And so, that means if you have 30 second interval
and 15 health checkers that will check the endpoint health,
you get on average a request every two seconds.
If you have 10 seconds as a period of health checks
and you have 15 health checkers,
then it will be less than one request per second.
More than one request per second.
So, in terms of health checks, you got lots of options.
You get HTTP, TCP, HTTPS health checks.
Although, when you use HTTPS health checks,
you'd get no SSL certificate verification,
so be careful with this.
And you can intregrate these health checks
with CloudWatch if you wanted to.
The really cool this is that once you have
these health checks defined in Route 53,
they can be directly linked to the record sets
and the DNS queries, and they will basically change
the behavior of Route 53.
So, it's just a theory lecture, but let's go over
creating a health check to see how that works.
So, to create a health checks,
we go to the left-hand side and click on health checks.
In here we have a UI to create a health checks.
So, this will help us with availability
and performance monitoring and will give us
some sort of DNS failover
that we'll test in the next lectures.
So, we'll create a health check
and I'll just say, the first one
is my Ireland health check,
and we'll test my Ireland instance,
and we'll basically monitor an endpoint,
but we could monitor the status of other health checks,
which is called a calculated health check,
or monitor a state of a CloudWatch alarm.
So this is how we could link CloudWatch to Route 53,
but right now we'll just do endpoints.
And then, we'll say okay.
The endpoints, do we wanna specify it
by IP address or domain name?
So, we have either choices.
We'll use IP address, because it will link
directly to our instance in Ireland.
The protocol we'll use is HTTP,
but we could use HTPS if you wanted to test some encryption,
and TCP if you wanted to just check
if a port was open for a level.
So, we'll use HTTP, and then we'll say okay.
The instance I wanna test right now is the one in Ireland.
So, we'll use this IP right here.
So, I'll just copy this IP and paste it in there.
Okay, we could specify a host name as optional
if you wanted to give a host name to that request,
but we don't do this for now.
The port is 80 and the path is going to be just slash.
Images is just an example of what you can put,
but right now, because we go directly to the IP address,
so if I go straight to the IP address,
as we can see, we just do the route, we do slash,
and so it's the same, so I will not add any argument here.
You can do some advanced configuration, which is quite cool.
Here we can see that we have standard health checks,
as I said, or fast health checks,
but you have to pay more if you do a fast one.
You can say a threshold for the failure.
So, we can say three failed requests equals failure,
but we can say just one, or maybe 10.
I'll put it as three, obviously.
Then you can do some string matching
to test the response and test if there is some string in it.
We can have some latency graph enabled
if you wanted to see the length
to see all these health checks
and make sure that it's don't deteriorate.
We could invert the health check status if we say okay,
a health check is actually unhealthy and the opposite,
so you could invert it for whatever you want,
disable it, and then you can configure
the health checkers to be from specific regions.
You can either customize this list
or use the recommended list,
so we'll just use the recommended one.
But, here we go.
Now, when you create a health check,
you basically get a pricing estimate,
so it says right now it's basic,
no additional options selected.
But, if you wanted to view the pricing,
it takes you to a new page and in there
you're able to see that health checks
cost you 50 cents per month on AWS endpoints
and more on non-AWS endpoints.
And then, if you use HTTPS, string matching,
fast interval, or latency measurements,
you pay more per month per optional feature.
By the way, new and existing customers
are not charged for health checks on up to 50 AWS endpoints.
So that means if right now we are fine
with this health check, it shouldn't cost us anything.
Okay, so we're good here.
I click on next and it will create an alarm
or not when the health check fails,
and right now we'll just say no,
I don't want to create an alarm.
And I'll go ahead and create a health check.
So now, I've create a first health check,
and what I'm going to do is basically create
my other two health checks,
and then we'll use them in the next lecture.
So, I'll create my Tokyo health check and this is great.
I will say the IP address is going to be
from my Tokyo instance, so this one.
Okay, paste it.
I will leave everything as default,
click on next, click on create health check.
And then finally, I'm going to create my last health check.
This health check is going to be for US East One,
so I'll just call it Virginia health check.
And I will put in there the IP address
of my US East One instance.
Okay, and we're good.
Click on next, create health check, and we're gone.
Now we have three health checks
and we'll just wait a little bit
for the status to get updated,
cause right now it is unknown.
Okay, our health checks have been created,
so this is perfect.
Now if I click on one, for example,
the Virginia health check,
we see all the configuration that's in there.
We could have some monitoring.
So here we can see the monitoring over time
of the health check status, so we can get some graphs,
and we can choose the time range we want,
and this comes straight out of CloudWatch,
so this is something we could use in CloudWatch.
The alarms, if you have CloudWatch alarms,
link directly to the unhealthiness of this health check.
Tags, if you wanted to tag them,
and health checkers shows you all the IPs
of the things that will basically ping my EC2 instance
and query this URL, we just had.
So here we can see we have about,
I think, 15 health checkers.
And all these things are going to constantly,
every 30 second, ping for my URL
and tell me if the HTP status code is going to be 200.
And in case you've enabled latency, which we haven't,
but in case you've enabled latency,
then you could see a latency graph in this tab
and get some information around how fast the endpoint
is to reply to our request.
So, that's really cool.
We have three health checks, they're all healthy,
and in the next lecture, we'll be able to play with them
a little bit and see how things work
using health checks in Route 53.
So, see you in the next lecture.