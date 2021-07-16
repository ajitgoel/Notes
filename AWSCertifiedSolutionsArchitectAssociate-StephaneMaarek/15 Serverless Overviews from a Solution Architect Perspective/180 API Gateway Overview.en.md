
<v Narrator>So so far, in our serverless journey,</v>
we've seen how to create lambda functions,
and we've seen how to use DynamoDB.
And so,
lambda functions can use DynamoDB as a database for our API,
and we can do create, read, update, delete on our tables.
But we'd like our clients to be able to invoke
this lambda function in some way.
So, there are multiple ways of doing it,
we can have the client directly invoke the lambda function,
that means that the client would need I informations,
or we see we can use an applicational browser to have it
in between the client and the lambda function,
and that would expose our lambda function
as an HTTP endpoint.
There's one last way we can use,
it's called the API Gateway,
and this is a serverless offering from AWS,
which allows us to create REST APIs
that are going to be public and accessible for clients.
So the clients will talk to the API Gateway,
and the beautiful thing is that the API Gateway
will then proxy the request to our lambda functions.
So we would use an API Gateway because it provides us
more than just an HTTP endpoint,
it will provide us a lot of features,
as we'll see in this section, such as of education,
such as usage plans, development stages,
and all that kind of things.
So, the API Gateway has a lot of features,
and this is just an overview.
But, we can integrate the API Gateway with the lambda,
and that gives us a full serverless application,
so no infrastructure to manage.
We have support for the WebSocket Protocol,
so we can do real-time streaming through the API Gateway
in two different ways.
The API Gateway handle API versioning,
so we can go from version one to version two,
and version three, and not break our clients,
we can handle multiple environments,
that includes a dev, a test, and a prod environment,
there is a whole thing about API Gateway insecurity,
so there's a tons of way to interval security
on your API Gateway,
for both authentication and authorization.
We have the ability to create API keys,
do request throttling,
in case some clients are doing too many requests on
their API Gateway,
and we can also use some common standards,
such as swagger, or Open API 3.0,
to import quickly defined APIs,
and also we can export them as swagger and Open API.
We can transform and validate requests and response
in the API Gateway level,
to ensure that the invocations are correct,
and we can generate SDK and API specifications,
and cache API responses.
So lots of features that come with the API Gateway,
that are not necessarily included when you use something
as simple as an Application Load Balancer.
So what does the API Gateway integrate with?
Well, there's the lambda function,
and we've seen this from the previous diagram,
so it can invoke a lambda function,
and with this integration,
it is the most common way, and a very easy way,
to expose a REST API backed by a lambda function
to do a full silverless application.
But, also, HTTP,
so we can expose any HTTP endpoints in the backend,
so it could be, for example,
an HTTP API you have on premises,
or it could be an Application Load Balancer you have
on your cloud environment,
and why would you do this?
Well, you would us an API Gateway to leverage the
rate limiting features,
the caching, the user authentication,
the API keys, et cetera,
so it's definitely useful to have a layer of
API Gateway on top of your HTTP endpoint.
And finally, we can use an AWS Service.
So we can expose any AWS API through the API Gateway,
so which ones, for example,
well we can start a Step Function workflow,
we can post a message to SQS directly
from an API Gateway API.
Why would you do this?
Well, because maybe you want to add authentication,
deploy some APIs publicly, or do some rate control
on some AWS services.
There are three ways to deploy your API Gateway.
This is called endpoint types.
So the first type, which is the default one,
is called edge-optimized.
This is for your global clients,
so that means that your API Gateway is going to be
accessible from anywhere in the world,
and to be efficient,
the requests are going to be routed through all the
CloudFront Edge locations,
which will improve the latency.
Your API Gateway is still only in one region,
where you created it,
but it's accessible, efficiently,
from every Cloud formation Edge location.
Then, there's the regional deployment,
so this is when we don't want to
use CloudFront Edge locations,
so it's when we expect all of our users to be
within the same region where we created our API Gateway,
and if you wanted to, you could create your own
platform distribution,
and this will give you the same result as
an edge-optimized distribution, but this time,
you have more control over the caching strategies,
and the CloudFront settings themselves.
And then, finally,
the last kind of API Gateway you can do
is a private API Gateway,
so this time it's not public,
so a private API Gateway can only be accessed
from within your VPC,
and it will use interface VPC endpoints for your ENIs.
And to define access for an API Gateway,
you can use a resource policy.
Okay, so now this is just an overview on API Gateway,
in the next lecture,
we'll just get hands-on through the console.