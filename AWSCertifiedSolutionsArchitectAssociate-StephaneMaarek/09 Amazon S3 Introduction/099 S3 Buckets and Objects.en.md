
<v Instructor>Okay, so first to talk about Amazon S3.</v>
We need to talk about buckets.
So S3 is a system, a service that allows us
to store objects.
So files into buckets or directories
and each buckets must have a globally unique name.
As you'll see in the hands-on.
we can't create a bucket that are already being taken
in terms of names.
The buckets are defined at the region level,
so even though S3 is a global service,
buckets are regional resource,
and there is a naming convention
which includes no upper case,
no underscore three to 63 characters long,
it should not be an IP,
and it must start with a lowercase letter or a number.
Okay.
Now in these S3 buckets, we need to create objects.
And objects are files and they must have a key.
And what is a key?
It is the full path to that file.
So if we have a bucket named my buckets
and of object named my_file.txt
then the key is my underscore file.txt,
it's the blue part.
But if we have folder structures within our S3 buckets
so my underscore folder one another folder.
And in my file.txt, the key is the full path.
So that's, again, the entire thing in blue.
And the key can be decomposed in two things.
The key prefix
and the object name.
So if we take the same long example,
the prefix for my_file.txt is my underscore folder one,
slash another folder, slash okay, that is the prefix.
Whereas the object name is my underscore file.txt
So even though there's no concepts of directories
within buckets, just very, very long key names
then the UI will try to trick you into thinking otherwise
because we could create quote unquote
create directories within S3.
So what we really have in S3 is just keys
with very long names that contains slashes.
Okay, so now let's go again for this objects.
So the object values are the content of the body.
So a maximum object size on Amazon S3 is five terabytes
so 5,000 gigabyte, which is a huge object
but you cannot upload more than five gigabytes at a time.
So that means that if you want to upload a big object
of five terabytes
you must divide that object into parts
of less than five gigabytes
and upload these parts independently
into what's called a multi-part upload.
Now each object in Amazon S3, can have metadata.
So it list of key value pairs
that could be system or user metadata.
And this is to add information onto your objects
and also tags.
You can also have key value pair and tags
which is very useful
when you don't you have security on your objects
or lifecycle policies.
Finally, we'll see when we go into versioning
that there is a version ID onto our Amazon S3 objects,
and we'll see what the value of that is
in the versioning lectures.
So without further ado
let's get into the Amazon S3 console
and do a hands-on.