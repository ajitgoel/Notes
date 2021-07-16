
<v Lecturer>So let's talk about a feature</v>
that can come up
in the exam on your load balancers
and that is connection draining.
So it has two different names|
based on the which load balancer you're considering.
If you're using a CLB or a classic load balancer
then it's actually called connection draining.
But if you have a target group
it's called deregistration delay.
And that is obviously applicable
for application balancers and network load balancers.
So what is this connection draining
and I'll just call it connection draining from now.
It's the time to complete in-flight requests
while the instance is being deregistered or unhealthy.
And the idea is that
it will allow the instance
to just shut down
anything was doing before being de-registered.
And so the idea is that the ELB
as soon as an instance is in draining mode
will stop sending new requests
to the instance because it is being de-registering.
So let's have a look in the diagram to understand better.
So we have our ELB and with three EC2 instances behind it
and our users are accessing, for example
our first EC2 instance through the ELB.
It turns out that our EC2 instance
maybe is being terminated or is unhealthy
so it's gonna go into draining mode.
And so during the draining mode,
the existing connections will be waited
for the duration of the
connection draining period to be completed.
And by default that is 300 seconds.
And so that means that any new connection
that is made by the users
into the ELB will be redirected
to the other EC2 instances available
and are being registered already registered to your ELB.
So it includes the first, the second EC2 instance
or the third EC2 instance in this example.
And so your deregistration delay
is going to be 300 seconds by default
but you can set it anywhere
between one second to 3,600 seconds
which is one hour.
And you can also disable it
by setting the value to zero.
So let's just discuss the value a little bit.
So if your requests are cut short.
So if you have a web application
that does very short request
maybe one to five seconds,
then you want to set your deregistration delay
to something that's going to be quite low
maybe 10, 20 seconds because you don't expect
any connection any request
to last any longer than 20 seconds.
But if your EC2 instances
are very slow to respond,
maybe to take minutes
because they have a lot of data processing to do.
Then you do want to set
your connection draining something a bit higher
to give a chance to these requests
that are already in-flight to be completed
and obviously if you don't want that behavior at all
then you can just disable it
set the value to zero
and in case a connection is dropped
while your EC2 instance is being killed,
then users will retrieve an error.
And maybe it's the role of your users
to just retry that request up until it succeeds
by being redirected to a new EC2 instance okay.
But so in the exam,
the connection draining concept can come up
and you just need to understand it at a high level.
So I hope that was helpful
and I will see you in the next lecture.