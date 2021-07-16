
<v ->So, in this lecture</v>
we are going to talk about AWS Private Link,
but before we do so I want to expose the problem to you.
So the problem is, we have VPC in our accounts
and we have a service we created our application in.
And we want to expose that application
to other VPCs in other accounts.
So option number one is to make our application public.
If we do so, maybe we create an application balancer
we make it public, and so all the traffic
will go through the public internet
and it's a bit risky, it's tough to manage access.
You need to manage firewall rules.
But that works, so we have our Service VPC
with our Application service.
And we have a bunch of Customer VPC
that have an internet gateway to access the internet,
and overall we expose our application publicly.
It goes over the public internet, and that works.
But the problem is, it's public.
It's not great.
Option two, is to do VPC peering.
We've seen this before.
So in that case, we must create many peering relations
between all the Service VPC and the Customer VPC.
And when you do a peering connection,
it opens up the whole network.
Not just the one application we've created,
but every single application in our VPC
will be networkly accessible from the other VPC.
So that works but doesn't really sell
So let's have a look.
We create a peering connection here,
another one here,
and another one here.
And it's a little bit difficult, right?
So this is not great solutions that work.
They definitely work, but they are not great.
And so, AWS came up with this genius way of doing so.
So it's called AWS Private Link
and it's also called VPC Endpoint Services.
So to me, it is the most secure
and scalable way to expose a service.
Not to one, not to 10, but to thousands of VPC
either your own, or from other accounts.
And this solution does not require VPC peering,
does not require an internet gateway or NAT or route tables.
It requires nothing of that.
So let's have a look to see how it works.
We have our Service VPC,
and we have our Application service
and we want from, to access it,
from a Customer VPC, which has Consumer Applications.
So how do we do this?
We have to create a Network Load Balancer,
or NLB, in the Service VPC and we have to
create the corresponding ENI in the Customer VPC.
So let's have a look.
We create our Network Load Balancer,
and our Elastic Network Interface in the Customer VPC
and now we have to link these two things privately.
Hence the name Private Link.
So here we go. Boom!
So we have Private Link in the middle
that's going to link the Network Load Balancer
and the Service VPC to the ENI and the Customer VPC
and these two are going to talk to together for that link.
That is going to be private, to within the AWS network.
So no VPC peering is required.
It doesn't go through your public internet.
You don't update any route table.
The ENI in the Customer VPC makes it look like
the application in the Service VPC is within their network.
So I think it's really awesome, it's really genius.
And on top of it, cherry on the cake.
If the NLB is in multiple Availability Zone,
and the ENI is multiple AZ,
then our solution is absolutely fault tolerant
which I think is great.
So to create a Private Link, or an Endpoint Service
we have to go on the left hand side to Endpoint Services,
and click on create Endpoint Service.
And here, we have to select a Network Load Balancer
within our account, to associate this service with.
So we don't have one right now,
but we will need to create a Load Balancer,
a Network Load Balancer, and then we'll be all good.
Then we have some settings to configure,
but we're good to go and then we would create the service.
I'm not going to do this.
I just want to show you the process.
Once we have created that Endpoint Service,
we need to go to Endpoints and create a new Endpoint
and this will be in the target VPC, obviously
maybe in other accounts,
And instead of choosing AWS Service,
you can select the Find Service by name,
and here you enter the private service name
and you would verify it.
And this will be how to get access
to a Endpoint Service from here
and we will create an ENI and we will be good to go.
This is very simple and I really like
the beauty of the solution,
of how we can link our services together
through a private link.
So in the exam, if you see any question that ask you
to expose services from one VPC to another-
hundreds of VPC,
think Private Link and remember this diagram
and hopefully you will get the answer right.
All right, that's it.
I will see you in the next lecture.