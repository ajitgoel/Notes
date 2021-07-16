
<v Man>So this was a long section,</v>
I know
and it is so important for you to master all of this.
So now you should see this diagram and say,
"Ah, it kinda makes sense!"
If it doesn't, that's okay.
What I asked you to do is to sit a little bit
for a few days on it and then redo the section again.
It's super important,
it took me forever
for me to understand all of this
and to make sense of it.
And even sometimes I have to go back to this diagram
and really make sure I understand things correctly.
So, super important for you to know all these things.
Now, I'm just going to summarize
everything we learned in this section
to give you a higher level view,
so let's get started.
So we started by CIDR and CIDR as an IP Range
We've seen CIDR for IPv4 and how to express it.
Then we defined our VPC.
VPC stands for Virtual Private Cloud
and we could define a list of IPv4 and/or
IPv6, CIDR arranged as we need it.
Then we created subnets
and subnets are tied to one specific Availability Zone
and then within the subnets, we define a CIDR
where our instance would be defined.
Then Internet Gateway, we created one of the VPC level
and that was used to provide IPv4 and IPv6 Internet Access,
but that Internet Gateway did not work on it's own.
We had to also edit the Route Table to add routes
from the subnets directly into the Internet Gateway
based on the CIDR rule.
Then, once we had Internet Access,
we wanted to provide Internet Access as well
for private instances,
and this was done using a NAT Instance.
The NAT basically gave Internet Access to Instances in the
private subnet,
but the NAT Instances is the old way of doing things.
We need to manage a CIDR entirely on our own
and also disable the source destination check flag.
Instead, we saw a better solution,
which was the NAT Gateway.
The NAT Gateway is managed by AWS,
it provides scalable internet access to private instances,
but the thing is, it's only for IPv4.
Then, we went on and defined Private DNS settings
and Route 53,
so we created private zone in Route 53
and we saw that this private zone would only work
if we enable DNS resolution
and DNS hostname at the VPC level.
And we saw that one setting was not enabled right away,
so we had to take that box.
Then, we looked at Network ACL
and we saw that they were stateless
and that they were subnet level rules
and they were going to filter inbound and outbound traffic
and when we defined Network ACL,
we saw that we shouldn't forget ephemeral ports,
otherwise some traffic would not go through.
Then, Security Groups, we already knew them,
but now with their stateful,
that means that if a traffic can go in,
automatically the response can go out
and this time the security group operate
at the EC2 instance level,
so they're more like the second-line of defense.
So, if you want to set up a more global firewall,
Network ACL would be the way to go.
Then, we went a bit more down the trenches
and we looked at VPC Peering to connect two VPC
and they need to have non overlapping CIDR.
And we saw that VPC Peering is non transitive.
That means that if you peer A and B and B and C,
A and C cannot talk to each other
until they've also peered A and C.
We looked at VPC Endpoints
and that was to provide private access to AWS Services
such as: S3, DynamoDB, CloudFormation, SSM, within our VPC
so with that, the help of an Internet Gateway.
And we looked at VPC Flow Logs.
Basically, that can be setup
either at the VPC, Subnet, or ENI Level
and we can filter for ACCEPT or REJECT type of request
and this will help us identify attacks
and we can analyze this using Athena because data
will be in S3,
or using CloudWatch Log insights
if the data is in CloudWatch.
Now, Bastion Host, they were public instances that
we would set up in our public Subnets
and we would be able to SSH into those
and then these public instances would have SSH connectivity
directly to our private subnets
and this is why it's called a Bastion Host.
Site to Site VPN which was how do we connect our data sensor
directly onto the VPC
and make it seem like they're part of one network
and for this when you set up a Customer Gateway
on our Data Center, a Virtual Private Gateway on the VPC,
and then we can link them to using
a site-to-site VPN connection.
But this one is over the public internet.
As an alternative, more expensive,
but it's a Direct Connect,
where we also setup a Virtual Private Gateway on VPC
and this time, we establish a direct connection
to an AWS Direct Connect Location,
so we have to actually set up the wire
between our Data Center and this location,
but then we would have a Private Connection directly
into AWS' Network.
And then, if you wanted to do this,
but on many different VPC,
then, instead of setting up many different Direct Connect,
we use Direct Connect Gateway,
and basically that helps us connect to many different VPC
in different regions.
But, this is not the same as VPC Peering, be aware of it.
Finally, we wanted to provide NAT Gateway Facilities,
but for IPv6, we would use an Egress only Internet Gateway.
And this would allow us to basically provide
our IPv6 Instances Internet Access while making sure they're
not Internet reachable.
Then we saw Private Link,
which is also called VPC Endpoint Services,
which allowed us to connect privately our services from
a service VPC to a customer VPC
and it doesn't need VPC peering,
it doesn't go over the public internet,
it does not use NAT gateway,
it does not use route tables,
so it's very elegant
and to use it, we must have a Network Load Balancer
and an ENI.
We've seen ClassicLink to connect an EC2-Classic Instances
privately into our Amazon VPC,
which is, by the way, a deprecated service.
And we've seen VPN CloudHub
to create hub-and-spoke VPN model
to connect your own private site
through the public Internets.
So, that's it for this section,
I hope you enjoyed it,
in the next section, we'll just do the clean-up.