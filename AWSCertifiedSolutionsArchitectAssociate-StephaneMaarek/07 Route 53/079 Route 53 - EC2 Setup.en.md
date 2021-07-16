
<v Instructor>Okay, so, I want to setup my infrastructure</v>
to have a bunch of EC2 instances left and right
in different regions.
So, that I can basically have Route 53
do some very interesting things with it
in the next lectures.
So, right now, here's the setup lecture,
so I'll go and open the EC2 console,
and right now I'm in Ireland, so I'll stay in Ireland.
I launch an instance, I'll make it Amazon Linux Two.
I'll select it and now you're getting used to it I'm sure.
T2 micro, I configure the instance details,
I just want one of them.
For the user data, I'm going to send some text,
so the text I have is in Route 53 user-data.sh,
and so let's have a quick look at what this does.
So we install Apache so this is HTTPD, we know this already.
Here we so something really interesting
that is quite cool to see.
We kept the availabilities on of the EC2 instance
by querying the meta-data service at this IP.
So, this is the EC2 meta-data service if you don't know it.
At 169.254.169.254
we create latest, meta-data.
We want to get the EC2 instance placement,
and then availability-zone.
So this gives us the AZ,
and then we echo hello world
from the host name of the machine in AZ
and then we pass in the availability zone.
We put this into index of HTML
and that's what will be displayed on the instance.
So, that's really cool.
Let's go and paste that into the user data.
Then we click on add storage.
The storage looks good.
Add text: no need. Review.
And then I'll just create a new security group,
and I'll just allow all SSH and all HTTP.
Review and launch.
Launch, I'll just select this key, and launch the instance.
Okay, we're doing great.
So this is one instance in Ireland,
but what I want to do is also do this in other regions,
so in North Virginia, US east one,
I'm going to do the exact same things.
So, I'll launch an instance,
Select Amazon Linux Two, configure the instance details,
Add-- no, previous.
We're gonna put the user data in.
Done. Add storage. Add tags.
Configure security group,
and then we'll have to create a new security group
because security group, remember, are region scoped,
so we have to recreate the security group we just created.
So, we're gonna select HTTP, just click here.
Perfect, and click on review and launch.
Launch, and here there is a key pair I already have,
but you can create a new key pair,
otherwise, or you can even proceed without a key pair.
We won't be SSH-ing into the instances so it's fine.
So, I click on launch instances.
And now this instance is launching,
and then finally, in a region in Asia,
maybe I'll choose Tokyo, Tokyo in Asia Pacific.
What I'm going to do is
that I'm going to create another instance,
so we'll have three instances
in three very different regions.
We have Tokyo, Ireland, and North Virginia.
So let's launch an instance.
Amazon Linux Two, needs some details.
For advanced details, we'll put the user data.
Add storage, add tags, configure security group.
Create the new security group, make it HTTP which is great.
Review and launch. Launch.
And here I will say that I will proceed
without a new key pair and launch the instances.
So now let me wait for all my instances to start,
and I'll be right back with you.
So, next we look at the fact that
if we look at a public IP, for example, in Ireland,
and I click on it, it says hello world
from, and here is, the host,
and there is in AZ eu-west-1c.
So, here I know that this instance is eu-west-1c.
What I'm going to do is just copy all these IPs
just so I remember the AZ,
so I'll just make a small file right here,
and I'll call it ip-to-az and it's just for me.
I will not have this file into the code at the end.
It's just for me to remember what is where.
So, this instance is in Ireland which is great.
There was one in North Virginia,
so I'll put one in North Virginia.
I'll also take this public IP and say this is us-east-1.
And then finally, there is one in Tokyo,
so we'll go to Tokyo, and here we get another IP,
and this instance right here, excellent,
is in Tokyo so it's northeast one.
So, ap-northeast-1.
Excellent.
Let's just check that these two instances also work.
Have to do use data, but there's no reason why it wouldn't.
So, this one worked.
It says hello from northeast-1a,
and, finally, this one should say hello from us-east-1a.
Okay, perfect, us-east-1a.
Excellent, so everything is ready.
Now the last thing we need to do
is to create a load balancer,
and so we'll go back to Ireland.
And, remember, load balancers are regional,
so it's not something that will change many.
We cannot link it to all the H two instances that we created
but we'll go link it to this one in eu-west-1c,
and you'll see why a little bit later in this course.
So, let's go to load balancers which is in the bottom left.
Load balancer, and I'll quickly go ahead
and create a new one, so I'll create a load balancer.
It's going to be an application load balancer.
I'll create it and I'll name it DemoRoute53.
It's going to be internet-facing and on ipv4.
It's going to be listening on port 80.
This is perfect.
I'll put it in three AZ just for trying it out,
and click on next configure security groups.
I will choose I will create a new security group
because I can't find the right one
which allows 80 on anywhere, perfect.
I'll configure routing, I'll create a new target group,
I'll call it DemoRoute53TG, for target group.
And it's going to link directly to an instance.
And the protocol is going to be HTTP, port 80,
and this is great.
The health checks is going to be left as is.
And I'll register a target.
I'll add my target to my target group, excellent.
Click on review, click on create,
and I'll just wait of this load balancer to be created,
so it will take a little bit of time to get provision,
but I'll just pause until then.
And my DNS name is now active,
so let me just try it out to see if it works.
I'll copy it, paste it, and here we go.
I still get my hello world from my instance,
so that is perfect.
All my setup is done
and now we're ready to have some fun with Route 53.
Just to summarize: we've created three EC2 instances
in three different regions,
and we've created a load balancer in Ireland
pointing to one of these EC2 instances.
All right, that's good.
I will see you in the next lecture.