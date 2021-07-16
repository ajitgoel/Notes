
<v ->To use Snowball, you just type in snowball,</v>
and we're not going to order one,
but I'm just gonna show you how it works.
There's literally a Snowball page,
and you can create a job and the idea
is that you say, "What do I wanna do?"
"Do I want to import into AWS?
Export?
Or just do local and compute storage only?"
So, I'll just say I wanna import data into AWS.
It's gonna say, okay, we're going to deliver to you
a Snowball and then you're going to copy the data
to the Snowball and AWS will move the data
and so there's a truck involved to move
that little Snowball.
All right, so we'll click on next,
and then we have to add a address,
so you could add whatever address you want.
I'll just add some random information right here,
just so we can go quick enter your country,
say Austria, and the phone number is going to be
something random.
You can select the shipping speed,
express or standard shipping, click on next
and then we can choose the type of snowball we want,
so we call it demo job, and here I can say,
okay I want a Snowball, has 80 terabytes of storage,
or I want a Snowball Edge that is going
to be storage optimized with 100 terabytes,
and now we're gonna get 24 vCPU and 32 gigs of RAM,
or maybe I want Snowball Compute Optimized,
and you see there is HDD and SSD now,
So the sum is going to be around 50 gigabytes,
but now we have more vCPU and more RAM,
or maybe you want as well a GPU on it,
if you want to perform some machine learning.
So you select the Snowball you want,
and then when you're happy, you select the bucket
name you want to write your data to,
so you could create a new bucket,
I'll just put it into a random bucket.
And then you can enable Compute with EC2
so you can literally load an AMI onto your Snowball,
which is kind of a funny idea, but I love it.
And then click on Next, you can select an IAM role,
so that's basically your Snowball can do what it
needs to do, you can set up encryption,
which is great, so I'll just click
on Create IAM Role right now just so it's done.
And click on Allow, okay now the IAM role is done,
which allows Snowball to import data into s3.
And the KMS key that I wanna use maybe this
import export is great, click on next,
then we can set notifications, email addresses,
or we can choose a new SNS topic,
basically if you want to know and receive text notifications
when our job is done, I'm not gonna
send notifications right now.
And then it's going to say all the status
you'd like a notification for, so job created,
preparing appliance, shipment, in transit, delivered,
in transit, at sorting facility, at AWS,
finally importing, completed or canceled.
So you get a lot of information around
how your Snowball job is going.
Click on next, and then when you're ready,
you can review everything and I am not going to
create a job, because that would be suicidal,
I would pay a lot of money for this,
do not do this as well, basically you could literally
order a Snowball device to your house or to your company,
and load up to 100 terabytes of data on it,
which I think is really really cool.
All right, so that's it for Snowball,
at least you get an idea of how it works,
and then you would obviously monitor
your Snowball jobs in this UI.
I hope you liked it, and I will see you in the next lecture.