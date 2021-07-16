
<v ->Okay, so now we're going to visit Trusted Advisor.</v>
Trusted Advisor is a service.
It's super easy, there is nothing to install.
It's going to give you a high level AWS account assessment.
So you'll get recommendations straight away from AWI.
How does it work?
Well, Advisor will go ahead and analyze our AWS accounts
and provide recommendations on many different topics,
such as Cost Optimization, Performance, Security,
Fault Tolerance, and Service Limits.
A popular exam question is, how do we know
if we're reaching a service limit?
How can we get a general overview of that?
Well, Trusted Advisor is the answer.
The thing is with Trusted Advisor, it's not really free.
Core Checks and recommendations, that's free
for all customers, but a lot of it
is disabled unless you have a Business Support plan.
Also, you can get weekly email notifications directly,
and you can enable that from the console.
So as I said, if you're a Business &amp; Enterprise customer,
you get full Trusted Advisor, and you can even
set CloudWatch alarms when you start reaching your limits.
So let's have a look at Trusted Advisor
just to get a better idea of how it works.
Let's find the Trusted Advisor service.
Here we're going to have a view
of multiple different topics.
As you can see, I told you that there would be
five topics that we would see.
There is Cost Optimization, Performance,
Security, Fault Tolerance and Service Limits.
As you can see right now, the little refresh button
is checking, is running because it's actually going
to do some checks on my accounts right away.
While this runs, let's go into Cost Optimization.
In Cost Optimization, the first thing that's surprising
is that it's absolutely not available
unless we upgrade our Support plan.
If you're a corporation, for sure you
would have a Support plan, and then you take advantage
of it, but here, because I don't have a Support plan,
I don't have any cost optimization checks.
Yet, we can see what happens.
Low Utilization of Amazon EC2 Instances.
For example, if their CPU is less than 10%.
Idle Load Balancers, so basically
the balancers that don't do much.
Underutilized EBS Volumes, Unassociated Elastic IPs.
So basically, all the very common ways
of wasting moneys on AWS, you will get some information
about it here, which is really, really nice.
The tricky thing, though, is that
it complements the billing features.
It doesn't supplement them.
Okay, let's look at Performance.
Performance is, yet again, locked,
and locked means that you have to upgrade your Support plan.
Still, we will see what it is.
There is High Utilization Amazon EC2 Instances.
That means that there is more than
90% CPU instance daily on your instances.
That means you're pretty much stuck,
or you need to upgrade them or something's happening.
Same for EBS Volumes.
Large Number of Rules in an EC2 Group.
Basically that can lead to performance issues,
but we're talking about a very large number
of security group rules, et cetera, et cetera.
You can have a look at all these things.
Security is where it's important.
Here there's one item that needs to have my attention.
Five items are good, nothing really, really bad.
But for Security Groups, freer, we can see
which security groups have unrestricted ports.
That means that for now, port 22 is unrestricted,
and that can be pretty, pretty bad.
The idea is that here, I have all my groups here
that have enabled port 22 unrestricted,
and I could go and act upon it.
What you see here is that it sort of overrides with Config.
Config was more around compliance.
This is more around recommendations.
They're a little bit different, but they check
for the exact same thing, at least for security groups.
See here, we can also see Public Snapshots,
RDS Public Snapshots, Bucket Permissions
in case we have any public buckets, IAM Use,
and whether or not we have MFA enabled on root accounts.
Still, we get a lot more information
if we do upgrade our Support plan,
and they invite you to have a look
at all these things right here.
Okay, Fault Tolerance.
Yet another thing that we need
to upgrade the Support plan for,
but you get information around the edge of the snapshots,
you get some availabilities of the balance
to make sure that you're really balanced
across all the AZ, optimization for
your load balance reconfiguration, et cetera, et cetera.
So some really good recommendations,
and finally, importantly, Service Limits, where we can check
how we are doing for each service
and if we're getting close to the limits.
If we're at 80% of the service limits,
we'll get a little warning and we'll know that it's.
Let's have a look at, for example, EC2 On-Demand Instances.
I'll go right here and say, okay, for now
I don't have any of my limits,
and I could click here and see all the limits as well.
Really helpful, I think, to have all these things.
The exam will ask you about service limits,
that's for sure, so know that Trusted Advisor
is the way to get alarms and stuff like this.
And then finally, super important,
somehow it comes up, you do have your Preferences,
where you can disable Trusted Advisor if you wanted to.
But more importantly, you can set
weekly email notification preferences,
and you can set email address for
Billing Contact, Operations Contact, Security Contact.
The idea is that if you want to just receive weekly emails
around the recommendations you can do
to improve your Cost, Performance, Security,
Fault tolerance and Service Limits, this will be the way.
This is also an exam question, so to enable
these weekly email notification preferences,
you have to do this through the UI.
So that's it for Trusted Advisor.
It's actually a very simple service,
but a very helpful, and you leverage it fully
when you have the actual Support plan for your AWS accounts.
Alright, that's it.
I will see you in the next lecture.