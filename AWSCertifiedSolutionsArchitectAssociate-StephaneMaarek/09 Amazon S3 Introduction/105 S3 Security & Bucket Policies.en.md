
<v Instructor>Okay, so now let's talk about</v>
Amazon as far as security.
So it's very complex but first you have user-based security.
So our IAM users have IAM policies,
and they authorize which API calls should be allowed
and if our user is authorized through IAM policy
how to access our Amazon S3 bucket,
then it's going to be able to do it.
Then we have resource-based security
and this is the infamous S3 bucket policies.
They're bucket-wide rules that we can set in the S3 console
and what they do is that they will say what principals
can and cannot do on our S3 bucket.
And this enables us to do cross account access
to our S3 buckets.
We'll do, in the hands-on, a very deep-dive
on S3 bucket policies.
Then we have object ACL, which is finer grain,
where we set at the object level the access rule.
And then finally bucket ACL, even less common,
and these two don't really come up at the exam.
Okay, notes.
An IAM principal, so it can be a user, a role,
can access an S3 object if the IAM permissions allow it,
so that means that you have an IAM policy
attached to that principal that allows access
to your S3 bucket, or if the resource policy,
so usually your S3 bucket policy, allows it.
And you need to make sure there is no explicit deny.
So if your user through IAM is allowed to access
your S3 bucket but your bucket policy is explicitly denying
your user to access it,
then you will not be able to access it, okay?
Okay.
So now this is your deep-dive on S3 bucket policies.
They're JSON-based policies.
So JSON is a notation language, and so we have here
a JSON bucket policy and this bucket policy here
allows public read on our S3 buckets.
So as we can see, it says effect allow,
principal star, so anyone,
the action GetObject,
on the resource, examplebucket slash star.
So on any objects within my S3 bucket.
So this is great, this allows public access
to our S3 buckets.
So these bucket policies can be applied to your buckets
and objects, so both.
The actions is they allow a set of API to allow or deny.
The effect is allow or deny,
the principal is the account or the user
that this S3 bucket policy applies to,
and so some common use cases for S3 bucket policies
is to grant public access to a bucket
or to force objects to be encrypted at the upload time,
or to grant access to another account
using cross account S3 bucket policies.
So we'll do it in the hands-on, a deep-dive
on S3 bucket policies.
Then we have the bucket settings for block public access.
So we've seen this in the hands of when we get started.
So this was a new setting that was created
to block objects from being public
if the account had some restrictions.
So here we have four different kinds
of block public access settings.
We have the new access control list,
any access control lists,
or new public or access point policies.
So this is going to block objects and buckets
from becoming public if they're granted
through any of these methods,
or you can block public and cross account access
to buckets and objects through any public bucket
or access point policy.
So you don't need to remember these four different settings.
It's just a summary in here.
What you need to remember going into the exam
is that there is a way to block public access
to your S3 bucket through these settings.
The exam will not test you on each of these settings, okay?
These settings historically were created to prevent
company data leaks because there were a lot of leaks
of Amazon S3 bucket in the news and Amazon S3 came up
with this way of making sure that any server could say,
hey, none of my buckets are public, by the way,
because of the settings, and that was very popular.
And so if you know that your buckets
should never, ever be public, leave these on.
And there's a way to set these at the account level,
as we'll see in the hands-on.
Other securities in S3 you should know about.
On the networking side, you can access S3 privately
through VPC endpoints.
So if you have EC2 instances in your EPC
without internet access,
then they can access S3 privately through
what's called a VPC endpoint.
For logging audit, you can use S3 access logs
and they can be stored in the other S3 buckets.
API calls can also be logged into CloudTrail,
which is a service to log API calls in your accounts.
For user security, you have MFA Delete,
so multifactor authentication is MFA.
In which case if you want to delete a specific version
objects in your buckets, then you can enable MFA Delete
and we will need to be authenticated with MFA
to be able to delete the objects.
Any finally, pre-signed URLs that we've seen briefly
when we were opening that file
and there was a very, very long URL,
which is a URL that's signed with some credentials from AWS
and it's valid only for a limited time.
And the use case for it, for example,
is to download a premium video
from a service if the user is logged in
and has purchased that video.
So the idea here is that any time of the exam
you see the access of certain files to certain users
for a limited amount of time, think pre-signed URLs.
So in the next lecture we'll do a hands-on
on S3 security to see all these various options.
So I will see you in the next lecture.