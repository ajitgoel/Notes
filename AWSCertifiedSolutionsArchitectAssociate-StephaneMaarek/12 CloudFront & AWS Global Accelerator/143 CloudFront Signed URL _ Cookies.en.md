
<v Narrator>To say you have a CloudFront distribution</v>
and you want to make it private
and you want to give access to people
to premium paid shared content all over the world,
but you want to be able to see and know who has access
to what on your CloudFront distribution.
For this you can use a CloudFront signed URL
or signed cookie (mumbles) difference of signed URL
and signed cookie are at the very end of this slide.
So first when we create a URL and a cookie,
you need to attach a policy and you need to tell
when does the URL or the cookie expire,
what IP ranges can access this data from,
so if you know the target IP of your client's,
then you should definitely use that and the trusted signers.
Which AWS account can create signed URLs for your users.
Then you can ask me, how long should this URL be valid for?
Well, if you're sharing a content (mumbles) movie or music
you can make it very short a few minutes,
but if it's content that is private to the user,
that they will access in a long period of time,
you can make that URL or signed cookie last for years.
So what's the difference between a URL and a cookie?
A signed URL gives access to individual files
so you get one URL per files so,
if you have a hundred files (mumbles) you get a hundred URLs
and if you have a signed cookie then you get access
to multiple files and the cookie can be reused
so this time you have one signed cookie for many files.
So choose whatever you need based on the context.
Now how does signed URL work as a diagram?
So we have our CloudFront distribution
and has a bunch of edge locations
and for example we seen before we can access
our S3 bucket through OAI,
so Origin Access Identity for full security.
And so that means the objects in our S3 bucket
cannot be accessed by anything else, but CloudFront,
but we still want to be able to give people access
to their objects through CloudFronts.
So we have our clients and our client is going
to authorize and authenticate to our application
and we have to code that application.
And our application will use the AWS SDK
to generate a signed URL directly from CloudFront.
It will return the signed URL to the clients
and then the client will be able to use that signed URL
to get the data and files and objects
or whatever he needs directly from CloudFront.
So this works for signed URL, but this also works
for signed cookie obviously.
You may be asking yourself, should I use a
CloudFront signed URL or an S3 pre-signed URL?
And they have a different purpose.
So CloudFront signed URL is to allow access
to a path no matter the origin,
so signed URL works not just for S3 as an origin,
but (mumbles) backhand of whatever you want.
It's an account wide-key-pair,
so only the root can manage it,
and you can filter by IP, path, date, and expiration,
and you can leverage all the caching features
out of CloudFront.
So if we look at the diagram we have the client
using the signed URL onto your CloudFront distribution,
and then CloudFront distribution talking
to your origin, in this case I put an (mumbles).
Okay, so we an idea for this.
Now for S3 pre-signed URL it issues a request
as the person who pre-signed the URL.
So the idea is that if I sign the URL
with my own IAM principal and they use my IAM key
to sign this, then the person who has that URL
has the same rights as me.
It has a limited lifetime,
and so the idea is that now the client can access directly
your S3 bucket using that pre-signed URL.
So the idea is if you want people to have access
to your CloudFront distribution and it's in front of S3,
you have to use a signed URL because you cannot access
your S3 bucket as you should
because there is a bucket policy restricting it
to the OAI, but if your users
are using directly against S3 and you want
to distribute a file (mumbles) directly
without using CloudFront, then pre-signed URL
would be a great use case for it.
Alright, that's it for this theory call lecture,
I will see you in the next lecture.