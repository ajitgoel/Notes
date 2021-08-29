<v ->Let's get into IAM Permission Boundaries.</v>
And so these Permission Boundaries
are supported for users and roles
and they're not available for groups so remember this.
And they're an advanced feature
that allow you to define the maximum amount of permissions
an IAM entity can get.
So let's have an example.
We have this, IAM Permission Boundaries.
It looks just like an IAM policy.
So we're saying,
allow everything on S3 CloudWatch
and EC2.
So we attached this for example,
to IAM user.
And that's it's Permission Boundaries.
That means that it can only do things
within S3 CloudWatch and EC2.
And then you need to specify on top of things
an IAM permission through policy.
And so here say we attached to this very same user.
Allow IAM create user "Resource star".
So there is a boundary
and there is an IAM policy with permissions.
What is going to be the result permission in this case?
Well nothing, no permissions.
Because the IAM policy is outside
the IAM Permission Boundary.
Therefore our user is not allowed to create other IAM users
because that is not in it's IAM Permission Boundary.
So I want to show you where
IAM Permission Boundaries are created.
So let's go create a user.
I'm going to call the user John.
And then I'm going to give him programmatic access,
next permissions.
I will not set anything.
And next tags, review and create user.
So we have created John.
And we're going to set Permission Boundaries for John.
So imagine John as a developer in our company
and he needs to have certain permissions
but we want to make sure
that he has a Permission Boundary.
So for this we could assign a policy for example for John.
So if I add permission and I say, Hey John,
I'm going to attach to you administrator access.
It seems like John can do everything right now.
So John is a super user.
But I'm also going to set a Permission Boundary on John.
And we'd say, okay, here's your boundary
and this is an advanced feature.
I'm gonna say the only thing you can do, actually John,
is to have Amazon S3 full access.
And so here what I've been setting
is a permission boundary for John.
And so through this AWS S3 full access managed policy.
Even though John has an administrator access,
when John logs in,
the only thing he can do is to access S3.
because S3 is its boundary.
So here we've seen that
even though there's a policy attached to John
that gives him an administrator access,
the boundary is actually going to be more restrictive.
So IAM Permission Boundaries can be used
In combinations of AWS Organizations SCP.
So if we Look at this diagram,
We have the effective permissions
to be in the middle of your identity based policy.
So whatever is attached to your user or your group,
the Permission Boundary,
which by the way only applies
to a user or a role and not a group.
And your Organization SCP,
which applies to every single IAM entity your account.
So in the middle lies what the users can do.
So we can use certain Permission Boundaries
for a few use cases.
For example, to delegate responsibilities
to non administrators within the Permission Boundary.
For example, to create new IAM users.
Or to allow developers to self assign
and manage their own permissions,
while making sure that it can't escalate their privileges.
That means making themselves administrators.
Or for example, restricts one very specific user
inside your AWS Organization.
Instead of applying an entire SCP to your account
and restricting everyone in your whole account, okay.
So now we can understand the diagram
of how an IAM policy is going to be evaluated.
So let's have a look
but everything in there we should be able to understand.
So first the decision starts with Deny.
So by default anything you do in AWS is going to be denied.
Then we're going to look at all of the applicable policy.
And if in any of these policies
either it could be Organizations SCP,
resource based policy,
IAM Permission Boundaries.
Or session policies,
your identity based policy.
If in any of those we have an explicit Deny,
then the final decision is Deny.
So explicit Deny is the most powerful thing you can do.
As soon as there's a Deny that's explicits,
then the decision is going to be Deny.
Then we look at the organizations SCP.
And so we look at,
is the member or principal of an Organizations SCP?
If yes, if there is an "Allow"
then no "Deny",
else go to the next step.
And the next step is,
is there a resource based policy?
So think on S3 Bucket,
and if there is an allow
that's explicit into your S3 bucket policy for example,
then the final decision is allow.
Then we go to the Permission Boundaries.
So we look at the Permission Boundaries.
Is there a boundary on the "Principal".
And is there an "Allow" on the Permission Boundary.
And if there is no Allow then it's going to be denied.
Otherwise if it doesn't allow
then we move on to the next step.
Session policy is for SQS.
We'll just give that.
And then identity based policies is,
does the user have an explicit Allow
that allows him to do,
you know, manage policy for example,
or any line policy that allows him to do for her,
a special AWS access.
If yes, then the final decision is Allow.
Otherwise it's going to be an implicit Deny.
And so that's it.
So this is how he evaluates an IAM policy.
And hopefully that makes more sense into how things work.
So let's have a look at this policy
and see what it can do to make it a bit more concrete.
So we have "SQS star"
Deny on "Resource star"
and we have action "SQS:DeleteQueue"
Allow on "Resource star".
So first question is,
can you perform SQS:CreateQueue?
The answer is no, you cannot.
Because there is a "Deny star" on SQS.
And "CreateQueue" belongs to that block
and there's a "Deny" on it.
So it's definitely going to be denied.
Now, can you perform an SQS:DeleteQueue?
So there's a Deny on the top of our part.
And there's an Allow on the bottom part, right?
And they conflict.
There's a Deny and Allow.
But what did I just tell you?
I told you that as soon as you have an explicit Deny,
then the decision is going to be denied.
So because there is an explicit Deny on "SQS star"
and sqs:deleteQueue is within that "SQS star",
then no matter what,
even there's an allow here,
This is going to be denied this action.
So you cannot perform "sqs:deleteQueue"
even though you have allowed it
explicitly in the second block.
So very important to know.
And finally, can you perform ec2:DescribeInstances?
So as we can see, there's nothing on EC2 in this vein.
And this is an IAM policy.
And so because ==there is no explicit Deny,==
==but also there is no explicit Allow,==
==then you cannot perform ec2:DescribeInstances==
==with this IAM policy.==
All right, hope that makes sense.
So that's it for this lecture.
Hopefully you understand IAM better.
And I will see you in the next lecture.