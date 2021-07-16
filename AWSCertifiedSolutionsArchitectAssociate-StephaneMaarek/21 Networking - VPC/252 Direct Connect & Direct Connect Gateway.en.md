
<v Instructor>So, let's talk about Direct Connect now.</v>
So, we've seen how to connect our data center
to our AWS VPC using a site-to-site VPN,
and that site-to-site VPN
was basically set-up on the Internet.
So, your traffic between your corporate data center
and AWS' data center goes over the public Internet.
But there's an alternative.
What if we don't use the public Internet?
Instead, we can set up Direct Connect,
and that will provide a dedicated private connection
from your remote network, so your corporate data center,
directly into your VPC.
And the dedicated connection must be set-up
between data center
and one of AWS' designated Direct Connect locations.
We'll see them in a second.
For this, on the AWS' side,
you still need to set up
a virtual private gateway on our VPC.
So, remember in the past lecture,
we saw virtual private gateways?
We still have to set one up on our VPC side,
and then we set up Direct Connect.
Direct Connect will allow us to access
both public resources, for example, S3,
and private resources, for example, EC2,
on the same connection.
So it channels really everything
on the same private connection.
So why will we use this?
What's the use cases?
What's the exam asking?
Well, any time you need to increase bandwidth throughput,
especially when you're working with large data sets
and you want lower cost on your bandwidth,
then having a private connection may definitely help.
Maybe sometimes you need more consistent network experience,
because you're experiencing data drops,
you're experiencing connection shutdowns.
you want to have real-time data feeds on your application,
they're shutting down too often.
Direct Connect is a great option for this.
Or maybe you want to just have a hybrid environment
of on-premise data center and cloud data center.
Direct Connect is awesome,
because it also supports both IPv4 and IPv6.
So now, let's just look at a diagram.
So, this comes straight from the AWS' documentation.
And so, here, what do we see here?
We see that in our VPC,
we have set up a virtual private gateway.
So just like before, when we set up a site-to-site VPN,
we also need the virtual private gateway,
so this doesn't change.
On the right-hand side now,
our customer networks, our data center is linked directly
to a customer or partner router,
and this is what we have to look at.
And this comes directly
from a AWS direct connection location.
So, there's a list of those.
And then this will be connected to a direct connection,
a Direct Connect endpoint.
And so this is a private link being established
and that we have to physically establish between our network
and this Direct Connect location.
And then it will use its own private link
directly into AWS' cloud.
And so as you can see, if you want to access EC2 instances,
we go directly into our VPC.
So this is a private connection right here,
and the green one is a public connection.
It still goes through Direct Connect,
and we get access, for example, to S3 or Glacier.
So this gives you an idea of how Direct Connect works.
We have to physically establish a new line of connection
between our customer, our data center
and a Direct Connect location.
Okay, and what if we want to connect to multiple VPC?
So, do we want to repeat this process for each VPC?
Well, the answer obviously is no.
In case you want to connect to multiple VPC,
you can use a Direct Connect gateway.
A Direct Connect gateway is if you want to set up
a Direct Connect to one or more VPC.
It could be in absolutely different regions,
but they have to be in the same account for now.
And, how does that work?
Well, we set up our Direct Connect connection.
And then, using a Direct Connect gateway,
we'll be connected to as many VPC as we want,
and each lock right here is a virtual private gateway.
So basically, here we're able to have one point of
connection for our customer's network,
which is a Direct Connect gateway,
and this is directly connected to many VPC.
The thing you have to realize though about this VPC,
must not have overlapping CIDRs.
So here, this CIDR and this CIDR are different,
so this works.
And, when you do a Direct Connect gateway, be very careful.
Even though it looks like this VPC is connected
to this VPC, they are not, okay?
The VPC are not peered.
This is not replacing a peering connection.
This is just allowing our own data center
to access both VPC at the same time.
This does not peer VPC, okay?
Very common question.
So any time you see at the exam,
"Oh, we need to set up a Direct Connect
"to many different VPC,
"or extend, you know, VPC to different region
"from our data center,
"then Direct Connect gateway will be the answer."
So, Direct Connect has two type of connection.
The first one is a dedicated connection,
and it comes in two flavors:
one Gigabits per second or 10 Gigabits per second capacity.
And, this is a dedicated connection,
and therefore,
you're going to get a physical ethernet port
that is going to be dedicated to you.
And so to get that port,
you need to first make a request to AWS,
and then once you have that port,
you need to contact an AWS Direct Connect partner
to establish that connection.
So you can expect this dedicated connection
can take a lot more time to do,
because AWS has to provision a port for you.
Otherwise, you can do a hosted connection,
and it comes in different flavors.
You have 50 Megabits per second, 500 Megabits per second,
all the way up to 10 Gigabits per second.
And, the connection request are made directly
via the AWS Direct Connect partners,
so you don't talk to AWS.
And the cool thing about it is that you can add or remove
capacity on demand.
So if you have a big migration to do,
and you know you're going to need
a better Internet just for a week,
you can ask for more capacity,
and then once you're done,
you can remove that capacity.
You get options,
which are one, two, five and 10 Gigabits
at some of the select AWS Direct Connect partners.
And for the other one,
you get either 50 Megabits per second
or 500 Megabits per second.
Now, the lead times for Direct Connect either way
are often very long,
when you first establish the first connection.
So, it's going to be longer than one month
to establish a new connection.
And so as the solution architect,
you need to ensure that the time requested
is going to be long enough in advance
before you transfer your data.
Okay, now let's talk about encryption.
So data in transit in Direct Connect is not encrypted,
but it is private.
It belongs to a private network
between you and the Direct Connect partner
and then the Direct Connect Partner and AWS.
So even though it's private, it is not encrypted.
Very, very important.
And so in case you need to have encryption,
you can combine Direct Connect with the VPN solution,
which provide you IPsec-encrypted private connection.
It's good if you want to have an extra level of security
by making sure everything is encrypted,
but it's slightly more complex to put in place.
And the diagram looks like this.
You have your own private installation,
and then you connect your customer WAN
to the Direct Connect location,
and you establish a VPN connection in between the two
to make sure that the traffic is encrypted.
All right, let's just have a look at the UI, how this works.
So as I said before,
we need to setup a virtual private gateway
for each VPC, if you wanted to set up Direct Connect.
So we would have to create one right here.
And then you go to Services.
This is a wholly different new service.
So it's called Direct Connect.
So this is not in the VPC side.
And, in Direct Connect, you click on Get Started,
and you give name a connection, for example, myconnection,
and then you set up a location you want to connect to.
So, these are all the connections
that I can connect to right now.
So, you have to basically establish a connection
to these things, and then after everything is set-up,
so I'm not going to do it right now,
but after everything's set-up,
we'll have a direct connection to this location,
and then we'll be ready to have Direct Connect
established between our AWS and our data center.
Now, as you can see here, there's Direct Connect Gateway,
and we could click Direct Connect Gateway,
and it says this allows you to use Direct Connect connection
to access your VPC in remote AWS' region.
So we can connect to different VPCs in different regions.
So, this is basically what we need to create
if we wanted to have one point of contact
for our Direct Connect solution.
All right?
So that's it.
We're not going to do anything,
because we don't have a data center on hand again,
but it's good to see it very quickly in the UI,
and I will see you in the next lecture.