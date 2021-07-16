
<v ->So let's see how WAF &amp; Shield works.</v>
And, by the way, this hands-on is not going to be free,
so if you don't want to pay any money within AWS,
please do not do this hands-on;
just watch the video.
So, we are in WAF
and we have the option to create a new web ACL.
And these cost about, I think, five dollars per month.
Okay, so I'll just call it MyFirstWebACL
and automatically there's gonna be
a CloudWatch metric added here, perfect.
And we need to choose a resource type
that this is associated with.
So, do I want to protect my regional resources,
which is Application Load Balancer and API Gateway,
or do I want to protect my CloudFront distributions?
So, three options and we have to remember them:
CloudFront, ALB, and API Gateway.
I'm going to choose CloudFront distributions.
So I have to rename everything again.
So, MyFirstWebACL.
Okay.
And this looks fine.
Next, we can add associated AWS resources to protect.
So I'm going to protect my CloudFront distribution.
And I click on Add.
Okay.
Next.
We need to add rules.
So, the rules is what are we going to be protected against?
So, we can use a managed rule group
or we can add our own rules and rule group.
I'm going to use the managed rule groups
and to see what is available.
So, for example, admin protection,
amazon IP reputation list, core rule set, and so on.
And each of them have a description.
So, I'm just going to add this one and this one, perfect.
I'll go to the bottom and click on Add rules,
but you can see you have lots of options.
Okay.
Do we want to allow actions that don't match any rules?
We'll just say Allow.
Okay, make sense?
Then we can set rule priority.
This is fine; I won't set it.
Click on Next and then we also get CloudWatch metrics
associated with these rules.
Okay, everything looks good and, remember,
this is going to be paid if you click Create web ACL,
so if you don't want to pay anything, don't do it.
But it's just to show you the options
that I'm going through in this hands-on.
So, my web ACL is being created
and it has full accessibility when created.
And it is associated now with my CloudFront distribution.
Just as easy as that and we have our first web ACL
on CloudFront.
We can also have IP sets to protect ourselves against IP,
regex pattern sets, and rule groups.
And there's a marketplace as well
so it's very complete.
But at a high level, again, going into the exam,
you need to remember that you can protect CloudFronts
and you can protect your regional resources,
such as ALB and API Gateway.
Okay, and next we go to Shield.
And Shield is going to be to protect ourselves from DDoS.
And so we have Shield Standard and Shield Advanced.
So, Shield Standard does give us DDoS mitigation,
the common ones,
such as SYN floods and UDP reflection attacks,
but Shield Advanced is going to be,
obviously, a little bit more advanced.
And if you scroll down, you can see that
you are protected with Shield Advanced against the cost--
it will be reimbursed--
that you incur on Route 53, CloudFront, and ELB,
in case you have updated for Shield Advanced.
Now, if you do click on Activate Shield Advanced,
you're going to pay $3,000 per month,
so I do not recommend you click that button,
but at least you know it's there.
And then finally, you cannot get out of this UI
without going back to Services, so here we go.
Firewall Manager is to manage your firewall rules
within your organization
and so you need to get started with it,
but the idea is that I won't do it in front of you.
But you manage everything within all your accounts
directly from Firewall Manager, which is very handy.
Well, that's it for this lecture
on how to protect your infrastructure against DDoS attacks
and other type of sequel injection and so on.
And I will see you in the next lecture.