
<v Instructor>The fourth pillar in the Well-Architecture</v>
Framework is the performance efficiency.
So what is it?
It includes the ability to use computing resources
efficiently to meet system requirements, and to maintain
that efficiency as demand changes and technologies evolve.
So it's all about adapting
and providing the best performance.
The design principles are simple.
First, you need to use advanced technologies, okay?
You need to democratize them, and basically,
as the services become available, maybe they can be helpful
for your product developments so track them.
You need to be able to go global in minutes
so if you need to deploy in multiple regions
it shouldn't last days, it should last minutes.
Maybe using cloud formation.
Use serverless infrastructure.
So that's the golden state.
So that means you don't manage any servers,
and everything scales for you, which is really awesome.
Experiment more often.
Maybe you have something working really well today,
but you think it won't scale to 10 times the load.
Experiment maybe try serverless architectures.
See if that works for you.
Basically, give it a go.
And mechanical sympathy.
So be aware of all the AWS services,
and that's really, really hard.
I mean, doing this course is a right way of doing it.
Reading some blogs is also the right way of doing it.
Even for me, it's really hard to track
of everything of AWS services,
but you still need to be on top of the game.
Because when new changes have to happen,
they can really change dramatically,
your solution architecture.
So for AWS services for performance efficiency,
well, selections, so Auto Scaling, Lamda, EBS, S3, RDS
so you have so many choices
of technology that scale a little different patterns.
So choose the right one for you.
Definitely, for example, Lamda needs to serverless,
Auto Scaling is going to be for more EC2,
EBS is when you know you need to have a disc,
but you can sort of manage performance
over time using GB2 or I01.
S3 if you want to scale globally,
RDS, maybe you wanna use it to provision a database
and maybe you want to migrate to Aurora.
So you have a lot of things to select from.
Review, so how do we review our performance?
Well, the cloud formation, making sure we get
exactly what we need before we create it.
And how do we keep updated
on all this performance improvements?
Then the AWS News Blog is also a really good one,
and that's a tricky one, yes, but do read the AWS News.
I do read them once in a while, once a week,
and really keep myself updated on what's coming up.
Monitoring.
So how do we know we are performing
really well and as expected?
Then CloudWatch with CloudWatch Alarms, CloudWatch metrics.
All these things CloudWatch dashboards can help you
understand better how things work.
AWS Lamda, as well.
Making sure that you don't throttle,
that your application Lambda function runs
in a minimal time, all that kind of stuff,
And tradeoffs.
So how do we make sure that we are doing
the right performance decision?
So RDS maybe versus Aurora.
ElastiCache if you want to improve real performance,
maybe using Snowball.
So Snowball, for example, will give us a lot of data
moving very fast, but it will take maybe a week
for the data to arrive.
So the tradeoff is, do we want the data right away
in the cloud and use all our network capacity
or do we wanna move that data through a track
and get this in a week from now.
So always Tradeoffs, right?
With ElastiCache, always a Tradeoff as well.
Do I want to have possibly outdated,
stale data in a cache but really improve performance?
Or do I wanna get the latest and not use ElastiCache?
CloudFront same thing.
It does cache stuff around the edges.
So if you use CloudFront, yes, you go global in minutes,
but you have the possibility of everything being cached
for one day on people's laptops.
So when you release an update to your websites,
maybe it will take time for people to get the new stuff.
So think about all these things.
Really, it's important, but overall performance
should be really in the middle of your thought process
as you do Solution Architecture.
Okay, that's it.
I will see you in the next lecture.