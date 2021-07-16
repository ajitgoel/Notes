
<v Narrator>Okay, so let's talk about caching strategies</v>
on AWS, and what they imply.
So this is a typical solution architecture
that I've just described, it could be,
obviously, very different for you.
But, we have something that we know of.
So we have CloudFront in front of an API Gateway,
which is in front of our application logic,
could be EC2, could be Lambda.
Our application stores and uses data from the database,
and maybe you will use an internal cache
such as Redis, Memcached and DAX.
And then, that's where the dynamic routes,
or all the dynamic content.
And there be will an aesthetic content route,
in which our client goes through a CloudFront
and the CloudFront will source data from S3.
So this is something we've seen, this is not very new.
But what I wanna talk about
is all the caching strategies you have,
and their implication.
So, if we look at CloudFront,
these two CloudFronts right here
they're doing caching at the edge.
That means that they're doing caching as close as possible
to our users.
So that means that if we enable caching in CloudFront,
and the users do hit the cache, then they get a response
right away, it's very very quick.
But because it's at the edge, there is a chance
that things have changed in the back end,
and obviously that the thing is outdated here.
So we can use a TTL to make sure
the cache is often very renewed,
and the new stuff is picked up from backend.
And so we have a balancing act to do between
how much more to cache at the edge,
versus how much we want to cache in the app logic.
Okay, next, we go to API gateway.
And API gateway also has some caching capabilities,
so it doesn't have to be used with CloudFront.
And so the API gateway is a regional service
and so in case we do use the cache at the API gateway,
then the cache will be regional.
So that means that where there's going to be network lying
between the clients and the API gateway,
if the cache is hit here.
Then we have our app logic.
And our app logic usually doesn't do any caching,
but it will do caching in a cache that we could use
such as Redis, Memcached, or DAX if we have DynamoDB.
And the idea here is that we don't want to repeatedly hit
our database, which does not have any caching capability.
We want to make sure that the frequent queries
or the complex queries, the result is stored into
a shared cache that can be accessed
by your app logic more easily.
And so here, we are saving by using caching here.
We are saving pressure on our database,
and we are augmenting the read capacity.
Finally, I want you to notice that
there is no caching capability in your database
in Amazon S3 and so on.
And so, as we move along this line of caching,
the more we move alongside, the more there's gonna be
a computation to cost and it's gonna be a latency.
So it's really up to you, there's no right way
or wrong way of doing caching.
It's all up to what you want to achieve
and how you want to set up your application
to achieve that behavior.
So it's all about choosing where do we want to cache content
how do we want to cache content,
how long do we want to cache content,
and then, are we okay with some latency,
and which content actually do we want to be cached?
So, this lecture again is not a "you should do this",
it's just to hopefully show you that
there's a lot of different ways to do caching on AWS,
and it really depends on what the scenario is
to figure out where the caching
is going to be most appropriate and most efficient.
Okay, that's it, I will see you in the next lecture.