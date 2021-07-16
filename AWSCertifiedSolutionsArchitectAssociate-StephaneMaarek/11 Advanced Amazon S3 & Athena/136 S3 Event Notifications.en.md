
<v Instructor>Okay, so now let's talk about</v>
Amazon S3 event notifications.
So some events happen in your S3 bucket,
for example, this could be a new object created,
an object removed, an object that has been restored,
or there is some S3 replication happening.
And so you want to be able to react to all these events.
You can create rules, and for these rules
you can also filter by object names.
For example, you want to react only to the Jpeg file.
So *.jpg.
And so you can create event notification rules
and these rules allow you
to trigger some sort of innovation
inside of your AWS accounts.
So use case for it, a very classic one,
will be to generate thumbnails of images
uploaded to Amazon S3.
So what are the possible targets for S3 event notifications?
Well, you have three.
You have SNS,
which is a simple notification service
to send notifications and emails,
we have SQS for a simple queue service
to add messages into a queue,
and finally Lambda Functions to generate some custom code.
Now, we'll see all these services, SNS, SQS,
and Lambda, in detail in this course,
but for now, just remember that you
have these three targets for Amazon S3
for event notifications, and that will make a lot of sense
by the end of this course.
You can create as many S3 events as desired,
and most of the time they will be delivered in seconds,
but sometimes it can take a minute or longer.
And there is a small caveat,
which is that if you want you to make sure
every single event notification is delivered,
you need to enable versioning on your bucket.
So this is what these two very long lines
of text are saying,
and this comes from the documentation.
So let's go ahead in the console to see how we can set up
a very simple S3 event notification.