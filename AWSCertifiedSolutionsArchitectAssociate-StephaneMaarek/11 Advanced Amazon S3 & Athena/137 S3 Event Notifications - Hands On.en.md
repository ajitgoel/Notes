
<v Instructor>Okay. So let's demonstrate</v>
S3 bucket notifications.
For this I'm going to create a bucket,
and then we'll call it
demo-stephane-2020-s3-buckets- notifications.
Okay.
I will create it in Eu-west-1 Ireland,
and it will scroll all the way down
and create these buckets.
So far, so good.
Next I will click and open this buckets
and I want to go into properties
and I want to change my Events notifications.
So as you can see where you can have multiple ones.
So I want you to create an event notification
and I'll call it Demo events,
and for the prefix it's optional so I will set nones
this way applies to all the objects within my buckets,
as well as suffix is optional and so on.
What is this events applying to?
So I want to have this event triggered
anytime an object is created.
So that is object created, put, post, copy,
and multi-part upload completed,
but you could also if you wanted to
have other calendar events,
such as deletes events, restore events and so on.
So for now I'm just going to select,
all objects create events for S3 object create to start.
Next we need to choose a destination.
And so the destination could be a Lambda function,
an SNS topic or an SQS queue.
Now we haven't seen those yet,
but we'll be using an SQS queue
and we will be creating a queue ourselves.
So let's go ahead and create a queue.
So let's go to SQS and create a queue for that matter.
So we'll create a queue
and this queue I'm going to call it
standard and outside demo-s3-notifications,
we're good to go.
And I will scroll all the way down
and click on creates queue.
Let me close these two things.
So my queue is created
and what I need to do is to set up an access policy
and the access policy I need to set up
is an access policy that will allow
my S3 bucket to write to my Amazon SQS queue.
So, no need to worry about what SQS is right now,
but just follow with me.
So let me refresh this page just to make sure that
I get my queue picked up.
So I've got demo events again one more time
for create objects and scrolling down SQS queue
and find my demo S3 notifications.
So if I save the changes right now
is going to give me an error
because I'm unable to write to my SQS queue.
So let's change the access policy
to allow people to write to my SQS queue
so I will change it.
And the access policy itself,
I can use a policy generator
to define an SQS queue policy,
and I will allow I'll make it very permissive right now.
I will allow,
anyone to do a
send message into my SQS queue,
and I need to find the ARN of my SQS queue
and the ARN is right here.
So here we go.
I will paste in the errand
out a statement, generate this policy,
and this should allow anyone
including my S3 buckets to write to my SQS queue.
Now this is way too permissive,
but good enough for this demo.
So I pasted it,
and then I will save this.
So now, my access policy should allow
my S3 buckets to write your SQS.
So let's save the changes one more time.
And this time the operation successfully completes.
Finally, let's go and upload an object
to see if that triggers an event.
So we'll add a file
and we'll add coffee.jpg
and upload this file
and see what happens.
Okay?
So this file has been successfully uploaded.
This is good.
Now let's go into Amazon SQS
and under Amazon SQS,
you can go to send and receive messages
on the top right corner
and under receive messages,
we can see two messages that are available.
So if you click on poll for messages,
this is going to receive these messages are here they are.
So the first message is this one.
And if we look at the body of the message,
we can see that this was a test event from Amazon S3.
This is when Amazon S3 was testing the connectivity
between the S3 buckets and the SQS queue.
So we can safely disregard this events.
And the second event,
if you look at the body now
this contains the actual notification
that was sent by Amazon S3 into SQS queue.
So we can see the sources aid was S3.
The event time, we can see it was in the eu-west-1 region
and the event name was objects created Puts.
We can see who did it, some IP
and a lot of information about that event in particular.
So this demonstrates that, yes our S3 buckets
is able to send notification into Amazon SQS
and the completed demo.
So that's it,
I hope you liked it,
and I will see you in the next lecture.