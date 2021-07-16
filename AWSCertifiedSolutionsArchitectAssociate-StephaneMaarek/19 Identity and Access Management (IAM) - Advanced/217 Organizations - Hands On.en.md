
So, let's create our first organization
and invite our child accounts.
So, I'm going to got to AWS Organization
and for this exercise,
I have created a new account called aws-course-master
and this will be the master account
of my new AWS Organization.
So, I'm going to create and organization
and it says, okay, I am happy to create an organization,
that has a single payer and centralized cost tracking.
Lets, allows me to create and invite accounts,
allows me to apply policy based controls
and also helps me simplify organization-wide management
of AWS services.
Alternatively, we could create an organization,
that only has consolidated features,
but no other features, such as SCP,
and so we don't want that.
We want to create a fully featured organization,
so, we are going to click on this big blue button.
Okay, so now, our organization is being created
and so, for this you need to verify your master account,
so I'm going to go ahead to my email
and verify my master account right now.
And so, I've just clicked the email link
and now I am on this badge which now says,
that my email address has now been verified.
So, now I can invite existing AWS accounts
to join our organization.
So, you can see right now,
we only have one account, it has a star,
so it is the master account and it's named,
because I named it aws-course-master
and now we're going to go ahead and click on add accounts.
Now, when we're on our adding accounts, we have two options,
the first one is to invite an existing account
to join our organization, or the second one,
is to create brand new account in this organization.
So, because I already have created another account
in parallel, I'm going to just invite that account
to join my organization.
So, I click on this and then I have to specify
the email or account ID.
So, aws-child-account@stephanemaarek.com
and this is the root's account's email
for my child account, which is in this tab right here.
And so, I'm going to click on invite
and then an email should be sent out to add this account.
So, as we can see right now
on the invitation status on the right hand side,
there is an open invitation
and we're good to go.
Now, I just received an email.
And so, into my child accounts,
I'm going to go to the organization service,
so, I'm going to go to the same service
and hopefully from there, I should start seeing
a invitation request from my master account,
so, as we can see, there is an invitation
on the bottom left right here.
Invitations one, so I'm going to click on it
and it says, okay, you have been invited
by aws-master-account name, it is of course master,
with this master account email
and the request controls us to enable all features,
so, that means that on top of consolidated billing,
there will be ways to enable
the service control policies or SCP.
So, this makes sense, I want to accept it
and I'm going to confirm,
that this is the organizations that I want to join.
Great, so, now my account belongs to this organization
and we're good to go.
So, if I click on organizations,
now this is the only thing I see.
Now, if I go to my master account
and refresh this page, you should be seeing the fact
that we have two accounts in here.
We have the master account, aws-course-master
and we have the child account, aws-course-child
and both of these accounts are joined in
into the same organization.
There is only one star
because we only have one master account,
which is the account that manages the entire organization.
So, that's the first step and it's great.
We have allowed two accounts to be in the same organization.
But now let's have some fun
and go to the organized accounts.
So, in here we are able to create different
or use our organizational units
to organize our accounts into.
And so, the first units we have by default
is the root OU.
Root is on the left hand side
and it is going to be the top most OU.
And so, what I can do, is I can create a new OU
within roots and I'll call this one maybe Dev,
so we can have all the Dev accounts.
I'm going to have one called Test,
so we have the test accounts.
And then I can create another on called Prod,
for the production account,
but it's up to you to define the OUs you want.
And so, as we can see,
now we have Dev, Test and Prod
and maybe within Prod you can go ahead and add more OUs,
so you could have HR for the HR related accounts
and you can also have finance
for the finance related accounts,
so we can have OUs as we want it,
as we can see now, we have an entire tree,
that has been created based on
all the way from root to the finance.
And so, for each OU we're going to have a set of accounts,
so in the root OU right now, we have two accounts
and if I go to the Dev OU we have zero accounts,
if I go to Test OU or Prod OU there will be nothing,
obviously because I haven't moved any accounts there.
So, what I can do, is take one of these accounts,
for example the child accounts
and I can move this account to the OU I want.
So, I can move it to the Prod
and then HR and this is where my account will go,
so my course child is now going to be in Prod HR
and it belongs to this specific OU,
whereas my master account,
well by default it's good practice
to leave it in the root OU,
but it is very possible for you to move your master account
to anywhere you want,
you can move it for example to Tests
and this is it, now my account is in Test.
And so we are organizing the accounts
based on the trees and this is
from what we've seen from before.
So now, what we want to do,
is to be able to regulate how these accounts
can access different services.
And so, as we can see, we have one account in Test
and we have one account in Prod HR.
So, what I'm going to do,
is go to roots and I'm going to
enable service control policies and so they are SCP.
And as we can see they're now enabled
and once they're enabled, I can attach these policies
to different places in my OUs
and the formations will be rolled down
all the way to all the accounts that belong to this OU.
So, if we look at roots, service control policy,
right now there's one policy,
that's attached and available, called FullAWSAccess.
And this allows all the accounts within roots,
so everything underneath to access AWS full
and that makes sense
and you do not want to detach this policy from root,
otherwise you will lose access to everything.
So, you don't touch this.
But now, if we go for example to the Prod OU,
in Prod, I'm able to attach a service control policy,
so, if I look at service control policy right now,
there is one that's attached and available,
which is FullAWSAccess
but this one actually has been inherited
from the roots, so as we can see,
because the root has had the FullAWSAccess policy created,
then it has been inherited into the Prod accounts.
And so, again if I go down to the HR accounts,
where my course child is,
we see the same service control policy,
which has been inherited from the root,
so, as we can see FullAWSAccess,
has been inherited from roots and Prod, okay.
This is great.
So, now I can create my own policy.
So, once I'm here, I can see
that there's service control policies
and tag policies.
This is the one we're interested into,
SCP, that it within the scope of the exam
and tagged policies are not within the scope,
I'll just tell you what it is.
It is if you wanted to regulate
all the standardized tags
that accounts can create in their accounts,
so if you wanted to make sure,
that only few tags would be created in all your accounts,
you would create tag policies
and they could be really really helpful as well,
but in the scope of the exam for now.
So, let's go to service control policies
and here we can create our own policy.
As we can see, the first that has been created by default,
is FullAWSAccess, which allows access to every operation,
so, I'm going to create a policy
and this one is going to be denying access to a Athena,
so I'll just called it DenyAccessAthena
and here you can create a statement,
so that the policy can look like just like a Jason
and it can be a deny or it can bee an allow
if it's a wait-list policy or a blacklist policy.
And so, in here, what I want to do is go to Athena
so, I'm going to click to Athena
and then I'm going to select all actions
and they're gonna be denied.
So here we have a statement one called deny,
action Athena star and resource,
actually I should say star,
so I'm going to change this real quick.
I'm gonna set resource star.
In this mixture that here,
we don't allow anything on Athena.
Okay, so I'm going to create a policy
and now this DenyAccessAthena has been created,
but we now have to attach it to a specific account
or user and see what happens.
So, we're going to go to organize accounts
and in here in my Prod and my HR,
I'm going to go ahead to my HR OU
and in my HR OU right now,
I can go to service control policy
and I can go ahead and attach the DenyAccessAthena,
so now, any account within this OU
will have the FullAWSAccess
and the DenyAccessAthena service policies,
so if I click on my account in here
and I look at service control policies
as we see, we have FullAWSAccess and DenyAccessAthena
inherited from the HR OU.
So now, what does that mean?
If I go to my account, which is my child account right now
and I'm going to try to go to Athena,
so I'm going to choose the region,
just so that the internet is faster,
so, I'll go to London
and then I'm going to open up the Athena service,
so, Athena.
Let's try to access it and see if things work.
So, I'm in Athena right now
and I'm going to run a query,
so create database test and that's in my column
and click on run query.
So, let's just set up the query result location,
so, I'll just say, okay, we'll just copy this,
as the query result and actually this part won't even work,
so let's click on save.
This worked and now click on run query,
okay, now we get a deny, so it says,
user bla bla bla root is not authorized
to perform StartQueryExecution with an explicit deny.
And this deny actually comes from the SCP
we have created from before,
so, this account right here cannot access Athena at all,
because of this SCP.
And so that's it.
You can have it play,
move your account between each organizational unit,
try to attach SCP directly at the OU level
or try to attach SCP directly at the account level,
all these things are definitely possible,
and then you've really understood how organizations work.
So, that's it for this hands on, I hope you liked it
and I will see you in the next lecture.