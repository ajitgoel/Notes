
<v Instructor>So, in this course,</v>
I really tried to make it a huge differentiator,
for you to actually see
very important architectural patterns.
To me, you can't do a solutions architect course
without seeing solution architecture.
So we've explored architectures around classic,
you know, for example, EC2, ELB, RDS, ElastiCache, etc.
And also we've explored, in depth, serverless,
more cloud-native serverless architectures
using S3, Lambda, DynamoDB,
CloudFront, API Gateway, etc., etc.
But, you may be hungry for more architectures,
and so if you want to see more architectures,
there's two links on the AWS websites,
which I think are really awesome,
and not many people know about it,
so, hopefully, I raise awareness on these links
through this course.
The first one is this link,
and the second one is this link.
So, you know what, we're going to visualize
these links together,
just to show you what they're about.
Okay, so we are on the AWS Architecture Center,
aws.com/architecture, basically.
And so, this page, you get access
to the Well-Architected framework,
but you get some really cool
reference architectures in here.
So let's open, for example, WordPress hosting.
We'll just open this in a new tab.
But you get, basically, a bunch of quick starts.
And if you scroll down,
you get AWS reference architectures,
for example, the web application hosting,
content and media serving, batch processing,
fault tolerance, etc., etc.
So, for example, you can look at file synchronization.
And, here we go, we have a PDF file
that shows us, let me just zoom out a little bit,
how to do file synchronizations on the AWS.
And this is really cool.
They tell you exactly what goes on at each number,
and what services are used,
S3, or the scaling,
DynamoDB, STS, so these are some great ideas
to, basically, do any kind of architecture.
So you don't need to really rethink all the architecture.
Someone probably did, before,
what you're trying to achieve,
so, maybe, looking through this,
if you're an online gaming company,
or you're a media sharing company,
or you do financial services, or time series processing,
there's a lot of content on this page.
So I do recommend you have a look at it.
And sometimes you even get, you know,
architecture documents, some images,
they show you some architectures, again,
and you may even get CloudFormation templates in there,
to, basically, launch these architectures,
as you can see right here.
We have a lot of CloudFormation Templates
that allow you to use them, and really visualize
how they work in real life.
The other link is this one,
aws.com/solutions.
And this link is really awesome.
Let me just close this.
This is really awesome,
'cause it does also show you
a bunch of AWS Solutions Portfolio.
It's also a bit of a overlap
with the previous link,
but there's some really cool ones.
So let's scroll down,
there's some ones I really like in here.
For example, Video on Demand on AWS,
Serverless Image Handler.
Okay, those are great,
so, Video on Demand, what does it do?
There's a deployment guide.
You can download the deployment guide,
you can launch the solution
through CloudFormation in the AWS console.
It takes about 20 minutes to deploy,
and they show you, exactly, the architecture,
and why, and there's a PDF,
so you can really understand
what's going on in there, and why this is a great solution.
If you go to Serverless Image Handler,
again, use the deployment guide.
You have a CloudFormation template.
And it shows you how it works.
So, what is the original image?
It's an S3 bucket.
We'll trigger a Lambda function.
Maybe you write back the image through S3 bucket.
Maybe it's exposed through API Gateway,
CloudFront, and then we have an optimized image
with the same height and width, but less spice.
So, it does give you so much information.
And I think these toolings, as a solution architect,
they're really awesome.
So if you have time, if you're curious,
if you wanna know how to do
a Data Lake, or Data Science, or so on.
Do look at these two links,
and hopefully they will help you prepare for the exam
a little bit.
But that's it, for me.
Hopefully, now you can be as thirsty as you want
for solution architecture.
And I will see you in the next lecture.