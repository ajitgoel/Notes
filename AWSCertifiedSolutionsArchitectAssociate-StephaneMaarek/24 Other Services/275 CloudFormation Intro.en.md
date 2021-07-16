
<v Instructor>Okay, let's introduce CloudFormation.</v>
Now CloudFormation, again, it's a very important topic
if you go into the Certified Developer exam,
or if you go into the Certified SysOps exam.
But for the Solutions Architect exam you just need
to understand the principles behind CloudFormation.
Maybe read a little bit of CloudFormation
but not too much, so overall it's pretty light
and this is why I'm giving you just a short introduction.
So currently we've been doing a lot of manual work,
where we create everything and it's very tough to reproduce.
So if we wanted to do this in another region,
in another AWS account,
or within the same region but everything was deleted
it'd be really hard.
If we create too many EC2 instances, security groups,
row 53 routes, I mean so many things.
And the idea is what if we had our
infrastructure be in code?
What if you could just have code
and that code will be deployed
and created, updated, deleted all the time
to make our infrastructure evolve.
And that is the concept behind infrastructure as code.
So CloudFormation is doing exactly that.
It's a declarative way of outlining
your AWS infrastructure for any resource
and most of them are supported.
So that means that within a CloudFormation template,
and we'll see one in the hands-on.
You'll say, I want a security group,
I want two EC2 machines using this security group,
and I want two Elastic IPs for these machines,
and I want an S3 bucket,
and I want a load balancer in front of these machines,
and when you specify all of these things
in a CloudFormation template and run it on CloudFormation,
your CloudFormation service automatically creates
all of these things for us, in the right order,
with the exact configuration that we specify.
So it's a declarative way into doing AWS infrastructure.
Now the benefits you get is number one,
Infrastructure as code
so no resources will be manually created
which is excellent for control.
The code can be version controlled using git for example.
And changes to the infrastructure are reviewed through code.
So in terms of cost benefits,
well each resource within the stack will be tagged
with a CloudFormation identifier
so we can easily see how much a whole
CloudFormation stack will cost us, which is really nice.
And on top of it there's a small feature
to estimate the cost of your resources
using the CloudFormation templates.
So a saving strategy for example for be, in Dev
you automate the deletion of all the templates at 5 p.m.
and you recreate them all at 8 a.m. safely
and that could be a way to save cost
because you're not working at night.
Another benefit is productivity
so you have the ability to destroy and recreate
an infrastructure on the cloud, on the fly.
And you get automated generation of Diagram
for your templates, which is really cool
if you wanted to just create some PowerPoint slides.
And you get declarative programming,
so you don't need to figure out which is the ordering,
or the orchestration, or what goes before what.
CloudFormation does that for us
which I think is really cool.
There's also a separation of concern,
so you can create as many stacks as you want.
So usually one stack per app, and many layers.
For example you get VPC stacks,
Network stacks, and App stacks.
And you don't need to reinvent the wheel,
you can leverage existing templates on the web
and you can just leverage the documentation.
So CloudFormation is a no-brainer
if you go into AWS in production,
and I would strongly recommend you learn it in depth,
just not in this one course.
So how does it work?
Well, templates have to be uploaded in S3
and then you reference them in CloudFormation.
And to update a template,
you cannot really edit the previous one
you have to re-upload a new version of the template to AWS
and these CloudFormation stacks will be identified by name.
So when you delete a stack in CloudFormation
it deletes every single thing
that was created by the CloudFormation stack.
So it's a very clean way of deleting resources.
To deploy CloudFormation templates
the manual way is to edit the template
in the CloudFormation Designer,
and then using the console to input parameters etc.
And an automated way, would be to edit the template
in a YAML file, that's what we'll see.
And then using the CLI to deploy the templates
if you wanted to go full automation.
If you wanted to fully automate your flow,
yes I would definitely recommend that.
So a little bit more theory before we get to the practice.
So there are building blocks in CloudFormation
now we won't go in-depth into it,
but basically there's a few components.
The first one is resources and it's a mandatory one
and this declare the AWS resources
that will be used in a template.
Then there's parameters if you want to have
dynamic inputs for our template.
Mappings, which is static variables for our template.
Outputs, which is references to what has been created.
Conditionals, list of conditions
to perform resource creation.
And Metadata.
And on top of it we get helpers
such as references and functions.
Now even if you remember all these things
just remember that your CloudFormation templates
most importantly has resources, parameters, and outputs.
Okay, and we'll see this in the hands on
just at a higher level of how they work.
So again, last time,
this is an introduction to CloudFormation.
It can take over three hours to properly learn
and master CloudFormation.
This lecture is just meant to give you
a good idea of how it works
so you can answer high level questions
on the exam about CloudFormation.
And the exam really expect you to understand
how CloudFormation works as a whole.
So, it's a great way to have infrastructure as code,
or to reproduce a stack into another environment.
And also sometimes it'll show you
a small snippet of code in CloudFormation,
and it's really very easy to read.
You just read what it does and you really understand it,
and I'll show you how to read it in the next lecture.
So that's it for CloudFormation,
just a high level theory introduction,
but let's go om the hands-on,
and get some practie with it.