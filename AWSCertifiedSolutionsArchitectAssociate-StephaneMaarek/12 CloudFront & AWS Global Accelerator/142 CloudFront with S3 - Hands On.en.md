
<v ->Okay so we are going to create an S3 bucket</v>
and we'll create a CloudFront distribution as well
in front of that bucket to basically distribute
the content of that bucket anywhere on the globe
with low latency.
Then we're going to create what's called
an Origin Access Identity so this is a user of CloudFront
that will be accessing our S3 bucket
and we'll limit the S3 bucket to be only accessed
using this identity/user.
So effectively, we'll basically make sure
that no one can access our S3 bucket
except if they go through CloudFront.
And why would we do this?
Well we can do this for many reasons,
for monitoring because maybe you have cookies,
maybe because of some policies, or et cetera et cetera.
And that is a very popular exam question.
So let's go see how we do this right now.
So let's go ahead and create a bucket
and I'll call it My Content Through CloudFront.
That's a horrible name, but let's go ahead with it.
Click on next.
And then I will keep everything as is.
Click on next, on next, and create bucket.
Okay so I have my bucket being created
and I'm just going to upload a few files in it.
So I'm going to upload the coffee, the beach,
and the index html.
Click on upload and here we go, my files are uploaded.
So now we're going to go straight ahead into CloudFront
and get to see how CloudFront works.
So in CloudFront, what I have to do
is to create a distribution.
So let's go ahead and create a distribution.
And then we're going to get started
with a web type of distribution.
So alright the origin domain now is going to be
our basically our bucket name.
So here it's My Content Through CloudFront
dot S3 dot amazon aws dot com.
The origin path we're going to leave it empty.
And the ID we're just going to leave it as is.
So this is basically just going to give you
a description of the origin.
Alright, we're going to restrict the access bucket.
And this is what's very important here,
the restrict bucket access option.
So if I say no there's no option,
if I say yes you see there's a lot more option that happens.
And so here basically is if we want our users
to always have access to our S3 content
only using the CloudFront URLs, not the Amazon S3 URLs.
So that's super important, if we want that to happen
yes we need to restrict the bucket access.
And then I can select a origin access identity.
So here we could use an existing identity
but we don't have any identity,
or we could just go ahead and create a new one.
And you can just name it, we'll call it
Access Identity Demo for example.
And then finally, there's need to grant read permissions
for that identity onto our S3 bucket.
So either no you will update the permissions yourself,
or yes please update the bucket policy for me
and we'll just say yes please update
the bucket policy for me because we're a bit lazy.
Alright, so now we're good.
Now we just scroll down and say okay, we're okay
with HTTP and HTTPS but maybe you want to redirect
HTTP to HTTPS so that we
only force encryption connections to CloudFront,
so we'll select the second option.
Maybe we'll allow only GET and HEAD
but we could allow more methods.
I can scroll down and see there's tons of parameters
but for now I'll just leave it as is.
And at the very, very bottom,
we will scroll all the way down
and we will say create distribution.
Now this distribution can take a lot of time to be created
and this is the case usually with CloudFront.
So right now the state is enabled
but the status is in progress,
and it can take a few, maybe ten minutes to get created.
So I'm going to pause the video until then.
So while this is getting created,
what's really important to see
is that now we have an origin access identity
that has been created and so you can see
that there's our comments, there's an ID so E8YG et cetera,
and there's an Amazon S3 Canonical User ID for this.
So automatically we have created an origin access identity
while we were creating our distribution.
If we go back to our bucket, it now goes to permissions
and bucket policy where we can see that a policy was created
automatically for us saying okay, basically our user
the CloudFront Origin Access Identity E8Y6,
the one we have right here.
This one is allowed to talk and do a "get object"
on anything of my content within this bucket.
So it's really neat because now we basically
understand that this user that was created by CloudFront
has access to our bucket.
And we could even make a statement to deny anything
if it's not coming from this principle.
So we could edit that bucket privacy,
we won't do it here but we could update it to say
anything that doesn't come from this user will be denied.
And so effectively we would only restrict our bucket access
to this origin access identity.
So super important for you to understand this
because that could be an exam question.
So now we're going to wait for the distribution to be over.
Okay, so my CloudFront distribution is done
and now I should be able to access it,
for example, my beach.jpg file through my URL.
So I take the URL of CloudFront.
And as you can se we get an "access denied."
And this is due to the fact that we've been redirected
to the S3 bucket.
So this is due to a DNS issue and we'll have to wait
about three hours for it to be fixed.
But in the meantime what we'll do
is that we'll make the files public
in our S3 bucket to fix this temporarily.
And so the one thing we have to do to fix this
is go to our S3 Management Console
and make these files public.
But so if I wanted to make, for example my coffee.jpg public
so I right click and make public, click on make public
I get an error.
It says failed.
And I get "access denied."
So why is my access denied?
Well because there is a setting in Properties,
or sorry in Permissions you have an access setting.
In here you can change the public access settings
for this bucket.
And basically we're going to un-tick everything.
We're basically going to allow us
to set some objects to be public.
So I'll click on save and I'll click on confirm
and this will basically allow us
to make some objects public.
So let's go back to my coffee.jpg.
I right click, make public, and make public
so now it was a success.
And so now if I go back to my CloudFront URL.
And in there I'll do coffee.jpg.
I should be able to, here we go, to see my coffee.
So it's pretty cool, this worked
and similarly I can also look at beach.jpg
and I can try to make this public.
So I'll try to make public, make public.
Here we go.
And in there I'll go back to my CloudFront URL.
And I will do beach.jpg.
And here we go, the beach is appearing as well.
Finally, you may have seen that
when I access my distribution using a domain name
I was being redirected directly to a S3 URL
instead of getting served through the domain name.
So this has to do with a DNS propagation issue
and if you want to read more about it,
this question on Stack Overflow called
"AWS CloudFront Redirecting to S3 Buckets,"
this answer explains why.
And the idea is that you need to wait three, four hours
for basically the DNS to propagate properly
before you get the CloudFront access to your images
and your files directly using the CloudFront URL
instead of using the S3 URL.
So just something you should know.
It's not a bug, it's just something to be aware of.
It's a temporary redirect which will be fixed
when the DNS has propogated on AWS' side.
So I have waited about a day now
and if I click my domain name and go to beach.jpg.
Now as you can see, my CloudFront URL directly takes me
to beach.jpg and I'm not redirected to the S3 bucket.
And so it's a really cool thing now
because the DNS is propagated I am served properly
only through CloudFront.
And so for this now I can go back to my S3
and I can make that file beach.jpg not public again.
So I'll click on public access and change the ACL
of that object and remove "Read object."
So now this file is private and I can go back to coffee.jpg.
Do the same on the permissions, remove public access.
Excellent, so no files in my bucket now have public access.
They're all private.
And I can go back to my permissions,
in the public access settings I can now re-tick
all these things preventing me from making anything public.
So I'll confirm this, click confirm, yep I'll confirm.
And so the idea now is that all these files are private
and only the bucket policy will allow CloudFront
through the origin access identity to access my files.
So I can verify it, I can just refresh this page
and it's working.
I can go to coffee.jpg, it's working too.
And I can go to index.html and as you can see
I also see my coffee picture.
So now here it's really cool because we use CloudFront
and the idea is that we have all this content
being cached at the edges of the world
and my S3 bucket is only accessible through CloudFront
and that's a very, very popular exam question.
So remember the important things here
is the origin access identity,
this ID here that is put into a bucket policy
allowing only my CloudFront user to access my S3 bucket
and therefore I'm really protected
and I can access CloudFront all around the world
from anywhere and only using CloudFront
I can access my S3 bucket.
So that's it for this lecture.
I hope you enjoyed it,
and I will see you in the next lecture.