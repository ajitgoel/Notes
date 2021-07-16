
<v ->Okay, so finally, for monitoring and audits,</v>
we will look at CloudTrail.
Then, CloudTrail is one of the simplest service
into AWS, but yet, one of the most useful.
It provides you governance, compliance,
and audit for your AWS accounts.
So, what does that mean?
Does it mean that because CloudTrail
is enabled by default, okay?
you will get a history of events and API calls
made within your AWS account.
So, anytime you do anything in your AWS account,
or any application does something,
you know it will appear in CloudTrail.
And so, if you do something from the console,
from the SDK, from the CLI, and your AWS services,
this will appear in CloudTrail.
Additionally in CLoudTrail, you can put all the logs
of things that happened in CloudWatch Logs,
and that gives you the ability to just
keep the events all the time.
Now, if a resource is deleted into AWS,
so if on the exam they ask you,
hey, something get deleted?,
Or someone did something, you know,
where should we look first?,
Look into CloudTrail first, okay?
This is probably the most common exam question
you'll get on CloudTrail.
So it's a very simple service but let's go ahead
in the hands on just so you get an idea of how it works.
Okay, so, make sure you are in the region
where you've been doing this course so far.
And so, what I'll be typing is CloudTrail.
And so, CloudTrail tracks user activity and API usage.
That's pretty much what I've said.
And so, here is pretty cool.
With CloudTrail we can view events in your AWS accounts.
And so, all of a sudden we see all the recent events
that happened for the last 90 days,
or at least the recent ones.
If you click on all events, we get 90 days history.
But we can see that elasticbeanstalk
has done a describe addresses API call
and we can see at which date and which time he did it.
You know, the source IP and what was API etcetera, etcetera,
Mia did a describe trails, um,
you know, just a few minutes ago.
And if I click on events,
you know, I can get all the information
about that event that happened.
You know, where, which region it was from, etcetera.
So, it's quite neat.
If you go to event history,
you get all the API calls that ever happened.
So there's a lot of them obviously.
Let's see if there is any deletes.
So, let's look at event name.
And I'll just type delete, okay?
And see that works, so deletes
Deletes, um,
Let's look at it.
Delete bucket, for example.
And so we can see that, you know,
there's three times where I deleted a bucket.
I deleted my bucket of stephane.
I deleted this really weird bucket name
that I just created just for fun.
So, it gives you the idea that
you can track any API call that was done by anyone.
So that's it for CLoudTrail.
I hope you liked it.
And I will see you in the next lecture.