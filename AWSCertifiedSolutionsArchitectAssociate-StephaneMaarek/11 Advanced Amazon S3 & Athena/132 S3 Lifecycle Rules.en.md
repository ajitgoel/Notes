
<v Presenter>So you can transition objects</v>
between storage classes
as we've seen in the previous hands-on.
So we can do it in what way?
Well there is a giant graph on the AWS website
that describes how to do it.
So it's pretty complicated.
But as you can see from STANDARD_IA,
you can go to INTELLIGENT-TIERING, ONEZONE_IA
and then GLACIER, DEEP_ARCHIVE,
and it just shows the possible transitions.
As you can see from GLACIER,
you cannot go back to STANDARD_IA.
You have to restore the objects
and then copy that restored copy into IA,
if you wanted it to.
So for infrequently accessed objects,
move them top STANDARD_IA,
for archives objects that we don't need in real time.
The general rule is to move them to GLACIER or DEEP_ARCHIVE.
And so moving all these objects around all these classes
can be done manually,
but it can also be done automatically using something called
a lifecycle configuration.
And configuring those is something you are expected to know
going into the exam.
So lifecycle rules, what are they?
You can define transition actions,
which are helpful when you want to transition your objects
from one storage class to another. For example,
you're saying, "Move objects to Standard IA class
"60 days after creation
"and then move to Glacier for archiving, six months later."
So fairly easy and fairly natural.
Expiration actions,
which is to delete an object after some time.
So for example, your access log files,
maybe you don't need them after another year.
So after a year, you will say,
"Hey, all my files are over a year old.
"Please delete them. Please expire them."
And it could also be used to delete old versions of a file.
So if you have versioning enabled and you keep on overriding
a file,
and you know you won't need the previous versions
after maybe 60 days,
then you can configure an expiration action
to expire objects, old versions of a file, after 60 days.
It can also be used to clean up
and complete multi-part uploads.
In case some parts are hanging around for 30 years and you
know, they will never be completed.
Then you would set up an expire action
to remove these parts.
And rules can be applied for a specific prefix.
So if you have all your MP3 files within the MP3
quote-unquote folder or prefix,
then you can set a life-cycle rule
just for that specific prefix.
So you can have many lifecycle rules based on many prefix
on your buckets. That makes sense.
And you can also have rules created
for a certain object tags.
So if you want to have a rule that applies just to the
objects that are tagged "Department: Finance",
then you can do so.
So the exam will ask you some scenery questions
and here is one and you need to think about it with me.
So your application EC2 creates images thumbnails
after profile photos are uploaded to Amazon S3.
And these thumbnails can be easily recreated
and will only need to be kept for 45 days.
The source images should be able to be immediately retrieved
for these 45 days.
And afterwards the user can wait up to six hours.
How would you design this solution?
So I'll let you think for a second,
please pause the video and then we'll get to the solution.
So the S3 source images can be on the Standard class
and you can set up a lifecycle configuration
to transition them to GLACIER after 45 days.
Why?
Because they need to be archived afterwards
and we can wait up to six hours to retrieve them.
And then for the thumbnails, they can be ONEZONE_IA.
Why?
Because we can recreate them. Okay?
And we can also set up a lifecycle configuration
to expire them or delete them after 45 days.
So that makes sense, right?
We don't need the thumbnails after 45 days.
So let's just delete them.
Let's move the source image to GLACIER.
And the thumbnails can be on ONEZONE_IA
because it's going to be cheaper.
And in case we lose an entire AZ in AWS,
we can easily, from the source image,
recreate all the thumbnails.
So this is going to be providing you the most cost effective
rules for your S3 buckets.
Now in second scenario.
There's a role in your company that states that you should
be able to recover your deleted S3 objects immediately
for 15 days.
Although this may happen rarely, after this time
and up to one year, deleted objects should be recoverable
within 48 hours.
So how would you design this to make it cost effective?
Okay, Let's do it.
So you need to enable S3 versioning, right?
Because we want to delete files,
but we want to be able to recover them.
And so with S3 versioning,
we're going to have object versions
and the deleted objects are going to be hidden
by delete marker,
and they can be easily recovered.
But we're going to have a non-current versions,
basically the object's versions from before.
And so these non-current versions
we want to transition them into S3_IA
because it's very unlikely,
that these old object versions are going to be accessed,
But if it do, are accessed,
then you need to make sure to recover them immediately.
And then afterwards, after these 15 days of grace period,
to recover these non-current versions,
you can transition them into DEEP_ARCHIVE,
such as for 100 and for 365 days.
It can be archived
and they will be recoverable within 48 hours.
Why don't we use just Glacier?
Well,
because Glacier will cost us a little bit more money
because we have a timeline of 48 hours.
And so we can use all the tiers
all the way up to DEEP_ARCHIVE,
to reach your file and get even more savings.
So this is the kind of exam questions you would get.
And it's really important for you to understand exactly
what the question is asking and what's storage class
is corresponding the best to it
and what life cycle rule can also correspond the best to it.
So let's go into the hands-on
just to set up a Lifecycle rule.