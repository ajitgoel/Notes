
<v Narrator>All right, let's talk about the last pillar</v>
in the Well-Architecture framework.
That is cost optimization.
So, what it is, it's the ability to run systems
to deliver business value
but at the lowest price point possible
that makes a lot of sense.
Now, design principles we'll adopt a consumption mode.
So, pay for only what you use.
So, for example, AWS Lambda is one of these services,
if you don't use AWS Lambda you don't pay for it,
where as RDS, if you don't use your database
you still pay for it because
you've provisioned your database.
So it's a really interesting trade off here.
Measure overall efficiency, use CloudWatch,
are you using your resources effectively?
Then we have a small ad for AWS,
but the idea is that if you move to the cloud
then you stop spending money on data center operations
because AWS has the infrastructure for you,
and they just allow you to focus on
your applications, your systems,
and you need to analyze and attribute expenditure,
so that means if you don't use tags on your AWS resources,
you're going have a lot of trouble figuring out
which application is costing you a lot of money,
so using tags insures that you are able to track the cost
of each application and optimize them over time
and get a ROI
based on how much money you generate from your business.
Finally, use managed and application level services to
reduce the cost of ownership.
So that means that because managed services operate
a cloud scale, they can offer such a lower cost
per transaction or service
and that's really something you have to remember about
the cloud, they operate at cloud scale,
I've read news, about people, like three engineers,
only three of them, AWS engineers
and they manage an application
that serves five million people,
I mean imagine that,
three people manage a global application on AWS
for five million people,
just because they are able to leverage the cloud
and operate at cloud scale.
So in terms of cost optimization, what do we get?
Making sure we know what costs us something,
so Budgets, Cost and Usage Reports, Cost Explorer
and for example Reserved Instance Reporting,
making sure that if we do reserve and instance,
we're actually using them and not just paying for
unused reserved instances.
Cost-Effective Resources, are we using the right stuff,
for example can we use Spot Instances,
they are considerably cheaper,
yes they do have some trade offs
but can we use them?
Can we use cost-effective resources?
Or if we know we're using a EC2 instance for over a year,
maybe three years because we provisioned a database on it.
Can we use reserved instances?
That'll be a great way of saving money.
AWS Glacier, so are we basically putting our archives
in the lowest price point possible
and Glacier is the lowest price point possible.
Are we matching supply and demand?
So are we not over provisioning.
So again, auto scaling or maybe AWS Lambda
if you're using serverless infrastructure
and are we optimizing over time,
so getting information from trusted advisor,
or again looking at our cost and usage report,
or even reading the news blog.
So let me just share with you a small story.
There was this ELB feature
and it allowed to use HTTP and HTTPS traffic going in
but you couldn't do redirect of HTTP to HTTPS before
and so you have to spin up an application that was doing
the redirect behind the scenes
and that application was costing me a little bit of money,
but then reading the news blog
they said now you can straight from the ELB
configure redirect of HTTP to HTTPS
and that was great, it saved me a bit of money every month
just for that one feature,
so reading the news does allow you to optimize your costs
and make sure you have the right price point.
Last story is for example,
if you're running an application on DynamoDB,
but it's really inactive, it's really slow application
or you don't need to use a lot of operations.
Maybe you're way better of using
the on demand feature of DynamoDB
instead of using the reserved capacity that'll use you RCU
and so on, okay.
So that's it just for small anecdotes but I hope that helps,
we've seen all the pillars now
and I hope you understand better
the AWS Well-Architecture framework,
again the exam will not ask you deep questions on it,
but it's good as a solution architect
to understand it overall
and if you're really curious about it,
I encourage you to read the white paper.
Okay, that's it I will see you in the next lecture.