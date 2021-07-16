
<v Narrator>So lets talk about Load Balancer Stickiness,</v>
so it is possible to implement stickiness and what
stickiness is, is that the same client will always
be directed, to the same underlying instance that is
behind the load balancer.
So this stickiness option works for the classic load
balancers and the application load balancer.
So how does that work?
Well there's a cookie that is being used for the
stickiness and the cookie has an expiration date and
as long as the cookie remains the same, then the load
balancer will redirect to the right instance.
So the use case for this is that maybe we want to make
sure that user doesn't loose his session data, so keep on
on talking to the same issue instance.
That is a very fine use case for that.
And then finally, if you enable stickiness then may
bring some level of imbalance to the load over the backend
Ec2 instances because now the load is not evenly distributed
it's sticky, so if you have many stickiness on the same
Ec2 backend then that one instance may be overloaded.
So here is and example, you have your load balancer
and your Ec2 instances are in the backend, and we have our
first client, and it wants to talk to the load balancer,
which will redirect to the Ec2 instance on the left side,
and if the same client talks again to the load balancer
with stickiness enabled then the same Ec2 instance
will receive the same results.
For client B another one then it will talk to the second
Ec2 instance maybe and if it does then it will always go to
the second Ec2 instance and for client C maybe will be
redirected to the second Ec2 instance as well on the
right hand side.
So stickiness is very helpful if you want the same request
originating from the same client, to go to the same target
Ec2 instance, okay?
Lets in the hands on to see how that works in practice,
so we have our applicational bands right here,
and stickiness is not a load balancer specific configuration
only if you use a classic load balance, then you
can configure it here, but because we have an applicational
balancer, the stickiness setting is going to be at the
target group level, so if I scroll down, I can find
stickiness here, which is currently disabled, so lets
look at what, how the load balancer works without
stickiness, so if I open my load balancer and refresh
I can see different ip's all the time, okay so this
works great!
But as soon as I go to my target group and I edit the
attributes and I set the stickiness to be enabled, and
well say okay the stickiness is going to last 120 seconds,
so two minutes, then I click on save, then as soon as I
refresh this page, so we can 196 here as the value,
and if I refresh again, very, very soon when the
stickiness actually kicks in, so this setting can take a
little bit of time to kick in, so lets try again,
I'm going to refresh this page so 64 and If I refresh
again, now 64 is indeed just the only answer ill have,
and I will keep that 64 answer for two minutes until my
cookie expires and when it does expire then it will be
redirected to another underlying target of my target
group, okay?
So it took a little bit of time for this setting to
kick in but you get the idea, and then let you wait
two minutes for my cookie to expire and then it will
be redirected to another instance in my target group, okay?
Well that's it for this setting and if you want to disable
the configuration you go to edit attributes and you
disable it, and that will be done.
All right, that's it, I will see you in the next lecture!