
<v ->Now let's talk about Cross-Zone Balancing.</v>
So, when cross-zone balancing is enabled,
that means that each load balancer instance
will evenly distribute the traffic
across all the instances in all AZ.
So, let's have a look to, diagram to
make this very clear.
We have three availability zone in this example,
and we have five EC2 instances.
Now, let's assume we have deployed a load balancer,
and that load balancer is deployed
in three availability zones.
So, cross-zone load balancing, if we have it,
that means our first instance, in our first
AZ for the load balancer, will be distributing traffic,
to all the EC2 instances. And that means,
the second one and the third one will do this as well.
So, this is all the possibility of combinations
for our load balancer. As we can see,
this is the best way to evenly spread the load
across all the instances.
Thanks to cross-zone load balancing.
But otherwise, if you don't have
cross-zone load balancing enabled, what does it look?
Well, it looks like we have the same set up,
but this time, without it,
the first load balancer instance
will be only redirecting to your EC2 instances
with your AZ, within your AZ1.
Same for AZ2 and same for AZ3.
Because we can see here, it's a different kind of
load balancing, one that would work as well,
but you don't have any cross-AZ,
cross-zone load balancing that happens.
So, the setting should be quite intuitive.
Now, the nitty-gritty.
So, for Classic Load Balancer, by default, is disabled,
and there is no charge if you enable,
enter cross-zone load balancing.
So, that means, usually in AWS,
when your data goes from one availability zone
to another AZ
then you will be charged for it.
But, if you enable it for the classical balancer,
then you will not be charged for it.
So, this is free.
For Application Load Balancer, this is always on,
it cannot be disabled, so you cannot change the setting
on the ALB. But, because it's always on
and you cannot disable it, then you don't have any charges,
again, for inter availability zone data.
But, for the Network Load Balancer,
it is disabled by default, again,
but, you will pay some amount of money
if you enable cross-zone load balancing,
because the data will be going across AZ.
So, try to remember this little rules,
and I will show you, right now, what this looks like
in the console.
So, just for the sake of this hands-on,
I've created a CLB and NLB where you don't have to do it,
I'm just going to show you the settings.
So, for the Classic Load Balancer right here,
if I scroll down, all the way down,
we have cross-zone load balancing,
that is disabled by default, but I can change that setting,
and click on, enable it, and this will evenly distribute
the traffic across all my EC2 instances that are registered
for this classic load balancer. So, here we go.
And I'm not going to pay for it.
For the ALB, it's always enabled by default,
so there's no setting to change
the cross-zone load balancing, because it's always
on by default for the Application Load Balancer.
And for the NLB, I scroll down, and I see that
cross-zone load balancing is disabled by default.
And I will say, okay, I want to enable it,
but here it says, by the way,
you will pay regional data transfer charges,
because cross-zone load balancing is enabled,
and for the NLB, this is something they will charge you for,
okay? You will click on save,
and cross-zone load balancing will be enabled,
but you will have to pay for it.
That's it, all I wanted to show you,
so, you can just, not have to do this hands-on,
and I will see you in the next lecture.