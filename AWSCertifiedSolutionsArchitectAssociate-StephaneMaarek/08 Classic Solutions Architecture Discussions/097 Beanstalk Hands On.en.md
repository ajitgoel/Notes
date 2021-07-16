
<v Instructor>So let's have a look</v>
at the Beanstalk service.
And for the solutions architect exam,
you don't need to know Elastic Beanstalk in depth,
you just need to know what it does at a high level.
If you go into the developer exam,
there's a whole section on how to use Beanstalk properly
because it is quite a very complete service.
But let's go ahead and quickly deploy
our first application with Elastic Beanstalk.
So I'm going to scroll down,
and we have to create an application name.
So I'll create, DemoBeanstalk.
Then tags, we won't need to specify them.
Next, we need to choose a platform.
So what do we want to run on Beanstalk?
As you can see, we have a lot of choices.
Is it Programming Languages?
Or is it Docker?
And for this example, I'm just going to use Node.js,
but you can choose whatever you want.
And the default versions are fine as well.
Then for the application code,
you could upload your own code, but it's quite complicated.
And again, not something we want to do
at the solutions architecture associate level.
But, we'll just use a simple application.
Now I want to click on Configure More Options,
just to show you the type of options
you can specify with Elastic Beanstalk.
So scrolling back up, we have presets,
and these presets are the way to perform
some type of solution architecture
on top of Elastic Beanstalk.
For example, we can use single instance,
which is Free Tier eligible,
and that means that we will have one instance
and there will be and Elastic IP attached to it,
and that will be it.
Or you can run a single instance using Spot Instances,
which is not Free Tier eligible.
We can run high availability,
which is going to be using an application load balancer
and an auto scaling group.
And you can also do the same high availability,
but this time using a mix of Spot and On-Demand Instances.
So if you select one of these presets,
what this will do is that it will modify
the settings that are outlined all right here, okay?
So I'm just going to use single instance
to make it Free Tier eligible.
And we have this platform, Node.js 12, okay?
Now for the software, you can specify all these things.
The instances, you can specify
the type of instances you want.
For example, for the capacity here,
we have On-Demand Instances, the t2 micro,
because we're using a single instance,
we don't have any load balancer, and so on.
So all these things can be modified.
And as you can see, it's a lot of options to know
if you need to know Beanstalk in depth.
But for our own purpose,
we just want to click on Single Instance,
and then click on Create App.
So this is going to create our Beanstalk environment,
and this will take a few minutes to get started.
So what I will be doing is that I will wait a few minutes
and then get back to you.
Okay, so we can see now that
the environment has been successfully launched,
and so if I click on Environment here,
and click on this,
to be a bit more quick, so I'll remove these prompts.
As we can see the application is running,
the health is okay and everything is green.
So what I can do is,
to see this application that has been deployed
by clicking on this URL right here.
And this is showing that yes, congratulations,
your first Beanstalk Node.js application.
has been deployed on the cloud.
So this is cool,
but the more important stuff to see is what has happened
and what has been deployed by Elastic Beanstalk.
So if we go into the ec2 service,
we can see what happened.
So obviously, if you go to Instances,
we can see that one instance is currently running.
And this instance right here, has been launched.
If we look at the tags,
we can see that there is a CloudFormation tag,
there's an Elastic Beanstalk tag.
And also the name of the Institute Instance
has an auto scaling group,
so that means that this Institute Instance,
which is a t2 micro,
is it somehow managed by an auto scaling group.
So if I go on the left hand side
and click on Auto Scaling Group,
as we can see, yes, an ASG has been created.
And if I click on this ASG,
we can see that the desired capacity is one,
the minimum and the max capacity is also one.
And if I go into Instance Management,
we can find our Institute Instance right here.
So this is great.
Also because this is a Beanstalk
Free Tier eligible environment
with a single instance,
if I go to Elastic IP's,
I should be able to find my Elastic IP
that has been created for this.
And if I go to Security Groups, for example,
I should be able to see a Security Group
that has been created.
So this is this one.
And as we can see the inbound rules allow HTTP on port 80,
which is allowing us to access our application
right here in Elastic Beanstalk.
So that's it.
If we had created load balancers,
they would be under the Load Balancer section,
but because we chose a very simple deployment,
we don't have any load balancer.
But just to show you what would have been created
if we did choose a highly available environment.
So now that we're done with this,
this was a quick demo,
we can just wrap up and terminate the environment.
So to do so, you just need to enter
the name of the environment.
So I'll copy this and paste it,
terminate it,
and then we're done.
So that's it.
I hope you liked this Beanstalk demo
and I will see you in the next lecture.