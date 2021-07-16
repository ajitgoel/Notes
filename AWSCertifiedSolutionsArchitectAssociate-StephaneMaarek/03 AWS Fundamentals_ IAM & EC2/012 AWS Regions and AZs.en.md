
<v Narrator>So let's get started with AWS,</v>
but we have to start with AWS Regions.
So, AWS is a global cloud provider,
and therefore it has many data centers all around the world.
And these are called Regions,
and so all these regions around the world
can be seen on this map in the bottom of my screen.
The blue dots are the regions that exist today,
and the orange ones are the ones that are coming soon.
So the regions are each of them a set of data centers,
and we'll see how they're structured in a second.
And so there's a naming convention for the regions
and usually it can be us-east-1, eu-west-3
and when you go into the AWS console,
as you'll see in a second, you can see the name
of each of the regions alongside the region code.
The region code is just a way for us
to identify the region quickly and
it's corresponds to a geographical location for that region.
So us-east-1 is Northern Virginia, eu-west-3, for example,
is going to be Paris, okay.
So, next what isn't a region,
a region is a cluster of data centers
and we'll see how they're clustered in a second.
And most of the AWS services we're going
to use in this course, are going to be region-scoped.
So that means you can use a service in a specific region
and if you use the same service in another region,
you will not have your data
being replicated or synchronized.
So, we'd have to recreate your infrastructure
in different regions and that makes sense, okay.
So, now let's talk about AWS Availability Zones.
So each region can have many availability zones,
and I also refer to them as AZ, AZ for availability zones.
So usually, it's going to be three AZ per region,
sometimes you will see two and sometimes you will see six.
So here's an example, for the region ap-southeast-2
which represents the Sydney region.
Then we're going to have three AZ,
the first one is ap-southeast-2a,
the second one is ap-southeast-2b
and finally the third one is ap-southeast-2c.
As we can see here, the regions and with a number
and the AZ or availability zones, and with a letter abcdef.
Okay, so what is an AZ?
Each AZ is one or more discrete data centers,
so imagine a lot of computers into one big room
that's a data center.
And each data center will have redundant power,
networking and connectivity.
But all these AZ or availability zones
are separate from each other, and that's why
they're isolated from disasters.
So the AZ ap-southeast-2a is distinct
and geographically isolated from 2b and 2c, okay.
But even though they're geographically distant,
and isolated from disasters,
they're still connected with one another
with high bandwidth, ultra-low latency networking.
So we have a connectivity between
all the availability zones.
So that's the basis of How AWS works,
now let's go to the console to see how that translates.
So here I am in my AWS Management Console
and if we click on the top right corner,
then we can see all the regions available to us right now.
As you can see, there's tons of them.
There's some in North America, some in Africa,
Asia Pacific, Canada, Europe, Middle East and South America.
And so for the rest of this course,
it's best if you pick a region that is close to you,
because you're going to have lower latency access to AWS
and it's going to be a smoother experience.
So if I'm in Europe, I want to choose a European region,
if you're in America, maybe an American region, and so on.
So as we can see, each region has a name for example,
Singapore is Asia Pacific (Singapore),
but also a code ap-southeast-1.
And so if I click on a different region,
then I switch regions automatically.
So as we can see because I'm trying to connect to Singapore,
and I'm far away from Singapore,
then it takes a bit of time for me to load.
But if I connect to Frankfurt, it's close to me
so it's gonna be faster.
Now if I go to a service for example EC2,
the EC2 service is what's called a regional service,
and as such, I will be in the Frankfort region, Okay.
And if I switch regions, I will have a different EC2 service
that's specific to that region.
But, if I go to IAM so, I tap IAM here,
as we can see for IAM, what will happen is that IAM
is a global service and as such,
there's no regions election that's required,
and everything I do in IAM is going to be linked
only for the global AWS space,
okay, great.
So finally, I want to show you
the global infrastructure space.
So, amazon.com/about-aws/global infrastructure/
we get out of here is a description of how AWS works,
which I think is important to understand
before you get started in using AWS.
So right now, at this time of recording,
there's 23 launch regions for announced regions
so it's going to go and get even bigger over time.
And if we scroll a bit down,
we see the map of all these regions
and if I hop over a region, I get the number of AZ.
So for this course, it's good if you pick a region
that has at least three availability zones, okay.
If it has two, then please use another one.
So, if you're in Africa, you can use Cape Town,
if you're in the South America,
you can use Sao Paulo and so on, okay.
Then the other thing I want to show you, is regions in AZ,
so here we get the list of the maps and the AZ,
so we can see on North America, all the regions
and the number of AZ in one table, so this is very helpful.
And then finally, I want to show you a regional table,
so the regional table is saying
which services are offered in which region?
And so some services are going to be offered in only one
or many or two regions, while other services
are going to be available in all regions.
So if in this course, you are in a region,
but somehow the service is not available,
then go back to this table and see which region
would have this, for example,
we're not going to go over upstream,
but take this as an example, if you're in Ohio,
you see upstream is not available,
so you'll not have access to upstream.
So you would switch to region, for example,
Northern Virginia, and you would get access
to Amazon AppStream 2.0.
So this is going to be very handy in the course
if somehow a service is not available to you.
Well, that's it for this lecture,
so just pick a region in the console
that makes sense for you.
And we're going to go get started with AWS,
I will see you in the next lecture.