
Okay so let's discuss serverless architectures.
Now, we're going to create
a mobile application called MyTodoList.
So what we want to do is have the following requirements,
we want to expose a REST API that has HTTPS endpoints,
we want to be serverless architecture
and we want the users to be able to directly interact
with their own folder in S3 to manage their data
if they want to.
And users should be able to also authenticate
through a managed serverless service.
And finally, users can write and read to-dos,
but they mostly read them,
so maybe there's something to do around performance here.
The database layer should scale,
and should have some really high read throughputs.
So that's a pretty good requirement,
now let's see how we can do it.
Number one is to get started, we have a mobile client,
and we talked about doing a rest HTTPS thing,
so let's use Amazon API Gateway for this.
This is a great way of doing it.
Now in a classic serverless API fashion,
API Gateway will invoke a lender function
which basically allows us to scale
and use serverless infrastructure.
Okay, Amazon Lambda needs to be able to store
and read to-do from a database.
A database that scales really well
that is serverless is DynamoDB.
So here, we have DynamoDB as our backend.
Now we said there was going to be also
some kind of authentication layer going on so,
for this we can use a serverless technology
such as Amazon Cognito.
So our mobile client can connect and authenticate
to Cognito and then API Gateway along the way
will verify the authentication with Cognito.
So that gives us a very classic serverless API
that we've just created here.
Nothing new for you here, but it's good to see again.
Now if you want to give a user's access to Amazon S3 Locate,
how do we do this?
Well, we have our mobile clients,
that authenticates to Amazon Cognito,
and Cognito that can generate temporary credentials for us
using AWS STS and return these credentials
to our mobile client.
These credentials allow our mobile client
to store and retrieve files in Amazon S3,
and basically access their own little space in S3.
So this is a very classic question as well,
how to do this and the wrong answer is
to store AWS user credentials on your mobile clients.
You definitely do not want to do this.
What you want to do is really use Amazon Cognito, STS,
and then Amazon S3 with temporary credentials.
Okay, so it's a very common question.
So next our app is starting to scale.
We're starting to get more users and it turns out
that we, by looking at the patterns,
figure out that we have a very high read throughput,
so we have many RCUs
and the to-dos don't really change much,
they don't get edited very often.
So how can we change this architecture,
to basically improve the read throughput
and decrease maybe the cost overall?
What we can do is use DAX as a caching layer,
so just before DynamoDB, we'll use DynamoDB DAX
and this will basically have a caching layer
and because we're doing so many reads,
now the reads will be cached in DAX,
and so DynamoDB won't need as much read capacity units,
maybe will scale better,
maybe will have less cause over all
because so many reads are cached and this is a great way,
overall, to keep on improving our architecture
in a serverless fashion.
Now there could be another way of doing caching,
maybe you want to use DAX, but maybe also we want
to start caching the responses
at the Amazon API Gateway level.
This is also something we can do.
And this is also a very good one if you think
that the answers never really change,
and that you can start caching a few responses
for some few API routes.
So over all, really interesting to see this kind
of architectures because they really show you
how serverless is done, where the caching appears,
and in this architecture nothing is managed by us,
we really pay per usage and we really don't think
about management of databases.
All these things is done by AWS for us.
So, in this lecture,
we've seen the classic serverless REST API architecture,
basically leveraging HTTPS, API Gateway, Lambda
and DynamoDB.
And then we've used Cognito
to generate temporary credentials with STS
which gives us access to an extra bucket
with a restricted policy.
We can use the exact same app pattern using Cognito,
so our app can access maybe DynamoDB
or Lambda directly or whatever.
This is a very common pattern.
Now caching the reads on DynamoDB can be done using DAX,
its a very easy way to enable and you can bring
not only performance improvement, but also cost reduction,
and caching the REST request can be done at
the API Gateway level, if we have very static responses.
Security, finally, for the entire thing
can be done with Cognito, and Cognito is directly integrated
with the API Gateway.
So this was a very basic example,
but it gives us a start basically
on serverless architectures and shows us
all the different components we've seen in the past section.
So I hope that helps and I will see you in the next lecture.