
<v ->Okay, so in the past lecture,</v>
we were in a stateless type of web application,
WhatIsTheTime.com.
Just enter the time and we didn't need any database
or any information, external information,
to answer that question.
But now we are going to get into a stateful
web application called MyClothes.com
And MyClothes.com allows people to buy clothes online.
And there is a shopping cart when you navigate MyClothes.com
and we're having hundreds of users at the same time
so all these users are navigating the website
and we wanna be able to scale,
maintain horizontal scalability
and keep our application web tier as stateless as possible.
So even though there is a state of shopping cart,
we want to be able to scale our web application
as easily as possible.
So users, that means that they should not lose
their shopping cart while navigating our website,
that would be really bad.
And maybe also have their details such as address, etcetera,
in a database that we can store effectively
and make accessible from anywhere.
So let's see how we can proceed.
You'll see it's going to be yet another fun
but challenging discussion.
Okay, so this is our application and I'm going to go fast.
Here's the kind of architecture we've seen
in the previous lecture.
So we have our user, Route 53, Multi AZ ELB,
Auto Scaling group three AZ, very basic.
So our application is accessing our ELB and our ELB says
"Alright, you're gonna talk to this instance."
And you create a shopping cart,
and then the next request is going to go
not to the same instance but to another instance,
so now the shopping cart is lost
and the user says "Oh, there must just be a little bug,
I'm going to try again."
So he adds something into the shopping cart
and it gets redirected to the third instance
which doesn't have their shopping cart.
So basically the user is going crazy and say,
"Wait, I'm losing my shopping cart
every time I do something.
This is really weird, MyClothes.com is a bad website.
I don't wanna shop on it, it will lost money."
So how do we fix this?
Well, we can introduce Stickiness or Session Affinity
and that's an ELB feature so we enable ELB Stickiness
and now our user talks to our first instance,
adds something into the shopping cart
and then the second request goes
to the same instance because of Stickiness
and the third request also goes to the same instance
and actually every request will go
to the same instance because of Stickiness.
This works really well but if an ec2 instance
gets terminated for some reason,
then we still lose our shopping cart.
But there is definitely some kind of improvement here,
thanks to Stickiness and Session Affinity.
So now, let's look at the completely different approach
and introduce user cookies.
So basically, instead of having the ec2 instances
store the content of the shopping cart,
let's say that the user is the one storing
the shopping cart content and so every time it connects
to the load balancer, it basically is going to say
"By the way, in my shopping cart I have all these things."
and that's done through web cookies.
So now if it talks to the first server,
the second server or the third server,
each server will know what the shopping cart content is
because the user is the one sending
the shopping cart content directly into our ec2 instances.
So it's pretty cool right?
We achieved stateless test because now each ec2 instance
doesn't need to know what happened before.
The user will tell us what happened before
but the HTTP request, they are getting heavier.
So because we sent the shopping cart content in web cookies
we're sending more and more data every time
we add something into our shopping cart.
Additionally, there is some level of security risk
because the cookies, they can be altered
by attackers maybe and so maybe our user may have
a modified shopping cart all of a sudden.
So, when we do have this kind of architecture
make sure that your ec2 instances
do validate the content of the user cookies.
And then, the cookies overall, they can only be so big.
They can only be less than four kilobytes total
so there's only a little information
you can store in the cookies.
You cannot store big data sets, okay?
So this is the idea.
So, this works really well.
This is actually a pattern that
many web application frameworks use
but what if we do something else?
Let's introduce this concept of server session.
So now, instead of sending a whole shopping carts
in web cookies, we're just going to send a session ID.
That is just this one for the user.
So we're gonna send this and in the background,
we're gonna have to maybe in the ElastiCache cluster
and what will happened is that when we send a session ID,
we're gonna talk to ec2 instance
and say we're going to add this thing to the cart
and so the ec2 instance will add the cart content
into the ElastiCache and the ID to retrieve
this cart content is going to be a session ID.
So when our user basically does the second request
with the session ID and it goes to another ec2 instance,
that other ec2 instance is able using that session ID
to look up the content of the cart from ElastiCache
and retrieve that session data.
And then, for last request, the same pattern.
The really cool thing with ElastiCache,
remember, it is sub-millisecond performance
so all these things happen really quickly
and that's really great.
An alternative, by the way, for storing session data
we haven't seen it yet, it's called DynamoDB.
But I'm just putting it out here
just in case you know what DynamoDB is.
So, it's a really cool pattern here.
It's more secure because now ElastiCache is a source
of truth and no attackers can change what's in ElastiCache.
So we have a much more secure type
of pattern and it's very common.
So now, okay we have ElastiCache, we figured this out.
We wanna store user data in the database,
we wanna store the user address.
So again, we're gonna talk to our ec2 instance
and this time, it's going to talk to an RDS instance.
And RDS, it's going to be great because it's
for long term storage and so we can store
and retrieve user data such as address, name,
etcetera directly by talking to RDS.
And each of our instances can talk
to RDS and we effectively get, again,
some kind of Multi AZ stateless solution.
So our traffic is going great.
Our website is doing amazing
and now we have more and more users
and we realized that most of the thing they do
is they navigate the website.
They do reads, they get product information,
all that kind of stuff.
So how do we scale reads?
Well we can use an RDS Master
which takes the writes but we can also have
RDS Read Replicas with some replication happening.
And so anytime we read stuff,
we can read from the Read Replica
and we can have up to five Read Replicas in RDS.
And it will allow us to scale the reads of our
RDS database.
There's an alternative pattern called Write Through
where we use the cache and so the way it works is that
our user talks to an ec2 instance.
It looks in the cache and said,
"Do you have this information?"
If it doesn't have it then it's going to read from RDS
and put it back into ElastiCache
so just this information is cached.
And so the other ec2 instances,
they're doing the same thing but this time
when they talk to ElastiCache,
they will have the information and they get a cache hit
and so, they directly get the response right away
because it's been cached.
And so this pattern allows us to do less traffic on RDS.
Basically, decrease the CPU usage on RDS
and improve performance at the same time.
But we need to do cache maintenance now
and it's a bit more difficult and again
this has to be done application side.
So pretty awesome now, we have our application,
it's scalable, it has many many reads
but we wanna survive disasters,
we don't wanna be stricken by disasters.
So how do we do?
Our user talks to our Route 53
but now we have a Multi AZ ELB.
And by the way, Route 53 is already highly available.
You don't need to do anything.
Well so far, a load balancer,
we're going to make it Multi AZ.
Our auto scaling group is Multi AZ and then RDS,
there's a Multi AZ feature.
The other one is going to be a standby replica
that can just takeover whenever there's a disaster.
And ElastiCache also has a Multi AZ feature
if you use Redis.
So really cool.
Now we basically have a Multi AZ application
all across the board and we know for sure
that we can survive unavailabilities on in AWS going down.
Now for security groups, we wanna be super secure.
So maybe we'll open HTTP, HTTPS traffic
from anywhere on the ELB side.
For the ec2 instance side, we just wanna restrict traffic
coming from the load balancer and maybe for my ElastiCache,
we just wanna restrict traffic coming
from the ec2 security group and from RDS, same thing.
We want to restrict traffic coming directly
from the ec2 security group.
So, that's it!
So now, let's just talk
about this architecture for web application.
So we have discussed ELB sticky sessions,
web client for storing cookies
and making our web app stateless
or using maybe a session ID and a session cache
for using ElastiCache and as an alternative,
we can use DynamoDB.
We can also use ElastiCache to cache data from RDS
in case of reads and we can use Multi AZ
to be surviving disasters.
RDS, we can use it for storing user data,
so more durable type of data.
Read replicas can be used for scaling reads
or we can also use ElastiCache
and then we have Multi AZ for disaster recovery.
And on top of it, Tight Security
for security groups referencing each other.
So this is a more complicated application
just three tier because there's the web tier,
the client tier, the web tier, and the database tier.
But this is a very common architecture overall.
And yes, it may start to increase in cost but it is okay,
at least we know the trade-offs we're making.
If we want Multi AZ, yes for sure we have to pay more.
If we want to scale the reads,
yes for sure we'll have to pay more as well.
But it gives us some good trade-offs
in architecture decisions that we have to make.
So hope you liked it and I will see you in the next lecture.