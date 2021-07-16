
<v Instructor>Okay, so now let's talk</v>
about Amazon S3 Access Logs.
So say that for audit purposes,
you want to log all the access into your S3 buckets.
So that means that any request that is done to Amazon S3
from any account, authorized or denied,
you want it to be logged into another S3 bucket
so you can analyze it later.
So you can analyze it, for example,
using data analysis tool
or something we'll see in this section called Amazon Athena.
So here is the idea with a diagram.
We make request into a bucket
and that bucket has been enabled for logging
into another bucket or logging bucket.
And so all the requests,
once we've enabled the S3 Access Logs,
will log all the requests into the logging bucket.
It's very, very easy, very, very simple.
And the log format is defined here.
So if you're interested about how we can read this log,
just click on this link, okay.
Now, something you should know about these logging buckets
that is pretty, pretty natural,
but you need to know about it once.
So do never, never, ever set your logging bucket
to be the bucket you are monitoring.
Otherwise, if you set the logging bucket
and the monitoring bucket to be exactly the same,
then it will create a logging loop
and your bucket will grow in size exponentially.
See how it's very simple to represent it?
So say we have a bucket,
it happens to be our application bucket
and also the bucket that is going to receive all the logs.
And so therefore, whenever a user puts an object,
the bucket is going to log inside of itself,
create a logging loop,
and they will create a new object
that will be logged in a new object that will be logged
and so it creates an infinite logging loop
and so that's why your bucket
will grow in size exponentially.
So my advice to you is do not try this at home.
This will end up in a huge AWS bill
for doing this little mistake.
So always separate your application bucket
and your logging bucket.
Now let's go in the hands-on so you see how this works.