
<v Instructor>So one very popular exam question</v>
is to make the distinction
between CloudWatch, CloudTrail, and Config.
Now thankfully, thanks to the hands-on,
hopefully you know exactly what are the differences are.
It's pretty obvious in my opinion,
but it's never too bad
to go through an example and see them.
So CloudWatch is for performance metrics,
metrics, CPU, network, and to create dashboards.
You can also get events and alerts,
and finally, we have a log aggregation and analysis tool
if we wanted to.
So CloudWatch, I think we're all pretty familiar with it,
this already.
Now, CloudTrail could be new to you,
but basically it's to record API calls
made within your account by everyone and everything,
and you can define some trails for specific resources,
so you can get more information on EC2 only,
and it's a global service.
Now finally, Config is to record configuration changes
and to evaluate resources configuration
against compliance rules.
Finally, you're going to get a timeline
of changes and compliance with its nice UI.
So, I think they're a very distinctive service
I don't think there's any confusion,
but let's go through an Elastic Load Balancer
to see how each of these service
can help you understand what is happening to your ELB.
So CloudWatch can monitor
the number of incoming connections,
can visualize number of error codes
as a percentage over time,
and maybe we can have a dashboard
to get an idea of the load balancer performance,
maybe we can have a,
even make it a global dashboard
if you have multiple load balancers
for a global application.
Now, Config, why would we use Config on the ELB?
Well, maybe you wanna track
the security group rules for the load balancer,
making sure no-one does anything fishy or changes anything,
maybe you want to change also a track
that configuration changes for the load balancer itself,
to see if anyone modifies the SSL certificate,
or et cetera, et cetera.
We also maybe have a rule to say,
oh there's always should be an SSL certificate
assigned to the load balancer,
and maybe we should never allow
non-encrypted traffic into the load balancer,
that could be two different compliance rules
that you put into Config.
Finally, CloudTrail will be to track who made any changes
to the load balancer with API calls.
So, in case someone changes the security group rules
or someone changes the SSL certificate,
or removes it, or whatever,
then CloudTrail will be how we know who made these changes.
So all these tools are complementary when you think about it
and when you understand that,
how they're used for a load balancer,
which I think is a great example,
then you are going to rock any questions
asked for you at the exam.
So I hope that makes sense,
and I will see you in the next lecture.