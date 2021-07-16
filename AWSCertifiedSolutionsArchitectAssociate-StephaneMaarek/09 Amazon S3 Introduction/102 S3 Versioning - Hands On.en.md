
<v Instructor>So next, let's explore versioning</v>
in our S3 Buckets.
So for now, we just uploaded a copy of the jpg,
and we didn't enable versioning when we created the buckets,
But let's go into the Properties tab,
and the first setting into the Properties tab
is called Bucket Versioning.
So let's edit it,
and move the Bucket Versioning
from being suspended to being enabled.
I will click on save changes,
and here we go.
Our bucket is now enabled for versioning.
So let's close this and go back to our Objects.
Great.
So this is our first object.
But now that we have enabled versioning,
we have a new setting here called List Versions.
This toggle right here, if I click on it,
will add a column into the view of Amazon S3,
which shows me the version ID.
And it turns out that's for coffee.jpg,
the version ID is null.
That means that we have uploaded this object
before we enabled versioning onto our bucket,
and therefore it will not have a version ID,
hence the term null.
But let's try to upload a new file,
and this time, we're going to upload the beach picture.
So beach.jpg.
I will scroll down and upload.
Now that file has been uploaded,
let's go back to our buckets and list diversions.
Now we can find that the beach.jpg
has a version that is a very long string.
And so this makes sense.
As we have uploaded a version of the file
after enabling bucket versioning,
it's going to be assigned a version ID.
Okay, what about if we upload the beach.jpg file again?
So let's upload beach.jpg, and see what happens.
Okay, back in here, I still have two objects,
but if I list my versions,
now we can see that beach.jpg has two version IDs.
This one is the one we applied from before,
and this one is the new version ID
we just uploaded right now.
So as we can see thanks to versioning,
every time we re-upload a file,
it will keep all its previous versions,
as well as the new version
and assign a different version ID every single time.
So this is cool.
Now what happens if we upload another time
the coffee.jpg file?
So let's try it out. We'll upload the coffee.jpg.
Upload.
Great.
Back in here, list versions.
We can see that coffee.jpg has two versions.
The first version that we just uploaded
has a long version ID,
and the one from before has the version ID null.
Okay, this is great.
Now let's try to unlist the object version.
So we just have these two files right here,
and let's try to delete a file.
So for example, let's take the beach.jpg,
and let's try to delete it.
So I click on Delete,
and as you can see, we get an information
saying deleting the specified objects
adds delete markers to them.
So we're actually not deleting the file itself,
we're adding a delete marker.
Let's see whether it's been so.
Let's confirm we want to delete beach.jpg, and press Delete.
Okay, so this is done.
The object has been successfully deleted.
Let's exit this.
Scroll down, and yes, it seems that's my beach.jpg
has been deleted.
But actually, if I click on list versions,
this toggle again,
well, we can see that beach.jpg is still here.
But now, on top of the two previous versions
we have uploaded,
we have a delete marker.
And this delete marker has its own version ID
of size zero bytes, and is same to AWS,
make it seem like this file is gone,
but actually, it's not gone,
it just has a delete marker.
And so how can I restore a file?
Well, I can just take this and delete the Delete marker.
Now, deleting a delete marker
or deleting a specific version ID
is called a permanent delete.
So if I take, for example, these two files right here,
these two versions,
the Delete marker and the previous version
because I want to delete two at once, I click on delete.
Now, instead of just saying delete,
it says you need to permanently delete
because I'm deleting specific version ID,
so it is a destructive operation
before it edited delete marker,
but not we're actually deleting the objects for good.
So this cannot be undone.
I click on Delete objects,
and my objects have been deleted.
Going back into my bucket one more time, what do we see?
We see my beach and my coffee.jpgs are back.
And if I list versions,
I only have one version for my beach.jpg, which makes sense.
this is exactly in line with the operation we just did.
Okay. And so this allows us to roll back
a previous version and restore a previous version,
thanks to the versioning.
Okay. And this is quite cool
because, well if someone goes and deletes a file,
and we have enabled versioning
as long as it deletes a specific object version,
we have prevented against unintended delete.
And finally, for Bucket Versioning,
you could go and disable it,
it is not suspend it.
So if you do suspend it,
this is going to keep all the previous versions
that you had from before,
but for the new objects,
they will have in version ID of null
and we will replace all the existing previous versions.
Okay. Now I'm going to keep Bucket Versioning on
because I need it for the rest of my demos.
So that's it for this part,
I hope you liked it and I will see you in the next lecture.