
<v Instructor>Let's talk about a very popular service</v>
called AWS Config.
So, it helps you with auditing
and recording compliance of your AWS resources over time.
And how does it do it?
Well, it will record configuration
and the changes to your configuration over time,
and it will display that to you, into the console.
Additionally, you can store all this configuration data
over time as well, into S3. And why would you do this?
Maybe you want to analyze it using Athena
in a serverless fashion, to quickly extract
the insights you need.
So the questions that can be solved by AWS Config
would be, is there an unrestricted SSH access
to my security group?
Or, do my buckets are public exposed,
do they have any public access?
Or how has my ALB configuration changed over time?
Again, I record it, and roll it back.
You can receive alerts in the form of SNS notifications
for any changes that happened within your configuration.
And Config, even though it's a per-region service,
you can aggregate it across region and all accounts
to get a global view.
So we'll do a hands-on and see what Config would looks like,
but here is some teaser.
There, you can view the compliance of a resource over time.
So if it's green, that mean it is compliant,
if it's red, that mean it's not compliant.
You can view the configuration of a resource over time
to see what had changed.
And there is a deep integration with CloudTrail,
if you enable CloudTrail.
So that you can see who did the changes,
in terms of what changes were done.
So then you can define Config Rules, right?
And they help you evaluate the compliance.
So you can use ASW managed config rules,
and there are over 75 of them.
Or you can make your own custom config rule.
And for this you must define that rule
using AWS Lambda.
So for example, the rules we can make is,
evaluate if each EBS disk is of type gp2.
Or evaluate is each EC2 instance is type t2.micro.
So you can go crazy,
you can really invent anything you want.
Rules can be evaluated or triggered
based on different factors.
Any time a config change,
so it's a reactive type of rule evaluation,
or at the regular time interval,
if for example, your config changes are a lot,
or very often, it just wants you
run it every hour, for example.
You can also trigger CloudWatch Events
if a rule is non-compliant,
and then chain that with Lambda, and so some remediation.
Rules can also have a auto remediation setting.
And so if a resource is not compliant,
you can trigger an auto remediation.
For example, say you have a rule
that checks if instances have tags,
and if not, if they're non-approved,
maybe your remediation will be to stop these EC2 instances.
Overall, Config Rules do not prevent actions from happening,
there is no deny, it's not like IAM,
which denies stuff from happening in your accounts.
But it helps you evaluate
the compliance of your resources over time,
and maybe you remediate to that.
But it's not a preventive action,
it is something that reacts to changes.
And the pricing, so Config is not free.
There's no free tier, so you have to pay
about $2 per active rule per region, per month.
And there is no partial month,
so if you do the hands-on with me in the next lecture,
then expect to pay a little bit of money.
So if you don't wanna pay any money,
again, please do not do the hands-on with me,
and just watch me do.
All right, that's it.
I will see you in the next lecture.