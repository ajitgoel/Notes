
<v Instructor>Now, let's talk about Amazon MQ.</v>
Amazon MQ's kind of new.
So if we look at SQS and SNS,
it's where they're called "cloud-native" services.
That means that they're using proprietary protocols
that are just available on AWS.
And they scale really well,
we don't manage them, they're kind of serverless.
But, traditional applications, when they run on-premise,
they are also been using queues and topics
and notification systems.
And they've been using their own little protocol,
so you can be MQTT, AMQP, STOMP, Openwire, WSS.
And so when you migrating one of these application
to the cloud, you don't want to re-engineer
all the application messaging layer to use SQS and SNS.
So what if there is an in-between way,
where we can use an hosted MQTT queue in the cloud,
and that hosted MQTT queue in the cloud is Amazon MQ.
So, Amazon MQ is a managed Apache ActiveMQ.
And Apache ActiveMQ is a great way of doing,
you know, messaging, such as
only using the protocol MQTT, etc.
So, Amazon MQ doesn't "scale" as SQS/SNS,
it's because we have to provision it,
and and it runs on a dedicated machine,
we can still have high availability
with failover doing multi-AZ.
And it has both a queue feature and a topic feature.
So, going into the exam, basically,
if you see we are migrating an app
from on-premise with cloud, and the app is using
the MQTT or the AMQP protocol or whatever,
what should we use?
Well, the answer is Amazon MQ.
That's all you need to know, but I'll show you
how to create one really quickly.
Okay, so we are in the Amazon console
and I'm going to tap Amazon MQ.
And we're gonna get there, and this is basically
a managed message broker service
for Apache ActiveMQ, as I said.
And so, the really cool thing is that it's really
about migrating your messaging layer
without rewriting code, okay?
So, this is for migration,
this when you migrate an application on-premise
to the cloud and to have Amazon basically
manage this message broker for us.
So, we get started and we have four options,
we can either select a blueprint if you want,
you have some kind of clustering,
and a clustering with multi-AZ.
You could use single-instance,
which is great for development
and testing all type of workloads.
But we're going to have one single AZ,
and so that means that if that AZ fails, then we're done.
And we have an active/standby broker,
which is kind of like a multi-AZ for RDS,
where basically there's another instance
waiting to take over if anything
happens to the first one.
For us, we'll just use single-instance broker
just to see the options.
Click on next.
And when we're done, we select the
broker name, MyDemoBroker.
And here, we select a broker type,
so we can go basically select all these things.
So, t2.micro is for evaluation,
and it's eligible for the free tier, okay?
But, if you wanted to do something
a few more production-like,
you would use something like m5.large
all the way through m5.4xlarge,
something like this.
So, teaching micro is fine for me,
as I said, we're in a single-instance broker,
and we're using Apache ActiveMQ.
Maybe it's possible that Amazon adds more
broker engine over time.
Username, I'll call this datacumulus,
and password, I'll have password1234
because I'm really not secure,
so I'll just have an very easy password.
Here we go.
And, additional settings,
we could set the broker engine version,
I'm just using 5.15.8, and I know this works.
Okay?
We don't need to really look into these
additional settings, but you could see
that you could overwrite configuration,
you could enable CloudWatch Logs,
you could set this in the default subnets and VPC,
or you can select your own subnet and VPC.
Same for security groups, you can use the default one,
or select existing one, whether or not you want
your ApacheMQ to be public or not,
so, yes, public, 'cause we wanna access it.
And then maintenance windows, which is sort of like RDS,
so do I want to have automatic
minor version upgrades or not.
And then what's my maintenance window that I want.
So, overall, not changing much here.
I'll just go ahead and create the broker.
And as you can see, the broker is being created
and it will take just a little bit of time.
It takes about 15 minutes total, so I'll pause until then.
Okay, so my broker has been created now,
and I can click on it and get some information,
so here's the ARN, Amazon Resource Name,
I can get some information around the broker name,
the broker type, how it as being configured, you know?
And then some configuration aspect of it,
and I can scroll down and here's the important things.
So, here, we get access to the ActiveMQ Web Console,
and from this web console, we're basically able to
access our instance, and we'll see
how to do this in a second.
And then, here, we get access to the endpoints as well,
and all the protocols are supported,
so anything you see, OpenWire, AMQP,
STOMP, MQTT, or WSS, think AmazonMQ.
So as we can see here, we clicked on the web console,
but it's still loading, and so when you see this
kind of thing still loading, it looks like a timeout,
and so it's a security group issue.
And so it's definitely a security group issue,
so, for this, how do we do it?
Well, we scroll up, we find the security group that we have,
and here it is.
You click on it.
And so we're looking at ports- 8162.
So let's go to the security group.
Inbound, and we'll set okay for port 8162.
I'm going to allow my IP to get in,
so, this is enough, 8162, my IP should be able to get in.
Okay.
And I'm going to refresh that page,
so let me go back to Amazon MQ,
find the URL, and now, yes, I am in it, perfect.
So now I can manage the brokers,
and it's going to ask for my username.
So my username was datacumulus
and my password was password1234.
And now I'm getting into the administration panel
for my broker, so I can see the uptime,
how much memory is used, the storage percent used, etc. etc.
And here, the really cool thing is that we can have
see the queues, so we can create a queue,
so I'll all it my test queue, and I'll say test,
and we're just creating a queue, excellent.
And we can send to the queue, for example,
so we could a message and so you can
have a lot of things in there, but I'll just say
test message being sent, and so, click on send.
And here we go, one message has been sent,
and you can see it's pending.
We could also play with topics, and basically
create a new topic if you wanted to.
We can look at subscribers to who is
subscribing to my topics and my queues.
The connections, the network, I mean,
all the cool stuff that we get information on this,
and so, we can get the OpenWire, WS, MQTT, STOMP, AMQP, etc.
So, you don't need to know all these things going
into the exam, but what I really want you to remember
is the type of protocols that ActiveMQ and Amazon MQ
accepts, how it was being created so we had to provision it,
and how it worked in the backend, and I think this
little security group trick was really helpful.
So, when you're done, you can just delete it,
it's really not a big deal,
so I'm gonna do this and that's it!
So, I hope you liked this lecture,
and I will see you in the next lecture.