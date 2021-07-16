
<v Instructor>So disaster recovery</v>
as a solutions architect is super important
and the exam expects you to know about disaster recovery,
and there's a white paper on it, you should read it
but I tried to summarize everything clearly
with graphs and diagrams in this lecture
so you don't have to read it if you don't want to.
But overall, you can expect some questions
on disaster recovery and as a solutions architect
you need to know about disaster recovery anyway.
Don't worry, I tried to make this
as simple as possible for you.
So what is a disaster?
Well it's any event that has a negative impact
on a company's business continuity or finances,
and so disaster recovery is about preparing
and recovering from these disasters.
So what kind of disaster recovery
can we do on AWS or on general?
Well we can do on-premise to on-premise.
That means we have a first data center, maybe in California,
another data center, maybe in Seattle,
and so this is traditional disaster recovery
and it's actually very, very expensive.
Or we can start using the cloud
and do on-premise as a main data center
and then if we have any disaster, use the cloud.
So this is called a hybrid recovery.
Or if you're just all in the cloud
then you can do AWS Cloud Region A to Cloud Region B,
and that would be a full cloud type of disaster recovery.
Now before we do the disaster recovery,
we need to define two key terms,
and you need to understand them from an exam perspective.
The first one is called RPO, recovery point objective,
and the second one is called RTO, recovery time objective.
So remember these two terms
and I'm going to explain them right now.
So what is RPO and RTO?
The first one is the RPO, recovery point objective,
and so this is basically how often basically
you run backups, how back in time can you to recover.
And when a disaster strikes, basically, the time between
the RPO and the disaster is going to be a data loss.
For example, if you back up data every hour
and a disaster strikes then you can go back in time
for an hour and so you'll have lost one hour of data.
So the RPO, sometimes it can be an hour,
sometimes it can be maybe one minute.
It really depends on our requirements,
but RPO is how much of a data loss
are you willing to accept in case of a disaster happens?
RTO on the other end
is when you recover from your disaster, okay.
And so, between the disaster and the RTO
is the amount of downtime your application has.
So sometimes it's okay to have 24 hours of downtime,
I don't think it is.
Sometimes it's not okay and maybe you need
just one minute of downtime, okay.
So basically optimizing for the RPO and the RTO
does drive some solution architecture decisions,
and obviously the smaller you want these things to be,
usually the higher the cost.
So let's talk about disaster recovery strategies.
The first one is backup and restore.
Second one is pilot light,
third one is warm standby,
and fourth one is hot site or multi site approach.
So if we basically rank them, all will have different RTO.
Backup and restore will have the smaller RTO.
Pilot light, then warm standby and multi site,
all these things cost more money but they get a faster RTO.
That means you have less downtime overall.
So let's look at all of these one by one in details
to really understand from an architectural standpoint
what they mean.
Backup and restore has a high RPO.
That means that you have a corporate data center,
for example, and here is your AWS Cloud
and you have an S3 bucket.
And so if you want to backup your data over time,
maybe we can use AWS' Storage Gateway
or and have some lifecycle policy
put data into Glacier for cost optimization purposes,
or maybe once a week you're sending a ton of data
into Glacier using AWS' Snowball.
So here you know if you use Snowball,
your RPO is gonna be about one week
because if your data center burns or whatever
and you lose all your data then you've lost one week of data
because you send that Snowball device once a week.
If you're using the AWS' Cloud instead,
maybe EBS volumes, Redshift and RDS.
If you schedule regular snapshots and you back them up
then your RPO is going to be maybe 24 hours or one hour
based on how frequently you do create these snapshots.
And then when you have a disaster strike you
and you need to basically restore all your data
then you can use AMIs to recreate EC2 instances
and spin up your applications or you can restore
straight from a snapshot
and recreate your Amazon RDS database
or your EBS volume or your Redshift, whatever you want.
And so that can take a lot of time as well to restore
this data and so you get a high RTO as well.
But the reason we do this is actually
it's quite cheap to do backup and restore.
We don't manage infrastructure in the middle,
we just recreate infrastructure when we need it,
when we have a disaster and so the only cost we have
is the cost of storing these backups.
So it gives you an idea.
Backup and restore, very easy, pretty expense--
not too expensive and you get high RPO, high RTO.
The second one is going to be pilot light.
So here with pilot light, a small version of the app
is always running in the cloud,
and so usually that's going to be your critical core,
and this is what is called pilot light.
So it's very similar to backup and restore,
but this time it's faster because your critical systems,
they're already up and running
and so when you do recover, you just need
to add on all the other systems that are not as critical.
So let's have an example.
This is your data center, it has a server and a data base,
and this is the AWS' Cloud.
Maybe you're doing to do continuous data replication
from your critical database into RDS
which is going to be running at any time
so you get an RDS database ready to go running.
But your EC2 instances, they're not critical just yet.
What's really important is your data,
and so they're not running,
but in case you have a disaster happening,
Route 53 will allow you fail over from your server
on your data center, recreate that EC2 instance in the cloud
and make it up and running,
but your RDS database is already ready.
So here what do we get?
Well we get a lower RPO, we get a lower RTO
and we still manage costs.
We still have to have an RDS running,
but just the RDS database is running, the rest is not
and your EC2 instance only are brought up,
are created when you do a disaster recovery.
So pilot light is a very popular choice.
Remember, it's only for critical core assistance.
Warm standby is when you have a full system up and running
but at a minimum size so it's ready to go,
but upon disaster, we can scale it to production load.
So let's have a look.
We have our corporate data center.
Maybe it's a bit more complicated this time.
We have a reverse proxy, an app server,
and a master database,
and currently our Route 53 is pointing the DNS
to our corporate data center.
And in the cloud, we'll still have our data replication
to an RDS Slave database that is running.
And maybe we'll have an EC2 auto scaling group,
but running at minimum capacity that's currently talking
to our corporate data center database.
And maybe we'll have an ELB as well, ready to go.
And so if a disaster strikes you,
because we have a warm standby,
we can use Route 53 to fail over
to the ELB and we can use the failover to also change
where our application is getting our data from.
Maybe it's getting our data from the RDS Slave now,
and so we've effectively basically stood by
and then maybe using auto scaling,
our application will scale pretty quickly.
So this is a more costly thing to do now
because we already have an ELB and EC2 Auto Scaling
running at any time, but again,
you can decrease your RPO and your RTO doing that.
And then finally we get the multi site/hot site approach.
It's very low RTO, we're talking minutes or seconds
but it's also very expensive.
But you get two full production scales
running on AWS and On Premise.
So that means we have your On Premise data center,
full production scale, you have your AWS data center,
full production scale with some data replication happening.
And so here what happens is that because you have a hot site
that's already running, your Route 53 can route request
to both your corporate data center and the AWS Cloud
and it's called an active, active type of setup.
And so the idea here is that the failover can happen.
Your EC2 can failover to your RDS Slave database if need be,
but you get full production scale running
on AWS and On Premise, and so this costs a lot of money,
but at the same time, you're ready to fail over,
you're ready and you're running into a multi DC
type of infrastructure which is quite cool.
Finally, if you wanted to go all cloud,
you know it would be the same kind of architecture.
It will be a multi region so maybe we could use Aurora here
because we're really in the cloud,
so we have a master database in a region
and then we have your Aurora Global database
that's been replicated to another region as a Slave
and so these both regions are working for me
and when I want to failover, you know,
I will be ready to go full production scale again
in another region if I need to.
So this gives you an idea of all the strategies
you can have for disaster recovery.
It's really up to you to select the disaster recovery
strategy you need, but the exam will ask you
basically based on some scenarios, what do you recommend?
Do you recommend backup and restore?
Pilot light?
Do you recommend multi site or do you recommend hot site?
All that kind of stuff.
Warm backups and all that stuff.
Okay so finally, disaster recovery tips,
and it's more like real life stuff.
So for backups, you can use EBS Snapshots,
RDS automated snapshots and backups, et cetera.
And you can push all these snapshots
regularly to S3, S3IA, Glacier.
You can implement a Lifecycle Policy.
You can use Cross Region Replication
if you wanted to make sure these backups
would be in different regions.
And if you want to share your data from On-Premise
to the cloud, Snowball or Storage Gateway
would be great technologies.
For high availability, using Route 53 to migrate DNS
from a region to another region
is really, really helpful and easy to implement.
We can also use technology to have multi-AZ implemented,
such as RDS Multi-AZ, ElastiCache Multi-AZ,
EFS, S3, all these things are
highly available by default if you enable that website.
If you're talking about the high availability
of your network, maybe you've implemented
Direct Connect to connect from your
corporate data center to AWS.
But what if the connection goes down for whatever reason?
Maybe you can use Site to Site VPN
as a recovery option for your network.
In terms of replication, you can use
RDS Replication Cross Region, Aurora,
and Global Databases.
Maybe you can use a database replication software
to do your on-premise database to RDS,
or maybe you can use Storage Gateway as well.
In terms of automation, so how do we recover from disasters?
I think you would know already,
Cloudformation/Elastic Beanstalk can help recreate
whole new environments in the cloud very quickly.
Or maybe if you use CloudWatch, we can recover
or reboot our EC2 instances
when the CloudWatch alarms fail.
AWS Lambda can also be great to customize automation.
So they're great to do rest API
but they can also be used to automate your entire
AWS infrastructure, and so overall,
if you can manage to automate your whole disaster recovery
then you are really, really well-set for success.
And then finally, chaos testing,
so how do we know how to recover from a disaster?
Then you create disasters, and so
and example that's, I think,
widely quoted now in the AWS' world
is that Netflix, they run everything on AWS,
and they have created something called a
simian-army, and they randomly terminate
EC2 instances, for example.
They do so much more, but basically
they just take an application server
and terminate it randomly.
In production, okay?
Not in divert test, in production.
So they want to make sure that their infrastructure
is capable to survive failures,
and so that's why they're running
a bunch of chaos monkeys that just terminate stuff randomly
just to make sure that their infrastructure
is rock-solid and can survive any types of failures.
So that's it for this section on disaster recovery.
I hope you enjoyed it,
and I will see you in the next lecture.