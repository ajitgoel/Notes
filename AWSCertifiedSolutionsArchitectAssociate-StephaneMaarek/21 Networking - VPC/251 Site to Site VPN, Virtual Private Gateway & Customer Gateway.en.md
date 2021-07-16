
<v ->So we are almost complete with this diagram</v>
and the last thing we have to do
is to connect our corporate data center.
So this is where you have your own infrastructure,
your own computer to the AWS cloud somewhat directly or not.
So, the idea is that, to do site to site VPN,
this will establish a Virtual Private Network
that will basically make it seem like your corporate network
and it uses Cloud VPC, our part of the same network.
For this, how does that work?
Well we have to create a customer gateway onto
the corporate DC and this is something you have to set up.
It could be software, it could be hardware.
There is a list on the AWS website around what's possible.
And then on the VPC side we'll
provision what's called a VPN gateway
and once the VPN gateway is provisioned,
in between the VPN gateway and the customer gateway,
we will set up a site to site VPN connection
that will basically link the two
and our VPC and our corporate DC
will be able to talk to eachother.
Okay, as for the theory, it's really simple
and there is no hands-on because we don't
have a corporate data center at our disposal
but you just need to get the idea.
Customer gateway is on the corporate data center side.
VPN gateway is on the VPC side
and site to site VPN connection links the two together.
So, Virtual Private Gateway is called the VPN concentrator
and you set it up on the AWS side.
And the Virtual Private Gateway, so VGW,
will be created and attached to the VPC from
which you want to create the site
to site VPN, so it has a VPC level.
You can customize the ASN if you know what that means
and then for customer gateway,
then it's the software or physical device
on the customer side, so on your
corporate data center side of the VPN connection,
and there's a list of all the devices
that AWS has tested here at this URL.
So I invite you to look at it in your own time
and for the IP address of your customer gateway
I think that's a very important part for the exam
it's either the static internet-routable
IP address for your customer gateway device.
So it will have a static IP address.
Or, if it's behind a NAT, okay if it's behind a NAT,
and that you have NAT-T enabled then instead of
using the public IP of your customer gateway,
you need to use the public IP of the NAT.
Now make sure that NAT in this case
is not the NAT on Amazon side,
it's the NAT on your network side.
So if you have set up a NAT on your network,
and your customer gateway is behind that NAT,
then use the public IP address of the NAT
instead of the customer gateway.
That's all you need to know but it's super
important going into the exam.
Now let's look at the UI just to make this rock-solid.
So to set up a VPN connection,
we have to go all the way to the bottom here
and look at Virtual Private Network
and here we can set up customer gateways,
Virtual Private Gateway and site to site VPN connection.
So let's go one by one.
Customer gateway is what you set
up on your own side, okay?
It's something you have to set up
so if you know customer gateway we've tested,
this is what you type into Google, AWS,
and it will give you a list of all
the customer gateway devices they've tested.
So all these things have been tested
and you can set it up in your own infrastructure
and that will set up a customer gateway.
And then once you have that,
you create a customer gateway in AWS,
you give it a name, you say whether or not
it's a static or a dynamic routing
and you put the static IP address, okay?
And as you can see in the information box here
it says, specify the internet-routable
IP address for your gateway's external interface.
It must be static and it may be behind a NAT, okay?
And if you have the NAT then put
the static IP address of the NAT.
Okay, cancel.
And now well that we have a customer
gateway that has been created, okay?
We set up a Virtual Private Gateway
and we click on Virtual Private Gateway.
We give this a tag, so whatever you want, DemoVPG, yes
and then basically, or VGW, and then basically
here you can either set the Amazon default ASN,
or you can set up a custom ASN.
This is more details, this is when
you really know what networking is.
And then once you're done you have a customer gateway
and you have a Virtual Private Gateway,
and here you set up a site to site VPN connection
so you create the VPN connection, you give it a name.
Then you have to select Virtual Private Gateway.
Then you have to select a Customer Gateway
and then basically you set up tunnel instructions.
First thing you have two tunnels
to have some kind of redundancy and you're done
and then you have a VPN connection between the two.
Now obviously, you see I haven't
created anything because I don't have
a corporate data center available to me,
but this is the process, what you have to remember
is that to create a site to site VPN connection,
on your corporate data center side,
you need to set up a customer gateway,
and on your AWS's side, you need to
set up a virtual private gateway
and then you connect the two using
site to site VPN connection.
So that's it for this lecture,
just a bit more architectural,
less hands-on but I hope you liked it
and I will see you in the next one.