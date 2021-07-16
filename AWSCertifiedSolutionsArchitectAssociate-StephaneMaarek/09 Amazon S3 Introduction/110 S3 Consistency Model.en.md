
<v ->Now let's talk about the Amazon S3 Consistency Model</v>
and Amazon S3 is a new eventually consistent system.
So, Amazon S3 is made up of multiple servers
and so when you write to Amazon S3,
the other servers are going to replicate data
between each other.
And this is what leads to different consistency issues.
So you need to know a few rules.
You get read after write consistency
for PUTS of new objects.
So that means that as soon as you upload a new object,
once you get a correct response from Amazon S3,
then you can do a GET of that object and get it.
So that means that if you do a successful PUTS
so PUT 200, 200 means okay.
Then you can do a GET.
And that GET will be 200
that means it will be okay as well.
This is true except if you do a GET
before doing the PUT to check if the object existed.
So if you do a GET, and you get a 404 for not existing.
Then you do a PUTS,
then there is a chance that you would get a 404 still
even though the object was already uploaded
and this is what's called eventually consistent.
So this eventual consistency, you also get it
on DELETES and PUTS of existing objects.
In English that means that if you read an object
right after updating it,
you may get the older version of that object.
So if you do a PUT on an existing object
so PUT 200, then you do another PUT 200,
and then you do a GET,
then the GET might return the older version
if you are very, very quick.
And the way that you get the newer version
is just to wait a little bit.
This is why it's called eventual consistency.
And if you delete an object, you might still be able
to retrieve it for a very short time.
So if you do delete an object and you do right after
a GET, you may have a successful GET, so GET 200.
This is because it's eventually consistent.
If you retry after a second or five seconds,
then the GET will give you a 404
because the object has been deleted.
So this eventual consistency model
is something you should know, going into the exam.
So, it's very simple.
You get read after write consistency
for PUTS of new objects and eventual consistency
for DELETES and PUTS of existing objects.
Super simple rules.
Finally, I've had this question many, many times
in the Q&amp;A.
So I'm going to answer it right now.
There is no way to request strong consistency
in Amazon S3, you only get eventual consistency
and there's no API to get strong consistency.
So that means that if you overwrite an object,
you need to wait a little bit before you are certain
that the GET returns the newest version of your object.
Okay, so that's it for this lecture,
I hope you liked it, and I will see you in the next lecture.