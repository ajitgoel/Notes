
<v ->Okay, yet another solution architecting</v>
we are going to see right here.
So, let's talk about software updates offloading.
So, we have an application is running on EC2
and it distributes software updates once in a while.
So, think about the computers
that need to download the patch
and then you download from us and this patch sits on EC2.
So, when a new software update is out,
we are going to get a lot of request
because a lot of people want to update.
And so the content is distributed
in mass over the networking.
It cost us so much money.
Additionally, we really don't want to change
or re-architect our application.
We just wanna optimize our cost and CPU.
Is there an easy way for us to do it?
Of course the answer is yes.
There is.
So, let's talk about the application current state.
So, we have a classic ELB plus ASG develop application
running in multi AZ and we'll assume that these M5 instances
are the instances distributing the software updates.
Now, for simplicity stake,
let's say that these software updates
they're put into the Amazon EFS,
so all of them are in the EFS.
So, how do we fix things?
How do we basically enable these applications
to scale more globally and to reduce CPU utilization
and to reduce cost.
Super easy.
We just put CloudFront on top of it.
So, CloudFront will be our savior, and why?
Well, there's no changes to architecture.
They will cache software update files at the edge
because the software update files they don't change,
they're not dynamic, there're static,
they're never changing.
And so our EC2 instances, even though they're not serverless
CloudFront is and it will scale for us.
So that means that our ASG will not scale as much
and we'll save tremendously in EC2 class, network class,
EFS class and so much.
And on top of it, we'll save on availability and so on.
So, remember.
CloudFront is such an easy way
to make an existing application more scalable and cheaper
if it's mostly static content just using some caching
at the edges all around the well.
So remember it.
I find it pretty cool.
And sometimes the best solution are the easiest one
and this is one example of them.
So, hope you like it and I will see you in the next lecture.