
<v Stephan>Okay, so let's talk about</v>
a new type of architecture.
In this architecture, we're going to look into
the problem and solution, obviously,
of distributing paid content.
So the business is that we sell videos online
and the users that have to pay to buy videos.
And each video can be bought by many different customers.
So, we only want to distribute videos obviously
to the users who are premium users,
to the users who have paid for these videos.
So, we have a database of who the users are,
of premium users and, so we want to send links
to the premium users and they should be
short-lived and secure, so that not other users
can use these links.
Our application should be global,
and actually we want this to be fully serverless.
So, let's start simple.
First, let's design our premium user service.
So, we have our clients,
rest https, talking to the the Amazon API Gateway,
talking to Lambda function,
talking to DynamoDB table.
In this DynamoDB table we can
read, update, delete a table of users.
And in this table of users we can say
whether or not a user is premium
or respite for a certain video.
Okay, so this is great.
Now, we need to add some form of authentication
so, for this maybe we want to authenticate
with Amazon Cognito
and verify authentication with API Gateway.
So far, you know, nothing new.
Now, let's add a video storage service.
So, our videos are going to be in S3.
This is where we are very confident
to place our videos
and we know that the users may want to
directly view them from S3 but,
what we want is to have global distribution
and secure distribution.
So, we still have our S3 bucket
this is where the videos are going to be located
but now we're going to have
a CloudFront global distribution
using an OAI talking to S3 with a bucket policy
and this is something we have seen before but,
basically we've ensured that now people can
only access our content through CloudFront,
and it's distributed globally.
Okay, so, this is great but,
we still haven't figured out the problem
of how do we allow
our client to talk to CloudFront
and only get premium users
to get access to this content in CloudFront.
This is the big challenge right.
So, let's take this problem.
So, this is the architecture
I just moved things around a little bit,
so Cognitos on the bottom left.
And so, our client is authenticated with Cognito,
and the bottom we have the rest API
basically writing to DynamoDB for the premium users
and on top hand side we have CloudFront and S3
in terms of managing access basically to this bucket.
So, we're going to want to use the feature of signed URL,
I don't know if you remember but,
CloudFront has a feature of signed URL
and this is a great way to distribute premium content
or paid content to users.
But, we have to generate that signed URL so,
we have to create or own application that will
generate signed URLs.
So, for this, we'll create an Amazon API Gateway second API
and it will verify the authentication of the clients
and the client will say,
Okay, I want you to invoke that API
and I want you to give me a signed URL.
So, Amazon API Gateway will say,
Okay, I'm going to invoke a Lambda Function
that has been coded
just for that one purpose.
That one purpose is that Lambda Function
is to create a signed URL and for this,
first, it's going to have to verify if
the users that invoked this API is a premium user
by looking up into Dynamo DB,
and then, if it is a premium user,
then it's going to use the CloudFronts API
using the AWS SDK and it's going to generate a signed URL,
and maybe the signed URL will have an
expiration of five minutes.
Okay, so this is something we have to code but,
you see from the solution architecture perspective
what this involves.
So, when it's done,
Lambda returns the value to API Gateway
which returns the signed URL to our clients
and now, our client can use the signed URL
to access our CloudFront global distribution.
So, we've talked about it hypothetically,
you know, in the CloudFront section
but now it's great to see an actual solution architecture
leveraging what we talked about in terms of features
on how to implement a content distribution
for premium users.
Okay, so what have we seen in this lecture?
We've basically implemented a fully serverless solution:
Cognito for authentication,
Dynamo DB for storing users that are premium,
two serverless applications,
one was used to register these premium users
and the other one was used to generate
CloudFront signed URLs.
And then all this static content
all the videos were stored in S3
and S3 is serverless and scalable.
And we've integrated with CloudFront with OAI
for security and global distribution
so that users can not bypass our security.
And CloudFront has been used
to generate signed URLs
to prevent unauthorized users from accessing it.
And, you could've asked me, what about S3 signed URLs?
Can we use those?
Well they're not efficient for global access
because CloudFront is more efficient
for distributing stuff globally
and on top of it because we have an OAI
and only allow platforms to access S3
then S3 pre signed URLs would have not worked.
But, that's it, at least you felt the right way
and you've seen a quite cool serverless architecture
and I hope you liked it.
I will see you in the next lecture.