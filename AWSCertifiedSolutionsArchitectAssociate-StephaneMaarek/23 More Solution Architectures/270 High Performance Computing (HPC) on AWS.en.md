
<v Voiceover>So there is this concept in AWS</v>
that's becoming more and more common and something
that the exam will test you on.
Which is called High-Performance Computing or HPC.
So the cloud is the perfect place
to perform High-Performance Computing.
Why, because you can create
a very high number of resources in no time.
And you can speed up the time to results
by adding more resources.
And you only pay for what you've used.
Once you're done you can destroy the entire infrastructure
and not be billed a single dime.
So, the idea here is that we can have
an extremely high number of instances performing
computations for us and then be done with it.
And just pay for what we used.
This is perfect, this is a great use case for the cloud
and something that AWS is encouraging you
to do more and more.
So why would you use HPC?
Well to perform genomics, computational chemistry,
financial risk modeling, weather prediction,
machine learning, deep learning, autonomous driving
and so on.
So the question is, what services in AWS
will help us perform HPC?
Let's have a look.
So the first category is how do we manage the data
and how do we transfer the data into AWS?
The first one is going to be direct connect to move data
gigabits per second of data into the cloud
over a private secure network.
So we've seen this in details.
Then we have snowballs and snowmobile
to move petabytes of data to the cloud
through a physical rout.
And they're usually great for big transfers
or one off transfers.
And then we have DataSync
well we have to install the DataSync agents
and they will help us move large amounts of data
between on-premise and NFS or SNB systems
into S3, EFS or FSx for Windows.
Okay this makes sense.
Now what about compute and networking?
Very important.
The first one is obviously our EC2 instances.
We have CPU optimized or GPU optimized instances
based on the type of computations we're trying to do.
We can also leverage Spot Instances
or Spot Fleets for huge cost saving
and Auto Scaling to automatically scale
our fleet based on the computation we're doing.
Finally, if our EC2 instances need to talk to one another
and perform some computation in a distributed fashion.
Then, using an EC2 placement group of type cluster
is great to get the best network performance.
In which case we have a low latency 10 Gbps network
in this example.
And for the cluster placement group everything's
on the same rack, everything is on the same AZ.
Okay. Next, how can we go even further to improve
the performance of our EC2 instances?
The first one is EC2 Enhanced Networking
also called SR-IOV.
And this gives you higher bandwidth,
higher PPS which is packet per second and lower latency.
And how do we get this EC2 Enhanced Networking?
The option one, which is the most recent and popular
is called an Elastic Network Adapter.
And this delivers you a network speed of up to 100 Gbps.
And this is something you have to know going into the exam.
So ENA is for EC2 enhancement networking, and gives you
higher bandwidth. higher packet per second
and lower latency.
Option number two is to use these very complicated things
from Intel called 82599VF and that gives you up to 10 Gbps
and that was to be the old ENA so it's Legacy
but I'm still including it here just in case
this comes up in the exam and you see it
you know what it is.
So, both these things the ENA and the Intel allow you
to get EC2 enhanced networking on your instance.
But you can push this a step further.
And using the Elastic Fabric Adapter or EFA.
And this is an improved ENA dedicated for HPC
for high performance computing.
And it only works for Linux.
And it's great when you have inter-node communication,
or tightly coupled workloads.
So think about distributed computation.
Why, because it's going to leverage something called MPI
the Message Passing Interface standard.
And this standard will bypass the underlying Linux OS
to prove even lower-latency and more reliable transport.
So think of it like if you have a Linux instance
and you're performing tightly coupled workloads
then using an EFA will bypass US and provide
you even higher network performance.
So it is quite common in the exam that you will be asked
to differentiate between the ENA and EFA or ENI
or something else.
And so this is good that we're seeing this right now,
you need to make sure to understand these concepts
very very clearly.
Okay, so we have transferred the data,
we're computing over the data
and we've configured our network,
but how do we store the data?
So, multiple choice.
We can use the Instance-attached storage,
so we could be EBS and this can scale up to 64000 IOPS
if you use io1.
It could be an instance store,
and we've seen this can scale to million of IOPS.
And it's linked to the EC2 instance so it's on a hardware
it's going to be lower latency,
but we can lose it if we lose our instance.
Then we can use network storage such as Amazon S3
to store a large blob of data.
It's not a file system it's to store large objects.
Or EFS where the IOPS is going to be scaled
based on the total size of your file system.
Or we can use a provisioned IOPS mode on the EFS
to get higher IOPS.
But we've seen there's a file system that's dedicated
to HPC, which was called FSx for Luster.
And Luster was for Lenux and Cluster.
And it's going to be HPC optimized,
gives you millions of IOPS
and in the backend it's backed by S3.
So lots of options again.
Finally, how about automation and orchestration?
The first thing we use is Batch which is (mumbles)
a support service to perform multi-note parallel jobs
and enables you to run jobs
that span multiple EC2 instances.
They're batch jobs, and it's very easy to schedule
these jobs and launch the EC2 instance accordingly.
They will be managed by the batch service,
so batch is a very popular choice for HPC.
Or we can use something called AWS ParallelCluster
which is an open source cluster management tool
to deploy HPC on AWS.
It's configurable with text files
and it automates the creating of VPCs, Subnets,
clusters types and instance types.
And this is something, an option
again you can see in the exams.
So to summarize, HPC is something that comes up
more and more in the exam.
And it's not a service,
it's a combination of service and different options.
And you need to make sure you understand all of those
to maximize the potential of computation within AWS.
And I hope that for this, this lecture was helpful.
Alright, that's it, I will see you in the next lecture.