
<v Narrator>Now we are getting into the concept</v>
of Auto Scaling Groups.
So in real-life basically your websites
and applications will change.
And they will have different loads.
So the more users, the more popular you are going to be,
and the more loads you going to have.
So in the cloud as we see we can create
and get rid of servers very quickly,
and so there is one thing the Auto Scaling Group
does very well.
It is to Scale Out.
That means add EC2 instances to match an increased load,
but also Scale In, remove EC2 instances
to match a decreased load.
And then finally we can ensure that the EC2 instances
can only grow to a certain amount
or decrease to a certain amount.
And so we can define a minimum
and a maximum number of machines, running in an ASG.
Finally we can also have a super cool feature of the ASG
which is to automatically registering new instances
to a Load Balancer .
So in the previous lecture
we did register instances manually
but obviously, there is always some kind of automation
we can do.
So in AWS what does it look like with the graph?
Well here is our beautiful Auto Scaling Group.
It's a big arrow,
and so the minimum size, for example one here,
is a number of EC2 instances
you'll have for sure running into this Auto Scaling Group.
The actual size or desired capacity parameter,
is the number of EC2 instances running
at the previous moment, in the current moment in your ASG.
And then you have the maximum size
which is how many instances can be added for Scale Out
if needed when the load goes up.
And so that's super useful.
What you need to know about is the minimum size
desired capacity and maximum size parameters
because they will come out very often.
Also note that the Scale Out means adding instances
and Scale In means removing instances.
So now how does it look with Load Balancer?
Well here is our Load Balancer and Web Traffic goes straight
through it and we have our Auto Scaling Group in the bottom
and basically the Load Balancer, will know directly
how to connect to these ASG instances.
So we'll direct the traffic to these three instances.
But if our Auto Scaling Group Scales Out,
so if we add EC2 instances then the Load Balancer
will also register its targets,
obviously perform health checks,
and directly reach traffic back to them.
So Load Balancer and Auto Scaling Group
really work hand in hand in AWS.
So ASG they have the following attributes,
A launch configuration
and we'll be creating one in the next lecture
during the hands on.
But a launch configuration has an AMI and an Instance Type
EC2 User Data if you need it, EBS Volumes,
Security Groups, SSH Key Pair
and as you can see while this is quit common,
quit the same thing that what we've been creating
from before when we launched an instance manually.
Obviously they are very very close.
You also set the Minimum Size, the Maximum Size
and Initial Capacity, as well as the desired capacity.
We can define the network and the subnets in which our ASG
will be able to create instances.
And we'll define Load Balancer Information
or target group information,
based on which Load balancer we use.
Finally when we create ASG,
as we see we'll be able to define Scaling Policies
so what will trigger a Scale Out
or what will trigger a Scale In.
So we are getting to the Auto Scaling part of Auto Scaling,
which is the Alarms.
So basically,
it's possible to scale your Auto Scaling Groups,
based on the CloudWatch alarm.
And we haven't seen yet what is CloudWatch,
but as I said Amazon is kind of a "Spaghetti Ball,"
so, don't worry follow with me.
So the CloudWatch alarms is gonna be something
that's going to monitor a few metrics,
and when the alarms goes off, so when a metrics goes up
you'll say,
"Okay you should Scale Out, you should add Instances."
And then when the Alarm goes back down
or there is another Alarm saying its too low,
then we can Scale In.
So basically the ASG will Scale based on the Alarms.
And the Alarms can be anything you wanna metrics,
the monitors such as the Average CPU,
and the metrics are computed as an average overall.
Okay, it doesn't look at the minimum or the maximum,
it looks at average of these metrics.
Based on the Alarms basically we can create
scale-out policies and scale-in policies, as I said.
So there are rules and there are new rules for Auto Scaling
we'll be seeing them in the hands on,
but now you can basically say,
"Okay I want to have a Target Average CPU Usage
in my Auto Scaling Group."
And basically it will scale-in and scale-out,
based on the load to meet that Target CPU Usage.
You can also have a rules based on the number
of request, on the ELB per instance.
The Average Network In, Average Network Out.
So really whatever you think the better Scaling policy
is for your Application, you can use.
These rules are easier to set up than the previous ones
and they can make more sense to reason about,
saying, "Okay I want to have 1000 request per Instance,
from a ELB."
That's easy to reason about.
Or "I want my CPU usage to be 40% on average."
Now you can Auto Scale also according to your custom metric
and basically we can define a custom Metric say,
the number of connected user to our application
and to do this,
we'll create a Custom Metric from our application,
we'll send it to CloudWatch using the PutMetric API,
and then we'll create a CloudWatch alarm,
to react to low or high values of that metric.
And then these alarm will basically trigger
the Scaling policy for the ASG.
So what you should know out of this is that,
the Auto Scaling group
isn't, tied to the metrics AWS exposes.
It's also be any metric you want,
and it can be a Custom Metric.
So here is a small brain dump on things to know on your ASG.
First of all you can have Scaling policies for your ASG,
and it can be anything you want.
So it could be CPU Network,
it could be a Custom Metric or define,
or even based on the schedule if you know in advance,
how your visitors are going to visit
for example your website.
If you know they are logging very early in 9:00 AM,
may be you can be proactive,
and add more instances proactively before users arrive,
so they have a better experience.
Also ASG can use launch configuration or launch templates,
and launch templates are the newer version
of launch configuration,
and they are recommended to use moving forward.
And if you wanted to update an Auto Scaling Group,
what you need to do is to provide a new version
of that launch configuration or that launch templates.
And then you underlying EC2 instances,
can be replaced over time.
If you do attach an IAM role to your Auto Scaling Group
that means that the IAM role will automatically
be assigned to the EC2 instances that you launched.
Okay?
And an Auto Scaling Group in itself are free,
the only thin you need to pay for,
is the underlying resources being launched.
So that means your EC2 instances attached EBS volumes
Et cetera, Et cetera.
If you have an instances under an ASG,
the beautiful thing is that if somehow
the instances get terminated, then the ASG will realize
that your instance has been terminated,
and will automatically create new Instance as a replacement
and that is the whole purpose of having an ASG
really is that extra safety that it gives you,
to know that your instances will be automatically recreated,
as a new one in case something goes wrong.
And when will the Instance be terminated?
Well Instances can be terminated,
for example if they marked unhealthy by a Load Balancer
and so your ASG knows,
"Okay your Load Balancer thinks that your Instances
is unhealthy,
the better thing to do is to terminate that Instance
and replace it by creating a new one."
So remember, an ASG create automatically new Instances
doesn't restart, doesn't stop you instances,
it literally terminate them
and create new one as replacement.
So that's it.
I hope you liked it and I will see you in the next lecture.