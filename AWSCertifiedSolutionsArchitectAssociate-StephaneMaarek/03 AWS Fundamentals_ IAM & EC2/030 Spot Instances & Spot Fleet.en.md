
<v Instructor>Okay, so let's do a deep dive</v>
on EC2 spot instances.
We know that with a spot instance,
you can get a discount up to 90% compared to On-Demand.
So that's huge cost saving.
How does that work?
We define a max spot price that we're willing to pay
for that spot instance.
And then as long as the instance is having a spot price
that is less than the max price we're willing to pay,
then we keep that instance.
So that max spot price, I will show it to you
in the next slide.
But the hourly spot will vary based on offer and capacity,
and so it will go up and it will go down.
And if somehow the current spot price
goes over the max price you have defined,
then you have two options.
And for these two options,
you have a two minutes grace period.
So that gives you a little bit of time to do these things.
And the options can be either you're stopping your instance,
that means that you shut down everything you were doing,
then you stop your instance.
And so if one day, the spot price goes below your max price,
then you can restart your instance
and continue where you left it off.
Or if you don't need the state on your EC2 instance,
you can just choose to terminate your instance
and let it go.
And then that would assume
that anytime you would restart your work,
you can start with a fresh new EC2 instance.
So two strategies based on the type of workload you have,
but you have a two minutes grace periods to do so.
The other strategy, if you don't want your spot instance
to be reclaimed by AWS is to use a spot block.
A spot block is when you block a spot instance
for a specified timeframe.
This can be between one to six hours,
and you get that block without any interruption,
at least on paper, because in the documentation,
but it's really rare, in rare situations,
the instance may be reclaimed.
But overall, when you consider a spot block
think that the instance will not be reclaimed,
that's the whole purpose of the spot block.
So when do we use spot instances?
Well, for batch jobs, data analysis,
workloads that are resilient to failures,
and as I said, they're not great
for critical jobs or databases.
Now let's have a look at the spot instance pricing.
So this is a graph that I obtained directly
from the AWS console.
As you can see here, this gives us the price
for a m4.large instance over three months in the spot zone.
As you can see, you have six lines for US-East-1,
the region and you have six availability zones,
so six prices.
So as you can see, the spot price does vary
based on the AZ you're considering.
As we can see, over three months, it has varied quite a bit.
For example, if you look at that yellow line,
it has varied between 0.4 to 0.45,
all the way down to almost 0.35, let's say and so on.
Let's assume that we are defining a user defined max price
to be this black horizontal bar dotted line.
We'd see is that if the yellow line is above
the dotted line, then the current spot price is going
to be more than the max price we have defined.
In this instance, right here,
we're going to lose our spot instance.
So we have to terminate it or stop it.
But if the price goes down,
so if the yellow line goes down our dotted line,
that means that we are willing to pay that price.
We are gaining that spot instance, in this meantime.
This is how we can optimize the cost
of our workload very easily.
As you can see, the On-Demand price is $0.10 per hour,
so that's really, really cheap.
And then the spot instance price is even cheaper.
It's around 0.4, I would say.
It's a 60% saving in that instance,
for the spot instance pricing, so lots of savings.
And obviously, if you were to define
your user defined max price
to be something like $0.05 per hour,
then no in-spot instances will be reclaimed
because you're always willing
to pay more than the actual spot instance price.
So no one can predict how the price goes over time.
But as you can see, it can be rather stable.
It can fluctuate a little bit, but overall,
it still provides you huge savings compared to On-Demand.
Next, how do you terminate a spot instance?
So we have to first understand how a spot request works.
For this, let's consider a spot request.
With a spot request,
you are defining how many instances you want,
your maximum price you're going to pay,
the launch specification, so the AMI and so on,
and when your request is valid from and until,
but it could be infinite, and then the request type.
It's very important to understand
there's two types of requests.
You can do one-time request for spot instances
or a persistent request for post instances.
Let's have a look at the difference.
If it's a one-time request,
as soon as your spot request is fulfilled,
your instances are going to be launched.
And then your spot request will go away
because it was a one-time request type.
So in this case, your spot request is going to go away
and you're fine.
But if it's a persistent request type,
that means that we want this number of instances to be valid
as long as the spot request is valid from to valid until.
That means that if somehow your instances do get stopped,
or interrupted based on the spot price,
then your spot requests will go back into action.
When things can be validated
we'll restart spot instances for you.
So if somehow you stop a spot instance, in persistent mode,
and your spot request is still active,
your spot request automatically will be smart enough
to restart a launch instance for you.
And this is something you can also see in this diagram,
but I won't spend too much time on it.
So what you understand out of it
is that if you want to cancel a spot request,
it needs to be in the open state,
the active state, or the disabled state.
That means that basically, it's not failed,
it's not cancelled or it's not closed.
When you want to cancel a spot request,
so if you take the spot request on the left hand side
and you cancel it, it's not going to terminate any instances
that you have launched from before.
So it is still your responsibility
to terminate these instances
and not the responsibility of AWS.
So as such, if you want to terminate spot instances
for good and not have them relaunched,
you need to first cancel the spot request,
and then you terminate the associated spot instances.
Because if you were to terminate the spot instances first,
remember, it goes back into the spot request
and a spot request says, okay, you wanted six instances,
but I can see you have zero right now,
I'm going to launch six instances for you.
So again, the right order to cancel
and to terminate spot instances is
to first cancel the spot request to make sure
that no new instances will be launched by AWS.
Then you terminate the associated spot instances.
I'm spending a bit of time on this
because this is something that can come up in the exam.
Okay, next spot fleets.
So this is the ultimate way to save money.
Spot fleets is going to be a way to define for you
to get a set of spot instances, and optionally,
On-Demand instances of what's called a fleet.
And the spot fleet will try its best
to meet the target capacity
with the price constraints you defined.
So it will launch from possible launch pools.
It can have different instance types,
different OS and availability zones.
You're going to define multiple launch pools,
a multiple instance size, multiple everything,
and then the fleet will choose the best
and most appropriate launch pool for you.
When your spot fleet either reaches your budget
or reaches the capacity you wanted,
then it will stop launching instances.
And so you define a strategy
to allocate spot instances in your spot fleet.
That's something to remember.
The first one is lowest price,
and that's going to be the most popular one
going into the exam,
which is that the spot fleets will launch instances
from the pool that has the lowest price
and that gives you a lot of cost optimization.
This is a great option if you have a very short workload.
It can also have a diversified way
to launch your spot instances, in which case,
the spot instances will be distributed
across all the pools that you have defined from before,
which is great for availability and long workloads
because if one pool goes away,
then your other pools are still active.
And then finally, you have capacityOptimized
to launch with the optimal capacity based on the number
of instances and choose the right pool for that.
The idea is that spot fleets can be complicated,
but what you have to remember is that using the spot fleet,
you're able to define multiple launch pools,
multiple instance types
until you're just interesting in real power.
And then if you use the lowestPrice discounts,
or the lowest price rate strategy for spot fleets,
then the spot fleets will automatically request
the spot instances with the lowest price for us.
So spot fleet gives us an extra saving
based on spot instances, because it's smart enough
to choose the right spot instance pools
to allow us to get the maximum amount of savings.
This is the benefit of spot fleets.
Again, you need to understand the difference here
of doing a very simple spot instance request
or you know exactly the type of instance you want
and the AZ you want, to using the spot fleet and saying,
okay, you can choose all these instance types
and all these AZ and what I need from you
is to give me the lowest price, for example.
That's hopefully is giving you a lot of insights
into how spot fleets and spot instances are different.
I hope you like this lecture
and I will see you in the next lecture.