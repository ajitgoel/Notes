
<v ->Okay, so I've mentioned in the past</v>
that we can integrate SQS with an Auto Scaling Group,
but I want to give you a theoretical lecture
on the architecture around how that works.
So, we have an Auto Scaling Group
with a bunch of EC2 Instances,
and these instances are polling for messages
from an SQS Queue.
What we'd like to do is to scale the number
of EC2 Instances based on the amount of messages
in the queue, such as,
if we have more load going through the queue,
we assign more capacity to these EC2 Instances,
and if there is less load,
obviously, we terminate some EC2 Instances
through the Auto Scaling Group.
So, the way it works is that we need a metric
to scale the Auto Scaling Group on, with some alarms.
So our EC2 Instances are going to push
a CloudWatch Custom Metric,
which is going to represent the queue length,
which is how many messages are waiting to be processed,
divided by the number of instances
in your Auto Scaling Groups.
And this metric, if it goes above a certain threshold,
that means that we either have too many messages,
or not enough instances.
And so when we set the threshold
to whatever we need for our application,
we will create a CloudWatch Alarm
for breaching this metric,
and the CloudWatch Alarm will automatically
be assigned to a scaling policy on your Auto Scaling Group,
and scale your Auto Scaling Group accordingly.
So we would need to create, maybe, two alarms;
one for going above a certain threshold for that metric,
and one for going under another threshold for that metric.
And that would give us a step scaling policy
For example, one that would go up, and go down.
But this is the basics of how you need
to integrate SQS with an Auto Scaling Group,
there is no out-of-the-box metric you can use
from SQS or from ASCII to do this scaling,
you have to create a custom metric
that represents the queue length,
divided by the number of instances.
And so having this architecture is really helpful
because now we can create decoupling
between your application tiers,
which is very, very common.
So, say we have a bunch of requests for EC2 Instances,
and they're also managed by an Auto Scaling Group,
maybe they're behind a load balancer,
and so they receive a bunch of requests
to process some files.
What we can do is put these requests
into an SQS Queue that is infinitely scalable
because of SQS, and then have another Auto Scaling Group
of EC2 Instances behind that queue to pull for jobs
from that queue, and the benefit of it is that we can have
Auto Scaling on this SQS queue from the way I've defined you
just in the previous slide, and we get very scalable
architecture this way that is fully decoupled.
So that's it, just a theoretical architecture on solution
with SQS in the middle, but hopefully
that makes a lot of sense
and you start seeing how all the pieces in AWS tie together.
That's it.
I will see you in the next lecture.