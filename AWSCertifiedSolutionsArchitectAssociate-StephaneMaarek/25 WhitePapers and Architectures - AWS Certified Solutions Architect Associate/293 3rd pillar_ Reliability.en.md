
<v Instructor>The third pilar</v>
of the Well-Architected Framework is reliability,
and so reliability is the ability of a system
to recover from infrastructure or service disruptions,
dynamically acquire computing resources to meet demand,
and mitigate disruptions such as misconfigurations
or transient network issues.
So it's about making sure your application
runs no matter what.
The design principles are simple.
We need to test recovery procedures
so you need to use automation to simulate different failures
or to recreate scenarios that led to failures before.
We need to automatically recover from failure.
That means that you need to anticipate
and remediate failures before they occur.
Then scale horizontally in case you need
to have increased system availability, or increased load.
And then stop guessing capacity.
So basically that means that if you think,
oh, I need four streams in this for my application,
that probably isn't going to work in the long term.
Use auto scaling wherever you can
to make sure you have the right capacity at any time.
And then in terms of automation,
you need to basically change everything through automation,
and this is to ensure that your application will be reliable
or you can roll back, or whatever.
In terms of AWS Services, what do we have?
Well the foundations of reliability is going to be IAM,
again making sure that no one has too many rights
to basically wreak havoc on your account.
Amazon VPC, this is a really strong
foundation for networking.
And Service Limits, making sure that you
do set appropriate service limits.
Not too high, and not too low,
just the right amount of service limits,
and you monitor them over time.
Such as if your application has been growing,
and growing, and growing,
and you're about to reach that service limit.
You don't want to get any service disruptions,
so you would contact AWS,
and increase that service limit over time.
Trusted Advisor is also great,
we'll see this in this section
about how we can basically look at these service limits,
or look at other things,
and get strong foundations over time.
Change management, so how do we manage change overall?
Well, Auto Scaling is a great way.
Basically if my application gets more popular over time
and I have set up auto scaling
then I don't need to change anything, which is great.
CloudWatch is a great way also of looking at your metrics.
For your databases for your application,
making sure everything looks reliable over time,
and if the CP utilization starts to ramp up
maybe do something about it.
CloudTrail in terms of are we secure enough
to track our API calls?
And Config, again.
Failure Management, so how do we manage failures?
Well, we'll see this for disaster recovery explanation
in this section, but you can use backups,
all along the way to basically make sure
that your application can be recovered
if something really really bad happens.
CloudFormation to recreate your whole infrastructure
at once, S3, for example, to backup all your data
or, you know, S3 Glacier if we're talking about
archives that you don't need to touch once in a while.
Finally maybe you want to use a reliable,
highly available global DNS system,
so Route 53 could be one of them.
And in case of any failures, maybe you want
to change Route 53 to just point to a new application stack
somewhere else and really make your your application
has some kind of disaster recovery mechanism.
Don't worry, we'll see disaster recovery
in this section as well,
and I'll try to make it as simple as possible.
So that's it, for this pillar, I hope you liked it,
and I will see you in the next lecture.