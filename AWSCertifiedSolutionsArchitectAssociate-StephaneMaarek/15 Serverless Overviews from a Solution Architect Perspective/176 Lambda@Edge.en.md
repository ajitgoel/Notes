
<v ->So let's talk about Lambda@Edge which is another</v>
type of synchronous invocation of Lambda.
So say you have deployed a CDN using CloudFront.
What if you wanted to run a global Lambda function,
alongside each edge locations,
or how would you implement request filtering
before reaching your application.
Well for this, you can use Lambda@Edge,
and Lambda@Edge is that you deploy Lambda functions,
not in a specific region, but alongside
each region around the world
with your CloudFront CDN.
So, why would you do this?
Well to build more responsive applications,
you don't manage servers so
Lambda will be deployed globally.
You can customize whatever it goes through
your CDN, and you're only going to pay for
what you use.
So that's the whole premise of Lambda@Edge.
So you can use Lambda to do what?
To change CloudFront request and response
and there's four types of Lambda functions
at the edge.
So if we look at our integration we have our user,
talking to your CloudFront edge locations
that are going to be talking to your origin.
So the first thing we can change
within that bench is called
the viewer requests
So the viewer request is when CloudFront
receives a request from a viewer, so from a user,
we can modify that request.
The second type of request we can modify
is called the origin request,
and this request is before CloudFront forwards the request
to the origin.
Then we can modify the third request,
which is the origin response,
which is done when CloudFront received the
response from the origin, we can modify that.
And then finally, we can modify the viewer response,
which is before CloudFront forwards
the response to the viewer.
So what that means is that we can also generate
responses to viewers,
without ever sending any request to the origin,
by just using the viewer request,
and the viewer response Lambda functions.
So, Lambda@Edge does allow you to change
these four types of requests.
So why would you do this?
Well we can create a global application,
for as an example.
So, our website will be statically hosted onto Amazon S3
in the HTML form,
then the user will visit it and will be asked,
with some client side JavaScript to do
some API requests to CloudFront and
CloudFront will be triggering our Lambda@Edge function
which is globally and running globally alongside
your edge locations,
and then your Lambda function may be querying
data in Amazon, DynamoDB,
and we'll see what DynamoDB is very soon
but it is a global database
for your serverless applications.
So, why would we use Lambda@Edge?
What are the use cases?
Where website security and privacy.
Dynamic web application at the edge.
Search Engine Optimization so SEO.
You can intelligently route across origins
and data centers.
You can mitigate bots at the edge.
You can do real time image transformation.
AB testing, user authentication
and authorization prior to reaching your origin.
User pressurization
and user tracking and analytics,
so then Lambda@Edge is just something you should know,
at a high level, going to the exam.
Okay, so it is whenever you need to integrate
a Lambda function with your CloudFront
distribution to modify these four kinds
of requests we've seen.
And so that's why I will just not include
a hands on for this.
Just a high level overview.
So that's it.
I will see you in the next lecture.