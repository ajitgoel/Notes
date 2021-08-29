<v Instructor>Okay, so let's get into</v>
some advanced concepts for IAM.
The first thing I wanna talk to you about is IAM conditions.
So what are IAM conditions?
They're what you make your IAM policies
a bit more restrictive based on a condition.
So let's have different looks at different conditions
that can come up in the exam.
The first one is aws:SourceIP which is
to restrict the client IP
from where the API calls are being made.
So in this example there's a deny*, resource*,
so deny everything, condition not IP address
is within these two IP ranges.
So if we translate this into plain English
that means deny anything that does not come
from these two SourceIP ranges.
And so what this means is that we don't deny everything
all the time, we just deny it if they don't come from
a predefined list of IPs and this
is probably for enhanced security.
So what you have to remember here is that the aws:SourceIP
is renaming the IP of the clients
making the API call into aws okay?
So this is what it means,
the IP of the clients where the risk calls are being made.
Next, we have Aws Requested Region which is to restrict
the region the API calls are made to.
So this example of an IAM policy is called Allow Only Inside
the EU which you probably know what it means
and the effect is allow, actions is EC2* RDS* DynamoDB*
so anything on these three services, Resource*,
so any resources within these three services
should be allowed.
Conditions are only if strings equal
requested region EU Central 1 or EU West 1.
So this means if you are making an API call
on these services on anything and it has to come from
these requested regions, so either EU Central 1
or EU West 1, then accept it.
Otherwise if it comes from the US or anything like this
then don't accept it.
So here thanks to the aws:RequestedRegion we don't see
where the client is located, we see where the client
is trying to make an API call to.
So that means the client can only operate
in EU West 1 or EU Central 1.
So, very good.
Next we have restriction based on tags.
So we are able to say okay, you can start and stop
your EC2 instances only and only if your project
is data analytics and your department is data
and that's for the resource tag of your EC2 instance
and the principal tag of your user.
So we are able to have tag based security in aws.
And one last that's pretty cool,
we can force multi factor authentication,
so we're saying okay, you can stop instances
and terminate instances only
if you have multi factor authentication present,
so deny if you don't have it.
So these are some really cool and insightful conditions.
The very good thing about IAM policies is
that you can usually read them out loud by just seeing
what is written but you should know that the SourceIP
is for where the client is located
and the requested region is
where you're trying to make request to.
Okay, so now let's look into IAM for S3.
So here is a very specific IAM policy
that you'll see many times.
So in this one we allow ListBucket on this resource
and this Bucket which is called test
and we also allow PutObject, GetObject and DeleteObject
on this bucket, test, but this time
there is a slash and then a star afterwards.
So let's see what that means and why.
So ListBucket is a permission that applies
to the bucket test and as such
the arn is arn:aws:s3:::test
because that's where our bucket is.
This is a bucket level permission
and so there's no trailing slash, it's just the bucket name.
But GetObject, PutObject and DeleteObject applies
to anything within a bucket and so therefore the arn,
the resource you should consider is the name of the bucket,
slash and then a star because it applies
to all the objects within the bucket.
So this is the star you see
on the bottom right of your screen.
This is because it says the PutObject, GetObject
and DeleteObject applies to any object within your bucket.
And so that's very important,
this is an object level permission
and before it was a bucket level permission.
So this is very important when you design your IAM policies
to understand the differences between the two
and to be able to understand why sometimes
there's a trailing slash and a star and why sometimes
there is not and hopefully that makes it very clear.
So what is the difference between
an IAM Role and a Resource Based Policy?
So for example if we take a resource for example
in the S3 bucket policy, what is the difference
if we use a S3 bucket policy versus
using a role as a proxy to access the S3 bucket.
So let's assume the user is in Account A
and the Amazon S3 bucket is in Accounts B
and we want to access it.
==Option number one is to create a role in the Account B,==
==assume that role using STS and then by assuming that role==
==in Account B we will be able to issue API calls against==
==the Amazon S3 bucket in Account B.==
==The other option is to use the same bucket==
==and create an S3 bucket policy that allows directly==
==the user accounts from account A to access==
==the Amazon S3 Bucket.==
So they look similar but they're actually
a little bit different.
==When you assume a role, would be a user, an application==
==or a service, you are going to give up==
==your original permissions and you're going==
==to take the permissions assigned to the role.==
==And when using a resource based policy,==
==your principal doesn't have to give up his permissions==
==and he can just use, go through that resource bucket policy==
==and not loose their permissions,==
==so you can do both actions in Account A and Account B.==
So for example, if user in Account A
needs to scan a DynamoDB table in Account A
and then dump it into an S3 bucket in Account B
then there would be some use case
for a resource based policy because if using IAM role
to do some stuff in Account B for the S3 bucket
then you cannot do anything back on your DynamoDB table
in Account A and that would be a waste.
So what our resource based policy gonna be applied to,
well Amazon S3 bucket, SNS topic, SQS queues,
all these things can have resource based policy.
So use wisely and know the difference between the two.