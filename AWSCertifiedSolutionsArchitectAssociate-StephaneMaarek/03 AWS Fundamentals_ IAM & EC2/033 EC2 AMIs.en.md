
<v Stephane>So let's talk about AMIs 'cause</v>
they're very important to understand for the exam.
As we saw AWS will come with a lot of base images
that we've been using, Ubuntu, Fedora, Red Hat, Windows,
et cetera, even Amazon Linux, right.
And these images, they can be customized
at runtime using EC2 user data or we can SSH
into these images and just do whatever we want.
But if we want to create our own image
that is ready to go and to use instead
of reproducing all that setup, all the time.
That's called an AMI and we can create AMI
for our machines to use and it'll be custom AMIs.
And we can build these AMIs for Linux or Windows machines.
So why would you even create a custom AMI?
Well, they can have a lot of advantages
such as pre-installed packages, faster boot time
because we don't need to use EC2 user data at boot time,
the machine will come configured
with monitoring or enterprise software,
there will be security concerns, for example maybe we want
to have control over all the machines in a network
and we need to install some security software,
maybe we want to have control of the maintenance
and the updates of AMI over time,
maybe it's compliance right, maybe we want
to set up Active Directory Integration out of the box,
maybe we want to install our app ahead of time
and that gives us faster deploys when we use auto-scale,
or maybe we want to use someone else's AMI
that will optimized for running an app or DB, et cetera.
So that's a lot of reasons why you will want
to use custom AMIs but remember that the AMI you build,
they're only for a specific AWS Region, okay.
They're not global, they're for a specific Region.
We can also use public AMI from other people
and we can also rent other AMIs from
other people so if they wanna sell it.
And these people, they basically have optimized software
or they've done something special and that's very easy
to run and configure using the Marketplace.
So we rent expertise from AMI creators
and you can even become an AMI creator
if you're an expert at setting some software up.
So the AMIs, all of them can be found
on the Amazon Marketplace.
Just a little bit of warning, do not use an AMI
you don't trust and some AMIs come with malware
or it may not be secure for your enterprise
so do your due diligence in advance.
For the AMI storage, basically when you create an AMI,
they take space and they will live into Amazon S3
and we know the S3, it's a durable, cheap,
and resilient site for storage and we won't see them
in the S3 console but we know that they live there
and by default all our AMIs are private
and they will be locked for our account and region.
But we can make them public and share them
with other people or sell them on the Marketplace,
so there's a way to move them around basically.
The pricing is pretty easy.
They live in Amazon S3, so we get charged
for the actual space taken in Amazon S3
and so if you take US-EAST-1,
this is the S3 pricing, I won't read it for you.
And so over all, I really encourage people to use AMIs.
Delete the old ones but it's quite inexpensive
to make your private AMIs and just remove
when you're down with them.
So in the next lecture what we'll go is to go ahead
and just create a small AMI just for practice.
We'll see it's very easy.
So see you in the next lecture.