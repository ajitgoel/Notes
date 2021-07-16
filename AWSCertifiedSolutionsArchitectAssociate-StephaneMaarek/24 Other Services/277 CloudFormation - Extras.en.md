
<v ->Okay so one little extra bit of information</v>
on CloudFormation, in case it comes up on the exam,
there is something called StackSets
and it's an advanced feature
but it allows you to create, update
or delete CloudFormation stacks across multiple accounts
and regions at the same time.
And so the administrators need to create a StackSet
and then you need to define trusted accounts
that can create, update or delete Stack instances
from StackSets and then finally,
when you update your StackSets,
all the associated stack instances are updated
in all the accounts and all the region.
So it's like an administrative portal
into multiple regions
and multiple accounts for CloudFormation.
So, here's an example, we have the admin account
where we define our StackSets
and it's going to deploy into the Account A
in us-east-1 but also in Account A in ap-south-1.
So this shows that we can have different regions
and also we can deploy to Account B in eu-west-2.
So we can have also different accounts.
That's it, so anytime you see in the exam something
around deploying a CloudFormation stack globally
or across accounts,
think no more than just StackSets.
Don't think any script, don't think anything custom,
this is a feature directly coming from CloudFormation.
All right, that's it, I will see you in the next lecture.