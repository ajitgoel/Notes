
<v ->So on the AWS and for the exam,</v>
you kind of need to know the instance types,
but not all of them because there are so many
just the main ones.
So, I'm going to give you a small run
of the instance types you can choose on AWS.
The R instance is the applications that need a lot of RAM,
so R for RAM.
So it shows in-memory chache or in-memory databases
or whatever.
So this is the R instance for RAM.
C is good for you for good CPU or computes
and so this is where you have databases usually,
or applications that do a lot of computations
such as Big Data.
This is the good instances for these.
M is in the middle, think medium, think middle.
So, it's between RAM and between CPU.
So, you use M instances for a web app
or something very, very general.
I is for good IO or instance storage.
So, when it's a lot of good IO,
a lot of good disc operations,
this is a database you are going to need,
and you need the I instance.
G stands for GPU.
So, G instances come with a GPU
and they're great for video rendering
or even machine learning since machine learning uses GPU.
And there is the instances when using so far,
T2 or T3, we'll be using T2
because that's the one in the free tier.
But they're called burstable instances,
and so that means that you get a good performance
for a burst, for a short while,
but then if you over abuse that burst,
then you lose the burst and you lose your capacity.
We'll see this in a second.
And then we have T2/T3 unlimited
which gives you unlimited burst.
So overall, in the real world
to choose the instance that you need,
I suggest you use the ec2instances.info website,
it is amazing.
So, let's go on it real quick.
We type ec2instances.info and here we get basically
a comparison of all the instances on AWS
and this is a very, very, very big table as you can see,
and there's way more than just what I told you.
There is some Z instances, whatever,
but what you need to remember is the one I give you,
so R, C, M, I, G and T, okay.
And so, just explore that table,
it's kinda neat to see what each instance does.
They give you the instance storage,
the performance, number of CPU's, the memory,
and the cost as well, which is really, really, really cool.
And it also gives you some information
if you are going to reserve your instances and so on.
So, let's get back to our little course.
And so basically, the burstable instances is T2/T3.
And so, with these instance,
that means that overall, you know,
when the instance is running you get good performance,
okay CPU performance, it's doing fine.
And then, sometimes maybe you need
to process something very unexpected,
maybe there's a spike of loading your application,
and your CPU skyrockets and it goes to 100%.
In this case, during the spikes,
the CPU can do something called a burst
and a burst is like a boost of power
and the CPU is very good during that burst.
But if your machine bursts it uses burst credits,
and as you can expect,
if the credits are all gone,
then the CPU becomes bad or I may say, terrible.
And then, when your load is over,
when the CPU is stopped bursting,
then you gain back the credits over time.
So this is what the burstable instances are,
they're good, then they accumulate credits
and then when you need them the most,
when their in need of a very unexpected load,
they're amazing.
And then if you do abuse that,
you just lose all the capacity
and they become very, very bad.
So, they can be amazing,
but basically if you run low on credits all the time,
then you probably shouldn't use T2 and T3,
you should probably use something like
a C or M type of instance.
So how do we see the credit usage and balance?
Well in Cloudwatch we can see this.
And so as you can see,
this is just for a dummy instance that I have.
But so, when the CPU skyrockets,
you can see that the credit usage here is very, very high
and the credit balance goes down.
But after the CPU credit usage is done,
after we're not using it anymore,
then we slowly gain back our credit balance
into a normal zone.
And so this is what you have to deal with.
You have to be very careful and obviously monitor
the credit usage and balance over time,
otherwise you may have surprises.
Now, the CPU credits,
you basically can then a different space
and you can find this is the documentation.
But basically, the bigger the instance,
if you have a T2 large,
the faster you're gonna earn credits
and the better is going to be the CPU.
And finally, there's this thing called T2/T3 unlimited,
and since November 2017, basically what you get
is unlimited burst credit balance.
That mean's you can burst for as long as you want
but you're going to pay for it,
and so you need to make sure
that you don't burst for no reason.
And it's a new offering so be very careful.
I find it very nice, but it needs to be
for very, very specific kind of use cases,
and you need to monitor your health of your instances,
otherwise you're going to pay a lot of money.
And you can read more in this blog.
So that's it for the instance types.
Again, I think what you should remember mostly
is going to be which kind of instance to you use
in case you need RAM, CPU, medium, IO or GPU.
And also, remember how T2 and T3 work under the hood,
they become very, very bad if you don't expect how they work
and then you can have production issues all of a sudden
if you get a big load.
Okay, so that was it.
I hope you liked it and I will see you in the next lecture.