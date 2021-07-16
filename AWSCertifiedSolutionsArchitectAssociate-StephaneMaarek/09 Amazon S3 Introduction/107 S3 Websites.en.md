
<v Instructor>Okay, so now let's talk about S3 websites.</v>
S3 can host static websites,
and have them accessible on the World Wide Web,
and the website URLs will be very simple.
It will be an HTTP endpoint,
and it can look like this
or like this depends on the region you're in.
The idea is that it starts with the bucket name,
dot s3-website and then the AWS-region,
dot amazonaws dot com.
And if you enable it for a website,
but you don't set a bucket policy
that allows public access to your buckets,
you will get a 403 forbidden error,
and we'll see how to fix this in this hands-on.
So let's go ahead and enable our S3 bucket as a websites.
Okay, so let's go ahead,
and make this bucket a static websites.
So first to do so let's just make sure to remove
the bucket policy we had from before.
I'm just going to delete it
so we can upload objects without any problems.
Okay, great. So now let's go back into our objects.
We want to upload an index dot HTML file
and to find it you going to the course downloads code,
and you will find an index dot html.
Which is a very simple html document,
which is called my first webpage
says I love coffee, hello world,
and this will load the coffee dot JPEG file.
The rest right here is for now commented code.
This will be used when I demonstrate course.
Okay, so pretty easy and pretty good so far.
Next we'll also have error dot html file
which just says, uh oh, there was an error,
and I'm going to remove this by the way.
Okay, great.
So let's go ahead
and upload these two files.
So I'm going to add files,
and I'm going to upload both the index html,
and errors dot html.
Here we go so both of these files have been uploaded,
and next I want to scroll down
and click on upload. Here we go.
So now our buckets contains these four files,
and we want to able to have a look at them.
So to do so we're going to go into properties,
and make our buckets a website.
So if I scroll down and I go to static website hosting.
I can see is disabled right now
but let's go ahead and edit it.
We want to enable it, we will host a static websites.
And then the index document is called index dot html,
and the air document error dot HTML.
Which correspond to the two files we have just uploaded.
We will save the changes,
and now our buckets is ready to be a static website host.
So if I scroll down all the way down,
we can find the buckets website end points.
So let's try it out I'm going to copy this.
Open a new tab and paste it.
And what do we find? Well, we see 403 forbidden.
So we are not allowed to access our buckets.
And this makes sense, right?
Because if we go back all the way up,
currently the buckets and the objects are not public.
And it turns out that we're trying to access them publicly.
So how do we do so?
Well, two steps, we go to permissions.
First we want to disable the Block public access setting.
Otherwise we'll never be able to be,
to make our bucket public.
So let's edit this and untick block all public access.
And this is going to allow us to make some objects public.
And to set a public buckets policy.
So I'd confirm it. That's the first step.
And second step is we're going to bucket policy,
and we're going to write a bucket policy
which allows public access.
So let's go into policy generator one more time,
is going to be an S3 buckets type of policy.
We're going to allow anyone, so principals star.
To do this time not to put objects,
but to get objects so let's do a get objects,
and VRN is going to be again the buckets ARN slash star.
Saying anyone can do a get object
on any object of these buckets.
This makes sense.
I click on add statements, generate policy, copy this,
and paste it here and here we go.
Now this buckets policy has made my S3 bucket public.
How do I know? Well now under access, it says public.
And there's a little warning sign
because AWS doesn't really want you to have public buckets,
and they want to be you to be very careful
anytime you make anything public on Amazon S3.
Okay, so now if we go back to this URL,
and refresh it.
We can see there is I love coffee, hello world,
and the coffee dot JPEG file.
So this works great.
If I go to slash coffee dot JPEG.
I should only be able to see at coffee dot JPEG files.
And if I tap a random URL for example,
does not exist dot JPEG,
I'm going to get to there was an error,
which corresponds to the error that html file
we have defined from before.
So all good.
We have made our extra bucket now
a static website hosts, which is great.
And I will see you in the next lecture.