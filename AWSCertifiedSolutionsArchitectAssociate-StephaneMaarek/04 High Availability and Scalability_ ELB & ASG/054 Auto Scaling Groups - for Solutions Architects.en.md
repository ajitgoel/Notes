
<v Narrator>Two more things you should be knowing</v>
as a Solutions Architect on your ASG.
The first one is that there is a rule,
regarding how your instances are being terminated.
So by default, there is ASG default termination policy,
and here's a simplified version.
So, first you find the AZ
which has the most number of instances.
And then if there are multiple instances
in the AZ to choose from,
delete the one with the oldest
launch configuration or launch templates.
So if we look on the right hand side,
on our Auto Scaling group,
we have two availability zones.
And the first one in A,
we have three instances with v1.
A two instances with v1
and two instances with v2 our launch configuration.
And on the AZB we have three instances of v1.
And v1 is the oldest launch configuration.
But as we can see the rule,
is that the Auto Scaling group
will choose AZA as the instance
as the AZ were to delete instances
because it is the one with the most instances.
So in this case, AZA will be selected
and then within the four instances of availability zone A,
we will choose...
The ASG will choose v1 instance,
because it has the oldest launch configuration.
The idea is that the ASG by default
using the default termination policy,
will try to balance the number of instances
across AZ by default,
and this is something you should know.
So in this one, boom!
This one will be zapped.
And then for lifecycle hooks,
this is another feature of ASG.
So by default, as soon as an instance
is launched in a ASG it's in service,
but there is a long process of things
that are happening when you launch an instance.
So when your instance is launched,
they go into a Pending state.
And if you define a lifecycle hook in the pending states,
the instance will go directly into Pending wait states,
and you have the option to configure that instance
or do a lot of things.
And then when you're ready,
you move it into Pending Proceed.
And when he goes into pending proceed,
it will go at directly in being InService.
I will see if there is no lifecycle hook,
then will go directly from Pending to InService.
The idea here is that,
you have the option to install extra software,
do extra checks, before making sure your instance
is declared InService.
And similarly, when there's a scale in events
so when the instance gets terminated,
it goes into a Terminating state.
And if you define a lifecycle hook
on the terminating state,
then you will go into Terminating Waits,
then Terminating Proceed,
and then finally Terminated.
And so why would we have a termination lifecycle hook?
Why we would have one for example,
if we wanted to extract information for example,
logs or files out of our ECM2 instance,
before it is completely terminated.
So this is the use case for lifecycle hooks,
and this is something you have to go
going through the exam okay.
Let's just talk about
the difference of launch templates and launch configuration.
So both launch templates and launch configuration
allow you to specify the AMI ID of your EC2 instances.
You can define the instance type,
the key pairs you want to attach, security groups
and other parameters you may want such as tags,
EC2 user-data, and so on.
So both of these things,
allow you to define how your EC2 instances
as part of your ASG, should be launched.
But launch configuration are considered legacy,
so they're old because they must be re-created
every time you want to update any single parameters.
And then, and the launch templates
are the newer capability of ASG
and this is what AWS recommends you to use going forward.
And the reason is, launch templates
can have multiple versions
so they can be versioned.
You can create parameter subsets,
so it's possible for you to define
a partial configuration that should be re-used
and inherited across multiple templates.
And it allows you, to provision
a mix of On-Demand and Spot instances,
to optimize and have a spot fleet
that's going to have a better cost structure,
than your launch configuration.
You can also use the T2 unlimited burst feature.
And as I said, Yes,
it is recommended by AWS going forward.
So anytime in the exam you see question,
you will probably be more lean
towards using a launch template than launch configuration.
I don't see any reason
why you would have to use a launch configuration,
now that is being legacy and completely replaced
and the launch configuration are so much better
and they're newer and more shiny, Okay.
So that's it.
Things you should know
about the launch template and Launch Configuration,
and that's it for this lecture.
I hope you liked it,
and I will see you in the next lecture.