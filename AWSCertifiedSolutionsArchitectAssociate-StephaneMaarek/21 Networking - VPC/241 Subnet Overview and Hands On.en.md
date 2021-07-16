
<v Instructor>So next, here comes a time to add subnets.</v>
Now, subnets are going to be tied
to specific availability zones.
In this diagram, I'm just showing AZ but in practice
we'll do two AZ just to have some kind of high availability.
So within each AZ, our goal is to create different subnets.
And so we'll create a public subnet and a private subnet.
And we'll see how to make one public
and how to make one private in a future hands-on.
But for now, basically we'll create two subnets
per AZ that will give us four subnets
and some of them will be public
and some of them will be private.
Let's get started.
So coming back to this, we're going to go to subnets,
and in subnets, we're going to be able to define subnets.
So, the trick is we're going to define public subnet
and private subnets, and we're going to make them
different size because usually a public subnet
is much smaller than a private subnet
because in a public subnet you would put your
load balancers only, where as in the private subnet
you would put all your applications et cetera, et cetera.
So let's go ahead and just create a first subnets.
This one, I'll call it public subnet A
because it's going to be an AZ A.
And the VPC I'm going to choose as my demo VPC
and It looks like we have this CIDR right here
that's available for us so 10.0.0.0/16.
Now the AZ as a preference we'll choose
eu-West-1a
and the IPv4 CIDR block
while it's up to you but I'll just choose 10.0.0/24
and that will give us 256 IP
so I'll keep this and if we can check again
that CIDR block right here
we can calculate it and see that it started with 10.0.0.0
and ends at dot 255 so 256 IP that's good.
So I'll keep this and say create.
And this is our first sub nets which worked
and now I'll create a second subnet called public subnet B
we'll choose the same VPC and then in terms
of AZ I'll put it in eu-west-1b.
The IPv4 CIDR block will have this one,
but this time I'm going to increase the third IP to one
because remember this last IP we had was 10.0.0 dot 255.
So the next one is going to be one in here.
So I'll choose this one and this is going to be good
we have a public subnet B thatt looks perfect.
So the subnet was being created.
So here we go. Now we have to subnets
so we can filter by VPC
in here so we can filter by the demo VPC.
Sorry, let me refresh this page to show you.
We're in the subnet right here
and here you can filter by demo VPC
and just see the subnets you created.
So we've created two public subnet
and I'm going to create a private subnet.
So private subnet A and this time
for the AZ I'm going to eu-west-1a but the CIDR block
I'm going to make this much bigger,
but I will choose 10 dot zero dot 16 dot zero slash 20.
And if you go and just type this out,
it's just me deterimined this ahead of time so.
If you're going calculate this
this gives you the first IP to be 10 zero 16 zero
and the last IP to be 10 zero 31 to 255
and that's about 4000 IPs so that's perfect.
I'll create this as my private subnet A, create it.
And finally I'll create a last subnet
so I'll create my private subnet B
and the AZ is going to be eu-west-1b and the CIDR block
I'm going to increase from 16 to 32
because the last one I had right
here was 31.255 so that's perfect.
Click on Create and here we go.
So now we have created four subnets
and there are different a size
my public subnets have way less IPs
so its slash 24 slash 24.
Whereas my private some that's have slash 20
which is about 4000 IPs and I've created them in to AZs
so that we have some kind of high availability
but so far we have defined nothing
so that one is going to be private
and was going to be public.
We don't know how this works yet
and we'll see this very, very soon.
So one last thing we notice
is that the number of available IP
is not really what we expect it to be.
For example, when we have a slash 20,
we expect 4096 IP, and we get 4091
and when we have a slash 24,
we expect 256 IP, but we get 251.
So this is a bit odd, right?
It seems like there's a number of five
as a difference between the available IPS
and the provision IPs.
So why is that?
Well, AWS will reserve five IP addresses
the first four and the last one in each subnet.
And so that means every time you create a subnet
you're going to lose five IP addresses.
These five IP addresses will not be available
and cannot be assigned to an instance
and for example, if you get a CIDR block of 10.0.0.0/24,
the reserved IP is going to be the first one
for the network address,
the second one reserved by AWS for the VPC router,
the third one for the mapping
to the Amazon-provided DNS,
the fourth one is for future years so it's not us just yet.
And the last one is the network broadcast address
but because AWS does not support broadcast in a VPC,
then the address is reserved and you cannot use it anyway.
So there is very common exam questions.
And here's an exam tip and it says,
Oh, we need 29 IP addresses for EC2 instances.
What subnet size can you choose?
Well, you cannot choose a subnet size of slash 27
because that is 32 IPs.
What you need to do is select the subnet size of slash 26,
which will give you 64 Ips
because if you do 32 minus five, you get 27.
And that's is less than 29 IP addresses
required for your EC2 instances.
So there is a are very, very common exam questions
and now you're ready for it.
So hope that's good.
I will see you in the next lecture.