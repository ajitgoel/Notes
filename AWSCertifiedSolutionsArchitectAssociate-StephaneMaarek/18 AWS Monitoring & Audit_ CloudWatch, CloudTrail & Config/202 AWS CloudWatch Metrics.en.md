
<v Narrator>So CouldWatch provides metric for every</v>
services in AWS, monitoring is at the core center of AWS,
and a metric is going to be a variable to monitor.
So it could be CPUUtilization or NetworkIn
number of connections, etc, etc.
Now metrics belong to namespaces, so they'll be grouped,
and a dimension, it will be an attribute of a metric,
for example, which instance id is sent to the CPUUtilization
for EC2, that could be a dimension.
Now you can have up to 10 dimensions per metric,
and metrics will have timestamps,
so obviously because it's a time series
we get a metric over time, so they will have timestamp,
and you can create a CloudWatch dashboards of metrics,
and we'll see dashboard and
metric details in the next lecture.
So, that's it for the basics,
now we have some metrics called the EC2 Detailed monitoring,
its something that we have to enable,
so if you remember EC2 instances metrics
they're every five minutes,
but if you enable detailed monitoring for a cost,
you get data every one minute,
and we already know this,
and so if we use detailed monitoring,
we can get faster, order scaling for our ASG,
it could be a way of improving the scalability
of our application.
Now the AWS Free Tier will allow us to get
10 detailed monitoring metrics,
so that's quite a nice tier,
and this is all you should know,
remember for EC2, we've seen this before.
Memory usage is not pushed by default,
it must be pushed from the inside of your instance
as a custom metric,
and for this we've used the monitoring scripts
and that's the way to do it, okay.
Now finally you can get custom metrics in CloudWatch
and you should know about them,
so by default you can send
your own custom metrics to the CloudWatch,
using the CLI or whatever SDK you want,
and you can also send or receive dimensions or attributes
to segment your metrics, so up to 10, just like before.
So we can send Instance.id, Environment.name, etc, etc.
So you'd just give dimensions to our metrics,
and then the metric resolution by default is going to be
this time one minute,
so we have a standard resolution of one minute,
but you can have high volume, high resolution metrics
and you can send them up to one second, so every one second
and obviously when you do use that higher resolution,
you're going to pay a higher cost,
so this is if you need extreme, detailed and extreme
information around of how your application is fairing
every one second.
Now to just send a metric to CloudWatch
you used to use the API called PutMetricData,
and that is for customer tricks obviously,
and then in case you get any errors,
the issue, the thing to do in AWS is to use a throttle
and exponential back off,
so that means that if you get an error,
first you're just going to retry every one second
and then two seconds and then four seconds
up until it works.
So now then lets have a look at CloudWatch metrics
in the AWS console.
Okay, so for CloudWatch we're just going to
find the services and type in CloudWatch
and in there I'm going to open the CouldWatch console.
We'll go to metrics
and in metrics we can see there's a bunch of
metrics groups so based on the services you used
you will see some metrics being populated right here,
so we get EC2, RDS, EleastiCache, S3, logs,
there's a bunch of stuff you can have,
and so just to get one metric working right now,
because everything is being deleted all the time,
I'm going to launch an EC2 instance,
very quickly I'll just launch an instance,
I'll select Amzazon Linux two,
I'll select t2 micro
and I'll just click directly on Review and Launch,
launch and I say acknowledge that it's okay.
So right now I've just launched an instance in ireland
and so it's in eu-west-1c and the instance state is pending.
What I'm going to do is wait just a few seconds until
the instance metrics appears right here.
Okay, so now I can click for example on EC2
and I can click on Per-Instance Metric,
I can look for CPU and see what we have,
so we have a CPUCreditUsage, CPUUtilization, etc.
I'll just use the instance I just launched
so a 73e at the end,
so let me click on it, here we go.
CPUUtilization over time for this metric,
and here we've just got a graph,
a line over time for this metric,
so not very fascinating I have to admit,
but it is something
and we can get some kind of graph happening.
So the idea is that here we could access the monitoring
as we know already,
directly from this console
but also we could access all the metrics
straight from CloudWatch and the reason we would do it
is to create CloudWatch dashboards and we'll see this
in the very next lecture.