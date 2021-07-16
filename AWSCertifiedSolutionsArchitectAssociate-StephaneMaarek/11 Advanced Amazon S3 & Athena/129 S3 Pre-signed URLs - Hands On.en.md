
<v Instructor>Okay, so let's demonstrate presigned URLs.</v>
And to do so, let's take a look at,
for example this one, demo-stephane-origin,
that is not public.
So this bucket is not public.
And we'll take the beach.
And we remember that if we do Object Actions,
Open,
this generates a presigned URL for us
and we can see the beach, as we can see in this bucket
even though it's not a public bucket.
But if we use the public objects URL,
then we obviously get an access denied.
Now, the question is, how do we generate this URL?
Because right now it's done through the console
and works really great,
but let's have a play with it with the CLA.
So first that's pretty easy,
we have the pre-signed-url.sh command
right here that we can look at,
and the command is, AWS S3 presign,
then you specify the bucket and object URI,
and then the region you're in.
Obviously, for the command to work.
So do not forget this.
So let's have a play.
So here it is.
Presign, we need to give the object S3 URI,
so I will copy this URI right here.
I will set the region.
So it's eu-west-1 for that bucket, I believe.
And then finally, I will specify,
expires-in 300,
to say that in 300 seconds, this URL will be gone.
So this has generated for me a presigned URL
and I can use it this presigned URL
to have a look at my objects.
So let's copy this entirely.
So I'll copy it.
Here we go, copy.
And then open a new tab,
paste it,
and yes, I do have access to the beach.
Pretty simple.
And something I've found is that
if you do get some issues with some errors,
then try to run this command,
AWS Configure Set default.s3.signature_version
to s3v4.
But only if you get issues,
if you don't just using this command, you're good to go.
And that's it, fairly simple,
but we've seen how to generate a presigned URL
that allows us to view an object
from a bucket that is not public.
So that's it.
I hope you liked it and I will see you in the next lecture.