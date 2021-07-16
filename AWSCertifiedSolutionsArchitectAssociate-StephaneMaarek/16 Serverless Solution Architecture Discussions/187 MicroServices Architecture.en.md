
<v ->Okay, so now we're talking about micro services.</v>
So, not exactly the server-less, but
still a very interesting discussion to have.
So, we want to switch to a micro service architecture
and many services will interact with
each other maybe using a REST API.
So, this is how they have interaction with
one another, they just use the REST API.
Each architecture for each micro service may vary
in form and shape, so we are free to do whatever we want.
And so, we want to use a micro service architecture
for the reason that we want to have leaner
development lifecycle for each service.
We want each service to scale independently
and have it's own quote repository.
So this is why we would use a micro service architecture.
Now, let's have a look, so our users may be able
to talk to our first micro service over HTTPS
and we've decided to have an elastic load balancer
talking to ECS, and then talking to Dynamo DB.
And, it's just a choice we made.
ECS, by the way, if you don't know what it is yet,
it is for docker, so for writing docker containers on AWS.
So that's it, now this micro service
usually has a DNS name or URL, so maybe it's
service1.example.com, and so to get all
that information maybe you will do a DNS Query
to route 53, get an alias record back and then
we can interact with that service.
That's my first service, but maybe we have
a second service, and this one is using
a classic architecture for server-less,
but instead of having Dynamo DB,
we have ElastiCache.
And again, just, you know, something just for fun,
just to mix things up, but we can definitely
use ElastiCache as the back end for Lambda.
So, cool everything works, but maybe
that second micro service, service two,
maybe it also interacts with service one.
So the lambda function will make
a call to our elastic load balancer
because it needs to get some information
from the first micro service to be able to make a response.
And then maybe we have a third micro service,
also using an ELB, but this one
is not server-less, it's using Amazon EC2 auto
scaling and an Amazon RDS database, so more
of the classic architecture we've seen from before.
And it turns out that maybe the EC2 instance
must make a call to the second micro service
before making a decision, so it's represented
here by the dotted lines.
And here, the URL for this is going
to be service3.example.com.
So, it's very simple, but what I
want to show is just have a quick discussion.
You're free to design each micro service
the way you want, and this is why
I had so many different random architectures.
There is two patterns for micro services.
There is a synchronous pattern, so this is
when we make explicit calls to other
micro service, so API Gateway, Load Balancer
are great way to do HTTPS calls to other micro services.
But there is also an asynchronous pattern
that I haven't made into a diagram,
but using SQS, or Kinesis, or SNS,
or Lambda triggers, or S3.
All these things basically we're saying,
"I'm goin to put a message in SQS,
but I don't care when I get a response,
actually I don't care about a response,
something else will happen, though."
And this is an asynchronous pattern.
So, some challenges with micro services,
the first one is that you need to
have some overhead for creating
each new micro service.
And you may get issues optimizing
server density or utilization.
You may get complexity of running
multiple versions of each micro
service simultaneously.
You may get a proliferation of client-side
code requirements to integrate with many
separate services.
But so, most of these challenges,
or some of them, are solved by using
server-less patterns.
For example, API Gateway, Lambda they scale
automatically and then you pay for usage.
So no need to worry about server utilization.
You can easily clone APIs or reproduce
environments in API Gateway.
And you can, for example, generate
client SDK through Swagger integration
for the API Gateway.
So, all in all, what you need to
remember is that micro service is
a design, and you can use any of this for that,
and it does solve some problems,
and it does add some problems.
But at least you get an idea of
how things would work.
Okay, that's it for this lecture.
I will see you in the next lecture.