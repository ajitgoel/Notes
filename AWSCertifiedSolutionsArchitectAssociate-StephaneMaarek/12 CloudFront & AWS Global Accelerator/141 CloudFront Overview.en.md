
<v Narrator>Now we're getting into content delivery</v>
and we'll start by CloudFront.
So CloudFront is a content delivery network or CDN.
And what it does, is it improves read performance,
because the content is going to be distributed
and cached at the edge locations
and edge locations are all around the world.
And there's about 216 points of presence globally,
as I'm recording this lecture
and they are all the time, new points of presence.
So it's much more than the 30 something regions
that always has.
This is a worldwide thing.
And so what this platform gives you
on top of this caching at the edge,
well, it gives you DDoS protection.
So to protect against attack that are
distributed denial of service,
it gives you integration with a shield
and also a web application firewall.
We'll see those into the security section of this course.
But the idea is that it's really protected
and it's a good way to front your applications
when you deploy them globally.
And also allow you to expose an external HTTPS endpoint
by loading the certificates
and also talk internally in HTTPS to your applications
if you need to encrypt that traffic as well.
So let's take a diagram.
So this is a map of the world
and there are some orange regions and their edge.
Everything on this graph is edge.
But as you can see, it's all around the globe
and so for example, say we have an S3 bucket in Australia
and some user from America wants to access it,
it's actually going to access an edge location close to it.
So in America and that network is going to be transmitted
over the private AWS network, all the way to the S3 buckets,
and the content is going to be cached.
So the idea is that this American user,
with the more users you have in America,
the more they will want to do the same kind of reads.
And they will all have content served directly from America,
not necessarily from Australia,
because it will be fetched once into America
and then served from there so cached locally.
So another user, maybe in Asia,
will talk to a edge location closer to Asia
and that edge location again,
will support traffic to the S3 buckets
to get the content and then cache it at the edge.
So CloudFront allows you really to
distribute your reads all around the world
based on these different edge locations.
And we improve latency
and reduce the load on your main S3 buckets.
So I said S3 buckets.
But what are the different CloudFront origins?
Well, the first one is an S3 bucket
and you would use CloudFront in front of S3
as a very common pattern
to distribute your files globally
and cache them at the edge.
You also get enhanced security, as we'll see in the hands on
between CloudFront and your S3 buckets
using your CloudFront OAI or origin access identity.
And this allows your S3 bucket to only
allow communication from CloudFront and from nowhere else.
And then finally,
you could also use CloudFront as an ingress,
to upload files into S3 from anywhere in the world.
Okay, the other option is to use custom origin
and there must be an HTTP endpoints.
So this could be anything that respects the HTTP protocol.
So it could be an Application load balancer,
it could be an EC2 instance, it can be an S3 website.
But we first must enable the bucket as a static S3 website
and note that it is different from an S3 buckets.
And this Debug website,
we need to enable that setting as we've seen before.
And we could be any HTTP backend you want,
for example, if it was on your own premises infrastructure.
Okay, how this platform work at a high level.
So we have a bunch of edge locations all around the globe.
And they're connected to the origin we defined,
it could be an S3 buckets
or it could be any HTTP endpoints
and our clients wants to access our CloudFront distribution.
For doing this, the client will send
an HTTP request directly into CloudFront
and this is what an HTTP request would look like.
There will be a URL, some query string parameters
and there will be also some headers.
And then the edge location
will forward the request to your origin
and that includes the query strings
and that includes the headers,
so everything gets forwarded on to your origin.
You can configure this
and then your origin response to the edge location.
The edge location will cache the response
based on the cache settings we've defined
and return the response back to our clients.
And the next time another client makes a similar request,
the edge location will first look into the cache
before forwarding the request to the origin.
That is the whole purpose of having a CDN.
Okay, so very, very simple.
This is how CloudFront works at a high level.
So let's look at S3 as an origin in details.
So you have the cloud and you have your origin,
which is your S3 buckets.
And for example, you have an edge location in Los Angeles
and some users want to read some data from there.
So your edge location is going to fetch the data
from your S3 buckets over the private AWS network
and give you the results from that edge location.
The idea here is that for the edge location of CloudFront
to access your S3 buckets is going to use an OAI
or an origin access identity is IAM role
for your CloudFront origin.
And using that role is going to access your S3 buckets
and the bucket policy is going to say yes,
this role is accessible and yes,
send the file to CloudFront.
So this works as well for other edge locations for example,
in Sao Paulo in Brazil, or Mumbai, or Melbourne.
And so all around the world,
your edge locations are going to serve cached content
from your S3 buckets and so we can see how CloudFront
can become super helpful as a CDN.
Now, what if you have a ALB or EC2 two as an origin?
The security changes a little bit.
So we have our EC2 instance or instances
and they must be public because
they must be publicly accessible from HTTP standpoint
and we have our users all around the world.
So they will access our edge location
and our edge location will access our EC2 instance
and as you can see, it traverses the security group.
So the security group must allow the IPs
of CloudFront edge locations into the EC2 instance.
And for this, there is a list of public IP
for edge locations that you can get on this website.
And the idea is that the security group must allow
all these public IP of edge locations
to allow CloudFront to fetch content
from your EC2 instances.
So that makes sense.
What if we use an ALB as an origin.
So now we have a security group for the a ALB
and the ALB must be public to be accessible by CloudFront.
But the backend EC2 instances now can be private.
And so in terms of security group for the EC2 instances,
EC2 allow the security group of the load balancer,
we've seen this extensively.
And for the edge location,
which are again, public locations,
it needs to access your ALB through the public network.
And so that means that your security group for your ALB
must allow the public IP of the edge locations
the same public IP as we had from before.
So two different architectures, same concept
but we better understand network security for S3 for ALB
or EC2 in front or behind I must say CloudFront.
Now CloudFront is a CDN
and it also has some really nice features.
One of them is geo restriction.
So you can restrict who can access your distribution.
So you can provide a white list.
We're saying, okay,
users from this list of approved countries
and only this list can go to a CloudFront.
Or we can say blacklist, where he's saying,
okay, the users from these countries
are not allowed to access our distribution.
And the way the country is determined,
is using a third party Geo-IP database
where the incoming IP is matched against it
to figure out the country.
So the use case for jurisdiction
will be when you have copyright laws
to prevent access to your content.
And you want to prove to regulators
that you are indeed restricting content access from,
say, France if you have content in America.
Okay, now you may be asking yourself
what is really the difference between CloudFront
and something like S3 cross region replication.
So CloudFront is using a global edge network
and files are going to be cached for a TTL.
So a time to live maybe for a day.
So it's great when you have static content
that must be available everywhere around the world, okay?
And maybe you are okay with
if that content is outdated or a little bit.
Now for S3 cross region replication,
it must be set up for each region
in which you want to have replication to happen.
And the files will be updated in near real time,
it's going to be read only
so is going to help you with read performance.
So S3 cross region replication
will be great if you have dynamic content
that needs to be available at low latency
in a few amount of regions.
Hope that makes sense, hope that's very clear.
Platform is for catching globally
and S3 cross region replication
for replication into select regions.
All right, so that's it for this lecture.
I will see you in the next lecture for some hands on.