
<v Instructor>Finally, let's go into the AWS SDK.</v>
SDK is for software development kits.
And so the idea is that if you want to perform actions
on AWS, but not from using the CLI,
just from your code in whatever language you're using,
you can use the AWS SDK.
And so there's official SDK, and there's unofficial SDK,
but official SDK are Java, .Net, node.js, Pi HP, Python,
Go, Ruby, C++, I mean there's a lot of languages,
and most languages support the AWS SDK anyway.
It turns out that if you ever hear
someone say "boto3 or botocore,"
that's also an alternative name for the Python SDK.
So, the idea is that, I'm pretty sure that as a developer,
your language is in there, and if it's not,
I'm pretty sure that if you google it,
you'll find an AWS SDK for your language.
So the SDK is really useful when we start coding
against AWS services such as DynamoDB.
So in fact, the AWS CLI itself
uses the Python SDK, or boto3,
and you may have noticed this.
So AWS CLI is a wrapper around the Python SDK.
And the exam expects you to know when you should use an SDK,
but it doesn't really expect you to use the SDK properly
or know how to code with the SDK.
There's a few concepts we'll visit in this class,
and we'll practice them when
we get to the Lambda functions mostly.
So overall, don't worry, everything you all
should know for the exam will be taught in time.
Right now, this is just introduction into the SDK.
Something good to know is that
if you don't specify or configure a default region,
then the API codes will default to the US East region
when you use the SDK.
Now for credentials, because security is
always such a big part of the SDK and CLI,
it's recommended to use what's called
the default credential provider chain.
And behind that very complicated name,
basically that means that this works seamlessly
with your AWS credentials when you run AWS configure,
so basically remember that credentials file
on your own computer, if you use the SDK,
your SDK will automatically look for that file
and use the credentials from there.
If you use an EC2 machine and you use IAM Roles,
then you can use an Instance Profile Credentials,
and the SDK again automatically
will look for these credentials.
And finally, a little bit less recommended,
but still used some place,
you can use environment variables,
these AWS access key id and AWS secret access key.
These environment variables that I don't really recommend,
still work with the SDK.
Overall here is my number one recommendation,
it is obvious, but I'm pretty sure
you may get ask about it in the exam,
overall, never ever store your AWS credentials in your code.
Okay, your code should be abstracted from these credentials,
and rely on your configure credentials in your machine,
or the instance profile credentials.
Never ever stored, okay.
This is a best practice, and you need to 100%
use IAM Roles if you work within AWS Services.
I'm pretty big on security,
so this is why I always have bolded uppercase stuff
when it comes to security, because that's really important,
and I don't want you to have problems
down the road when you use amazon.
Finally, when you use the SDK,
there's something called Exponential Backoff.
And so when you're use a API call,
and it fails because it's been called too many times
across too many applications of yours,
you go into a strategy called Exponential Backoff,
and that's only for rate limited API.
So the SDK usually implements a retry mechanism
with Exponential Backoff.
But I wanted to show you what it looks like,
so you're aware of it.
Basically your first API call after failure
will wait maybe 10 millisecond,
and your second API call will run after 20 millisecond.
And the other one, the third API call,
as you can see the double length of the arrow,
it will be for 40 millisecond.
And then the next API call, if it still fails,
it will wait double of that time,
and then obviously, the next one, the final one,
will still wait double of that time.
So the Exponential Backoff means that
if your API calls still keep on failing
we will wait twice as long
as the previous API call to try again,
and that ensures that you don't overload
the API by trying it every millisecond, okay.
So Exponential Backoff is included in most SDKs,
and it's just something you need to be aware of.
So that's it for AWS SDK, I hope that was helpful,
and I will see you in the next lecture.