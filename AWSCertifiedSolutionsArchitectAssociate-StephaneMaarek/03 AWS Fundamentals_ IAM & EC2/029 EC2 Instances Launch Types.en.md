
<v Instructor>Right now we're going to talk about</v>
the EC2 instance launch types.
And they're very important for you to know going to the exam
to understand which type of launch will allow you
to either provide the best cost savings
or the most stability, and so on.
So let's have a look, and there's so many of them
as we'll see.
So there is on demand instances,
and these are the type of instances
we've been using from the beginning.
So that when we create an instance,
and we have it right away, they're on demand.
And it's great when you have a short workload,
and want you to have predictable pricing,
you get an hourly pricing ahead of time.
But if you run some instances
for a known amount of time, for example,
you know that at least for one year,
you're going to need an EC2 instance
because maybe you run a database on it,
then you should use a reserved instance type.
And so reserved, as I said, is minimum for one year,
and you have different type of reserved instances.
So the first one is called reserved instances,
where you say I want that instance for one year
is for a long workload,
but then the next one is a convertible reserved instance,
in which instead of saying you want a M four X large
for one year, you're saying I want something for one year,
and you can convert what that something is.
So maybe it's an M four X large today,
but maybe it's going to be a C five large tomorrow.
And finally, we have scheduled reserved instances.
So for example, you wanna say,
hey, I wanna have that instance every Thursday
between three and 6:00 pm because I know
I'm going to run some job between this time,
but other than that, I don't need it.
But I know I will need this for at least a year,
so this will be a scheduled reserved instance.
Then we have spot instances where it's going to be
for short workloads, they're going to be very, very cheap,
but the risk is that you can lose the instance,
and that makes spot instances less reliable.
So we'll see in details all of those by the way.
Finally, we have dedicated instances where we know that
no other customers will share the hardware,
the underlying hardware on AWS.
And then dedicated host, where you actually book
the entire physical server,
and you control instance placements.
So that's just a high level overview,
but let's go and do a deep dive in each of those
to really understand how they work.
So the first one is on demand, and with on demand,
you're going to pay exactly for what you use,
and the billing is per second after the first minute.
So this is what I've been using, and when we start
an instance, stop an instance, we just paid
for the amount of time we've used it.
And that's the highest cost because it's on demand
and there's no upfront payments,
but there's no long term commitments.
And it's great, for example, for this course,
but it's great when you have short term needs
or uninterrupted workloads, or when you can't predict
how your application will behave over time.
So they're great for elastic workloads.
Now, reserved instances are more traditional IT
because we know that we're going to need that instance
for a long period of time, we can get up to 75% discount
compared to the on demand pricing tier.
And so we're going to pay upfront
for what we use for long term commitments,
we can actually pay upfront with partial reservation
and so on, but get the idea that you would pay up front
for one year and you can reserve for one or three years.
And you reserve a specific instance type.
And then, for example, if you have a database,
that would be the perfect use case.
So if you're reserved instances database and you wanna
run it for three years, then this is great.
This will be the type of answers that the exam
will drive you towards.
So we also mentioned convertible reserved instances
where you can change the EC2 instance type,
so they're going to be a little bit more expensive,
but you have more flexibility in terms of the instance type
so you can make it evolve over time
and that gives you up to 54% discounts.
And then we have scheduled reserved instances,
and they come up in the exam a lot as well,
which is when we want to lunch within a time window
that we reserve and that's only when we require
for a fraction of the day, week or month.
So again, what we said before, maybe we only need
an instance, on Thursdays between 3:00 and 6:00 PM.
And next, we have EC2 spot instances.
And these spot instances are going to be discussed
at great length into the next lecture but for now,
I just want to give you a high level overview of it.
So with spot instances, you can get up to 90% discount
compared to on demand, so a huge cost saving,
but the spot instances are instances you can lose
at any point of time, based on the price you pay
for the spot instance.
So there's something called a max price, which is how much
you're willing to pay for that spot instance.
And if it happens at the current spot price goes over
the max price, then you will lose your spot instance.
So as such, they make it very cost efficient,
but they are only helpful for your workloads
that are going to have a resiliency to any kind of failures.
So what type of jobs can be reserved to failures?
Well, a batch job that you can retry or data analysis
that you can use with distributed computing,
or image processing, again, that you can retry etc, etc.
So anything that is possible to retry
that is resilient to failure can be used
with a spot instances.
But what cannot be used with spot instances,
well, I would definitely not recommend it
to run a critical job on your spot instances or even run
a database on your spot instance, because a database needs
to be up and running for years and years,
and your spot instance again has the risk of being lost
based on demand and offer.
And so a great combo you can do is to use reserved instances
for your baseline capacity.
For example, say you're running a web application
and you know that year round, you're going to need
at least 10 instances to run that web application,
then you can reserve all these instances and get the maximum
amount of cost saving.
And then for anything that's unpredictable,
that's going to be based on demand or for peaks,
then you can use a mix either of spot instances
or on demand instances based on if you can have failure
or not on your workload.
And so this will also bring you more agility
and more cost saving to deal with these peaks
and so that is a great combo.
Next, dedicated hosts.
So dedicated host is that you get a physical dedicated
EC2 server for you to use and you have full control
over the EC two instance placement.
That gives you visibility into the underlying circuits
or physical core of the hardware,
which is great for licensing purposes.
And what you get is that host, you get it for
a three year period reservation.
So you need to know in advance that you're going to need
a server ahead of time and you need to have access
to the underlying sockets and physical cores
of the hardware, and that's usually due to licensing stuff.
So it's definitely going to be more expensive.
And as I said, it's useful if you have
a Bring Your Own License model.
Some licenses, for example, will bill you
based on the number of physical cores on the hardware,
or number of sockets and so this is the kind of use cases
for dedicated hosts.
For example, if you have a strong regulatory or compliance
needs that again, you want to make sure you have your own
hardware and not share that with any other customers,
then that would be the way.
Now for dedicated instances, these are instances
that are gonna be running on hardware
that's dedicated to you.
And it may share the hardware, other instances,
but only within your accounts.
And you have no control over the instance placements,
so you can only move the instance placement
from the hardware after doing a stop and a start.
So this would be the difference between dedicated instances
and host in that right-hand side,
comparison table and as you can see,
the dedicated host does give you per host billing,
the visibility into circuits, cores and host ID
and some affinity and the dedicates instances gives you
per-instance billing, so based on how many instances
you place on the dedicated instance.
So in the exam, I've seen dedicated hosts to be a much
greater use case for questions than dedicated instances.
But still, here's the table in case you needed to better
understand how they're different.
So the question is, which host is different for me?
On demand is going to be when you want to,
for example, let's take a hotel as an example
to compare, right like we have a hotel.
On demand is you're staying, and coming and going
in this resort whenever you like
and you pay the full price.
It's just you arrive and you say I want the room.
Yes, we have a room sir, and boom, here we go.
Reserved is when you want to plan way ahead of time
and you want to say, okay I want to stay for one week
or a month, and the hotel says, okay, you're welcome
to stay for a long time, we'll give you a good discount.
Because you know, in advance, they're going to stay
and they know the room is going to be booked.
Spot instances is for example, just before the night starts,
they know they have some free rooms, and they want to allow
people to get these free rooms, and they will let people bid
over the empty rooms and give the rooms to the one
who wants to pay the most money for that room.
So but if someone comes and say, and that would be weird
for a hotel, obviously, but if someone come and say,
I'm willing to pay more than they will kick you out
of your room and that would be extremely awkward,
but that would happen in the cloud world.
And finally dedicated hosts with saying, okay,
I want to book the entire building of the resort or maybe
an entire wing of that building, and I want that
to be dedicated to me.
So hopefully that helps you see a little bit
how they compare.
Now for price comparison, I think this is interesting to see
how they work just to get an idea of like how things
could work for an M four large instance.
So for on demand, I would pay 10 cents per hour,
and that would be the base price.
For spot instances, it would be
between 0.03 to 0.45.
And that would be up to 90% off and I probably made
a typo here 0.045.
I'll correct this offline.
Spot block is going to be around the spot price,
so a good discount.
Reserved instance is going to depend if you pay
no upfront or all up front is going to be
0.062 or 0.058, which is less than 0.10,
obviously, about 50% less.
If you reserve an instance for longer timeframe for example,
three years, then you're going to pay even less;
0.043.
Now if you want it to be convertible, that means you want
to change the instance type, then the price is going
to be higher but still less than on demand.
Dedicated, a little bit higher as well.
And then scheduled, which is you want to schedule ahead
of time, as you can see, it's only going to be
five to 10% off.
So it's still some savings but obviously because you're not
using the instance a lot, it could be less than usual.
Finally, dedicated host is going to be on demand price
and dedicated host reservation up to 70% off.
So just to give you an idea, they won't ask you about
the right numbers in the exam, but just so you get
understanding of like, what discounts
are offered based on the launch type.
All right, that's it, I will see you in the next lecture.