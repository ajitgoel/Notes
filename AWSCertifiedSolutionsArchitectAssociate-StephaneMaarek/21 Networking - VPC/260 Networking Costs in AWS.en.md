
<v ->So now let's talk about Networking Costs in AWS</v>
per gigabyte, and this is a simplified version,
to make things as easy as possible
and to explain to you a few important concepts.
Now, networking cost in AWS can get very complicated,
but here is a high level review
and that should help you going into the exam.
So we have a region
and I've drawn two availability zones in this region.
Let's assume we have an in situ instance in the first AZ,
and so the first thing you should know that,
any traffic going into your in situ instances
is going to be free.
So any incoming traffic onto in situ is free.
Now let's assume we have a second in situ instance
and it is in the same availability zone.
Then in that case because availability zone represents
a set of multiple data centers
that are geographically located within one another,
then any traffic between your two in situ instances
will be free,
assuming that they are using their private IP
to communicate,
by using the private IP they will go over the network
that they are connected with.
So this is great.
So far everything is free.
But now let's include an in situ instance in another AZ,
and this time we want to have these two in situ instances
across two different AZ within the same region
to communicate with one another.
One approach would be to use a public IP,
or an elastic IP.
And if we do so, we're going to pay two cents per gigabyte
if using a public IP or elastic IP.
Why?
Well, because the traffic has to leave the AWS network
and go back in for our two instances to communicate
and so AWS will charge us for that.
Instead, if we are using a private IP,
then we're going to be charged half as less,
because we're now using the internal AWS network
to link between these two availability zones.
So a take away here is that
if you want to make your instances communicate one - faster,
and two - at a lesser price,
then use as much as possible the private IP
versus using the public IP.
Next, let's consider another region
with another availability zone,
in which case the traffic to go from one region to another
is going to be 0.02 dollar on the gigabyte.
So that means that the inter region traffic
can be quite expensive.
So what do we get as a take away from this
very simplified slide?
The first thing is that, you should use a private IP
instead of a public IP if you want have good savings, okay,
and better network performance
because you will automatically be onto the private network.
So one reason is, do not use the public IP
to communicate between two instances
in the same region into AZ.
The second thing is that if you have a cluster
that does some computation and does require a lot of
communication between your in situ instances
from one another,
then you may want to use the same availability zones
for a maximum amount of savings, okay?
That obviously these cost savings come at a cost
and the cost is that you're not highly available anymore.
That means that if your AZ goes down,
then you don't have any fill over available,
so here you have to balance between
high availability and cost.
And based on the question you will be asked in the exam,
you have to choose the right balance.
So typical example of that would be,
"Hey, we have an RDS database and we want you create"
"a read replica and do some analytics on top of"
"this read replica."
"How do we create a read replica"
"for the cheapest amount of money?"
Well, if you create that read replica in the same AZ,
then you're not going to be charged anything
to replicate one database to another,
in terms of network costs,
but if you create that read replica in another AZ,
then you're going to pay one cent per gigabyte
of direct transfer between the two databases.
And that's it.
So hopefully, that makes sense for how
networking costs in AWS works at a simplified level.
And I will see you in the next lecture.