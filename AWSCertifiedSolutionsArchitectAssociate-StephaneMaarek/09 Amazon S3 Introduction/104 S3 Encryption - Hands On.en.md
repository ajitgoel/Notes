
<v Instructor>Now let's look at encryption settings.</v>
So, we'll go into the coffee.jpg file
and I'm going to scroll down.
And let's have a look at the encryption setting.
So, as we can see, for server-side encryption setting,
right now, there is default encryption, Disabled
and server-side encryption, None.
So, our object is not encrypted.
Now, we could edit it and encrypt it in place,
but I wanna show you how it's done
as well when we upload a file.
So let's go ahead and upload a file, I will add a file
and I will add again the coffee.jpg file.
Now we'll scroll down,
and I will look at additional options for encryption.
So let me scroll down.
We are getting into the server-side encryption settings.
I will click on Enable
and here we have different kind of options.
So obviously we disabled it,
and this is no service at encryption,
which was a default from before,
or we can enable it.
So the first encryption type we've seen
and learned from is SSE-S3.
In this case, we are using an Amazon S3 key,
and this is an encryption key
that Amazon S3 will create, manage, and use for us.
So fairly easy.
This is what we could do,
and we could just go ahead and create that file.
For example, with Amazon S3 key.
So let's scroll down, upload it, and that is it,
we have uploaded a file with encryption of SSE-S3.
Now let's do it again, but for the beach.jpg.
So let's add a file and go for beach.jpg,
and I'm going to expand
the additional upload options, scroll down,
Enable Server-Side Encryption and the second option
is AWS-KMS key, so SSE-KMS.
In that case, as we've seen,
we still have an encryption key,
but this time that encryption key
is protected by the KMS service.
And here, we have a couple of options.
We could use an AWS managed key, which is AWS/S3
and this would be an easy option,
or you can choose from your own KMS master keys
if you want to create your own key,
which we'll not do right now.
Or if the key isn't in other accounts,
we could enter the KMS master key ARN,
Amazon resource name manually in here,
but to keep things simple,
we're going to use an AWS managed key (AWS/S3).
And this is going to make sure
that the key encryption happens
by doing API calls into the KMS service, okay?
So let's upload this file again.
Okay, now if we exit this, let's have a look
at what we have.
So we have five object versions.
So we have different coffee.jpg, we have different beach.jpg
and so we could look at specific object versions
in particular.
So if we look at the beach.jpg,
we just had and the one from before.
Let's have a look at what the encryption says.
So this is the one I just uploaded.
And if we look at the encryption setting,
it's encrypted with AWS-KMS master-key
so (SSE-KMS).
And if I'd look at the beach.jpg we had from before
when we first uploaded that file.
If I scroll down, as you can see,
server-side encryption is None.
So what this means that the encryption setting
is just for a specific file and its specific version ID,
but this will make sense.
So we can upload these files manually
and specify the encryption setting for each file.
Or if we wanted to, we could for example,
go into Properties and specify
a default encryption mechanism for the buckets.
So how do we do it?
Well, for example, let's edit
this default encryption settings.
So here we go, I will edit it.
And we will Enable Server-side encryption
by default.
And let's say we want the default, every single object
to be uploaded with the Amazon S3 key.
So we'll use this, save the changes, and now let's try
to upload a file without any encryption.
So let's have a look.
So we'll go to objects, upload it.
And I'm going to upload a coffee.jpg file,
but I'm not specifying any encryption.
But as we can see, the default encryption is Enabled, okay?
But if I go into additional upload options,
I'm saying encryption to use
the default encryption bucket settings.
And so, as you can expect, if I upload this file,
what is going to happen?
Well, let's have a look.
I'm going to click on this file ID right here
and look at the kind
of server-side encryption setting it has.
Yes, it has an Amazon S3 master key.
So the default encryption setting worked properly.
And so lastly, you may be asking me Hasty fan,
you taught us about more settings,
you know, to encrypt files.
So why don't we see them?
So lets have a look.
If I go into the Options and look at overriding,
as we can see, we have Amazon S3 key
so (SSE-S3) or (SSE-KMS).
Another one we have learned is (SSE-C).
And we can only do this through the CLI
because we have to pass in an encryption key
into AWS securely to anchor that object.
So this is not something that has developed to be done
through the console at this time.
So it's not accessible to us.
So the SSE-C option is not going to be shown.
And the last Option I showed you,
it was called Client-Site encryption.
And Client-Site encryption, it means that we need
to encrypt objects client size,
so on our own computers before uploading
to Amazon S3.
And so Amazon S3 doesn't really care
if it's encrypted or not,
it will just take all the bites anyway.
And so this is why this option
does not show anything here as well.
So that makes sense.
This is where we can only see SSE-S3 and SSE-KMS.
So that's it for this lecture.
I hope you liked it.
And I will see you in the next lecture.