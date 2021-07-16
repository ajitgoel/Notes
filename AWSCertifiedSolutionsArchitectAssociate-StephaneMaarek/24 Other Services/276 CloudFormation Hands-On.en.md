
<v Narrator>Okay, so I'm going to</v>
type in "CloudFormation," and we're
just going to get started with CloudFormation.
Again, just a high level approach,
we don't need to be experts at it,
but for now we'll just get a small taste of it,
and if you wanted to go deeper into CloudFormation
I do recommend looking at the
developer certification or the sub-certification.
So on the right-hand side, first of all
I want you all to select the US East,
North Virginia region and the reason is
I made these templates work only in
this region for simplicity's sake, okay?
So please follow along with me, go into
US East, North Virginia region.
Okay, so we are in CloudFormation
and so we are going to create our first stack.
I'm going to create a stack, and we have
three options: either a template is ready,
or we can use a sample template provided by AWS,
but we won't, or we can create
a template in designer, and designer is a way
for us to graphically create templates,
which is actually really cool.
For us, the template is ready,
and I can even say it is already uploaded
to Amazon S3, or I can upload a template file.
By doing this upload, it will basically
be uploaded in Amazon S3 behind-the-scenes.
Let's select our own file.
Now in my code, I'm going to select CloudFormation,
and we'll just work with the just-EC2 file.
So this file, I can view it in designer
and have a quick look at what it does
and what it is, this is a graphical
way of looking at stuff.
It just creates an EC2 instance, and that's it.
This is just one EC2 instance,
but we can see that, with the cloud designer,
we can get some pretty cool visuals
out of our CloudFormation templates.
Now, the template content is actually right here.
We see that there are different resources.
Then I find MyInstance, and the type of it
is an EC2 instance, and the properties to
configure that EC2 instance is that it's in
the AZ US East 1A, so that's why
we need to be in North Virginia for this hands-on.
The image ID is AMI, and this AMI right here.
Again, the reason why you are in US East 1A
is that this AMI is locked to the region US East 1,
and then finally the instance type we choose
is t2.micro so we are in the free tier.
As you can see, CloudFormation templates
are quite easy to read, I think
they read naturally, so we have the resources,
the types of the resources,
and the properties on the resources.
Obviously they can get more complicated,
but at a high level, a CloudFormation template
is, I think, something that you and I can read very easily.
I'm going to close this designer right now,
and I'm going to leave this site.
So I go back to creating my stack,
and I'm going to re-upload my file very quickly.
As we can expect, these CloudFormation templates
will basically create an EC2 instance.
So I'll call it MyDemoTemplate
and there's no parameters, we click on Next,
and I will go fast, click on Next,
and then at the very bottom click on Create.
What this will do here, is that it will
execute my CloudFormation template.
Now we can see the status is in "create in progress."
As things go along, my resources
are going to get created, and I'm going to
get updates in this event window.
If I refresh this, now we can see that
MyInstance is in create in progress,
the resource creation has been initiated.
If you wanted to verify this, you can definitely
open the EC2 console, go to your instances,
and here we can see that this t2.micro
is actually being created right now, is being initiated.
If we look at the AMI ID, right here we can see
that this AMI ID is the AMI ID I have specified in
my CloudFormation templates,
so it was being configured properly.
Also, we said it was going to be a t2.micro,
and it is a t2.micro, and then finally, we said
we wanted the AZ to be US East 1A, and it is US East 1A.
So here, this is our first taste of infrastructure as code.
Here, when the Create is complete
I get a green tick, and then because every resource
in my template has been created,
the whole thing goes to "Create Complete."
If I go back to my CloudFormation stacks now,
I have the stack name being created,
create time and everything is perfect.
This is really cool.
This instance got created thanks to CloudFormation,
and all my infrastructure is S-code.
Now I can go to Tags, and Tags on this EC2 instance,
a really cool thing is that the CloudFormation
has added a few keys and values to track
basically MyInstance based on
the CloudFormation template it is in.
So right now, we can see the stack ID,
the stack name, the logical ID of this resource,
and that's really cool.
Okay, next, what can we do in CloudFormation?
Well, we can update these templates.
So I click on Action and Update Stack,
and here we can replace the current template
within a file, once we upload.
I'm going to upload the file called 1 EC2 with SG EIP.
This is a way more complicated CloudFormation template.
Let's open this in a new tab,
so we don't lose our progress.
Visually, now, if the UI works fine,
and I have to make the UI work for me, here we go.
Visually, here, what we have, is more stuff.
We have an EC2 instance, and it has an EIP,
so an elastic IP attached to it,
and it has two security groups being created.
Now we can see the visually, the relations
between all these resources we're creating,
so we can see that the elastic IP
gets attached onto the MyInstance EC2 instance,
and the instance references two security groups,
so we can see the relations as well within this thing.
We don't need to specify the relations,
though, in our template.
In AWS we'll figure out in which order
to create all these things, so that they
can be looking like this in the end.
If we look at our template again,
now we have a parameter, security group description,
and a type of string so we can
actually enter some information dynamically
for our CloudFormation templates.
And for resources, I still have my
EC2 instance, but now it has a
security group property, and it's
referencing two other security groups.
We also have an elastic IP here,
and it's referencing MyInstance
as being created before, and then we have
a security group here, it's a type EC2 security group
and the properties is the group description.
This one enables SSH access via port 22.
And the security group ingress rules,
so it was saying from any IP on port 22
authorized tcp to port 22.
So 22 port is going to be open to everyone.
The second EC2 security group in here,
same thing, we're going to reference our
security group description, so parameter
right here is actually going to
modify the security group description.
And here, if we look at the ingress rules,
we have two of them, and the first one is saying
port 80 can go from anywhere and the second one
is saying port 22 just from this IP right here.
And finally, the output is saying
okay, the value of the elastic IP,
I would like to see it as an output of my templates.
Again, we don't need to know how to write
these things, but we can read them very easily,
and this is what I want you to
take away out of this lecture,
we can read these templates very easily
and that's all the exam will ask you to do,
just to read the templates maybe once.
Here, we upload this template file,
click on Next, and now we have the
security group description parameter.
So it's saying I can control the description,
description of the security group, which is cool.
Click on Next
and then we scroll down,
click on Next, and as we can see in
the very bottom, we can preview the changes.
Here, the EC2 instance will get modified,
and actually will get replaced.
Here, on top of it, it will be added an
elastic IP, it will be added an SSHSecurityGroup
and added a ServerSecurityGroup.
So all these things are going to change
and CloudFormation automatically knows
how to figure out to do these changes properly.
We're happy, and we'll say okay, update your stack.
And here we go. Now my stack is an update in progress.
My CloudFormation automatically will figure out
what to create, when to create it,
how fast, in which order, and all this kind of stuff.
That's really the power of infrastructure as code.
What I'm going to do is just pause
it a little bit until this is done.
Okay, so, we have new events available,
so something happened, and so
I'm going to refresh this page.
As we can see, a lot of things happened.
Let me scroll down, here we go.
The update in progress was here,
then two security groups were
in Create in Progress mode, so two
security groups got created and their update
to the create was completed, for my two security groups.
Then MyInstance is going to go and get terminated,
because we need to create a new one.
It creates a new instance, updates it,
creates an elastic IP, attaches it to MyInstance,
and now terminates my old EC2 instance.
So let's have a look in my EC2 management console,
I'm going to refresh this page,
and now I can see that one instance
got terminated by CloudFormation,
that was the old one, and a new instance
got created, and it's now running.
If we look at the description now
it has an elastic IP value right here.
It's a t2.micro, US East 1A, and for
security groups there are two
security groups attached to it.
If we go to security groups on the left-hand side,
a few are created beforehand.
But these two security groups,
for example, they were created
by the CloudFormation templates,
and if we look at the description of this
security group right here, the description
is "I can control the description of the security group"
meaning it was the parameter value
that I entered just a second ago.
If we look at the inbound rules
they represent exactly what we have
in our CloudFormation templates,
and if we look at tags again,
they're tagged properly from the CloudFormation service.
So this is really, really awesome,
because CloudFormation basically
manages all these things for me.
Now, at the end, the update is completed.
So if I go to Resources, now,
I can see that I have four resources.
An elastic IP, an EC2 instance,
and two security groups.
And I can click here to just have links to them.
And in the output section, I also
wanted to get my elastic IP value so here we go.
It is 3.208.35.201, and so I can work maybe
with that value in the future.
Really cool.
So finally, in CloudFormation,
what if you want to clean up everything?
What if you want to delete stuff on the fly?
Well, you click on your stack and you do Action,
delete, delete, and here we go,
the delete has been initiated for MyDemoTemplate.
The cool thing about CloudFormation is that
everything that CloudFormation creates
will be deleted by CloudFormation
when I select Deletion right here.
That means you can have really clean
creating infrastructure, and then deleting it,
cleaning everything, and having
no leftovers on your cloud.
That's why CloudFormation is really recommended
when you need to fast log,
when you need to quickly
create a whole infrastructure into a new region,
or into a new account, or whatever you want, really.
That's it, that's just a quick
demo of CloudFormation, but I hope
it gave you a good idea of all
the possibilities for it.
Obviously there's so much more,
but for the Solutions Architect exam this should be enough.
All right, I will see you in the next lecture.