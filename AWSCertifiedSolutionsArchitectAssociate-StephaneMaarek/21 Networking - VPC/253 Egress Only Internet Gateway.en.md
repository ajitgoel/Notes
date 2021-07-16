
<v Instructor>Let's talk about</v>
Egress Only Internet Gateway.
So egress means outgoing,
and outgoing only internet gateway
kind of hints at what it does.
But, let's be very, very clear.
Egress Only Internet Gateway
works only for IPv6,
so if you have an IPv4 instance,
that does just not apply to it.
So an Ingress Only Internet Gateway
makes us think of a NAT.
But NAT is for IPv4.
So Egress Only Internet Gateway
is the same as a NAT, but for IPv6.
They perform the exact same function.
The NAT allowed our private instances
that had an IPv4 to access the internet.
An Egress Only Gateway will basically
allow our IPv6 instances to access the internet,
but not being accessible.
Why do we need this?
Well it turns out that all IPv6 are public addresses,
so there's not private range of IPv6.
For this for private ranges, we'll still use IPv4.
So as soon as your instance is an IPv6,
it has a public address and it's publicly accessible.
So that's not because what if we don't want
all our IPv6 instances to be publicly accessible?
Then we set up an Egress Internet,
Egress Only Internet Gateway
and that gives all our instances with IPv6
access to the internet so we can still Curl Google.com
or whatever, but the internet cannot directly
reach our instances.
So we effectively make them sort of private, okay?
And after you create an Egress Only Gateway,
to make it work, you need to edit the Route Table.
So let's quickly see how this works in the UI.
So for this, I'm going back to Services, VPC,
and in there I go to Egress Only Internet Gateways,
and Create Egress Only Internet Gateway.
Now I need to just select a VPC
so I'll select my DemoVPC,
and here we go.
My Gateway has been created.
So if you go here, the Gateway has been created
and it's attached to your VPC,
but to make it work basically you would need
to open a Route Table.
So you can choose whatever Route Table you want,
for example, we can choose, let's select our DemoVPC.
We'll just choose the main Route Table for now.
So click on Route, Edit route, Add route,
and then ::/0 which represents any IPv6.
The Target is going to be Egress Only Internet Gateway,
and this one, save the route,
and we have basically added an outbound route for IPv6.
This is an IPv6 address for presenting anything.
So it's like 000/0 but for IPv6
and the Target is going to be the internet,
the Egress Only Internet Gateway.
So that's it, that's all you need to know.
We're not going to create an instance with IPv6.
I still think this is very new at the exam.
But you need to know
what an Egress Only Internet Gateway is anyway.
Well that's it for this hands on.
I will see you in the next lecture.