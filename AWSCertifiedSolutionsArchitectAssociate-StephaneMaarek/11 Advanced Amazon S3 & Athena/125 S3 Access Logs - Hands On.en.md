
<v Instructor>So let's demonstrate S3 Access logging,</v>
so I'll call it demo-s3-access-logs-stephane-2020.
And then, I will leave all these settings on
and click on Create Bucket.
Okay, so this is creating my bucket,
and this bucket is going to be used
for access logging for my other buckets.
So let's take my demo-stephane-s3-bucket-2020,
and I'm going to turn on server access logging.
So for doing so, I'm going to go into Properties,
and I will scroll down,
and I will find the server access logging in here.
Okay next, I will click on Edit,
and then enable server access logging.
Next I need to specify a target bucket,
so I can just browse Amazon S3,
and look at this bucket that I just created,
choose the path, and we can do, for example,
slash logs slash
if you wanted to have all the server access logs
to go under the S3-logs folder.
It's up to you, it's optional,
but add a trailing slash at the end.
Save the changes and we're good to go.
So now, it is enabled, and so,
the idea is that if I go, and for example, list my versions,
if I go and take this coffee.jpg file, and open it,
and stuff like this, this is going to generate
some traffic onto my bucket, okay?
And this is going to be logged
onto my other bucket called the demo-s3-access-log-stephane.
Now this takes, this can take an hour or two hours
to appear so I'm going to wait a little bit
for it to be written.
But one question you may have is, "How does this bucket,
by turning on the server access logging,
how is this bucket getting the right to write
to my logging bucket?"
And so it says it here.
By enabling server access logging, the S3 console
will automatically update your bucket access control list,
so ACL, to include access to the S3 log delivery group.
So let's check this out.
Let's go to Permissions of my demo-s3-access-logs bucket,
and under Permissions, if I scroll down
and go to access control list, ACL,
yes, indeed, the S3 log delivery group
has the right to write my objects onto my S3 bucket.
So this is something that has been added automatically
by Amazon S3 when I did enable server access logging.
So just the nitty gritty, but it's almost good to see
the full security picture when I do something.
Okay, so now the only thing I have to do is wait,
so I'll post the video,
and hopefully within an hour or two,
I should be able to see some objects
being populated in here.
So I will see you very soon.
Okay, so I'm in my access log bucket, I've waited an hour.
So hopefully if I refresh, yes,
I start seeing an s3-logs folder
that has been created, so perfect.
And within that folder, it's contained
a bunch of access logs of what has been done
on my S3 bucket.
So I can take any of these files,
I can take this one, for example,
and I can download it.
It's a text file,
so I'm going to open it with my text editor
to see what it's inside.
And so, I just opened this file,
and this is the text file.
This is one line so this contains one bit of information
in this specific file,
and this tells me about the request ID,
the bucket it was made on,
the time and date of this bucket request,
the IP it's coming from, that in fact it was a get,
so it was a get and the result was 200,
so it was a successful get on a bucket at the very top.
So it was probably like a request done
at the top of the bucket.
So these type of access logs can be analyzed at scale
using something like Athena
that we'll see in this course.
And so, on their own, they're not very helpful,
but if there are any problems,
if there's any authorization issues or attacks, whatever,
Athena analyzing these files
and getting down to the bottom of it
will allow you to get more insight into what is happening.
So that's it for access logs.
I hope you liked it and I will see you in the next lecture.