
<v ->So CloudWatch Events,</v>
very quickly,
you can either have a schedule so you can define right
on Cron Job to schedule events in CloudWatch.
So little notifications you would trigger on demand.
Or you can have an Event Pattern in CloudWatch Events
and that will basically allow you to define rules
such as if a service in AWS is doing something
we are going to trigger an event if that event
matches the rule.
So for example, one example that you have is,
for example Cloud CodePipeline state changes
is a good one for this.
So we can detect CodePipeline state changes
using CloudWatch Events
and then trigger, maybe, Lambda functions
or send a message to SQS, SNS, Kinesis.
I mean you can get different integration points
if you wanted to.
When you have CloudWatch Event as an output
the event it creates is small JSON document
and you will give it a little information about the change.
Okay, so, that's it for CloudWatch Event.
Let's just quickly look at the UI.
So on the left hand side we have events
and here we can create events.
So let's just create a rule.
And so we can either choose a Event Pattern
or a schedule.
So if we choose a schedule we can say,
okay, we would like to create a event every five minutes
or every five hours, or whatever we want,
and you can set that number to whatever you want as well.
Or you can set up a Cron expression,
so if you're filling with Cron expressions
you can set up one here.
And then an event that comes out of it will
look like this JSON right here.
It will say hey, the detailed type is that
it is a scheduled event.
Now, for the targets you can define the targets
you want to go to so you can say.
And there's a lot of different targets as you can see:
CodeBuild, CodePipeline, EC2, Kinesis,
Lambda, SNS, SQS.
So you can pretty much integrate AWS CloudWatch Events
with anything you want.
We'll just remove this for now.
And so, let's do something a bit more fun.
For Event Pattern we're able to look at
some services.
So as you can see there's a list of services right here
that we can react to, so let's choose CodePipeline;
'cuz it's a popular one.
And we want to respond to a Pipeline Execution State Change.
And we want to have a state specific to be failed.
So any time my CodePipeline fails,
which is this Event Pattern right here.
And I could copy this to the clipboard or even edit it
if I wanted to add some more details.
Anytime my CodePipeline state changes to failed,
then what do I want to do?
I want to add a target and I will say maybe
write to an SNS queue.
And I will just say alarm triggered.
This one topic, we don't need to create
a new one for this one.
And we can configure the inputs to either
give you the matched events,
so if you pasted the entire events that was matched
into the alarm, which is fine,
but you also have different optimization or settings
if you wanted to modify that events.
So that looks good.
We'll click on configure details,
we'll name our rule so call it
"CodePipeline Failures,"
and it's enabled.
We'll create a rule and that's it.
We have our CodePipeline Failure Rule right here.
So there's two other rules that are
already created it turns out.
There is code commit notification,
so that was auto created by code commit for the
repository we created.
Basically if we look at it any time there is a
Pull Request State Change
the comment on Pull Request, or comment on commit,
they will basically trigger an SNS topic.
And the other rule that existed from before was
a CodeCommit Repository State Change
when the reference was updated or created,
such as a branch.
And it was in master.
So that's it for CloudWatch Events.
And basically you can set up as many rules as you want
and they allow you to have reactivity in your
AWS infrastructure.
And as you can see you can set up many different
sources for these rules.
And many different targets as well.