
<v Narrator>So CloudWatch Logs is also</v>
very important to understand.
Your applications can send logs
to CloudWatch using the SDK.
And that's a way to log your
current application log,
if it was something very custom.
But if you wanna collect a log from an AWS service,
then it is very straightforward.
Elastic Beanstalk will directly collect
a log from your applications
and send them to CloudWatch.
ECS will get the collection from the container logs.
AWS Lambda, you get the collection from the function log.
For VPC Flow Logs, we'll gets
to see this in a future section.
But we'll get the VPC specific logs.
We'll get API Gateway logs.
CloudTrail, if you set up a filter.
CloudWatch if you set up log agents on EC2 machines.
And you can get Route 53 and you can log
all the DNS queries that are
made all around your infrastructure.
So overall, you get a lot of services that can
directly send logs to CloudWatch out of the box.
And then CloudWatch themselves can
send the logs to whatever you want.
It could be S3 if you wanted
to archive it from time to time.
Or it could be Elasticsearch cluster, for example,
if you wanted to perform further analytics.
Because Elasticsearch can have
nice searching capabilities for logs.
So, CloudWatch Logs, though there is one thing
to know, you need to store logs in two things.
You need to have a log group,
and that's named whatever you want.
Usually it's an application name,
but it's really free naming.
So you can do whatever you want.
And then within the log groups
you're gonna have many log streams.
And this is what a stream of a specific file,
or an application, or a container will be.
So this is usually when you have one log stream
per container, one log stream per application,
or per log file, that kind of things.
And then once you have defined a log group
and many log streams,
you can define a log expiration policy.
whether or not your log never expires,
expires in 30 days, et cetera.
Because you get to pay for data retention in CloudWatch.
So the more data you store in CloudWatch,
the more you're going to pay.
So this is a good strategy maybe
to have it for 30 days, export the logs to S3,
and then delete in CloudWatch from time to time.
And then you can even use the AWS CLI
if you want to tail the CloudWatch Logs.
So that means follow the logs as they appear.
Which is a nice way of seeing how
an application is behaving in real time.
Finally, if you are sending the logs to CloudWatch,
some common mistakes is not
to get the IAM permissions right.
And so when you don't have the IAM permissions right,
obviously things won't work
and it could be quite tricky to debug sometimes.
Now, logs can be encrypted.
You can use KMS for encryption.
And that works really, really well.
Now, a bit of insider on the new features of CloudWatch,
They're not necessarily going
to appear in the exam today.
But you need to know about them anyway
'cause I wanna give you real life skills.
And so you can use CloudWatch Logs
and you can use filter expressions.
And so with these filter expressions, for example,
we can search for a specific IP inside of a log.
So you can basically
search for whatever you want.
And then on top of it you can set up a metric filter,
basically it should give a metric
based on the filter you define.
And you can use that metric filter
to trigger CloudWatch alarms.
The idea is that for example you're looking for
a specific IP, you set up a metric filter.
And then any time that IP appears,
it will trigger an alarm
and you will know about it right away.
Could be to detect an attacker
or some shady behavior or whatever you want, really.
And then there is this new feature,
which I'm really really excited about,
which is called CloudWatch Log Insights.
It's out of November 2018,
was announced at re:Invent Conference.
And you can basically use this to query logs
using a common language that's easy to use.
And you can add queries directly
into your CloudWatch dashboards.
And so there are some sample queries
that are given in the UI.
And you can see, for example, the common query says
I want the 25 most recently added log events,
or the number for exceptions logged
every five minutes, or the list
of log events that are not exceptions.
So you can have queries that are common,
but also CloudTrail, Lambda, Route 53, VPC Flow Logs.
And you can even write your own.
But I'm really excited because I think
it brings a lot of usability and ease
to query CloudWatch Logs, that was not easy
to do before we filter expressions.
So if you are getting started with CloudWatch Logs
and you don't have any logs
you will see this screen.
So you can click on Let's Get Started
and then click on Quick Start Guide.
And this will go ahead with configuring
and installing the CloudWatch Log Agents
on a running EC2 Linux instance.
So let's create that instance, first of all.
So I'm going to create an EC2 Management Console.
I'm going to launch an instance,
and I will choose Amazon Linux 2 AMI, click on Select,
t2.micro, Configure Instance Details.
And then we'll have to create a new IAM role.
So I'll create a new IAM role
and this role we should give access to CloudWatch.
So I'll click here and it's click on an EC2 type of role,
click on Next Permissions, and then in terms of Policies,
I will just type CloudWatch in there,
and I can give it, for example, CloudWatch Full Access.
There's going to be a bit more privilege in this to view.
Even CloudWatch Logs Full Access, this will be a bit better.
And this will allow our instance
to send logs to CloudWatch.
Click on Tags, click on Next Review, and
the Role Name, I'll just show it, DemoCloudWatchEC2Role.
Okay, this is great, Create Role.
So this EC2 role will basically
allow us to send CloudWatch logs
from the EC2 instance.
So I will scroll, Refresh,
and click on DemoCloudWatchEC2Role, here we go.
Now I click on Add Storage, Add Tags,
Configure Security Group.
I will just allow SSH from anywhere, excellent.
Review and Launch, and finally click on Launch.
I'm just going to create a new key pair
'cause I don't have one in this region.
So I will call it DemoAWS, Download Key Pair,
and here we go, Launch Instances.
So my instance is now starting,
and what I'm going to do is when it's done booting,
I'm going to go and SSH into it.
Okay, so I have now used, successfully used
SSH command to add SSH to my instance.
And so this instance, just to remind you,
it has an IAM role attached
that allows us to send logs to CloudWatch.
So let's get started with CloudWatch.
So we will go back to the Quick Start.
I'm going to scroll down
and this was around creating the IAM role.
So we've done that already, and then we need
to install and configure the CloudWatch Logs Agent.
So let's scroll down, we have to do
sudo yum update -y to update
all the instance packages.
And then we are going to do sudo yum update -y,
AWS logs, just to get the logs installed as well.
The logs agent installing on the
EC2 instance and that log agent
will be responsible to send the logs to CloudWatch.
So let's just paste the command
in right now and then press Enter.
Okay, so the CloudWatch Logs is now installed.
So if I go to this file called /etc/awslogs/awslogs.conf
this is a file where basically,
where we have all the configuration
of our logs for the log agent.
And so we can just modify it.
If we wanted to, but for now I won't do it.
Although there is one thing we need to modify.
It is the /etc/awslogs/awscli.conf to
point to the right region so if you
look at this file, this one, it's permission denied.
So if you go to sudo su to be super user
and do it again, so I'll cat it, okay here we go.
So, its going to show better
here we have the plugins,
which is CloudWatch Logs.
And then the default region which is us-east-1.
That we have to modify this.
So I'll do nano and I will modify this file.
So nano and I'll just copy this and paste it, yes.
And the region, right now I'm in eu-west-2.
But you just change it to whatever you want
based on the region you're in.
Okay excellent, so now once we have done this thing,
what we can do is start the service.
And so because I'm using Amazon Linux 2,
I'll run this command right here.
Paste it, and now the logs agent has started.
So now we can actually check this file for errors.
When the service started, so let's just cat it,
see if anything is bad, nope, nothing looks like errored.
So let's go back to CloudWatch
and hopefully now if we refresh this page
we should see some log groups being created.
And so yes, one log group
was being created for /var/log messages.
And this contains the log stream of my EC2 instance id.
And this will contain a bunch of information.
All my log lines that happen on my EC2 instance.
So this is really awesome, this is a quick demo
of CloudWatch Logs but here you could filter event,
maybe type in Linux and this will just show you
all the lines that have the word Linux in them.
So just a cool little thing you can do.
You can start searching your logs
and start filtering them and making sure they work.
And finally one last thing I want to show you
is that in this Log Stream,
so let me just go up, expand here,
we can set expiration on the logs.
So they can never expire, or set up
to 10 years of retention.
So maybe I'll choose one week,
and after one week,
basically the data will be deleted.
And then if I click on the log here.
I can basically delete this log stream
or search the log groups or create a new log stream.
So that's pretty handy.
And then finally, if I select this log group,
I can export the data to Amazon S3,
or we can stream to AWS Lambda,
or stream to Amazon Elasticsearch Service.
Finally when you're done with the service,
don't forget to terminate your instances
so you don't pay for a running instance.
And that's it.
So CloudWatch Logs is very, very handy.
Once you have many log being aggregated from everywhere.
And you just have to remember
its function in the AWS environment
as a solutions architect.
I hope that was helpful
and I will see you in the next lecture.