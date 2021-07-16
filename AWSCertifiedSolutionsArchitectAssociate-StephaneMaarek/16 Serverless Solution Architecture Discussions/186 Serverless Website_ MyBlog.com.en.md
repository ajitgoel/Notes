
<v ->Okay, so let's talk about a serverless hosted website,</v>
maybe called myblog.com.
So our website should scale globally,
and we rarely write blogs, we often read blogs.
So our blogs is seen by
hundreds of thousands of people online,
and we rarely add blogs, maybe one a day, one a week,
but most of the time these blogs are being read.
And so most of my website is going to be purely static files
and maybe a little bit of my website
is going to be a dynamic REST API.
I want to implement caching where possible
to relieve save cost and save latency,
and have a great user experience.
And any new users that subscribes to my website, to my blog,
I really want them to receive a warm welcome Email,
and this should be serverless.
And any photo uploaded to the blog,
I also want to have a thumbnail being generated,
also serverless because I really like serverless.
So how do we implement all these requirements?
Number one, we want to serve content,
it's static and it's global.
So if you remember, we have our client,
and our static content may be stored in Amazon S3.
So how do we expose that bucket?
Remember the Amazon S3 bucket is in specific region.
How do we expose this globally?
Well we can use Amazon CloudFront,
and Amazon CloudFront is a global distribution CDN,
and so basically our clients is going to
interact with edge locations on Amazon CloudFront,
and it's going to cage data coming straight from Amazon S3.
Okay super easy, we've seen CloudFront,
we've seen S3, as a classic architecture.
Now how do we do this securely?
Now that's a very common question as well,
so we have the client it's interacting with CloudFront,
and it's a global distribution still,
but now, we're going to use OAI,
or an Origin Access Identity from CloudFront to S3.
Basically saying, okay, we're going to add a bucket policy,
and the bucket policy on S3 will say,
you only authorize the OAI, so CloudFront, to read,
the rest cannot.
And so that secures it, because now our clients
they cannot go directly to the S3 bucket to get the content.
They have to go through CloudFront,
and in this way we've secured our infrastructure.
Okay, so now we have this, and this is really good.
How do we add a public serverless REST API?
Well for this we'll have a REST HTTPS cloud talking
to Amazon API Gateway, invoking a Lambda function,
maybe querying and reading from DynamoDB,
and because we have so many reads,
maybe DAX is a great caching layer we could use, okay?
So far very easy.
If we're going global,
maybe we could be leveraging DynamoDB global databases
to reduce the latencies in part of the world.
That also could be a really good way
of maybe speeding up our infrastructure
and our architecture.
Okay so this is fine, we have everything we need.
Now let's talk about the user welcome email flow.
Well here, remember when a user subscribes
I want them to be having an email saying,
hello, how are you?
So for this, maybe in DynamoDB
we want to enable streams of changes,
so we'll have DynamoDB stream being created,
and that DynamoDB stream will invoke a Lambda function.
That Lambda function is going to be very special,
it's going to have an IAM role,
which allows us to use Amazon SES.
So we haven't seen what Amazon SES is,
but it's really simple.
It's called Amazon Simple Email Service, so SES,
and it basically allows us to send emails.
So here our Amazon Lambda function can use the AWS SDK
to send emails from Amazon SES, and here we go,
we have a basically serverless user welcome email flow,
and really simple, no infrastructure to manage,
it just works and scales really really well.
Okay, so now we said, okay if users upload images
we want thumbnails to be created, so our client,
is going to maybe upload to our S3 bucket directly,
or maybe we again have an OAI in a CloudFront distribution.
In which case our client will upload photos to CloudFront,
and CloudFront will forward them onto the Amazon S3 bucket,
and this is called S3 transfer acceleration.
So either directly to S3, or using transfer acceleration,
and then we will do is that whenever a file is added to S3
it's going to trigger a Lambda function,
so Lambda can be triggered by S3,
and Lambda will be creating a thumbnail
and putting that thumbnail into an S3 bucket,
could be a different bucket for example.
And just to show you it's possible,
Amazon S3 also has triggers to SQS and SNS.
Now this is optional,
and from SQS SNS you can do whatever you want,
but it's just to show you that your very free
into how you want things to work,
and so Amazon S3 can invoke either Lambda, SQS, or SNS,
and you're really free to think about your
solution architecture and how to make things serverless
and easy for you on your end.
So this is quite a complete architecture we've just done,
but it's all serverless, it's all scaling globally,
and I think that's what matters most.
So we've seen static content being distributed
using CloudFront with S3.
We've seen the REST API that was serverless,
we didn't need Cognito this time
because it was a public REST API,
and we leveraged a global DynamoDB table
to serve the data globally.
We could have used also Aurora Global Tables,
but in this case it wouldn't have been such serverless,
it would have been provisioned Aurora.
We could also enable DynamoDB streams,
basically these streams should tell us about changes
to our user tables and then trigger a Lambda function,
and that Lambda function had a IAM role attached to it,
so it could use SES or Simple Email Service,
and this was just to send emails in a serverless way.
And S3 we've seen that it could trigger
SQS, SNS, Lambda to be notify of events.
So quite a lot of learnings, all these things we know,
but it's now, I think, really nice
to see all these things working together,
and how we can create some really cool applications
using all the concepts we know.
So I hope you liked it,
and I will see you in the next lecture.