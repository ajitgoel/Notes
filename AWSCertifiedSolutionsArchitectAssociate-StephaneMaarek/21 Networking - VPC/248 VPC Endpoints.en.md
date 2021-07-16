
<v ->Okay so our diagram is getting fuller</v>
and fuller by the day.
So now let's talk about how do we talk
to AWS services.
So as we know DynamoDB, CloudWatch, S3,
these all within the AWS cloud.
Although if we want to access those right now
from a private EC2 instance,
what we need to do is have that EC2 instance
talk to our VPC NAT gateway
and then to the internet gateway,
and then all of a sudden
there is a internet route
through the public internet,
directly into, for example, DynamoGB.
And that is problematic, because we'd like
all this traffic to remain private,
because DynamoDB after all is a service offered within AWS.
So enter VPC endpoints, right here.
And so VPC endpoints are meant
for you to access AWS services
within a private network.
So how does that work?
Well, with the VPC endpoint,
it'll create maybe an endpoint to S3
or an endpoint to CloudWatch.
There's ways to create endpoints
to many different AWS services.
And our instance is, through some route table
we'll be able to, for example,
from a private subnet, access directly
that endpoint and talk to our Amazon S3
or Amazon CloudWatch service privately.
Which is really cool, but it's something
we have to set up directly.
It is not something that's available out of the box.
So VPC endpoints allow you to connect to AWS services
using a private network instead of the public internet.
They will scale horizontally and are redundant,
so it's really good.
And they remove all the need
to set up an internet gateway, a NAT gateway, et cetera
to access all these AWS services.
So there's two kind of VPC endpoints,
there is the interface VPC endpoints
to provide an ENI, and that's a private IP address
as an entry point, and we must
attach a security group to it.
That is how most AWS services work.
And then there's a Gateway to provision a target
and it must be used in a route table.
For example, S3 and DynamoDB are the two services
that require a VPC endpoint to gateway.
Don't worry we'll see this in the hands on right now.
Now in case of issues, two thing to check.
You need to check the DNS setting for resolution
in your VPC, so we've seen this before.
And the other thing to check if you have a gateway,
you need to check the route table
to make sure that the traffic doesn't decode
straight into the gateway.
Alright, let's have a go at this.
In this lecture, we'll set up S3 as a gateway.
And so for this, we just need to do a few bits of set up.
So in the first one, we're going to go through our
EC2 instances, and we're going to go to a private instance.
And this one we're going to sign to it
an IAM role that has access to S3.
So I'm just going to quickly go into IAM
to create a role that has full access to S3.
So for this, I go to roles, in here,
I'll create a role for EC2,
and click on next permissions,
then I will search for S3,
and it'll say Amazon S3 full access as a great policy.
Next tags, next review, then I'll call it
S3 full access, and click on create role.
Okay the role has been created,
so now I can go back to my EC2 instance
and I can right click on it.
I can go to instance settings,
attach/replace IAM role,
and here we type S3 full access,
and we apply it.
Okay, so now let's SSH into our,
did I assign to the wrong one?
No I assigned to the right one,
so this one, okay.
So now let's SSH into this private IP.
So for this, we'll do the SSH commands
on my instance on the right hand side.
I can remove this one, we don't need it.
So we're going to SSH into our private instance
from my public instance,
and press enter and here we go, we're in it.
And so if I do AWS S3 LS,
I should be getting an answer from it.
It says here are all the buckets
that are available for me.
So this works right,
but now what we're going to do
is we're going to completely cut off
the internet off of the instance.
So let's go to our private route table,
and now we're going to remove the destination as a NAT,
because we want to remove internet access.
So I save the route and here we go.
Now our instance doesn't now have access to the net,
and so if I do AWS S3 LS again,
now it just times out, it cannot access
to S3 service over the public net.
So now let's solve this problem
using a VPC endpoint.
So for this, I'm going to go to endpoints,
and I need to create an endpoint.
Okay this is great.
I need you to select service categories,
so it could be AWS services or marketplace services.
For now the only thing we need to do really
is to go into S3.
And so let's look at this first.
These are all the AWS services,
so you can see there's a lot of them,
and some of them are interface,
actually most of them are interface,
but S3 ends another one.
Up there sorry.
DynamoDB is a gateway.
So these two are going to be gateway set up,
and the other ones could be interface set up.
So let's look quickly at, for example, interface set up.
So let's look at cloud formation.
When you do an interface set up,
you have to define in which subnets your endpoint
is going to live, and then
whether you want to enable private DNS name.
And for this it says, if you do enable this
ensure that enable DNS host name and enable DNS support
are set to true in your VPC.
So that's a very common troubleshooting question.
And then we need to assign a security group
to this endpoint.
But we're not going to do this
for cloud formation right now.
What we're going to do is go straight
to S3 and set up a gateway. So when you set up the gateway,
it's a little bit different.
You need to select your VPC,
so we'll select our demo VPC.
And this will basically create a rule
with a destination pl will be added
to the route table you select below.
So let's select the route table we want,
and we want to have our private route table.
So that's this one.
And then I knew it because
if I hover over the subnet,
it says private subnet A and private subnet B.
So I'll click on this route table,
and in this route table automatically
they will get updated with rule to this destination,
which represents Amazon S3.
And they will go through this VPC endpoints.
Okay policy is full access.
This is if you want to control
and restrict access to the VPC endpoints
in some ways, so we're not
going to go over this right now.
And click on create endpoints
and the VPC endpoint has been created.
So if you look at it,
it looks like it's pointing to the S3 service name.
It's available. It's a gateway type of endpoint,
and it's in our demo VPC.
And if you look at our route table,
it's associated with this route table ID
that is associated with two subnets.
Now the tricky bit here is if you look
for this route table ID.
Go back to route table
and look for it. So we'll filter.
Press enter and go to routes.
As we can see, now we get to have the target
of this destination, which is basically our endpoints
into the VPC endpoints.
So really, really cool.
Now it says anytime you hit this URL,
these CIDRs, basically,
which are the Amazon S3 CIDRS,
then go to this targets.
If you wanted to edit the route,
you could basically add a route,
but you could not directly change this one
in this UI.
What you would have to do to change this one
is go back to your endpoints and in there,
in your route table you would have
to manage it from here.
So now let's look at,
see if it works.
So remember this instance does not
have access to the internet.
For example, if you go to google.com,
it's just does not work.
But let's do Amazon S3 ls,
and as we can see things don't work.
So the trick is here that because we use
the AWS CLI the default region of the AWS CLI
is US east one.
But, if we go back to our VPC endpoint,
it was provisioned for eu west one,
so very important thing to remember
is that when you do run these commands,
make sure you do select the region
that you're in too. So eu west one. And now if I do this,
this will talk to the Amazon S3 endpoints
in the region eu west one
and then it works, and I get the results from it.
So very, very important to understand that,
because it could be a trick question as well
at the exam.
So that's it.
As we can see, our private instance
does have access to S3 in the region eu west one,
and still cannot access google.com.
So it could be a way to make your private subnets
and give them access to some sort of AWS services
without giving them full access to the internet.
So that's it for this lecture.
I hope you've enjoyed it,
and I will see you in the next one.