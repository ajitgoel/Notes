
<v Narrator>So far, we've seen that we have a</v>
Web App with 3-tier architecture
and there were a lot of components in there.
There was Elastic Load Balancing,
there was auto-scaling, Multi-AZ,
there was a Database RDS,
there was a cache for the ElastiCache,
and all these things we had to create manually.
Imagine if we had to deploy so many apps,
Java, Go, Python,
whatever languages you are using, even Docker.
And we had every time to create that load balancer,
to configure that auto scaling,
and that RDS database, and on top of this,
well, we need to deploy into several environments,
such as DEV, TEST, and PROD, and maybe
we want to have different versions at the same time.
I mean it's a complete nightmare, right?
So, as a developer, you don't
want to manage infrastructure.
You just want to deploy code.
You want to configure the databases, load balancers
once and just be done with it.
You want it to scale, okay?
You want your deployment to be valid for one instance,
but also to be valid for 100 instances.
And, as you can see, well,
the architecture right here is pretty traditional.
Most web apps will have a load balancer
and an auto-scaling group.
So, as a developer, you know, personal wish,
I want my code to run.
I really don't care about the architecture.
And I possibly want consistency across
all my applications and environment.
I want a one-step shop to manage my stuff, okay?
So, this is where Elastic BeanStalk comes in.
Elastic BeanStalk is like a developer centric view,
so you can deploy applications on AWS.
It will leverage all the components we've seen before,
and that's why we've been to the fundamentals first.
So, all the EC2, ASG, ELB, RDS, etc.,
all these things we've seen before,
we're going to reuse them right now.
And this is why it comes in super handy.
It's one view that's super easy to make sense of.
So, we'll see all the configuration and development.
But we'll still have full control over
how all these components get configured,
which is very nice.
Elastic BeanStalk (mumbles) is free,
and you are going to pay only
for the underlying instances.
So, BeanStalk is a managed service.
That means that the instance configuration,
all of the operating system,
will be handled by BeanStalk.
The deployment strategy, you can configure it,
but again it will be performed by BeanStalk.
And just the application code is your responsibility.
That's kind of an oversimplification.
You can always customize stuff.
But I wanted to give you a straight,
easy-to-understand picture.
There's three architecture models for BeanStalk.
You have a single instance deployment,
which is good for DEV.
So, you'll have a whole environment,
and it's going to be one instance.
Then you have a load balancer and an auto-scaling group.
That's great when you do production or
pre-production for your web applications
and you want to see how they react at scale.
And then, if you just want to have ASG load balancers,
it is great when you do non-web apps in production,
such as your workers or other kind of models
that don't need a load balancer
or don't need to be accessible.
So, BeanStalk, when we look at it,
and we'll see this in our hands-on,
it has three components.
It has an application, an application version,
so every time you upload new code,
basically, every time you upload new code
you'll get an application version,
and environment name, so you're going
to deploy your code to DEV, TEST, and PROD.
And you're free to name your environments
just the way you want,
and have as many environments as you wish.
You're going to deploy applications
to your environments,
and basically will be able to promote
these application versions to the next environments.
So, that's the whole idea.
We're going to create an application version,
get it from DEV to TEST to PROD, etc...
There's a rollback feature, as well,
so we can roll back to a previous application version,
which is quite handy.
And we've got full control over
the life cycle of environments.
So, the idea is that you create an application,
and you create an environment or multiple environments,
and then, you're going to upload a version
and you're going to give it an alias,
so, just a name that you want.
And then, this alias, you will release it to environments.
Fairly easy, right?
So, what can we deploy in BeanStalk?
Well, it has support for tons of platforms.
And, if your platform is not there,
there is something weird.
But, Go, Java, Java Tomcat, .NET, Node, PHP, Python,
Ruby, Packer, you know, Single Container Docker,
Multicontainer Docker, Preconfigured Docker,
and if your platform is not supported,
you can write your own custom platform,
although that is fairly advanced,
and not something that's expected of you
as an Associate Developer.
But that's the idea.
With BeanStalk we can do a lot of things.
And so what we're going to do is
deploy an app on BeanStalk.
So, we'll see you in the next lecture.