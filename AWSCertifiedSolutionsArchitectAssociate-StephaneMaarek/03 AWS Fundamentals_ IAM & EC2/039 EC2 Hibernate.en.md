
<v Lecturer>In this lecture we are going to talk</v>
about a new feature from EC2 called EC2 Hibernate.
So, let's get started.
We know we can stop and terminate our EC2 instances
and what happens?
Well, when we stop them, the data on disk,
if it's an EBS volume, it's kept intact for the next start.
And if you terminate our instance
then any data on our EBS volumes that is root
that is also set up to be destroyed
along side our instances is going to be lost, okay?
But, if it is an EBS volume that is attached
as a secondary drive, and that it's not meant
to be destroyed when your instance is being terminated,
then you will keep the data obviously.
So, these are behaviors we know and we've seen before.
And when we start an instance, what happens?
Well on the first start, the operating system
is going to boot and then it's going
to play the script from the EC2 user data.
This is how we customize our instances a little bit.
And, if we stop it and then restart it,
just the operating system will boot
and your application obviously, if you set it up,
then your application will start,
and if you have an internal cache on your EC2 instance,
then the cache will be warmed up.
And all these things can take a bit of time,
if the application is slow to start
or if your cache is slow to get warmed up.
So, there is a new option called EC2 Hibernate.
What happens?
When we use EC2 Hibernate,
all the in-memory state is preserved, so that means
that all the data in your RAM is going to be preserved,
so that's your memory.
So that means that when you restart your instance
after hibernating it, the instance boot is going
to be much faster, because in fact,
the operating system has not been stopped or restarted.
As we'll see in the hands-on,
the operating system will still be up,
so it's like we just froze, or hibernated,
our EC2 instance state, and we can restart it
to get back into a state much faster.
What happens, because it's really tough
to maintain a memory state obviously,
well the whole state of the RAM is going to be dumped
into a file onto the root EBS volume.
And that root EBS volume therefore must be encrypted.
And so what happens is this.
So we have our EC2 instance that is running,
and there's an encrypted Amazon EBS root volume in the RAM.
Upon we stop and hibernate, what's going to happen
is that the RAM is going to be dumped
onto the encrypted Amazon EBS root volume,
and then the instance will be stopped,
so there will be a shutdown of the instance,
but not the OS, and then when we restart it,
the RAM will go from the EBS volume,
into the RAM of the instance,
and the instance will be running.
So why would we do this?
Well, the use cases are if you want
to keep a long-running process running,
or if you want to save the RAM state,
or if you have services that take a lot of time
to initialize, and you don't want to really initialize them
on start, then you would hibernate your instance
and restart it and then your instance state will be kept.
Okay, so good to know about EC2 Hibernate.
It doesn't support all the EC2 instances.
Currently it supports C four, C five, C three
and four and-- I mean all the one instances right now,
you can see, C, M, and R.
Obviously this can change over time
as the feature gets better.
The instance RAM size must be less than 150 gigabytes.
That's the current limitation, because you have to spend
and put all that RAM into disk,
so you need to have a big enough root EBS volume.
It's currently not supported for bare metal instances.
The AMI that it supports currently is Amazon Linux 2,
or Linux 1, or Ubuntu.
You can use the root volume, so it has to be an EBS volume,
it cannot be an instance store. It has to be encrypted
and it has to be large enough, big enough,
to support the dump of the full RAM size.
Finally, it's only available for On-Demand
and Reserved instances, so not Spot instances,
and there is a current limitation
that the instance cannot be hibernated more than 60 days.
So these information right here,
probably is not what the exam will test you on.
The exam will probably test you on more
of the feature itself, to save the RAM state
and hibernate your instance.
But this is more, some real world experience
that I'm giving you, so that if you want to use the feature,
you know the limitations.
Now these limitations, as anything in AWS,
they change really really quickly,
and so it's very very possible that in the future,
obviously there will be improvements on these things
and that maybe more instances types will be supported
and so on, okay?
So see this as a guideline and a little bit less
as a source of truth.
Okay, so that's it for this lecture.
I will see you in the next lecture for the hands-on.