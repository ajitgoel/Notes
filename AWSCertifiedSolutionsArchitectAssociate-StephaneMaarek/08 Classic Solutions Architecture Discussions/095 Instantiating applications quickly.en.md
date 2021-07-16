
<v Narrator>So a very quick lecture on</v>
instantiating applications quickly.
So in the Architecture discussions that we've had
we have never really talked about how do we install
and deploy this application onto or EC2 instances
to basically run or websites, and so when you launch
your full stack, It can take a lot of time
to install applications insert or recover data
configure everything and then launch the application.
So how can we speak that up? So we can use the advantage
of the cloud to speed up.
So let's have a look for EC2 instances
we can use what's called a golden AMI.
A golden AMI means that you install your applications
you're OS dependencies etc, everything beforehand,
and then you create an AMI from it
and then for the future EC2 instances,
you just launch them directly from the disk golden AMI
and the reason we do this is
that we don't have to reinstall the applications
US dependencies etc. We could just launch with everything
already installed and ready to go,
and that's the fastest way we can start up our EC2 instance.
So golden AMI is very common pattern in the Cloud to have,
and also seen how to use user data so easy to use user data,
and that allows us to bootstrap or instance.
Bootstrapping means basically configuring the instance
when it first starts. And so bootstrapping can also be done
install application OS dependency's etc.
But this is going to be very slow and we
don't want each application to do each easy to do instance
to the exact same thing the other one did
if it can be repeated.
But for dynamic configuration for example maybe retrieving
the URL for our data base and the password etc. etc.
We can use bootstrapping using the EC2 user data
and so we can basically have a hybrid mix of a golden AMI.
An easy to user data to make it work, and this is something
we'll see in a second using elastic Beanstalk.
Elastic Beanstalk use the same principle of the hybrid,
where we can reconfigure an AMI
and then we add on some user data.
OK so for RDS databases we can restore from the
snapshots and then the database will have the schemas
and the data ready. Which is much better
than may be running a big insert statement
they will take forever to start RDS databases.
That may be a way to go be quicker
when you want to retrieve data.
And EBS volumes we can restore from a Snapshot
so we don't have to have a disc that's empty
and not formatted, we can retreat from a snapshot
and the snapshot will already be formatted properly
and have the data we need.
So these are the things you need to understand as a
solutions architect when going to the exam.
You say, OK we just speed up EC2 instances starting.
a way to speed up EPS databases or EBS volumes
and formatting in the other kind of stuff.
This is what you want to do using golden AMI user data.
Restart database snapshots and EBS snapshots.
So that's helpful, hope that makes sense for you
and I will see you in the next lecture.