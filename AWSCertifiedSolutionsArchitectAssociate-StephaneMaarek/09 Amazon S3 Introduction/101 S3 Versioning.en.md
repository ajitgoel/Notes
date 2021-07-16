
<v Narrator>So, now let's talk about Amazon S3 versioning.</v>
So your files in Amazon S3 can be versioned,
but it has to be enable first at the bucket level.
So we'll do this in the hands on.
So that means that if you re upload a file version
with the same key,
then it will overwrite it,
but it won't overwrite it,
actually it will create a new version of that file.
So instead of overwriting the file that already exists,
it will create a new file version
and I'm simplifying it here,
but it will be version one,
then version two,
then version three,
et cetera, et cetera.
So, it is best practice to version your buckets
in Amazon S3 in order to be able to
have all the file versions for a while,
because you can get protected against unintended deletes
because you're able to restore a previous version.
And also, you can easily rollback
to any previous versions you wanted.
So, you need to know a few things though.
Any file that is not versioned prior to enabling
versioning will have the version null.
And if you suspend versioning in your bucket,
it does not delete the previous versions,
it will just make sure that the future files
do not have a version assigned to it.
So lets go in the hands on and see how that works.