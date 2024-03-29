
<v Instructor>So, it's just a quick lecture,</v>
just to touch base
on what is scalability and high availability.
This is quite the beginners level,
so if you feel very confident about these concepts,
feel free to skip this lecture.
Now, scalability means that your application system
can hinder a greater load by adapting.
And so, there are two kind of scalability.
There's going to be vertical scalability
or horizontal scalability, also called elasticity.
And so, scalability is different from high availability.
They're linked but different.
So, what I want to do is deep dive into all this distinction
and we'll use a call center as a fun example
to really put into practice how things work.
So, let's talk about vertical scalability.
Vertical scalability,
that means that you need
to increase the size of your instance.
So, let's take a phone operator, for example.
We have a junior operator and we just hired him.
He's great but he can only take five calls per minute.
Now, we have a senior operator and he's much greater.
He can take up to ten calls per minute.
So, we've basically scaled up our junior operator
into senior operator and he's faster and better.
This is vertical scalability.
As you can see, it goes up.
So, for example, in EC2,
our application runs on a a t2.micro
and we want to upscale that application,
that means we want to run it on a t2.large
So, when do we use vertical scalability?
Well, it's very common when you have non distributed system,
such as a data base.
So, it's quite common for a data base, for example,
on RDS or ElastiCache,
these are services that you can just scale vertically
by upgrading the underlying instance type,
although, there usually are limits
to how much you can vertically scale
and that's a hardware limit
but still, vertical scalability
is fine for a lot of use cases.
Now, let's talk about horizontal scalability.
Horizontal scalability means
that you increases the number of instances/systems
for your application.
So, let's take again, our call center.
We have an operator and he is being overloaded.
I don't want to vertically scale it,
I want to hire a second operator
and now, I've just doubled my capacity.
Actually, I'll hire a third operator.
You know what?
I'll hire six operators.
I have horizontally scaled my call center.
So, when you have horizontal scaling,
that implies you have distributed systems
and this is quite common when you have a web application
or a modern application
but remember,
that not every application can be a distributed system.
And I think it's easy, now a days, to horizontally scale,
thanks to the cloud offerings such as Amazon EC2
because we just right click on the web page and boom,
all of the sudden we have a new EC2 instance
and we can just horizontally scale our application.
Now let's talk about high availability.
High availability, that goes usually hand in hand
with horizontal scaling but not all the time.
High availability, that means
that you're running your application or system
in at least two data centers,
or two availability zones in AWS.
And he goal of high availability
is to be able to survive a data center loss,
so in case one center goes down, then we're still running.
So, let's talk about our phone operators.
Maybe I'll have three of my phone operators
in the first building in New York
and maybe I'll have three of my phone operators
in the second building
on the other side of the United States, in San Francisco.
Now, if my building in New York
loses their internet connection or their call connection,
then that's okay, they can't work
but my second building in San Francisco
is still fine and they can still take the phone calls.
So, in that case, my call center is highly available.
Now, high availability, can also be passive,
for example, when we have RDS Multi AZ, for example,
we have a passive kind of high availability
but it can also be active
and this is when we have a horizontal scaling,
so this is where, for example,
I have all my phone calls in two buildings in New York.
They're all taking calls at the same time.
So, for EC2, what does that mean?
Well, vertical scaling again,
increasing the instance size,
it's going to scale up or down.
So, for example, the smallest kind of instance you can get
in AWS today is t2.nano and this is 0.5 gigs of RAM, 1 vCPU
and the biggest is A u-t12tb1.metal,
which has 12.3 terabytes of Ram and 450 vCPUs,
so quite a big instance
and I'm sure these things will get bigger
as time goes along.
So, you can vertically scale from something very, very small
to something extremely large.
Horizontal scaling, that means you increase the number
of instances you have
and in AWS terms, it's called scale out or scale in.
Out, when you increase the number of instances.
In, when you decrease number of instances
and this could be used
for other scaling groups or load balancers.
And then finally, high availability
is when you run the same instance
of the same application across multiple AZ
and so this is for an auto scaler group
that has multi AZ enabled
or a load balancer that has multi AZ enabled, as well.
So, that's it.
Just a quick run down were fine
on the terms high availability and scalability.
They're necessary for you to understand
when you look at the exam questions
'cause they can trick you sometime,
so make sure you're very confident with those.
They're pretty easy when you think about it.
Remember the call center in your mind
when you have these questions.
Okay, that's good.
I will see yo in the next lecture.