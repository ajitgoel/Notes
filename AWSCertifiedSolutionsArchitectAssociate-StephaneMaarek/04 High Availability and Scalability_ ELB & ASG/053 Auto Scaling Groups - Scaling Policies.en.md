
<v Lecturer>So, now let's talk about scaling policies,</v>
because that is the core of your Auto Scaling groups.
So, there's three things you need to know.
Number one is called Target Tracking Scaling,
and that is the most simple and easy to set up.
For example, you would say to your ASG,
I want your average CPU of all your instances
within your ASG to stay at around 40%.
Very, very simple.
So, that means that if you're over that CPU,
that means you will provision more instances
to serve your ASG, and if you're under that CPU,
it will start doing scaling in,
so it will start terminating your instances
to stay at this around average 40% CPU.
Simple and Step Scaling Policy is not that simple,
but you would set up something called a CloudWatch alarm,
and the CloudWatch alarm would be an alarm
that would be triggered, for example,
when your average CPU of your entire group
goes over 70%, and then you would say, okay,
if that alarm is being triggered, then add two units.
So, you have a bit more control over
how many instances are being added
through this scaling policy,
and you would set up a second CloudWatch alarm
to be triggered, for example, if say,
if the CPU is more than 30%, is less than 30%,
then remove one instance.
And so, you have a lot more control about
the scale out events, when units of capacity are added,
and the scale in events where units of capacity are removed.
Okay?
And finally, there is, in case you know in advance,
some patterns of your application,
you have something called Scheduled Action,
where you anticipate a scaling
based on known usage patterns, so for example,
you know that at 5 PM on Fridays, you need
to increase the min capacity to 10 instances
because you know that you will need, absolutely,
at least 10 instances for your Auto Scaling group.
So, this is the kind of scheduled actions you would have.
Another thing you need to know going into the exam
is Scaling Cooldowns.
So, a lot of text but I will read this out to you.
So, there's a cooldown period, and that helps
ensure that your Auto Scaling group doesn't launch
or terminate additional instances before the previous
scaling activity takes effect.
Okay?
So, this is the cooldown, which allows
your Auto Scaling group to kind of settle
before there's a new scaling.
So, in addition to the default cooldown,
you can create cooldown that apply only
to specific simple scaling policy.
And a scaling-specific cooldown period overrides
the default cooldown period, so that makes sense.
And one common use for scaling specific cooldown
is with a scaling policy, the one that terminates
your instance.
Because it terminates instances, Amazon EC2 Auto Scaling
needs less time to determine whether or not
to terminate additional instances.
And so, this is when you may want to override the cooldowns.
So, as a rule of thumb, if the default period of 300 seconds
for the scaling to cool down is too long,
you can reduce your costs even further by applying
a scaling-specific cooldown period of, say, 180 seconds
for the scaling policy to terminate instances
a little bit faster.
And if your application is scaling up,
and on multiple times each hour, make sure
to modify the cooldown timers and the CloudWatch
alarm period that triggers the scaling.
So, this is something you can look at in the documentation,
and the question is, is there a scaling action happening?
If you're within the cooldown period, then you can
ignore the action, if you're not, then you can
launch or terminate instances.
Okay?
So, just the stuff that you may need to know
going into the exam.
Now, let's have a look at the scaling policies
directly in the console.
So, let's go to this automatic scaling tab.
And here, we can define either a scaling policy
or a scheduled action.
So, let's start with a scaling policy.
We can click on add policy
and we have three policy types, so,
target tracking scaling, and then we have
step and simple scaling, which are to mean
the same kind of zone.
So, target tracking is saying, okay,
we want to track maybe the average CPU utilization,
or average number of request counts per ALB.
And, we want to, for example, choose CPU,
the target value is going to be 50,
could be 40, whatever you want,
and the cooldown, how long the instances
need to warm up before including in the metrics,
so, 300 by default, and then
we can disable scaling if we wanted to,
to only create a scale out policy.
But, in this case, we want to scale in and out,
so I will not tick this box.
So, we'll create this,
and this is our target tracking policy.
And so,
we can actually remove,
I think I'm going to edit this a little bit,
just for the demo to be faster,
so I'll say instances need about 10 seconds
to warm up before include it in the metric,
and save this change, and let's see it in action.
So, we have a CPU utilization, obviously, of zero,
because nothing is happening, so if we look at
the CPU utilization for EC2,
in here, we see the CPU utilization is really, really low,
and so, what I'm going to do now is go to details,
and I'm going to change the desired capacity to two
and seeing what happens.
So, I'm going to update this, so what this will do
is that it will create an EC2 instance,
so we will have two EC2 instances,
and then the average CPU utilization will be very low.
It will be about 0%.
So, because of this target tracking policy,
we'll say, wait a minute, you look like you have
too many instances for your needs,
and so it will, it should automatically remove
that instance.
So, let me pause the video, just so we can
show you exactly the entire result at the end.
So, the first thing that happened is that
an instance was being launched because
the desired capacity was going from one to two,
so now, in instance management, we can see two instances,
and now I hope to see that the target tracking policy
will automatically terminate the instance very, very soon.
So, wait and see.
So, if you want to know what's happening
behind the scenes of this target tracking policy,
we're going to look at CloudWatch,
and we haven't seen CloudWatch just yet,
but let's have a quick look at it to see how it works,
it'll be a fun way to get started.
So, your CloudWatch alarms are going to be right here,
and right now have three, but this one probably,
that is not relevant to you.
So, I have two alarms right here,
which are saying, okay, and they're linked to my ASG.
So, as you can see, they were automatically
being created, and the first one is called
target tracking Target Tracking, My First ASG, Alarm High,
and the second one is
Target Tracking, My First ASG, Alarm Low.
And it's saying that, if the CPU utilization
is less than 28 for 15 datapoints within 15 minutes,
then it will trigger, and if it's more than 40 otherwise
for three datapoints within three minutes,
then this one will trigger as well.
Okay?
So, right now, the one we want to trigger is Alarm Low,
but it's not happening, I mean, I've been waiting
for a long time, because that says 15 minutes
for this alarm to go off, so if we look at the alarm itself,
we can see the CPU utilization right here
has been under 28 since
19 PM,
and right now, I have to wait a little bit,
so right now, it is 19:13,
so I need to wait an extra three minutes
for this alarm to go off, and then it will be
in the alarm state, and then it will be able
to have the scaling happening.
So, I need to wait an extra two minutes,
but only to show you exactly behind the scenes,
if you got through your alarm and type,
My First ASG, this should just show you the one
you're interested into.
Here we go, the two ones.
And now, we'll wait a little bit for these alarm
to be triggered, and this should trigger a scale in
of my Auto Scaling group.
Okay, so to speed this up, I'm just going
to click on my Alarm Low, and edit the condition,
and I'm going to say instead of 28, I'm going to say
28 is great, but you need to have three datapoints
out of three under that alarm,
to be in the alarm state.
So, I've just updated my alarm to make it trigger
a little bit faster, 'cause I wanna make sure
I can go on with the hands-on, so I need to wait
a little bit, and this time, the alarm should be set off
very, very soon.
And now, thankfully, my alarm is now in alarm state.
So, what this will do is that, if I go back to my ASG
and go to activity, I should be seeing very, very soon,
a scaling activity.
So, let's wait just a little bit to see it happen.
So, I'll be honest, it took a lot of time,
so if you're doing the hands-on with me,
make sure to be able to wait a long time,
but right now, it says, yes, there is
a terminating instance that is happening,
because the alarm Target Tracking, My First ASG, Alarm Low
was in the alarm state.
And therefore, the desired capacity changed from being two,
to being one.
And so, if we go back to the details in here,
and I refresh this page,
so let me refresh this page right here,
we can see now that the desired capacity is one.
So, this is why there is a scaling happening,
and the instances will go from being two instances
to being one, and then we can see,
the last one, the second one right now,
is in the terminating space.
Okay.
And now for automatic scaling,
so this is for target tracking policy,
now I can go ahead and delete this,
but I also have the option to add a simple or step scaling,
so we'll just use a step scaling,
so you would name it, My Step Scaling,
and we need to create CloudWatch alarms for this,
which we don't have, and then the action would be,
if this alarm here is triggered, then add, remove or set to,
and then you tell how many capacity units,
how many percentage of the group you want.
So, for now we'll say okay, if this alarm is breached,
then add two capacity units,
and then if another alarm is breached,
then remove one capacity unit.
So, very helpful, right?
So, this is step scaling, and with simple scaling,
it's even simpler, you don't have as many options, okay?
You need to add, remove or set to, whatever capacity units
you want, or percentage of group,
and then you wait X seconds before allowing
another scaling activity.
So, that's the general idea.
And, now going into scheduled actions.
As we can see, we can create a scheduled action.
We'll called it, Scale at X PM.
And so, we're saying, okay,
when the start time is, whatever, tomorrow at
18 UTC,
then set the minimum capacity to 10.
And, click on create, and here we go.
So, tomorrow at 10, then it will set the capacity
to 10 for the minimum.
So, very, very easy, but the scheduled actions
allow you to predict things ahead of time.
Do they occur once?
Do they occur regularly in time?
And so on, so they're very helpful
when you have more predictable scaling patterns
in your ASG.
But, we'll go ahead and remove it,
and that will be it for our Auto Scaling policies, okay?
That's it, I will see you in the next lecture.