
<v Narrator>Into the exam, you need to know</v>
about all the S3 storage classes
and understand which one is most adapted to which use case.
So in this lecture, which is going to be quite long
I want to describe to you all the different storage classes.
The first one is the one we've been using so far
which is Amazon S3 Standard, which is for general purpose.
But there are some more optimized one
depending on your workloads.
The first one is S3 Infrequent Access
or IA
also called S3 IA.
So this one is when your files
are gonna be infinitely accessed,
and we'll have a deep dive by the way on all of them.
There's gonna be S3 One Zone IA,
when we can recreate data.
There's gonna be S3 Intelligent Tiering,
which is going to move data
between your storage classes, intelligently.
Amazon Glacier for archives
and Amazon Glacier Deep Archives
for the archives you don't need right away.
Finally, there's one last class
called Amazon S3 Reduced Redundancy Storage,
which is deprecated
and therefore I will not be describing it
in details through this lesson.
Okay, so S3 Standard General Purpose.
We have very high durability is called 11 nines.
So 99.999999999
of objects across multiple AZ.
So if you store 10 million objects
with Amazon S3 General Purpose,
you can own average expect
to incur a loss of a single object, once every 10,000 years.
Bottom line is,
you should not lose any objects on S3 Standard.
There's a 99.99 availability percentage over a given year.
And all these numbers by the way you don't have to remember.
There's just indicative to give you some knowledge.
You don't need to remember exactly
the numbers going into the exam,
just since you understand
the general idea about a storage class.
And it can sustain two concurrent facility failures.
So, it's really resistant to AZ disasters.
The use cases for general purpose
is going to be big data analytics,
mobile and gaming applications, content distribution.
This is basically anything we've been using so far.
Now we have S3 Standard Infrequent Access or IA.
And this is suitable for data as the name indicates
that is frequently, less frequently accessed
but requires a rapid access when needed.
So we get the same durability
across multiple AZ,
but we have one nine less availability,
and it is lower cost compared to Amazon S3 Standard.
The idea is that if you access your object less
you won't need to pay as much.
It can sustain two concurrent facility failures.
And the use cases for this is going to be a data store
for disaster recovery, backups,
or any files that you expect to access way less frequently.
Now we have S3 One Zone IA, or Infrequent Access.
And this is the same as IA,
but now the data is stored in a single availability zone
before it was stored in multiple availability zone.
Which would let us in to make sure
the data was still available in case an AZ went down.
So we have the same durability within the single AZ,
but if that AZ is somewhat destroyed,
so imagine an explosion or something like this,
then you would lose your data.
You have less availability 99.5% availability,
and you have still the low latency
and high throughput performance
you would expect from S3.
It's lower cost compared to, it supports SSL
for all the encryption.
And it's going to be lower cost compared
to infrequent access by about 20%.
So the use case for One Zone IA
is going to be to store secondary backup copies
of on-premise data
or storing any type of data we can recreate.
So what type of data can we recreate?
Well, for example, we can recreate thumbnails from an image
so we can store the image on S3 General Purpose
and we can store the thumbnail
on S3 One Zone Infrequent Access.
And if we need to recreate that thumbnail over time
we can easily do that from the main image.
Then we have S3 Intelligent Tiering.
And it has the same low latency and high throughput
as S3 Standard,
but there's a small monthly monitoring fee
and auto-tiering fee.
And what this will do
is that it will automatically move objects
between the excess tiers based on the access patterns.
So it will move objects between S3 General Purpose, S3 IA.
And so it will choose for you
if your object is less frequently accessed or not.
And you're going to pay a fee
for an S3 to do that little monitoring.
So the durability is the same.
It's not 11 nines,
and it's designed for 99.9 availability
and it can resist an entire event
that impacts an availability zone.
So it's available.
Okay, so that's one of the General Purpose S3 storage tiers.
And then we have Amazon Glacier.
So Glacier is going to be more
around archive glacier's cold.
So think cold archive.
It's a low cost object storage
meant really for archivings and backups.
And the data needs to be retained for a very long time.
So we're talking about tens of years
to retain the data in Glacier.
It's a big alternative to on-premise magnetic type storage
where you would store data
on magnetic tapes and put these tapes away.
And so if you wanted to retrieve the data from these tapes
you would have to find the tape manually
put it somewhere and then restore the data from it.
So we have still the 11 nines of durability
so we don't lose objects.
And the cost per storage is really really low.
$0.004 per gigabytes, plus a retrieval cost.
And we'll see that cost in a second.
So each item in Glacier is not called an object.
It's called an Archive.
And each Archive can be a file up to 40 terabytes.
And Archives are stored, not in buckets
they're stored in vaults.
Okay, but this is a very similar concept.
So we have two tiers within Amazon Glacier
we need to know about.
The first one is Amazon Glacier, the basic ones,
and we have three retrieval options.
And they're very important to understand.
Expedited, which is one to five minutes.
So you request your file and between one to five minutes
you will get it back.
Standard, which is three to five hours.
So you wait a much longer time.
And Bulk when you require multiple files retrieval
at the same time,
which takes between five to 12 hours
to give you back your files.
So as we can see here,
Amazon Glacier is really to retrieve files
and not have some kind of urgency around it.
If you're very, very in a rush
you can go and use Expedited,
but it's going to be a lot more expensive
than using Standard or Bulk.
And the minimum storage duration
for Glacier is going to be 90 days.
So again, files that are going to be in Glacier
are there for the longer term.
And we have an even deeper
storage tier for Glacier called Deep Archive.
And this is for super long-term storage
and it's going to be even cheaper.
But this time the retrieval options are Standard, 12 hours.
So you can not retrieve a file in less than 12 hours.
And Bulk, if you have multiple files
and you can wait up to 48 hours
it's gonna be even cheaper.
So Deep Archive we will see is going to be
for files that you really don't need to retrieve urgently
even if it's archived.
And the minimum storage duration
for Deep Archive is going to be 180 days.
Now you have to remember these numbers at a high level
because going into the exam,
they will be questions asking you to understand
which point to pick
between Glacier and Glacier Deep Archive.
And for example, if the storage file
is going to be less than 180 days,
then you have to use Glacier.
If you need to retrieve the file very very quickly
between three to five hours is going to be Glacier.
But if it's going to be a file to be retrieved in 72 hours
and it's going to stay for one year
in your vault in Glacier
then maybe Deep Archive is going to provide you
the best cost savings.
So,
let's compare everything that we've seen.
We've seen S3 Standard, Intelligent Tiering,
Standard IA, One Zone IA Glacier
and Glacier Deep Archive.
So for durability, they're all 11 nine.
So that means you don't lose any objects.
For availability,
while the ones that we can look at is S3 IA,
because it's infrequently accessed.
We have a little bit less availability.
And if it's One Zone IA,
then it's going to be even less availability
because we only have one availabilities on them.
So that makes sense.
For the SLA, this is what Amazon would guarantee you
to reimburse you.
And it's not something you need to know about
but I'll just put it in this
in this chart in case you need it in real life.
Now, the number AZ your data is stored onto
is going to be three everywhere
except in One Zone IA, because as the name indicates
it's only for one zone,
so you're going to have one.
Then, there is a minimum capacity to charge per object.
So when you have the normal S3
or Intelligent Tiering, you're fine.
But when you're using IA, you need to have a large object
a rather larger than 128 kilobytes.
And for Glacier 40 kilobytes.
The minimum storage duration is going to be 30 days
for Standard IA and 30 days for One Zone IA
and for Glacier 90 days
for actually Glacier Deep Archive, 180 days.
And then finally
is there a retrieval fee?
For the first two, no there's not,
but it's when you have Standard IA
because it's infrequently accessed
then you're going to be charged a fee
anytime you retrieve the data.
And then for Glacier, Glacier Deep Archive, again
there's going to be a fee based
on the number of gigabytes you receive
and the speed you want to receive at.
So you don't need to know all the numbers in it
but the numbers should make sense
from what the storage tier really really means to you.
And for those who like numbers,
here's just a chart that I have.
You can look up on your own time.
But what it shows is that
the cost of S3 Standard is 0.023, which is high.
And if we go all the way to the rights to Glacier,
we have Deep Archive
we have 0.00099 per gigabytes per month
which is a lot cheaper.
And so if you want the data fast enough
for Intelligent Tiering is gonna be between 0.23 and 0.0125.
Standard IA is going to be that number
and One Zone IA is gonna be even cheaper and so on.
And it shows also the retrieval cost.
So if we want an Expedited retrieval from Glacier
it's going to cost us $10 per 1000 requests.
Whereas if we use Standard or Bulk
is going to cost us a lot less,
same for Glacier Deep Archive.
Okay.
So that's it.
And finally for S3 Intelligent Tiering
there is a cost to monitor objects
because it's gonna be able to move them
between S3 Standard and Standard IA on demand.
And so the cost is quite small
but it's 0.0025 per 1000 objects monitored per month.
Okay, well that's it.
Let's go into hands-on to see how we can use these tiers.