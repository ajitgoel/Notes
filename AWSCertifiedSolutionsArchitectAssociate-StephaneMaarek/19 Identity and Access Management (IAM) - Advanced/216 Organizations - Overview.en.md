
<v Instructor>So let's get into the multi-account realm</v>
with AWS Organizations.
So, AWS Organizations is a global service
and it is allowing you to manage multiple AWS accounts
in your organization.
The main account is going to be called,
the Master account and you cannot change it,
and the other accounts within your organizations
are member accounts.
The member accounts can only be part of one organization.
Although, they can be moved from one organization
to another, it's called a migration.
And we'll see how to do this
in this theory lecture as well.
So, the benefits of organizations
is that you get Consolidated Billing across all the accounts
and with a single payment method.
So you can have as many accounts as you want
and they will all be billing
under the master accounts.
And the pricing benefits you get from aggregated usage,
for example, if you have volume discount
for EC2 or Amazon S3,
you get it at the organization level.
So, it's really great to federate
all these accounts into one organization
to pay less and simplify your billing methods.
And there's a really cool API
that allows you to automate the AWS account creation.
So, you can create AWS account on demand
using an API through organization
and make sure that the billing of that account
will be rolled back into the bigger accounts.
So, what if we have multiple accounts in AWS?
We have multiple strategies for it.
For example, you may want to create one account
per department or per cost center or per environments,
for example, for dev, test and prod,
or based on regulatory restrictions, for example,
or for better resource isolation.
So, you want to make sure that you don't have resources
that can talk to each other within the same VPC.
So, you create two accounts
and you don't pair them together.
And so, the resources are virtually-isolated.
There's also good to have per-account services limits
and also, isolated accounts for logging.
So, there's multiple strategies
for multiple accounts and it depends, really,
on the wish of the main architect in your organization.
Now, there is a difference
between having a multiple accounts
or one account with multiple VPC in it, okay?
The thing is, if you have multiple accounts,
you know they're really well-separated
and you have different user accounts and so on.
Whereas, if you have one giant account
with multiple VPC, there is a chance
that your resources may talk to one another,
the instance that, the users also get access
to multiple VPCs and so on.
So, it's really up to you
to choose what you wanna have
and how you want to run your organization.
You can have also, tagging standards for billing purposes
and you can enable CloudTrail on all accounts
to send the logs to a central,
for example, Amazon S3 accounts,
and also have CloudWatch logs
sent to central logging accounts.
So many, many different strategies
for your cross accounts
and if you wanted to administer all of the accounts,
then you can establish Cross Account Roles
for admin purposes,
where the master accounts can assume an admin role
into any of the children accounts.
Okay, so how do we organize all these accounts?
We organize them using Organizational Units or OU.
So, you can organize them by business units, for example,
on this example, we have the master account
and then we have the sales OU,
the retail OU and the finance OU.
And under each OU, we have different accounts.
So, the sales account one, two,
retail account one, two and so on.
Or, you can have it by environment, for example,
you have the master account
and then you're gonna have production,
development OU and test OU.
And within each OU, again, multiple accounts.
Or, you can be project-based.
Project one, project two, project three,
and multiple accounts.
Again, this could be completely different.
You can mix and match.
It's really up to you to design the type of OU you want,
but it gives you some ideas around how OUs are being used.
So, for your organization, let's have a look
at all the possibilities.
You have the root OU,
we have the root account as the master account,
and then you can have OUs within this.
For example, a development OU with two accounts in it,
the Prod OU with two accounts in it,
and another OU deep within the Prod,
which is the finance OU,
with another two account in it
and another OU within Prod again,
which is the HR OU with two accounts in it.
So, we see the kind of structure we can create
with organizations and you can go really crazy,
you can assign accounts to whatever OU you want
and they will inherit some rules and some SCP,
I will show you in the next lecture,
in the next set of slide, of security.
So hopefully, you can visualize now what OU is,
because we're getting into the security of these OU.
There is something called a Service Control Policy or SCP,
and it allows you to white-list or black-list IAM actions
applied at the root OU or account level
but it doesn't apply to the Master account,
the SCPs have no effects on the Master account.
So, the SPCs will see an example very shortly.
They can be applied to only the users
and the roles of the account,
including the root.
So, if you apply an SCP onto your account within an OU,
and you say you cannot use EC2,
even an admin within that account cannot use EC2.
But the SCP does not apply to service-linked role.
So, this is the service roles that other services use
to interact with organizations.
Okay, SCP must have an explicit Allow to allow things.
So by default, it does not allow anything.
And so, use cases for SCP,
and this is what the exam will test you on,
will be to restrict access to certain services.
For example, you're saying,
"Okay, in my production accounts, you cannot use EMR."
Or to enforce PCI compliance
by explicitly disabling services
that are not compliant with PCI yet in AWS.
So, I'll try to make this a little bit clearer,
let's have a look at our OU.
So, we have the root OU with a root account,
a production OU with an account A in it,
and with an HR OU with account B,
and a finance OU with account C.
So, let's assume that you usually do this.
On the root OU, you add an SCP called FullAWSAccess
which tells that every services
and every action can be done.
Basically, allowing you to use your accounts.
But, let's apply a DenyAccessAthena SCP
onto the Master accounts.
Now what can the Master account do or cannot do?
Well, the Master account can do anything
because it inherited the Full Access SCP from the root OU,
and even though we have attached to DenyAccessAthena SCP
to the Master account,
because it is the Master account of your route OU,
no SCP apply and therefore this SCP reply
to the Master account is completely not taken into account.
To summarize, we've inherited stuff
from the root OU and the SCP applied
to the Master account, ToDenyanything does not apply.
Now let's go on, we have a DenyRedshift SCP
that is applied to the prod OU.
And an AuthorizeRedShift SCP applied to the account A.
So now about account A,
it can do anything because you have FullAccess SCP.
But it cannot access Redshift
because there is a DenyRedshift SCP
applied to the prod OU.
And even though I would attach
an AuthorizeRedshift SCP to my account A
because we have an explicit Deny
on Redshift at the OU level,
the Deny is going to take precedence over the Authorize.
So even though I have this AuthorizeRedshift SCP
on the account A, actually that Authorize
is useless because we already have a Deny at the OU level.
So it's interesting for you
to know that this is a full tree.
And so account A going to inherit the SCP
at its level, at the OU level
and even the roots of the OU,
so it goes like a tree.
And so if one of these says, "Deny,"
then it's going to be a Deny.
Now let's look at HR OU,
as a DenyAWSLambda SCP.
And so what about account B?
Well, it can do anything
because of the Full Access,
but it cannot access Redshift
because it's within the prod OU, it's the bigger OU.
And also, it cannot access AWS Lambda
because it's within the HR OU.
So account C though, in finance OU
is not affected by this DenyAWSLambda SCP
because it only applied to the HR OU but not the finance OU.
And therefore account C, has the exact same permission
as account A, which is to do anything but access RedShift.
Hopefully that makes sense.
If you understand this,
you've basically understood SCP and their power.
So let's take an example of what it looks like.
An SCP looks just like IAM policy.
So this is AllowAllActions,
so we allow star on star.
So do you say you can do anything but DenyDynamoDB
and we're saying the effect is "Deny"
on "dynamodb" star for any resource.
Another strategy would be to whitelist
only a certain type of services.
So we're saying allow EC2 start
and CloudWatch star on resource star.
But any other services but EC2 and CloudWatch,
cannot be usable.
If you don't know exactly what this means
you want more examples,
there's a link right here
that takes you to the documentation
and shows you different OUs, SCP you can have.
Okay, finally, before we get into the hands on,
how about moving accounts.
So, say we have Org A and Org B,
and we want to move an account from Org A to Org B.
To migrate accounts,
you need to know the process.
The first thing is to remove the member accounts
from the old organization,
then you send an invite to the new organization
to include that account.
And then you accept the invite for the new organization
so that the member accounts can join it.
So as you can see in my growth diagram up,
that's how the accounts went in.
So, you left the first one,
and then you get an invite from the second one
and it was migrated.
And if you want to migrate the master accounts,
so you want to migrate the root accounts
of your organization,
then you need to migrate every single accounts within it.
And then when you're done,
you delete the organization
and you migrate the account
that is standalone back into Org B.
So that makes sense, it's just,
step that look natural
but once you set it, you know it's possible
and you will be able to answer an exam question
based on this.
Alright, so that's it.
We'll try to make
I will try to make AWS Organization much clearer
in the next lecture for the hands-on,
but you got a good overview of what it is.
I hope you like this lecture
and I will see you in the next lecture.