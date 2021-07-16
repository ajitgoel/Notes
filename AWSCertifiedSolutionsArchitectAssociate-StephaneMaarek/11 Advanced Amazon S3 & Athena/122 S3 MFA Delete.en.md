
<v Instructor>All right, you are going to talk about</v>
MFA-Delete in depth.
So MFA-Delete is to use MFA, so multi-factor authentication,
and that will force our users
to generate a code on the device,
it could be your mobile phone or your hardware key
to do important operations on S3.
So to use MFA-Delete,
we have to first enable versioning on the S3 bucket,
but you already know this.
And when we need MFA will be to permanently delete
an object version and suspended versioning on the bucket.
So these are like the most important disruptive action
that we'll need MFA for,
but if we just enable versioning or list deleted versions,
or just delete a version by just adding a marker,
this is fine, we don't need MFA for that.
The one important thing to know is that MFA-Delete
must be enabled or disabled only by the bucket owner,
which is the root accounts.
So even if you have an administrator accounts,
you cannot enable MFA-Delete.
you'll have to use the root to accounts.
And on top of it, because it's really not easy,
you have to use MFA-Delete only using the CLI for now.
So it's really, really hard to set up,
but I'll show you how to do it.
And for this, you need to use root credentials
and there is no way of doing it in the console right now,
it's only has to be done through the CLI.
So let's go ahead and walk through this,
but you don't have to do the hands-on with me.
You can just watch me cause it's really clunky and painful,
but the idea you understand is that only the buck,
the root accounts can enable and disable the MFA-Delete,
and that you'll need MFA only to permanently delete
an object version or suspend versioning on the buckets.
So let's get started with the hands on.