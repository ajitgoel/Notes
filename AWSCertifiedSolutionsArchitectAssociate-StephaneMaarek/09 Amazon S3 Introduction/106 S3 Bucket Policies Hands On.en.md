
<v Instructor>Okay, so let's have a play with</v>
S3 bucket policies.
To do so let's go into permissions
and the goal for us is to define a bucket policy
that we'll write in JSON.
And this bucket policy is going to prevent
putting objects that are not encrypted.
So let's edit this bucket policy and we have two links.
We have the policy example
which actually goes to the documentation of AWS.
If you want to have a read into
all the kinds of possibilities
you can create a bucket policy
or if you just want to follow along with me
then let's go into the AWS policy generator for S3 buckets.
Okay, so lets generate our bucket policy.
So first we need to select the policy type
and the type of policy we want is an S3 bucket policy.
So please make sure to select the S3 bucket policy.
This is very important otherwise
you will not see the same options as me.
Okay, so we have an S3 bucket policy here
and now we want to add a statement.
So what we want to do here
is to deny any objects being uploaded into Amazon as free.
That is not encrypted
using for example, the SSE S3 scheme.
So we're going to have the effect to be
deny principles of where from,
from everywhere, okay?
The action is on the uploader
so the API name it to upload a file into AWS
is called put objects.
So we're looking for put objects here
and then we need to specify the ARN.
So the ARN should be the bucket name slash the key name.
So let's go into the S3 management console
and here they provide us with the buckets ARN
because they know that we're going to use it.
So let's paste it, and so as I have pasted my buckets ARN,
please make sure to add a star and then sorry, a slash
and then a star at the end of the resource name.
Why?
Well, the action that we have selected
which is called puts objects,
as we can see right here
put objects applies to object within the bucket.
And so to specify to either way
we want to apply this to object.
We need to specify the bucket name, then slash, star
and the star indicates any objects within that bucket name.
So we're saying, okay, deny anyone
to upload an object anywhere in my bucket
and we need to add a condition
otherwise we will not be able
to do many things with this bucket.
So we'll add a condition and the statement is no, so no.
The key is going to be looking for the S3
so let's level look, S3 XAMZ server-side encryption.
So this one, okay, which is going to look
for whether or not we have this header when we send a file
to Amazon is free and the value is true.
So let me explain what I did.
We're saying if this header is no.
So that's the conditions.
If this header is no, then deny and that make sense.
If this header is no, we are sending the file
and we don't ask for any kind of encryption.
So we'll add this condition and this is our first statement,
so let's click on add statements
and we'll add a second statement to repeat it.
So we'll deny from anywhere
and then the action is going to be again, the put objects.
So let's find it quickly
put objects.
The resource name has to be the bucket name slash star.
And for the condition, this time we're going to look
at a second condition and we're saying string not equal.
The key is the same key as before
so the XAMZ service that encryption
and then the value of it is going to be AES 256.
So we're saying if the file is uploaded
but with the header,
but the header value is not equal to AES 256,
which is representing the SSE S3 type of encryption,
then deny it.
So we'll add the condition at the statement
and here we go, we have generated our policy right here
which I can copy and paste into my S3 console,
save changes and we're good to go.
So here we have defined a bucket policy
which denies any object being encrypted.
If it's not encrypted with SSE S3.
So we can, for example, have a look,
so let's upload an object and see if that works.
So we'll add a file,
we'll add coffee.jpg and as we can see
I don't specify any encryption setting in particular, okay?
So it's going to go with none
and click on upload,
it failed and we can look at why it failed.
So it failed, access denied.
And so this is due to the bucket policy.
So this is obviously good
because this is what we expected to happen.
And if we try to upload
the same file so coffee.jpg,
but this time we are going to
specify the encryption to be SSE S3
so by setting the right header, then this should work.
So let's upload it and see, yes, this has succeeded.
And finally, let's start to upload this file one last time
but by specifying a KMS type of encryption.
So let's go to overwrite KMS
using the SSE S3 KMS key
and click on the upload.
And this has failed again because it doesn't
respect the bucket policy.
So the bucket policy is working just fine.
And so how did I figure this out?
So if I Google S3 buckets policy deny encryption,
this shows you the kind of blogs that shows you
how to write these kind of let me show you
I have buckets policy so this is not something invented.
I use the documentation to refer for my courses
but I wanted to show you how to generate this policy
using the ADA policy generator, okay?
Hopefully this makes sense.
Now, other settings that
we may want to look at for security,
so let's go into permissions.
So if we go into permissions
we can see that there is block all public access setting.
And so this is on by default, and just to prevent
any data leaks from AWS S3 into the world.
And so we want to keep this on at all time
unless we are running a public website
and want to make the objects public.
So we'll see how to do this in our future lecture.
Also, we can define this block public access setting
at my account level.
To do so on the left hand side,
I can do account settings for block public access
and I can block all public access of all my buckets
if I wanted to by taking this block.
So this is one more level of security, okay?
And then finally, for all my objects
if I look at coffee.jpg,
there is something called ACL or access control list,
so I can scroll down access control list.
And this is something I won't linger on
because we're not using this
and the exam really doesn't touch it.
But access control list is a way for you to define objects
read and writes at the object level.
So as we can see right now,
my accounts can read the objects
and read rights, thanks to the ACL.
Anyway, I won't linger on it
because this is not very important for the exam.
But just know that ACLs are another way
to protect your objects in AWS.
So that's it for this lecture,
I hope you liked it.
And I will see you in the next lecture.