
<v Narrator>So now we have set up AWS CLI</v>
on our local computer.
And as you've seen, we've been using our credentials.
Now very common in this case, is to also run the
AWS CLI on EC2.
Now there's a bad way of doing it and there's a right
way of doing it.
And I do not want you to even try the bad way.
The bad way is what?
You could just run the same command AWS configure EC2
just like we did and it will work.
And you'll boot your personal credentials.
But that is super insecure.
So here is me getting on my security hat again.
I just don't want to be your dad on this, but I kind of
have to say it.
Never, ever, ever, put your personal credentials
on an EC2 machine. It's really, really, bad.
Why? Because your personal credentials, as the name
indicates, are personal and only belong on your
personal computer.
So anything that's personal, you never put that on EC2.
You actually never own the EC2.
If your EC2 machine is somehow compromised,
so is your personal accounts.
If your EC2 is shared between many people, and other
people use your credentials, then they may perform
AWS actions in your stead and really impersonate you.
If they do something really bad, who's going to be pointed
the finger at, it will be you, okay?
For EC2, you never, ever put your credentials there.
Don't even think about it.
There is a better way and now it's time to
introduce is to you.
It's called AWS IAM Roles.
So we've seen IAM Roles before, right?
But now we are going to quickly play with it.
So there was IAM Users, IAM Groups, and IAM Roles.
IAM Roles are attached to applications or EC2 instances.
IAM Roles can come with a policy.
And that policy, basically, we can define exactly
what the EC2 instance should be able to do.
And by default it has no rights.
So now that the diagram is that.
On the AWS Network, we'll have EC2 instances
and it wants to communicate with the AWS Account using
the CLI, but now the AWS instance will have an IAM Role.
And that basically IAM Role, there's going to be some
magic happening, you don't even have to worry about it.
But then your AWS account will check your credentials
and the permission of that role.
That makes everything more secure.
You've never put your credentials on the EC2 Instance
because it has its own role. Okay?
So EC2 instances will use these profiles automatically
without any additional configurations.
This is the best practice on AWS and you should
100% do this all the time.
The exam is very clear about it.
Anytime there is an EC2 instance that
needs to perform something,
never, ever think about putting your credentials there.
Always use IAM Roles.
That should be automatic in your head.
Let's go ahead and practice this.
I am in my console.
And the one that I'm going to do is go to EC2.
I'll also open a new tab just so
we can keep things in sync and in this tab I will go
and open IAM.
Okay. So the first thing we want to do is go to our
running instances and as you can see, there's no
running instance.
It's because I'm in the wrong region.
Let's make sure and go back to EU Paris.
And here are my running instances.
Okay. One of them is running.
So what's I have to do is SSH into it.
So I'll go and find the public ID and I will SSH into it.
For this, I will run the SSH command and
specify the right ID.
Okay, I am in by AWS Instance.
Now, in fact I'm in my AWS, as you can see, because we have
used Amazon Linux 2, it's actually nice and we don't need to
install the AWS CLI on it.
It is actually already installed.
If we do AWS version, we should get information about
the version of CLI.
As you can see, it's a little bit older from what we've
installed on our computers, but it will still
work just fine.
So the command is working.
Now, as we can see before, we can do AWS configure.
As I said, it is really, really bad to put anything in
the AWS Access Key ID.
I click on enter because we don't want to put anything.
So we will not put our AWS Secret Access Key.
We'll press enter again.
Now, the default region name though, I can definitely
say EU West three, because that's where my instance is from.
And then default output format, I'll press on enter.
So as you notice, I have no put my access key ID
and my secret access key there.
Okay, this is for the security bit.
So now, what if we want to run AWS s3 ls, press enter.
Now we get unable to look at credentials and it sort of
misleads you into saying you can configure credentials
by running AWS configure.
Now, as we've said, if we're on AWS configure it prompts us
to put our own personal credentials, so that's bad.
There is actually a better way.
It's to use instance scrolls.
So if we look at this instance, basically it does not have
any IAM Role, you can see that this instance has no
IAM Role attached to it.
Now, we can attach an IAM Role and we will do so right now.
So in IAM, I will go to roles and it will create a role.
Now for this, I need to select the type of trust entity.
I want to attach this role to an AWS service.
As you can see, you can attach a role to a lot of
different AWS services.
Basically, roles in AWS are used so that you can have
any service have it's own set of permissions.
So for us, most of us are going to be using Lambda, but for
now we are dealing with EC2, so click on EC2.
We click on next and then we can look for policies.
These are managed policies we can attach.
And let's just filter for s3, we'll just search for s3
and there's an s3 read-only access.
So I'll go ahead and attach this s3 read-only access.
Then I will click on next, the blue button right here.
The role name, I'll call it "MyFirstEC2Role" and the
role description is whatever you want.
I'll say "Allows EC2 to make calls to Amazon S3" and these
are read-only calls because we have attached a
read-only access.
That sounds right, I click on next.
And now my first EC2 role has been created.
It is right here in the last line.
So let's go back to the EC2 management console.
Right click and you can do instance settings, attach
replace IAM Role.
So we'll attach the "MyFirstEC2Role" that is obviously
suggested right here.
Or we could have created an IAM Role straight from
this console.
I'll click on apply and it says
IAM Role operation succeeded.
Click on closed, and now if we scroll down again,
we can see that there is an IAM Role attached to our
instance, it is "MyFirstEC2Role".
Now let's go back to our console and type AWS s3 ls.
As you can see now, the command has succeeded.
We can see the bucket of Stephane and the other bucket
of Stephane.
We can also go down deeper and make sure that we can
list files within my bucket.
And it seems to work.
We can see my beach, my coffee, and my index.html file.
So all these seem to work.
But what if we try to do something a little bit tricky,
such as creating a bucket?
So AWS S3 make bucket s3, and then I'll just have
some random stuff, press enter.
And now we get a make bucket field.
It says, "An error has occurred. Access Denied when calling
the CreateBucket operation."
So that means our EC2 Role is not permissioned enough to
make bucket operation.
And that makes sense, right?
Because if you click on it, the only policy that I have
attached to it is the Amazon s3 read-only access.
So then it really becomes obvious that we can't obviously
attach to our EC2 instance the permissions it actually
needs to perform its job.
An EC2 instance does not need administrative rights.
It usually is an application and will interact with
a few AWS components and so we can tailor a policy just
for that instance.
So obviously, we have to see how we can edit these policies
and stuff, we'll have a lot of this in the next lecture.
But for now, I can just attach a new policy and if we look
at maybe the s3 full access, which is quite a
strong policy, I'll apply it.
Now, our EC2 instance has read-only access and full access.
So now if we run this make bucket command, as we can see,
it's still access denied.
This is another very interesting thing about IAM.
When you apply a policy, it can take a little bit of time
for it to be effective, so it's not immediate.
Things have to replicate in the global infrastructure of
AWS, so that's expected.
Just keep on trying to run the command and as you can see,
I just ran it and now the make bucket operation succeeded.
If I do AWS s3 remove bucket now, to just remove
that bucket, this should work as well, okay?
Everything worked.
This is it, just to get you started on how to create
IAM Roles.
This IAM Roles can be attached to as many EC2 instances
as you want, but an EC2 instance can only have one
IAM Role at a time.
And IAM Roles are used to permission EC2 instances so
they can perform API calls on your behalf.
So as you can see here, my EC2 instance was able to view
a lot of things, but never once have I put my credentials
on the EC2 instance, and that's much better.
So I hope that was helpful.
In the next lecture, we'll do a much deeper dive
into AWS policies.