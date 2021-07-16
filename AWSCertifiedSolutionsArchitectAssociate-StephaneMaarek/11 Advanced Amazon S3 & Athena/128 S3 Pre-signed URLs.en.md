
<v Instructor>So now we're talking about</v>
S3 pre-signed URLs, and so we've seen them before,
but now we're going to do hands-on.
So we can generate pre-signed URL
using either the SDK or the CLI.
And the easy thing to do is for downloads
you can just use a CLI, but for uploads,
it's a bit harder and you must use the SDK to use them.
Nonetheless, it's quite easy
and we'll do downloads in this lecture.
Now, when you generate a pre-signed URL,
by default it will have an expiration of 3,600 seconds,
which is one hour.
And you can change that timeout
using an expires-in parameter, argument,
and you specify the time in seconds.
And when the user you give it,
you give him a pre-signed URL.
Basically they will inherit your permissions.
So the one permission that created the object,
so they can do, get, or put accordingly.
So why would you do this?
Well, there's many reasons,
maybe you want to allow only logged-in users
to download a premium video on your S3 bucket.
So you only wanna give a downloading for maybe 15 minutes
to a premium user that is logged in.
Maybe you have an ever changing list of users
that need to download files, and so,
you don't wanna give them access directly to your bucket
because it could be very dangerous or it's not maintainable
because there's so many new users all the time.
So maybe you want to generate URLs dynamically
and give them the URLs over time,
all by pre signing them all of them.
And then maybe you want to allow temporarily a user
to upload a file to a precise location in our buckets.
For example, maybe you want to allow a user to upload
a profile picture directly onto our S3 bucket.
And so for this, we would generate a pre-signed URL,
so there could be a lot of use cases.
But let's go ahead and see how we can generate
a pre-signed URL for a download.