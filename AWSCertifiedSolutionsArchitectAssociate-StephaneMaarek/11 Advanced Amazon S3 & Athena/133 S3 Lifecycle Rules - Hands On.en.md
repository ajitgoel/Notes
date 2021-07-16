
<v Lecturer>Okay, so now let's have a look</v>
at Lifecycle rules.
For this, I'm gonna go into Management
and I can define a lifecycle rule.
So let me create one.
I will call this one DemoRule,
and we can either play it to a specific scope
within our buckets or all the objects.
I will apply to all the objects,
just for simplicity sake in this video.
So we have five different kinds of lifecycle rule actions,
we can transition current versions
of objects between storage classes or previous versions.
So what do we mean by current and previous?
Well, for currents
we mean the object that is the most recent
if we have enabled versioning,
and for previous we mean all the other versions of an object
if we have enabled versioning.
Then we can expire current versions of objects,
permanently deletes previous version of objects,
and finally delete expired,
delete markers or incomplete multipart uploads.
So lots of different options.
But let's just do this one,
we are going to transition current versions
of objects between storage classes.
And we can say, we can transition objects
into the standard-IA storage class, after thirty days,
then we can move it into Intelligent-Tiering after,
seventy days.
And then move it into maybe Glacier after,
one hundred and eighty days
and Glacier Deep Archive after,
let's say three hundred and sixty five days.
Okay.
And there is probably
because I'm not doing my cost correctly,
I get a small warning.
Ah if you transition oh yeah,
if you transition small objects into Glacier
or Glacier Deep Archive,
this will increase costs,
so obviously if you do transition objects there,
make sure they're ,big enough.
Okay, great.
So next I can also expire current object version
ah current versions of objects,
So we're seeing okay.
After an object is created maybe after seven hundred days,
then please delete it.
And we could also add a previous version transition
just for fun.
And we can say it's,
move it into Glacier after sixty days
because if it's approved version
maybe we don't want to access it.
We don't plan on accessing this.
Okay, so I acknowledge this as well.
And so we can look at the timeline summary.
And so for current version actions,
day zero, the objects are uploaded,
day thirty they are transitioned automatically
into Standard-IA,
day seventy into Intelligent-Tiering,
day one eighty to Glacier and finally,
three sixty five Glacier Deep Archive.
Day seven hundred they will expire.
And then for previous version actions,
this year they become noncurrent
and day sixty they are transitioned to Glacier.
Just, you know, a simple ah fun lifecycle rule to set up
but this shows you the whole power of lifecycle rules
you can set up multiple ones per buckets
on different filters with different rules.
And this allows you to really optimize your costs
in AWS for Amazon S3.
So I hope you liked it,
and I will see you in the next lecture.