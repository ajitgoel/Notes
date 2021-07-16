
<v Instructor>So let's have a look at storage classes.</v>
So I'm going to create a bucket,
demo-stephane.2020-storage-classes,
and I will scroll all the way down,
and click on Create Bucket.
So this is a whole new bucket.
And where is it?
Here it is.
And I'm going to upload my first object in here.
I'm going to upload an object named coffee.jpg.
Okay.
So if we expand the additional upload options,
we can have a look at the storage class option.
And so here we get access to all
the storage classes we've learned from the previous lecture.
So we have Standard,
Standard-IA,
One Zone-IA,
Reduced Redundancy, which is deprecated,
so usually not used,
Intelligent Tiering, Glacier and Glacier Deep Archive.
So we have all the options here,
and there is a summary of what each storage class means.
For example, how many AZ are available,
the minimum storage duration,
the minimum billable object size,
some fees in terms of auto-tiering,
and Retrieval Fees.
You can also click on this, Learn More,
and Amazon has free pricing, buttons,
and links if you want you to learn more
and get access to the documentation, obviously,
as well as the pricing documentation
in case you have any doubts.
But for example, let's choose to upload this file
in Standard-IA, which is infrequently accessed.
And let's see if that works.
We'll click on upload
and here we go, our file has been uploaded.
So I can happily upload another file.
For example, I can upload my beach.jpg,
and if I choose to upload my beach.jpg in the Glacier,
then it will not allow me to see this file immediately,
unless I retrieve it.
So let's have a look.
I've got to restore it first.
So I have my beach.jpg,
and as you can see, the storage class is Glacier,
whereas coffee.jpg, the storage class is Standard-IA.
So if I click on beach.jpg,
it says this object is stored in the Glacier storage class,
in order to access it, you must first restore it.
So that makes sense.
Whereas if I go to the coffee.jpg,
I'm easily able to do object, action, open, and view it.
For this beach.jpg, I cannot open it.
I first need to initiate a restore
which is going to take, you know, some days to restore.
It could take between five to 12 hours
if I do it with bulk retrieval,
Standard is between three and five hours
and expedited between one and five minutes,
and it's going to be a lot more expensive.
And how many days do I want
the restored copy to be available in days?
So it's going to take a lot of time for me to show you this
but you get the idea because it is in Glacier,
then it's going to take some time to restore it.
And finally, it is possible for you to edit
the search class of an object.
So this object right here is in Standard-IA,
but I can edit it and I can change the storage class
to Standard or One Zone-IA,
or we just run on Intelligence Tiering,
for example, let's move this to Intelligence Tiering,
save changes, and here we go.
The storage class of that object has been changed.
So that's it for storage classes.
I hope you liked it.
And I will see you in the next lecture.