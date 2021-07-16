
<v Instructor>Okay, let's talk about CloudWatch Alarms.</v>
Alarms are going to be used to trigger notifications
from any metric.
So, we've already touched alarms when we were doing
Auto Scaling groups.
And so alarms can get attached to Auto Scaling Groups,
they can be attached to EC2 Actions, or SNS notifications,
so you can use alarms to modularize your whole AWS.
There is various options, so you can choose to metric,
to alarm on the sampling, on a percentage,
on a max, on a min.
So you can basically customize your alarm
any time you want.
The alarms come in three states.
It can be an OK state,
that means your alarm is not doing anything;
INSUFFICIENT_DATA, this is when you basically
don't send enough data for your alarm,
so the metric is missing some data points;
and ALARM, when your alarm threshold is being passed.
In terms of period, basically you have to specify
a length of time in seconds to evaluate the metric,
and if you use a high resolution custom metric,
you can choose 10 seconds or 30 seconds
as the period for the evaluation of your alarm.
So that's really it for alarm,
let's just go quickly into CloudWatch to see how they work.
If we go to Alarms,
we can see that we have two alarms already,
and these were created by Elastic Beanstalk.
And so, the first one is saying,
"Hey, this alarm should look at NetworkOut to be
less than 2,000 for one datapoint within five minutes."
And so this was created by Beanstalk, obviously,
this is for our Auto Scaling group,
but it basically says,
"Okay, if our application gets
less than two megabytes of data out for five minutes,
then you would like to decrease
the size of our ASG, Auto Scaling Group."
And this one is saying,
"If we get NetworkOut to be greater than six megs,
so if we are sending more than six megabytes of data
out from our Auto Scaling group,
we would like to increase the scaling group capacity
because we want to scale up."
So this is why one of the alarms is in the ALARM state,
because we're not using our website.
This alarm is red and if we were to use that alarm,
if we were to use our Elastic Beanstalk website
with real users,
we'd get maybe some traffic out of the network
and the Auto Scaling group would scale.
So this is the ID,
this one will always stay in the ALARM state
because we're not doing anything with our website.
And so, what this translates into is that
when we look at our Auto Scaling group right here,
and we look at this one,
if we look at the scaling policies,
we can see that there is a simple policy
which says that if the NetworkOut is
less than two megabytes for 300 seconds,
then remove one instance.
And the Scale Up Policy is saying
if the NetworkOut is greater than
six megabytes for 300 seconds,
then add one instance.
The reason why we still have one instance in place
is that we set the minimum capacity
to be equal to one
and so, even though the alarm is saying
remove one instance,
because we are already at the minimum capacity,
the instance won't be removed.
You could play around and add alarms on your own.
We could create an alarm and we get to see
all the metrics that are available to us.
So maybe we want to get EC2 metrics,
and if we scroll down,
we see there is a MyFirstWebappBeanstalk-prod,
so that sounds like a good one,
and I'll just look at NetworkIn, a
and okay, so we get some metrics here,
which is good.
So if we look at the average of our NetworkIn
over a period of five minute, that sounds right,
we could set the period you want.
Let's lose this metric,
so we'll click on next.
Here we get to define the metric.
So we're saying High Network In for BeanStalk
prod.
And so you can say, okay if NetworkIn is going to be greater
than one hundred thousand.
So here is my bar on the right hand side, this is where
I define my bar and this blue is my actual values.
So, right now my alarm is going to be blue.
So then we have to say for how many data points.
So here, I have one out of one data points,
but if we look at the period on the bottom right,
we can see that the period is five minutes.
So we can set the period to whatever we want.
Five minutes is what we have to use, if we used one minute,
we'd be missing data because we don't have enough enabled
metrics, it's not a high enough resolution for this
so we'll just keep it as five minutes, but we could go
five, fifteen, an hour, six hours, one day.
Over whatever period you want to look at.
And so we're saying, okay, if we look at one out of one
data points, if one of these data points goes over
five minutes, then do the alarm.
Maybe we should say, three out of three data points
and what this will do is it will say,
"Okay, if for fifteen minutes, five, five and five, so
that's three, for fifteen minutes, we get the NetworkIn to
be greater than the red line, then trigger the alarm."
Here we can say what we want to be missing data.
So, if the data is missing, should we say missing state
or should we say good, so okay, bad, so alarm, or ignore,
to maintain the same state.
So based on the requirements, you may want to choose these.
And the action is, "Okay, whenever the state is ALARM, so
whenever the state is in ALARM state, we should create a new
list"
And I'll just call it AlarmTriggered and I'll send
myself an email, so I'll say, "Okay, whenever the alarm is
going to go over the red bar, send myself an email."
Now, go and click ahead under create alarm, and now we'll
do it later for confirming my email address.
And so here, we see that so far we get this data point,
saying that there is insufficient data, so I need to just
wait a little bit, for this to become OK.
So, here we go, now it's OK.
So, because it found all the data, so it turns out that
because my blue line, over here, is less than my red line,
and has been the case for three data points within fifteen
minutes, then it's going to be okay.
If I changed my alarm, and so I go and click on modify,
and now, I'll say that my threshold is going to be,
maybe twenty thousand, for NetworkIn
Now, my blue line is above my red line,
so I'll save my changes.
And, within a second, we should see the alarm being in
ALARM state, so now it's red and CloudWatch will send me
an email, saying "Hey, something is up."
So you can see how you can start using alarms to
basically trigger auto scaling or sending yourself emails,
and you can really be free into how you want to monitor your
stacks and your applications.
So that's it for CloudWatch alarms,
I hope you liked it, and I will see you in the next lecture.