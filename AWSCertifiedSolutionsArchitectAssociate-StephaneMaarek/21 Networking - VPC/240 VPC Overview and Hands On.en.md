
<v Instructor>Now let's go ahead</v>
and create our own VPC.
So VPC stands for Virtual Private Cloud
and you can have multiple VPC in a region,
up to five of maximum.
But there's a soft limit,
so you can place an AWS support ticket
and then they will increase that limit for you.
And each VPC can have up to five CIDR.
For each CIDR, the minimum size must be slash 28,
so 16 IP addresses,
and the maximum size is slash 16,
so 65,536 IP addresses.
Because VPC is private,
only the private IP ranges are allowed.
So just as a reminder,
we get this range, 10.0.0.0/8,
we get this range, 172.16.0.0/12,
and then finally, the home network IP address,
so 192.168.0.0/16.
And the really interesting thing is
that when you do create A VPC,
the CIDR you choose should not overlap
with your other networks.
For example, if you have a corporate network,
and you're on 172 dot something,
then make sure when you create a new VPC,
that there is no overlapping IP ranges
because when you start connecting all of those together,
you wanna make sure
that the IPs are not going to be overlapping.
So there's enough IPs in this world
for you to choose non-overlapping CIDR,
just be very careful with it.
So if we look at the state of the Hands On,
this is what we'll have at the end.
Within the AWS cloud, we will have a VPC with nothing in it.
So lets' get started.
So the really easy way to get started with a VPC would be
to Launch VPC Wizard,
but then that would defeat the whole point of learning,
so we are going to create a VPC manually
without the wizard
and it's actually going to be better.
So we'll create a VPC
and for this, we'll go into Your VPCs, and Create VPC.
The nametag will be DemoVPC.
And here we have to choose an IPv4 CIDR block.
So for this, we'll choose 10.0.0.0/16.
That's the biggest IP CIDR block we can choose.
If we do slash 15,
there will be a problem because the block sizes must be
between slash 16 and slash 28.
So slash 16 is a great idea.
And if we wanna know what slash 16 means,
we can go back to our website, CIDR to IPv4 Conversion,
type in the CIDR, and we see
that the first IP is going to be 10.0.0.0 slash 0,
and then the last one is going to be 10.0.255.255.
So that's 65,000 IPs.
All right, great.
For now, we're not going to do IPv6,
so we'll leave no IPv6 CIDR block off.
And the tendency is, basically,
how we launch EC2 instances within it.
Do we want default, which means shared hardware,
or dedicated hardware?
And this one was inherited
by when you create an EC2 instance.
So we'll select Default,
we don't want to have dedicated hardware,
otherwise, we'll pay a whole lot more money.
Click on Create.
And our VPC has been created.
And if we look at our VPC,
it looks like there's one CIDR block
that has been defined.
So the CIDR block is right here,
Flow Logs, there is nothing,
Tags, there is nothing.
But it looks like when we created that DemoVPC,
it comes with a Main Route table
and a Main Network ACL that have been created for us.
So what can we look at this.
Well, the one thing I want you to notice is
that we're not limited to just this IPv4 CIDR block.
If you wanted to, you'd be able to edit your CIDRs,
by clicking on Edit CIDR.
And here, we're able to add IPv6 CIDR
if we wanted to later on or add IPv4 CIDR.
So if you wanted to add a CIDR for IPv4,
you could definitely do 10.1.0.0/16,
which is the next CIDR,
and then you click on Yes,
and it automatically would associate that.
So you can add up to five VPC IPv4 CIDR in there
to extend your VPC size over time.
For now, I don't need to add this one,
so I'll just remove it,
but I just wanted to show you how this were to work
if you wanted to add more CIDRs to your VPC.
So that's it, right now, we just have a VPC,
it's basically a big container.
We haven't defined any subnets, but guess what?
We'll do that in the next lecture.