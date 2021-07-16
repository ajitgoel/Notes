
<v Instructor>Just a quick lecture about S3 Object Lock</v>
and Glacier Vault Lock.
They have the similar idea.
So for S3 Object Lock, the idea is that you want to adapt
something, adopt a WORM model, write once read many.
What that means is that you write the file once
to your S3 buckets, and then you will block
that object version to be deleted for a specific
amount of time, so no one can touch it,
no one can modify it.
So we have the guarantee that the file
will only be written once, and you will not
have deletion or modifications happening to that file.
This is similar for Glacier Vault Lock,
where you have the same WORM model,
and you create a lock policy and that lock policy
prevents future edits to that file,
so that no longer can be changed.
And that policy itself is set in stone,
so once you set it, no one can delete that policy.
So it's extremely helpful when you have compliance
and data retention requirements,
so you want to say okay I want to upload an object
to S3, or Glacier, and have the guarantee that no one
ever will be able to delete that object,
so that we can retrieve in seven years time
in case there is an audit.
That would be a perfect use case for S3 Object Lock
or Glacier Vault Lock.
So the diagram is very simple, but once you insert
and objet into the vault and you have a vault lock policy,
then the object cannot be deleted, and you have
the certainty that it will not be touched by anyone,
so even admins, this is really critical.
All right, that's it for this theory lecture.
I will see you in the next lecture.