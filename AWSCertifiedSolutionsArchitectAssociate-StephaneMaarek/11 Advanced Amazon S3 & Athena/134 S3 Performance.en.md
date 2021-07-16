
<v Narrator>So, we have to talk about the</v>
S3 Baseline Performance.
So, by default Amazon S3 automatically scales to a very very
high number of requests and has a very very low latency
between 100 and 200 milliseconds to get the first bite
out of S3.
So, this is quite fast.
And, in terms of how many requests per second you can get,
you can get thirty-five hundred put, copy, post, delete
per second per prefix, and five-thousand and five hundred
get, head requests per second per prefix in a bucket.
So, this is something you can get on the website and I think
it's not very clear, so I'll explain to you what per second
per prefix means.
But, what that means in (muffled speaking) is that it's
really really high performance.
And there is not limits to the number of prefixes
in your bucket.
So, let's take an example of four objects named file
and let's analyze the prefix for that object.
The first one is in your bucket,
in folder one, sub folder one/file
In this case, the prefix is going to be anything between the
bucket and the file.
So in this case, it is /folder1/sub1/
So that means, for this file in this prefix you can get
thirty-five hundred puts and fifty-five hundred gets
per second.
Now, if we have another folder one and then sub two.
The prefix is anything between bucket and file.
So, /folder1/sub2
And, so we get also thirty-five hundred puts and
fifty-five hundred gets for that one prefix.
And, so on, so if I have one and two we
have different prefixes.
And so, it's easy now to understand what a prefix is
and so it's easier to understand the rule of
thirty-five hundred puts and fifty-five hundred gets
per second per prefix in a bucket.
So, that means if you spread reads across all the four
prefixes above evenly, you can achieve twenty-two thousand
requests per second for head and get.
So, that's perfect.
Next, let's talk about KMS as a limitation to
to S3 performance.
So, if you can KMS inscription on your objects using SSE-KMS
then you may be impacted by the KMS limits.
When you upload a file, it will call S3 on your behalf.
The GenerateDataKey KMS API and when you download a file
from S3 using SSE-KMS, KMS itself will call the Decrypt
KMS API.
And so, these two requests will count towards
the KMS quota.
So to set an example, our users connect to the S3 bucket
and they want to upload or download a file
using SSE-KMS inscription.
And so, S3 bucket will perform an API call either
generate data key or decrypt to a KMS key and get
the result from it.
And so, by default, KMS has a quota of number requests
per second and based on the region you're in it could be
fifty-five hundred per second, ten-thousand per second, or
thirty-thousand per second requests.
And you cannot change that quota.
As of today, you cannot request a quota increase for KMS.
So, what this means is that if you have more than
ten-thousand requests per second in a specific region
that only supports fifty-five hundred requests per second
for KMS, then you will be throttled.
So, you need to be sure that KMS doesn't block
you performance on S3.
Now, this quotas are pretty big for normal usage but
still good to know if you have many many files
and a high usage of your S3 bucket.
Now, let's talk about S3 performance, how we
can optimize it.
The first one is multi-part upload.
So, it is recommended to use multi-part upload for files
that are over one hundred megabites and must be used
for files that are over five gigabytes.
And what multi-part upload does is that it
parallelize uploads and that will help us
speed up the transfers to maximize the bandwidth.
So, as the diagram it always makes more sense.
So, we have a big file and we want to upload
that file into Amazon S3.
We will divide it in parts, so, smaller chunks of that files
and each of these parts will be uploaded in parallel
to Amazon S3.
In Amazon S3, once all the parts have been uploaded
it's smart enough to put them together back
into the big file.
Okay, very important now we have S3 Transfer Acceleration
which is only for upload, not for download.
And it is to increase transfer speed by transferring
a file to an AWS led edge location which will
forward then the data to the S3 bucket in the target region.
So, edge locations there are more than regions there are
about two-hundred, over two-hundred edge locations today.
And it's coin.
And let me show you in the graph what it means.
And that, transfer acceleration is compatible
with multi-part upload.
So, let's have a look.
We have a file in the United States of America
and we want to upload it to a S3 bucket in Australia.
So what this will do is that we will upload that file
through an edge location in the United States,
which will be very very quick.
And then we will be using the public internet.
And then from the edge location to the Amazon S3 bucket
in Australia.
The edge location will transfer it over the fast
private AWS network.
So, this is called transfer acceleration because we
minimized the amount of public internet that we go through.
And, we maximize the amount of private AWS network
that we go through.
So, transfer acceleration is a great way to
speed up transfers.
Okay, now how about getting files, how about
reading a file in the most efficient way.
We have something called a S3 Byte-Range Fetches.
And, so it is to parallelize GETs by getting specific
byte ranges for your files.
So, it's also in case you have a failure or to get
a specific byte range, then you can retry a
smaller byte range and you have better resilience
in case of failrues.
So, it can be used to speed up downloads this time.
So, let's (muffled speaking) file in S3,
it's really really big and this is the file.
Maybe you want to request the first part which
is the first few bytes of the file, then the second part,
and then the the N part.
So, we request all these parts as specific bytes
range fetches, that's why it's called range because
we only request the specific range of the file.
And all these requests can be made in parallel.
So, the ideas that we can parallelize the GETs and
speed up the download.
The second use case is to only retrieve a partial
amount of the file.
For example, if you know that the first fifty bytes
of the file in S3 are the header and give you some
information about the file, then you can just issue
the header request with byte-range request for the headers
using the first, say, fifty bytes.
And, you would get that information very quickly.
All right, so that's it for S3 performance we've seen how
the speed-up uploads, downloads, and seen the
baseline performance, and we've seen the KMS limits.
So, make sure you know those things going into the exam
and I will see you in the next lecture.