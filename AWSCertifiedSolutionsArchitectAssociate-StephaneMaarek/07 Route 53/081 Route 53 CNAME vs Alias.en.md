
<v Stephane>So, let's try to understand</v>
the difference between a CNAME record and an Alias record.
So, if you have an AWS Resource that
could be a Load Balancer or CloudFront,
it will expose a AWS hostname.
For example, if I have a Load Balancer,
it could be lb1-1234.us-east-two.elb.amazonaws.com.
So, this is your URL that Amazon Web Services controls,
but you don't.
What you want to do is to expose your application
as myapp.mydomain.com,
but you want it to point to your Load Balancer.
So, what we need is a CNAME.
So, a CNAME, if you remember correctly,
points a hostname to any other hostname.
So, for example, app.mydomain.com
can be pointing to blabla.anything.com.
And CNAME's are great,
but they only work for non root domain,
so it has to be something.mydomain.com.
That's what I mean by non root.
It cannot just be mydomain.com,
it has to be something.mydomain.com.
And then we have Alias records.
Alias records are very similar to CNAME,
but they point a hostname to an AWS Resource.
So, this time,
it has to be app.mydomain.com to blabla.amazonaws.com.
So, in this instance,
it has to point to an AWS Resource, specifically,
whereas CNAME could point to anything.
And the great thing about Aliases is that
they work for both root domain and non root domain.
So, it can work for mydomain.com very simply.
On top of it, Alias records are free of charge
and have capability for native health checks.
So, the exam will ask you to understand
what is the difference between a CNAME and Alias
and when to use which, and the answer is,
if you have a root domain then you have to use an Alias.
If it's a non root domain, you can use either,
and usually it's always going to be an Alias anyway,
because you point to an AWS Resource
which will be free to charge and better.
But anyway, now you know the difference
between the CNAME and an Alias,
but let's go in the hands-on to see what I mean by that.
So, currently I have an A record for my root domain,
so I'm going to delete this, just for now.
Okay.
Now I'm going to create a record set,
so let me close everything, here we go.
I'll create a record set,
and it's going to be myapp.stephanetheteacher.com,
and first choice is for me to make it a CNAME,
and I'll make it a CNAME directly to
the Load Balancer I have.
So, let's scroll down, click on "Load Balancer,"
and I'll select this DNS name right here,
and I'll select a CNAME pointing to this.
This is a very valid CNAME and it works.
I'll click on "Create,"
and as we can see now,
if I go to myapp.stephanetheteacher.com,
as we can see,
we get the "Hello World" directly from the Load Balancer,
which points to the EC2 instance.
So, this is working really really great.
Also what I could be doing is, instead of doing a CNAME,
I could use an Alias record because this is a Load Balancer.
So here, I'm doing something inefficient.
I'm pointing directly to an Amazon Resources
but I don't take advantage of the Alias feature.
So, I'll create a record,
I'll call it "myalias,"
and there I'm going to make this an Alias record,
so I click on Alias "Yes."
And it can say, okay, either you choose a target name and,
to be honest, I'm still confused by how this work,
because sometimes it just doesn't show what you wanna have,
or it says you can also type a domain name
for the resource directly in there.
So, if I just paste this,
it will work and find right away that
it is my Load Balancer in there.
So, I've pasted this and we get a Alias Hosted Zone ID,
so this is perfect.
Click on "Create" and here we go.
We have an Alias record being created,
and so if I try this URL, myalias.stephanetheteacher.com,
I get the exact same result pointing to the Load Balancer
and eu-West-1c.
So, in that regards, my CNAME, myapp and myalias,
they do the exact same purpose.
One is an Alias record, one is a CNAME,
and so this one is going to be free,
this one's going to be paid,
but they achieve sort of the same purpose.
Overall, I do recommend for you to use myalias.
As we can see, though, in myalias,
we can evaluate the target health right away
by clicking on "Yes,"
and that will directly leverage
the Load Balancer health checks for this,
which is really really cool.
But for now, I'll just leave is as "No."
Okay.
Now, let's look at root domain.
So, if I go on stephanetheteacher.com,
I can make this an Alias and enter the target name in there,
and click on "Create," and this works just fine.
So, stephanetheteacher.com is an Alias
directly to my Load Balancer.
So, my root domain is an Alias and that works just fine,
but if I create a record set and this time,
so let me just delete this one, obviously, first,
I'll delete this one, "Confirm."
So, I'll make a new one, stephanetheteacher.com,
but this time I'll make it a CNAME pointing to
and my domain name for my Load Balancer,
which is right here, pointing it,
and click on "Create."
Here, we get an error saying the CNAME with the DNS name
is not permitted at apex in zone stephanetheteacher.com.
So, that means that, basically,
I'm trying to create a CNAME at the root of my domain name,
so at the apex of my zone,
and that is just not allowed by Route53.
So, I cannot do this.
If I wanted to have stephanetheteacher.com
pointing to my Load Balancer,
CNAME is not an option, it would make an error.
The only way to do it would be to select an Alias record
and point directly to my Load Balancer in there,
and click on "Create."
And now while I just test that out,
I'll go to stephanetheteacher.com
and we'll have to wait just a little bit for it to work.
So, let me just wait one second,
and I use an Incognito window just to make sure
that I have no (murmurs) there, but here we go,
stephanetheteacher.com points directly to my Load Balancer
and it's replied for my EC2 instance.
So, this is perfect.
That just proves that, basically,
Alias records both work for the root domain
and also for sub-domains,
whereas CNAME just work for sub-domains only,
and it is something that you need to know
going into the exam.
I hope you like this lecture,
I will see you in the next one.