
<v Instructor>Let's have a look</v>
at all the instance launch types.
So they're all on the left-hand side right here,
and if we do launch instance that would be
an on-demand by default right?
But lets have a look at all the things we just saw.
So the first one we're going to look
at is reserved instances and so this is for instances
that we want to reserve in time so for example,
let's say, I want to have an m5.large.a,
and the term is going to be 12 to 36 month
and I'll just click on search,
and here we go, we get some information
so we can reserve that instance for 36 months
and we can get no upfront, partial upfront
or all upfront and we can say how many we want.
For example one, two, or three and then we can add to cart.
So example, lets say okay I want this one.
I want one and I will add it to cart,
and now I have to pay $1,089.
So obviously I won't do this but this will show us
how to use and reserve instance
and reserve that capacity upfront.
So I cancel it, then we have scheduled instances.
And so, these are only available in some select regions.
So maybe if you don't see it,
that's because you're in the wrong regions.
So, I know the regions that work, for example,
is U West one or US East one.
So have a look if you're in the right region,
just to test that out.
And so therefore, schedule reserved instances
where we know we are going to need some capacity,
just for a little bit of time.
So, if we start for example tomorrow,
and we say daily for four hours,
and we can say how many hours we want a day.
So four hours a day, this is what it means.
Linux on any AZ, any instance type.
Confine schedules and we don't have anything right now,
so it's quite tricky to book these it seems.
But it just shows you that's
from scheduled reserved instances.
You set up a recurring schedule daily, weekly, monthly.
You say how many hours a day,
how many hours a week, how many hours a month you want,
when you want to start the platform,
and the type of instance you want.
And if you have any luck, you will find available schedules
and you can book those, okay?
So next what we have is dedicated hosts.
So dedicated hosts is going to be around
dedicated hosts that will give you access
to how many sockets and cores are installed
on the server and then grade when you want
to bring your own license.
So this is the kind of scenario in this, okay?
We click on allocate a host,
we choose the instance family m5d.
Do we want to enable multiple instance types or no?
Then the instance type we want, so m5d large, the AZ,
whether or not we want instance auto-placement
or host recovery.
And then you click on allocate host
and that will go ahead and create a dedicated host for you,
and you can start being billed for it.
So, I'm not going to click on allocate host
or otherwise I will start paying some money.
But, it gives you an idea that here, using dedicated host,
we specify what we need and we get it right away.
Okay, next we're going to have spot request.
And spot requests are extremely interesting.
So here we can request spot instances two ways,
either through this button right here,
or through the instance launch.
So we'll see both in a second.
So the first one is going to be
around the requesting spot instance,
so requesting spot instance.
And by the way, just before I do that,
I wanted to show you something else.
In the pricing history, you can see the spot price history.
For example, if we take a m4 large
and we do the date range of one week,
we can see that the price range
is actually very, very stable,
so just a real world trick in here.
Spot prices don't vary in price so much.
They're actually quite stable
and I found them to be quite a stable way of using them.
But from an exam perspective, remember that Spot Instances,
can be reclaimed by AWS at any time.
So they make it less stable from an exam perspective, okay?
But as you can see the on-demand price
is zero point eleven,
and the actual price is zero point three four,
which is extremely cheap,
so you have a very, very good savings,
and they're stable in time if you use spot instances, okay?
Okay let's get back to request spot instances.
So here we have the option to define the spot instance,
based on a type of workload.
So it could be a load balancing workload,
if you wanna have a web service,
a flexible workload if you are wanting to batch jobs,
big data jobs, if you want to launch many, many types
of instances of any size to run some computations,
or defined duration workloads, which is a spot block,
where you say I want to book a spot instance
between one to six hours, okay?
And so for each type of spot instance request,
you have to specify AMI ID, the Network,
the AZ, the key pair and so on,
and then you tell how much capacity you need.
So for example you say, I need one instance,
or I need six instances and this could be instances,
or vCPUs so virtual cores.
And then, do we want
to maintain the target capacity and so on.
And then finally, here is the fleet request,
so this the spot fleet request,
and it's saying okay, I need to book some c3 large,
some medium t2 and so on.
But you can also just choose what you want in instance types
and the allocation and the price.
And then finally, do we want to have a capacity optimize?
Do you want to have diversified fleet
or lowest price, so you have a lot of different things
in your Spot Fleet.
And then it gives you an estimated hourly price.
And it's saying after I get capacity,
you have 72 percent savings, okay?
That is when you want to request a spot instances,
so that it's a spot fleet.
But if you want to request just one spot instance,
you would go to the instances on the right hand side,
on the left hand side, sorry.
And you click on launch instance.
And in here we're going to say Amazon Linux two.
And then I'm going to say
I want a t2.micro instance details.
In here in the purchasing options,
you can request a spot instance,
it shows you the current price of a spot instance,
which is a lot less than the actual on-demand price.
Then we can set the maximum price we want
for that spot instance.
For example I will say, zero point zero six,
and that means I'm going to pay six cents per hour maximum
for that Instance.
So currently I will be paying that current price,
but if it goes over my maximum price,
then AWS will reclaim my instance as we saw before.
Is it a persistent request?
So does that mean what do you want
to do when the instance is terminated?
So do you want to terminate or stop?
So we have different options.
And then is my request valid from any time,
so a specific time that to another specific time,
that is for example,
if you want to have that spot instance
for a long time and you are very, very close
to the current price,
these options would be quite helpful, okay?
So I just canceled it, and that's it.
That will be all the ways to launch your instances.
Sorry, I just missed one, obviously, the dedicated instance,
so let's go back to our teaching micro instant details
and in the bottom, there is tenancy,
and the tenancy you can choose to either run
on shared hardware, or dedicated,
to have a dedicated instance.
Or you can run on a dedicated host that we've launched,
that we would have launched from before
to launch this instance on a dedicated host,
and we get extra options on host
and placement affinity, okay?
Well that's it for this lecture.
We see all the instance types,
so remember the exam will ask you
to figure out from a case, is it a database?
Is it a spot instance?
Do we need a schedule reserve instance?
That kind of things to bring you the best cost savings,
the most efficient workload,
while making sure you comply with all the requirements.
For example, to be resilient to failures
or to never have termination in place,
or to have some kind of licensing view, okay?
So that's it for this lecture.
I will see you in the next lecture.