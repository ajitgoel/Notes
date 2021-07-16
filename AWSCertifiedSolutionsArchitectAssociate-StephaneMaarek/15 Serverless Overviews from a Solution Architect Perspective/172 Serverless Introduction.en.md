
<v Instructor>Okay, so let's discuss now</v>
what is serverless.
So serverless is something new.
And the developers when you use serverless services,
you don't have to manage servers anymore.
So it's not that you don't have servers anymore,
it's just that you don't manage them.
You just deploy code
and originally, you just deploy it functions.
So initially serverless meant Function as a Service,
or FaaS.
But now serverless means a lot more.
So in the beginning,
serverless was pioneered by AWS Lambda
that we'll see in the section,
but now also includes anything that is remotely managed.
So databases, messaging, storage,
as long as you don't provision servers.
So serverless doesn't mean there are no servers,
it just means you don't see them
or you don't provision them.
So if we drill down into what serverless means,
in AWS, we have our users
and they would get for example,
static content for from our S3 buckets
delivered as a website's
or CloudFront plus S3.
Then we would login with cognito,
this is where our users would have their identity stored.
And they would invoke your REST API
through the API gateway,
the API gateway would invoke Lambda functions,
and Lambda functions would store
and retrieve data from DynamoDB.
So this is just an example.
This section is going to be dedicated to
learning a lot of things around Lambda DynamoDB,
API Gateway, Cognito, and so on.
But so it's just to give you an a reference architecture
for serverless applications.
So in AWS, it's Lambda DynamoDB, Cognito, API Gateway,
Amazon S3,
but also things we've already seen such as
SNS and SQS,
yes indeed,
we did not manage any servers for SQS and SNS
and it was scaling on its own.
So that fits the serverless use case
Kinesis Data Firehose, because again
it scales
based on the throughput you have
you just pay for what you use
and you don't provision servers,
Aurora Serverless,
when your Aurora database
scales on demand
without you managing servers,
step functions and fargate
because fargate was a serverless function of ECS,
where we didn't provision the infrastructure
to run our Docker containers.
So hopefully this is short
and sweet introduction to serverless.
Next lecture, we'll be starting with AWS lambda.
And it will be a lot of content to learn,
but the exam does test you heavily
on your serverless knowledge.
So let's get started.
<v ->(keys tapping)</v>