
<v Instructor>So CloudWatch Dashboards are</v>
actually and surprisingly asked at the exam.
There will be one or two questions
and I'll just give you the tips right now.
So Dashboards are a great way to get access
to your key metrics
and to get a good overview of how your
application is running based on how you design it.
Now the Dashboards, the thing to understand
is that they're global.
You can access the Dashboard in any region
and we'll see this in a second.
On top of it,
you can make a Dashboard include graphs
from different regions.
And that's really, really cool.
Because that means that you can have
a graph from Ireland,
and a graph from the USA,
and a graph from Asia.
And all this things can appear together
on the same CloudWatch Dashboard.
And that's one of the main questions
you will be asked from the exam.
You can also change as we'll se in a second
the time zone and the time range of the Dashboards
straight from Dashboards themselves.
Finally, you can set automatic refresh.
It can be 10 seconds, one minute, two minute
up to 15 minutes.
And that's it.
The pricing for Dashboard is something you
need to be aware of.
You get three Dashboards up to 50 metrics for free.
So we'll be in the freed share once we do this
hands on.
But then afterwards is three dollars per
Dashboard, per month.
So Dashboards can get quite pricey over time.
But they're very, very useful
if you have an application to monitor
in a very certain way.
Okay let's go ahead with the hands on now.
So let's go ahead and create a Dashboard.
So we click on Dashboards and we can click on
create Dashboard.
And I'll call it MySysOps
Dashboard.
Click on create Dashboard.
And here we go.
Now in there we're able to add different
kind of widgets.
And it could be a line, a stocked area,
a number, a text or a query results
from login sites.
For now we'll just add a line.
Configurate.
And we'll need to select a graph.
So we'll do a CPU utilization.
Because that's our favorite metric.
And we'll go into EC2.
And we'll get the one from our instant
that is running.
So here we go.
We get the CPU utilization graph happening right here.
Create a widget
and here we go.
So now we can see is that
this widget has been created.
And right now we are in Ireland.
So I'm gonna click on save Dashboard.
Because you have to save the Dashboard
every time you do any kind of changes.
And so here we go, we're ready.
Now let's look at some very interesting stuff
for this.
First of all,
we can select any kind of timeframe we want.
So we can set up, okay,
absolutes where we can choose some kind of
date frame.
Or relative, we'll say okay I wanna get
the last six hours.
And we get this graph.
Or we wanna get the last 30 minutes.
And we get a much, less narrower graph.
Okay.
Next we can click on the button to refresh our data.
And hopefully get more data in.
But also we can click on the top right
and enable auto-refresh.
And the reason we would do auto-refresh
is to basically not click on that button all the time.
So we can say every ten seconds,
I want to auto-refresh.
Okay.
The other thing you can set
is choose the time that you want.
So either you wanna be in UTC timezone
which is going to show 11:35, 11:40, 11:45.
Or if I wanna get my local timezone
we get a different timeline.
So, 12:45, 35, 40 and 45.
So this is something you can set up
on the top right.
The annoying thing is that you have to
do it all the time.
Every time you get back to CloudWatch
you'll have to set up the timezone again.
But as we can see, we can get options
to get local timezone or UTC.
Now the really interesting thing to do
with these Dashboards
is to look at how to make them work on the
global level.
And so for this let's do a quick experiment.
And switch our regions.
So I'm in Ireland right now.
Maybe I wanna go to US East North Virginia.
So I'll click on that.
And as we can see now,
our Dashboard is still there.
We still get MySysOps Dashboard.
That's available.
And we still see our metric.
So what happened?
Well when we created this graph,
it was automatically assigned to where
we created it.
So we created this in Ireland.
So I can say
CPU utilization in Ireland.
And that graph is actually made from
from Ireland, the one you saved.
From Ireland.
But I just want to specify it right here.
So the cool thing is that we can get
global Dashboards.
If I go to my EC2 console now.
And I am in the other region.
So I'm in North Virginia.
And I'm going to create a new instance,
I'll launch an instance.
And I'll do this very quickly again.
Teach you micro, and
say okay.
Everything acknowledged.
So now we have the second instance
and this one is in a different region.
It's in US East 1A
in the AZ US East 1A.
And so I'll wait for it to get started.
And what I'm going to do
is add yet another graph here
and we'll get a global Dashboard.
So it's been a while now I've waited.
And so my instance has been started
in North Virginia.
If I go to monitoring
I can see some metrics are up here and ready.
So what I can do now
is basically add a widget.
And here we can add a line.
Configure it.
And this time I'll go again,
look for CPU utilization.
But I'm in North Virginia so it's going to be
giving me, so that's go to EC2,
Pre instance metric.
And then we look for CPU utilization for this one.
And press on create widget.
And so now as we can see
let's just zoom in on one hour.
As we can see these graphs are slightly different.
This one is the CPU utilization for my instance
in US East one, so.
In
US
East
one.
And this one is for Ireland.
And so the graphs are different,
although they look similar, they're different.
So this graph right here has peak at the 12:05,
while this one has a peak at 12:20.
So this is basically representing my
CPU instance for
my EC2 instance in Ireland and
US East one.
And the cool thing is that it is a global Dashboard.
So if I change to,
ops I need to save the Dashboard obviously.
If I go to say Oregon
for example
just a completely different region.
I will see the exact same two graphs.
And so effectively what I've done
is that I've created a global Dashboard.
And I could go ahead and just do this
again and again in different regions.
And I get a global Dashboard.
Now the reason I'm showing you this
is that at the exam,
they will ask you how to do it,
how to build a global CloudWatch Dashboard.
And so this is how I wanted you to see
how to do it first hand.
So that's it.
I hope you enjoyed this lecture
and I will see you in the next lecture.