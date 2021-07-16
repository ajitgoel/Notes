
<v Stephane>Okay let's talk about Snowball.</v>
It's kind of a fun name,
but it's basically a huge box
and that allows you to basically physically transport data
in and out of AWS.
And we're talking terabytes or petabytes of data.
It's basically an alternative to moving data
over the network and you pay network fees.
So, if you have a lot of data,
if it's huge and you need to transfer it,
for example, from on premise,
all the way to the Amazon Cloud,
maybe sometimes it's better
to actually use this giant box called a Snowball,
send it to AWS and load it this way.
So it is secure, it's tamper resistant,
there is KMS encryption on it,
and there's a tracking using SNS and test messages
and there's a E-ink shipping label,
so it's really well made
and you're going to pay per data transfer job.
So the use case of Snowball
would be to do large cloud migrations
or decommission a DC or do disaster recovery.
And basically the idea that when should you use Snowball
and when should you not use Snowball,
well if it takes more than a week
to transfer over the network,
you're probably better off using a Snowball device.
So how does that work?
Let's go to a funky new cloud area
to just ask for a physical device,
but here we go.
You're going to request a Snowball device
from Amazon Console
and it's going to be delivered to you.
Then you install the Snowball onto your servers.
You connect it to your servers
and then you copy the file using the Snowball client.
Then you ship back the device when you're done.
It goes right away to the right AWS facility
thanks to the E-ink shipping label.
And the data will be loaded for you
into an S3 bucket,
and then the snowball will be completely wiped,
so that no one can access your data, obviously.
And all the tracking along the side is done, obviously,
using SNS, text messages and the AWS console.
So for you to visualize it,
you can directly upload to S3,
maybe over the internet,
maybe you have a 10 gigabyte per second broadband,
but maybe it's not enough.
Maybe you have petabytes of data
and so using Snowball, you order a snowball,
it comes to you,
you load it using your servers
directly into the Snowball box,
you ship the Snowball box,
you have the import export feature
directly done by AWS
and there your data will be in an Amazon S3 bucket.
So, pretty cool but kind of a new idea, isn't it?
Now Snowball Edge is a Snowball but it's improved.
Now, it has computational capability to the device.
So you can have 100 terabytes of capacity.
And you can either have its storage optimized,
so you get 24 vCPUs,
or compute optimize and you get 52 vCPUs
and maybe a GPU.
The idea is that you can load a custom EC2 AMI on it
and Lambda functions,
and so you can support,
basically perform computations while your data is moving.
Which is quite cool.
So now on top of moving alongside on the truck or something,
your Snowball device
will actually perform computations for you
and save you time.
So it's quite useful if you want to pre-process the data
while the thing is moving.
And the use case would be data migration, image collation,
IoT capture or machine learning.
And so as if it wasn't enough,
say you have more than 100 terabyte
and maybe you have petabytes of data,
then there is a Snowmobile.
And it's seriously a truck.
It's an actual truck.
So you can transfer exabytes of data with it.
So one exabyte equal 1000 petabytes,
equals 1 million terabytes,
so it's not for everyone, obviously.
And each Snowmobile itself
will have 100 petabytes of capacity
and we can have multiple of these trucks
come into your facility in parallel
if you wanted to load this much data.
So it's usually better than Snowball
if you transfer more than 10 petabytes
of data at a time.
But obviously now you need to have a truck
on your facility and load the data into there.
So that's it for all the Snow-something on AWS.
So Snowball and Snowmobile.
Basically the idea is
that as soon as you transfer
a very large amount of data,
you should use a Snowball
and if it's an insanely high amount of data
then probably a Snowmobile.
Finally, let's view a solution architecture
in which how do we get data
from Snowball into Glacier?
So something you should know
is that Snowball can not import data
into Amazon Glacier directly.
What you have to do instead
is to use Amazon S3 first,
and then you're going to use an S3 lifecycle policy
to transition that data directly
and immediately into glacier.
So Snowball, as I said,
will import data into Amazon S3 because Amazon S3
is the only place where Snowball can drop its data
and then, using an S3 lifecycle policy,
we will migrate that data into Amazon Glacier
and effectively, we'll have made Snowball
do put data into Amazon Glacier,
but that involves an extra step
into Amazon S3 in the middle.
And you have to remember this.
So that's it for this lecture on Snowball.
I hope you liked it
and I will see you in the next lecture.