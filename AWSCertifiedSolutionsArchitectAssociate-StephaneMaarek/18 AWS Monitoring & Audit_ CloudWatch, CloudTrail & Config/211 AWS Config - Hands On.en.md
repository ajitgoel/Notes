
<v Instructor>So let's go ahead and open Config and here,</v>
we are going to be able to get started and basically
the service as I said is going to be able to provide
an inventory of our resources and a history of all
the configuration changes,
and we evaluate rules that will give us some
compliance and analysis.
So, let's get started.
The first thing we have to do is set the kind of
resources you want to record.
So remember, this is not a free tutorial, so if you
just want to be in the future just watch me do it.
But right now, I'm going to say okay, I want to record
all the resources in this region.
We can also include global resources if we
want to record IM resources for example.
If you don't want to tick this box, you can say
okay, I just want to record all the scalings,
scaling policy or may be EC2, all these things
under EC2, etc. etc.
For me, I'm just going to record all resources
just to show you the scope of all the possible things,
and I will also include the global resources.
Now basically anytime that we have a change, we can
log that change into a bucket and it can be an A list
bucket, so we can say stephane-aws-config
and we can also add a prefix if we wanted to to this,
but for now it is fine.
So basically any configuration history and
configuration snapshot files will land into S3 so we
can analyze it later, maybe using Athena.
We can also stream any configuration change to an
Amazon SNS topic, but we are not going to tick this.
And finally because it is a new service on AWS,
and it needs to do a lot of things, you need to grant
it a service-linked role and so we are just going to
create it straight from this UI.
Click on Next.
Now we get to choose the Config rules and so there's
a lot of Config rules we can choose and basically
these rules will allow us to track the compliance
of some of our elements.
For now, what I'm going to do is that I'm going
to skip this 'cause I want to give you a good
overview when we get there at the moment.
So now we get in to the Review.
We have no rules being created and the only thing
we do right now is just track all
the resources configuration.
Click on Confirm and now AWS Config is being set up.
That may take a little bit of time, so I'm just going
to pause until this is done.
So now my resource are being discovered and that can
take a little bit of time to be done.
Okay, so my entire account has been mapped out
and as you can see, I have 71 resources in this
region which is really, really cool because I didn't
even know this, right.
Now I know I have 71 resources.
And so I'm going to pay obviously because I'm
tracking these resources now, but all the configuration
of all these resources going to be tracked,
which is also quite safe and quite nice to know.
Okay, so as we can see though, getting the resources
information is not really, really correct.
If I click on one on security group and click on this one,
well I just get information around what it's like
and I can get a configuration timeline and here we go,
that was the first time it was created,
but there is not much that's happening really.
I need to know over time if it's compliant.
If these security groups are open to the world
maybe or not.
So right now, there is no compliance timeline because
we don't have created any rules.
So what we have to do is go ahead and start creating rules.
So let's go in my Dashboard and I'm going to
click on Add Rule.
So here we are going to add rules and now we have a list
of all the AT2 and any AWS managed rules I can
add right now.
So you can see basically all these rules kind of
apply to different services.
For example, this one can apply to IAM,
this one can apply to EC2,
this one can apply to AutoScaling and so each rule
has a description of what it does.
For example, this one is really cool.
It's saying that if you select this rule, only
the approved AMIs will be compliant.
Running instances not used using this AMI will
not be compliant.
And so the really cool thing about it is that now
we can just say okay, there is a bunch of AMIs
in our company and we know we have the security software,
we know they're set up correctly and if people
don't use these AMIs, we'll know right away that there's
a compliance violation and we can go and talk to
people to migrate to the right AMI.
So that could be a really, really cool type of rule
to set up.
I'll cancel it.
The one I want to set up though is going to be the one
on SSH, so I'll just type SSH and here it's
called Restricted SSH.
So this is a very nice rule which shows whether or not
the SSH traffic can be completely unrestricted to any IPs,
which is not what we want.
So I'll say okay, I want to install this rule
and I want to trigger this rule anytime a configuration
changes, but we can also set periodic on some rules
for example saying every five minutes I want you to
check or every day I want you to check whether or not
the rule is compliant or not.
Now the scope of changes could be resources, tags
or all changes, so any time a resource changes
or a tag changes or both changes, then we can
trigger a configuration change check and so
for now I'll just say resources and I'll say okay,
any time my security group changes, then you are
going to check whether or not SSH traffic is allowed.
So I'll click on Save, and now the rule
is being evaluated.
So if you remember, I had something like seven
security groups so all the seven security groups
are going to have their compliance evaluated against
this rule and we'll be able to get the results in a second.
So I'll have to wait for it to be done.
And so here, what we see is that out of my rules,
three resources were non-compliant and
four resources were compliant.
So let's just click on two of those to see the difference.
So if I click on the compliant one, this one,
this was created using RDS, and if I click on
the configuration itself, so let's go back to
this compliant one.
So, this was RDS Launch Wizard and I can click
on Manage Resources in the top right and get
straight in to the Resource Configuration.
And so what I see is that yes, there is no 22 port
here being open whatsoever,
but if I go to my non-compliant resource,
so this one was non-compliant with one rule,
this was my Launch Wizard 2, and if I go to
manage resource, what I can see is that probably
in inbound we have SSH on port 22 from anywhere
and that makes my resource non-compliant.
So what I can do is instead saying okay, maybe only
my IP should be allowed, not every ever, just my IP.
I click on Save and now I should have made
this group compliant.
So what I can do now is just wait a little bit for
this resource and so automatically because I've changed
the configuration, automatically this should
become compliant over time.
So how do we see this?
Well, we have two ways.
We can use the configuration timeline and the
compliance timeline, so I've just opened both.
For the configuration timeline, as we can see here,
we have the first time my resource was being discovered,
so this was on the second of January at this time
and we can see here, we can see whether or not
there were any changes and CloudTrail Events.
And so the information we get here is that we also
get because we have enabled CloudTrail in the past
lecture, we can see that the root user did run
instances AuthorizedSecurityGroupIngress,
CreateSecurityGroup, etc. etc.
So we can see all the CloudTrail Events related
to that security group.
But know what we have to wait for now is basically
for the configuration to change because if you
go to the compliance timeline as we can see right now,
it's not compliant, but because I just changed the
security group rule after may be five minutes,
it just needs a bit of time to evaluate the rule
again and to be triggered, I should be
seeing the compliance.
So I'll just pause the video for a few minutes.
So I just refreshed the page and it took a few
seconds, but as we can see now, my resource is
now compliant, so we get the exact time at which
it became compliant.
And the really cool thing is that if I go to
configuration timeline, I'm able to see that
yes, some changes were made at 3:03 and if I click
on Changes, we can see the configuration changes
that were done.
So, one rule basically disappeared, so this rule
basically went away, which is the 0000/0 and this
rule was added, so new permissions were added as
a new rule and I only allowed SSH from my IP.
And so now we basically made this resource compliance
and over time, we are able to track the compliance
and why it happened thanks also as well
to the configuration timeline.
So the idea is that at scale basically, you're going
to have a Dashboard in which you are going to evaluate
how many rules are non-compliant and how many resources
are non-compliant and you're going to set up as many
rules as you need.
It could be either the rules that are defined
by AWS which are quite handy or custom rules that
you want to define if you use AWS Lamda,
but by defining all these rules and on all your resources,
you basically have a great account view on which
rules are doing what and how is your resource configuration
changing over time for your entire resources on your
entire AWS accounts, which I think in itself is
really, really cool and nice and I think something
that should be enabled for everyone.
Unfortunately, you have to pay for it,
so it's just something you have to make a conscience
decision for if you wanted to keep track of all
your resources and all the rules you wanted,
but definitely if you have a production AWS account
and you need some compliance rules against whatever
you want, then have a look at config and set up
as many rules as we can because overall, it is really,
really Dashboard to know how many times you have
non-compliant rules and how to make your resources
compliant over time.
So I hope you liked it.
I hope you understand how Config works now
and I will see you in the next lecture.