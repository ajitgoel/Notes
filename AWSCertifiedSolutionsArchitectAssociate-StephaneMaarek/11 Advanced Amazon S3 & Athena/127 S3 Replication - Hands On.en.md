
<v ->(instructor) Okay,</v>
so let's have a play with S3 replication.
So I'm going to create a first bucket.
So demos to fan origin, 2020 N E U S one.
And I'm going to enable bucket versioning because
for replication, you need to enable bucket versioning
on both the source and the target buckets.
So we'll create those buckets.
And so this is my first bucket created,
the most if an origin, 2020, and it was an EU West one
but I'm also going to create a second bucket called demo.
Stefan replica, 2020.
And this time I'm going to choose something
like in the U S or us East one, for example,
to replicate my data from Europe into the U S maybe
it is a disaster recovery strategy of yours.
Okay. So I will scroll down.
I will enable bucket versioning again,
and click on create buckets.
Okay, So both my buckets have been created.
So my origin buckets and my replica buckets
and let's open them in new tabs.
What I want to do is start uploading one object
into my demo's defined origin 2020.
So I will upload yet again,
the coffee the JPEG file and upload it.
Here we go.
And so right now, as we can see,
it is in my demo origin buckets,
but obviously we haven't configured anything.
So it is not yet in my demo replica buckets.
Okay? So for this, now I want to set up replication.
So you need to go into management and under management
there is replication rules.
So we can create a replication rule here,
and I'll just call it demo rule.
And the rule is enabled.
And what we do is we can limit this rule
to a specific scope within the buckets.
So a subset of objects, or we can specify
that this rule applies to all objects in the buckets.
So it's up to you, but right now we want to keep it simple.
Let's apply it to all objects and the buckets.
Next we need to a destination, So it could be a bucket
in this accounts or in another accounts,
let's choose a bucket in this accounts, we'll browse
S3 and find the demo replica buckets.
So we'll choose this.
And as we can see the destination region
is us East Northern Virginia at USDS is one.
And so this is cross region replication,
but if the destination region was the same,
it would be a same region replication,
for your replication settings.
Okay, Finally, you need an IAM role to perform this action.
And so we can just ask Amazon is free to create this role
for us, which is very nice,
in terms of advanced settings.
I'm just not going to check anything.
We just want to demonstrate the capability right now.
So let's save this.
Oh, and one thing I'm sure, you're sorry.
The deletes market replication right now is disabled.
So delete markers are not replicated, but if you enable it
delete markers would be replicated
and it will demonstrate this in a second.
Right now I will leave this,
as delete marker replication of, okay, I will save this.
And now my replication rule has been created
and correctly configured.
So what you would expect is that if we go
into the origin bucket, we see one object, coffee, the JPEG.
And if we go into the replica buckets and refresh, well
we'll still see zero objects.
So it turns out that's, as soon as you enable replication,
it will not replicate old objects for you.
Previous objects, it will only replicate newer objects.
So how do we fix this?
Well, we can upload the coffee, the JPEG file again.
So let's upload coffee, the JPEG and click on upload.
Now this has uploaded the coffee the JPEG felt right here,
again in my bucket.
So if I list versions now of two, and you can see
we have a new version of you, of Q, D, D R H whatever.
Now, if I go into my replica buckets
and refresh within a few seconds,
I should be seeing this object popping up.
And here we go, my object has now appeared, and we can look
at the fact that the version ID of this coffee
the JPEG, is the exact same, So Q Q DQ, R, H,
is the exact same as the version ID I have on my origin
bucket.
So the object is replicated,
including the object version ID.
And if I upload, for example, well, a beach JPEG
it is obvious that it is also going to be replicated.
So hopefully this makes sense.
Now let's look about deletes.
So if I take my coffee, the JPEG and delete it,
I'm going to create a delete marker
and press and click on deletes.
So this delete marker that is created is not going
to be replicated.
So let's prove it to ourselves.
So right now we only have the beach jpg in here
in the origin buckets.
And if I refresh here,
I have the beach and the coffee the JPEG.
So the deletes marker did not get passed,
on to the replica buckets.
And we started from before, this was just a setting
in the replication rules.
So if we specify, we could also tell Amazon is free,
to replicate these delete markers
but this is something you have to opt in by default.
And finally, if I list my versions and say I wanted
to delete a very specific version of my file.
So let's say, delete all these files right here,
and I will permanently delete them
because I'm deleting specific version IDs in my buckets.
They, these, these deletes are not going to be replicated.
So again, replication rules do not replicate deletes by
and there's no way to replicate
and delete actually between two buckets right now.
So this is something good to know, and definitely
a behavior you should be aware of at your exam.
Okay?
And that sits for replication rules.
I would say you can set up different replication rules
and your buckets based on different prefixes and filters.
And you can edit the rule.
If you wanted to.
For example, if you wanted to scroll down
and delete the marker replicate,
delete marker replication as well to enable it,
but for now we won't do it.
We saw the basics of replications
and that should be enough for the exam.
I hope you liked it.
And I will see you in the next lecture.