
<v Instructor>Let's talk about a new type of service</v>
which is called AWS Resource Access Manager or RAM,
is actually a very simple service.
So it's allowing you to share AWS resources
that you own with other accounts.
You can share with any accounts or within your organization.
The idea is that you avoid resource duplication.
So what can you share with RAM or Resource Access Manager?
Well, you can share VPC Subnets, to allow you to have
all the resources lunch within the same subnets,
and they must be from within the same organizations.
And currently, though, you cannot share security groups
or the default VPC.
And then from this, the participants can manage
their own resources in your shared VPC.
But the participants cannot view, modify
or delete resources that don't belong to them.
So if they belong to other participants or the owner,
you will not see those.
So you share the underlying VPC
but you don't share the resources within the VPC.
Other resources you can share
but maybe won't be in the exam,
will be AWS Transit Gateway, Route53 Resolver Rules,
License Manager Configurations.
And as you'll see in the hands on right now,
there's a few more.
So let's have a look at a concrete example and use case
of how you would use Resource Access Manager.
So let's take an example of the VPC.
So we have AWS accounts, and it's going to be the VPC owner,
and we're going to create a VPC within that accounts.
And the VPC will have a private subnet,
where we deploy our resources.
And other accounts are going to be sharing the same VPC.
So account one and account two
are going to be sharing the same VPC,
thanks to Resource Access Manager.
So each account will be responsible for its own resources,
and cannot view, modify or delete other resources
in other accounts.
So the only thing that is shared here is the private subnet,
it's the networking layer.
So account one can create an EC2 instance,
and have an Application Load Balancer,
and they can communicate with one another obviously,
but they belong to account one.
And account two, the account that has the VPC owner
cannot see these resources.
Likewise, account two can create EC2 instances
within the account two, and account one cannot view
these EC2 instances.
And, for example, we can also create an Amazon RDS database
in our VPC owner accounts.
And again, this will not be visible to any other accounts.
But the network is shared, so that means that,
anything deployed in the VPC
can talk to the other resources in the VPC.
So that means that the application
can access each other using their private IP.
They don't need to access each other over a public IP,
and that could be a huge security benefits.
So even though on top of things,
we can even reference security groups
to have a maximum amount security across accounts,
so that means that if we modify the security group
of an Amazon RDS database to allow the security group
of our EC2 instances from account one,
then our EC2 instance, is going to be able
to access our Amazon RDS database
from the VPC owner accounts.
And if we allow again from the ALB in account one access
to the EC2 instances and account two,
then the EC2 instances in account two
can access our ALB directly using its private IP,
or private DNS.
And so this is extremely helpful,
because now we have shared an entire networking layer
across multiple accounts,
and we have simplified a massive challenge,
which is how do we make these resources talk to each other.
So in the console,
let's type Resource Access Manager or RAM.
And then I'm going to create a resource share,
and as you can see, we can share resources
with other accounts, these resources shared by me,
and then shared with me, so it makes a lot of sense.
Let's create a resource,
I'll just call it MyFirstResourceShare.
And then what can I share?
Here we go.
It could be an Aurora DB Cluster, Capacity Reservations,
CodeBuild Projects, Dedicated Host, Image Builder,
License Configurations, Resolver Rules,
Resource Groups, Subnets, Traffic Mirror Targets
and Transit Gateways.
But from an exam perspective,
I think the most likely thing you're going to be tested on
is going to be VPC Subnets.
So as your subnet, and right now
there's no resources found, that's because I don't have
a subnet that is not belonging to the default VPC.
So this is why we can't find anything.
So it's not going to be very fascinating,
but as you can see, I could have shared subnet if I had one,
and then I scroll down here is principles,
which is optional, which is okay, which accounts
should have access to my subnets that I've selected.
And so it could be external accounts.
And we can look at account number, OU or organization.
So it makes a lot of sense again.
And finally, we can tag this resource here,
and you'll be done.
And once this is done, then we'll have to accept it.
The other accounts will have to accept
that resource share in here, and they can start using it.
A very simple service, is not gonna be very complicated
at the exam, if you see sharing a VPC subnet,
think Resource Access Manager.
All right, that's it.
I will see you in the next lecture.