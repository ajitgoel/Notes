
<v ->Now let's talk about how we can use something called the</v>
CloudWatch agents to take logs from EC2 instances,
as well as metrics, and have them onto CloudWatch.
So by default, no logs are going
from your EC2 instance from CloudWatch.
For this, you need to create and start an agent,
which is a small program on your EC2 instances
that will push the log files that you want.
So the idea is that your EC2 instances
will have the CloudWatch logs agent, for example, running,
sending the logs into CloudWatch logs.
For it to work your EC2 instance must have an IAM role
that allows it to send the log to CloudWatch logs.
That make sense.
And good to know is that this CloudWatch log agent
can also be set up on-premises servers.
So it's possible for you to have your services,
virtual servers, like VMware on-premises,
and you install the exact same agent,
which is a small Linux program,
and your logs will end up in CloudWatch logs as well.
Now there are two different agents
you can find in CloudWatch.
You have the CloudWatch logs agent, which is the older one,
and the CloudWatch unified agent, which is the newer one.
So they're both for virtual servers,
EC2 instances on-premises servers, et cetera.
The CloudWatch logs agents is the old version
and can only send logs to CloudWatch logs.
Whereas the unified agents
will collect additional system level metrics,
such as RAM processes.
I'll show you this in the very next slide.
And also send the logs into CloudWatch logs.
Now it's unified, it's better
because it can do both metrics and logs,
hence the name unified agent,
but also you can configure that agent very easily
using the SSM Parameter Store,
which is a feature that the previous agent did not have.
So you can do centralized configuration
for all your unified agents.
So the CloudWatch unified agent can send logs
in CloudWatch logs, but let's have a look at the metrics.
So if you install it on your EC2 instances
or your Linux servers, you can collect metrics
and what are they?
Well, we can collect the CPU metrics,
but at a way more granular levels, for example,
active, guest, idle, system, user, steal.
You don't need to know them at all.
I'm just giving you the granularity of all these metrics.
Disk metrics of free use total,
disk IO in terms of number of writes, reads,
bytes, IOPS.
RAM, so free, inactive, used, total, cached.
Netstat, the number of TCP and UDP connections,
net packets, bytes.
You get some information around the processes.
So total number of process.
How many are dead, bloqued, idle,
running, sleep.
And swept space, which is some memory spilling on disk.
So how much is free, used, and use percentage?
So what you wanna remember is just take a mental screenshot
of these things.
The bottom line is the CloudWatch unified agent
allows you get a lot more metrics
and a lot more granular details
than the normal monitoring for EC2 instances.
As a reminder, out-of-the-box for EC2,
you get some information on disk, CPU, network,
not memory, not swept, but all of this at a high level.
Okay?
If you want more granularity,
think CloudWatch unified agents, okay?
So that's it for me. I hope you liked it.
And I will see you in the next lecture.