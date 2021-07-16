
OK so in this lecture we are going to talk about transit Gateway which is a newer type of offering from
AWS that the exam where start your test you on at a high level.
So when we have a complex VPC setup we have multiple VPC across multiple accounts and they may
be connected for example to our on premises infrastructure.
We get a very complex network topology.
For example we have to create multiple VPC peering connections machine all over Amazon VPC because it
is not a transitive type of connection.
We also have to create a VPN connection for each different customer Gateway and include a VGW.
We also have to include a direct connect connection maybe if we want to have a private and reliable
secure connection alongside a VPC Direct Connect Gateway if you want to connect to multiple VPC.
And so what you get at the end is a very complex network about topology and you get very complex route tables
and this gives us the kind of diagrams we have right here.
And so because this network topology can grow so complex AWS has introduced the transit gateway.
So the Transit Gateway is to have a star gateway a star connection between all your VPC and your on premises
infrastructure.
So the way it works is like this you have all your VPC connected to the transit Gateway.
You also have the direct connect to Gateway directly connected to the transit Gateway and any VPN connection
will be terminated into the transit gateway.
And what we get out of this is a bunch of star connections that are transitive.
So now all the things connected to the transit gateway if set up correctly can connect with one another.
And so that simplifies your network topology a lot.
The transit Gateway is a regional resource but it can works cross region and you can share it across
accounts using the resource access manager or RAM you can peer transit gateways across regions which
is very helpful.
And using the route tables defined in the transit Gateway you can define which VPC can talk
to each other or which VPC can talk to your on premises infrastructure and so on.
It works with Direct Connect Gateway and VPN connections so it works with pretty much any kind of network
connections into it or us.
The cool thing is that it supports ip multicast which is not supported by any other.
It be a service and that's something you can be tested on.
And so that means is that if you see a question that says okay we need to have to support IP multicast
in our AWS infrastructure you would have to use a transit gateway.
So it's very simple at a high level you just need to remember what it does which is to create a star
network across all your VPC and your on premises infrastructure.
And this is the only thing the exams should test you on.
But let's go in the console to see how we can set it up.
So we are not going to go all the way through sending up a transit gateway but I want to show you the
pricing and where the options are in the console.
So the Transit Gateway is not free.
It is something you have to pay per attachment.
So one attachment for example can be a VPC.
It could be a Direct Connect Gateway.
It could be a VPN connection.
So you have to pay five cents per hour for each attachment in us-east-2 for example
And you also pay per amounts of network of data processed so for each gigabytes of data that goes through
your transit Gateway you're going to pay two cents.
So you can get quite expensive very quickly.
And then if you go to the VPC at the very bottom left of your menu you will find the transit Gateway
menu and I don't want to go deep into it because this is not something you need to know for the exam
in depth maybe something for the network specialty but you can create a transit Gateway like this you
would add a name you would define an ASN number and you would enable some default route and DNS support
although this is very advanced I'm not going to go over it a long time and then you will create the
transit Gateway and you start being billing for its automatically for each attachments.
And so then afterwards you would manage your attachments in this menu right here where we can create
different attachments.
And this attachment can be either a VPC or VPN or a peering connection between for another transit gateway
for example and then you would define your route tables to allow how each of these attachments can talk
to each other.
And finally you have the network manager option and this allows you to centrally manage your network
across.
It was an on premises to visualize all your network in the central dashboard and understand how things
worked for your network topology which is quite handy.
OK.
And then finally as I said if you go to resource access manager in resource markets manager in RAM you
are able to share your transit gateways.
So if we go to resource share and create the resource share here we are able to find a transit Gateway
and so we can share transit gateways across multiple accounts.
So this that is going to be very high level overview you already know more than enough for the transit
gateway.
Just remember that is just how it simplifies a network topology and you should be all good for the exam.
All right.
That's it.
I will see you in the next lecture.