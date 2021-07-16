
<v Lecturer>So let's get started</v>
with our first API Gateway.
So in API Gateway, I'm going to go into the console
and we are greeted with a new UI,
so it says it is to create, maintain and secure APIs
at any scale, so this is serverless and great.
So we have different choices, we can build an HTTP API
and that works with Lambda and HTP back-ends,
or we can build a WebSocket API
that works with Lambda, HTTP and AWS services.
This is when we have, for example,
something that is real time use cases
such as a chat application or a dashboard,
and then, finally, a REST API
to have more control over the API management capabilities
and REST API private to have this privately within your VPC.
So this may be confusing, all these options
and I will go over them one by one later on in this course.
But, so right now I don't want the HTTP API,
I wanna scroll down and use the REST API.
Okay, so we're going to build one
and I'm going to click on the build.
And here I am greeted with a panel to create your first API.
So I say, okay, I would like a REST API
and instead of using the example API,
we're going to create a new API
and then we have to name our API,
so I'll just call it MyFirstAPI.
And then we choose an endpoint type.
So regional is deployed within this region
and we're not using the CloudFront Edge network,
Edge Optimized, we're using the CloudFront Edge network
and Private, this is within our VPC.
To keep things simple, I'm going to use original endpoints,
we get more information with the I right here.
Okay, let's create our API.
And now our first API is created.
So there's lots of menus that have just appeared
and, if needed, we'll go over them one by one.
But so right now I'm going to create my first API.
And so, as such, I'm going to click first on this hint
and hide all the hints.
This way this will not be distracting,
and I'm going to create a method.
So here I click on action and then create method
and the method is going to be a GET.
And then I press validate and we have our first method.
So this is a GET at the root of our resources
and we are having many options.
So the first one is integration type.
And so we can choose the type of integration we want.
We want Lambda functions HTTP, Mock, a service, for example,
it could be in any region and any service.
So we can expose an AWS service as an API or a VPC link.
And this is when we have a VPC link inside of our VBC,
but this is advanced and out of scope for the exam.
So right now the only thing we'll be doing
is a Lambda function.
And then you have the option to use
a Lambda Proxy integration.
And I'm going to say yes, I want the proxy integration
cause I want to show you the full event
coming out of the API gateway.
Then the Lambda region is going to be eu-west-2
and we have to create our Lambda function.
So let's go and create our first Lambda function
for this API Gateway.
So I'm going to create a function
and I'm going to call it Lambda API Gateway Proxy root GET.
Pretty long name, but at least it is explicit
around what it does.
Then the runtime is going to be Python 3.8
and then I will create a new execution role,
I click on create function.
And while this happens,
I want us to use some code I already created for this.
So in my API Gateway folder, I have my Lambda code
and we've defined a Lambda handler
which is very similar to what we've seen so far.
So we return a body, which is used here,
we return a status code 200 which means okay.
And then some headers that I've added
to say to our web browser
that the content we're getting is of type json.
So, very simple.
I'm going to copy this entire code, go back here,
scroll down and I'm going to paste this code, save it.
And just for the sake of it I'm going to test it.
So I'll create a test event, click on create
and my Lambda function, if I click on test, works.
And I just get the status code 200, the body and headers.
So this is the function we want to use for our API Gateway.
So back in our API Gateway, I'm going to go up and go down
and I can select the Lambda function that I want
and I can use the Lambda proxy integration,
so again, make sure to tick that box.
Then run the timeouts so the Lambda has a timeout
of up to 15 minutes, but the API Gateway
times out automatically after 29 seconds.
So I can disable this and use a custom timeout,
but the maximum timeout you can get is 29 seconds
and I will use the default timeout for now.
Let's click on save.
And now we're about to give API Gateway
permission to invoke our Lambda function right here.
So yes, I'm happy with this
and our first method is done.
So how do we know that our API gateway
can invoke our Lambda function?
Well, we can test it, we're going to do this in a second.
But before I'm going to go into Lambda, go to permissions
and scroll down and in here have a resource-based policy
on my Lambda function, which authorizes the API Gateway
for my API right here to invoke my Lambda function.
So this is how my API gateway is authorized
to access my Lambda function.
Back in the API Gateway,
I can look at this method execution.
So it will create a method request.
Then there is an integration request, which is Lambda proxy,
then it will be passed onto my Lambda function.
There is no integration response because
we cannot transform request and response in proxy mode,
we'll keep it simple.
And then, finally, the method response
sends back to the client.
So let's test it out.
We're going to test
and I'm going to click on the test button
and we get the response from Lambda.
It says hello from Lambda.
So the really cool thing is that our Lambda function here,
if we go back to the code,
was defining a full json documents
that had a status code, a body, and some headers.
And in our API Gateway, the response body was directly taken
from the body here and the headers are ending up
in the response headers,
so we can see the content type is application json.
On top of things, we can see the logs on the API Gateway,
which I think is pretty cool.
So the last thing I want to show you is
we're going to log this request from the API Gateway.
So I'm going to change my code and print the event
to show you what the event is.
So I'm going to save this and then I'm going to go back
to my API Gateway and do another test.
So I'm going to click on tests, and this test has worked.
So now I'm back in my Lambda function,
I'm going to go to monitoring
and view the logs in CloudWatch.
So I'm in my CloudWatch logs
and I have a second log stream that was just created.
I'm going to click on this
and here is the logging statements.
So this is the entire request we receive
from the API Gateway and so we get lot of information.
The resource, the path, the HDP method,
which is a GET, some headers and so on.
So, lot of information that can be used
by our Lambda function to generate the correct response.
So, super simple, this is great and this has worked.
But now let's go ahead and create a second method.
So let me click on actions and then create resource,
And I'm going to call this houses.
And the resource path is slash houses.
Then I will click on create resource.
So this has created slash houses path and in it,
I can create a method which is, again going to be GET,
but we can use any HTTP verb we wanted
for any other type of queries, for example,
post, if you want to post data.
So we'll use a GET one more time.
And then in here I have an integration type
with the Lambda function.
So I have to create a new Lambda function.
So let me go back to my functions lists
and I'm going to copy this to type it faster.
I'm going to create a new Lambda function
to handle that request.
So the function name is Lambda API gateway proxy houses GET.
The runtime is Python 3.8 and then we select
a new execution role, so we create this function.
And again, we'll copy this function code.
So here I copy this code, go back to my console,
scroll down, paste the code,
and instead of hello from Lambda,
I'm going to say hello from my pretty houses.
Okay, just something that relates to houses
to change the message.
We'll click on save and then
we'll go ahead and refresh this page.
So I have a Lambda function,
it's a proxy integration and this is the houses function.
So here we go,
and I click on save.
Okay, and now my API Gateway
has the capability to invoke this function.
We can test it and test it,
and we get hello from my pretty houses.
So, really cool.
This has working, so we have two routes,
the slash at the root and the slash houses
and they're testable from this UI,
but we want to have access to them using HTTP endpoints.
So for this, very simple, action,
and then we're going to deploy this API.
So we'll deploy this API and I'm going to create a new stage
and I'm going to develop a stage, dev for development.
Very simple.
We'll go into stages later on
and we'll deploy this stage API.
And so here we go.
We have an invoke URL now we can use.
And so if I click on this URL and open it,
as we can see, it says hello from Lambda
and if I go and add slash houses at the end,
I get hello from my pretty houses.
And if I just have something wrong such as wrong,
then I'm gonna get an error message in some way.
So it's really cool.
We have the root, again, hello from Lambda,
and we have created a sub resource underneath
called houses, hello from my pretty houses.
And this is our first overview into the API Gateway,
but very simply, we've deployed an API
backed by two Lambda function on an HTTPS endpoint.
Very cool, I hope you liked it
and I will see you in the next lecture.