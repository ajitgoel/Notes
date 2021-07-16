
<v Instructor>So let's do a deep dive</v>
into IAM roles and policies.
This policy are attached my IAM role, MyFirstEC2Role
and so there are different components into policies.
As we can see, there is attached policy that can be managed.
Or you can create your own.
So if you go to the policy tab,
we can see that all these policies are AWS managed,
that means they will get updated over time,
but you can also create your own policy.
And when you create your own policy,
you can choose a service, actions,
resources and request conditions.
You can also import managed policies and so on.
So it is very much possible for your infrastructure
and your organization to create your own set of policies.
Now there is also another subtlety you can do,
is that when you go to your EC2 roll,
you can add an inline policy.
Inline policy are basically policies that are going
to be added inline, so that means on top of
whatever you've already chosen,
and it turns out that these policies
are not possible to be added to other rolls.
Okay, so this is like basically saying
this policy is just for that roll.
Overall, I don't really recommend using inline policies,
it's always better to manage policies globally,
just to get a better management view.
So now how do we create these policies
and how do we analyze them?
Well let's look at the AmazonS3ReadOnlyAccess.
It turns out, that it gives you a policy summary,
which is a nice little table,
or you can get a JSON document.
So if you look at the policy summary,
it says that on S3, you get full read and limited lists.
Okay, let's have a look at the JSON.
And it looks like, yes, we're allowed to perform actions,
which is Get something or List something on Resource star.
And basically that says that you are able,
for any Amazon S3 resource, to perform API calls,
that start with the name Get something or List something.
So how does that work?
Well let's type AWS S3 listbucket API
and now we get basically a listbucket API right here.
And so if we look at it,
the name of the API is called ListBucket.
And so this is why we have list star.
But there's a bunch of list operations you can do
on AWS, obviously.
Same for Get, we can do Get object or Get bucket and so on.
Now if we look at the AmazonS3FullAccess instead,
well the JSON document this time,
allows s3 star, so that means any API column s3 is allowed
and resource star means anything you want.
So the idea is that you are able,
through this JSON document, so specify what you want.
But how do we know exactly how to make this JSON document?
Well let's give it a go and create our own policy.
So policy I'll create and I'll say this is a policy
that we'll all just practice on.
So, we need to choose a service, and we can get
a visual editor or a JSON editor.
This is basically when you want to type it all out
or copy and paste something from the web
and this is where you want to just click
and choose whatever happens.
So let's choose a service.
For example, we'll choose AmazonS3,
because we've been working with it.
And then here it gives me all the actions
that are allowed in S3.
So I can say all S3 actions,
which is S3 star, we've seen this.
Or we can say list, read, write, or permissions management.
And if we draw down in something,
we can see that within each read,
we for example get all the different
operations one can be allowed.
So maybe we only allow, want to allow, GetObject
and that's it, so I just knocked out this one.
But if I wanted to click on Read,
then you will select all 31 possible API calls from it.
Same for List, et cetera, et cetera.
So for this, let's just allow GetObject, that sounds right.
Okay, now we can choose resources.
And so, when we scroll down, we click on resources,
and it says, okay, what are you allowed to read.
You're allowed to read either
a specific bucket or all resources.
All resources is the star we've seen from before.
But we can also be specific and add ARN.
So to add an ARN, we can look at the ARN we have
for our buckets and we can basically say,
okay the bucket name is thebucketofstephane
and we can take the any here
that would basically change the bucket name to star.
So we'll just leave it to thebucketofstephane
and the object name we can also click on here
saying any star and we just added a slash star right here.
We'll click on add and here basically I've created
a policy just for this.
Then you can specify conditions, they're optional
and they basically allow you
to drill down into the policies.
For now we won't need them.
Let's add additional permissions, if you wanted to.
But we actually don't need it, so we'll remove it.
And we'll review the policy.
Now it turns out I give read access on this resource
for these conditions so I'll just call this,
MyTestS3Manage, no CustomPolicy
and we'll click on create policy.
And now we can click on this policy itself
and we can even look at the JSON.
And so the JSON was generated using the visual editor.
And we can see that we allow S3 get object on this resource.
So this visual editor is actually quite nice.
There's another one you may need to be aware of.
It's called AWS policy generator and just Google it.
And you get the first link and this is basically something
just like that, you can create a policy type.
So for us it was IAM policy and we can say
okay we want to allow on the service S3 the action
and here we get all the actions we want.
So, get object is what we had.
On the ARN I'll just leave star for now to make it simple.
We click on add statements and then generate policy
and this gives us a JSON of what we need.
So these two tools are very similar,
they are both created by AWS, so now I think Amazon
wants you to most likely use the visual editor
we've had in the IAM console.
But just so you know, there is also
this policy generator tool right here.
So from this, you're able to create your policies.
The advantage of creating policies here
is that you can see who is using it
and the version, so you can basically add versions
of that policy to make sure that you can always roll back
to a previous version if it was too permissions
or you get to track as well
all the versions you've ever created.
Coming back to our roles, we can go
and look at our first role, and I'll just close this,
click on our first role, and we can attach our policy
and the one we just created I think was called
test something, my test custom S3 policy
and this type is customer managed and we can attach it.
So here we go, now our S3 EC2 role
only has these three things.
And so because I managed this one,
I'm actually able to probably make it more specific
to my EC2 instance and it's probably
going to be better security.
So that's it to basically create policies.
In the next lecture, I'll just show you how to test them.