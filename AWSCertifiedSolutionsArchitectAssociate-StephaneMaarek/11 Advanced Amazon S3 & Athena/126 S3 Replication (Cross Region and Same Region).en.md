
<v Instructor>Okay, now let's talk about</v>
Amazon S3 replication that is CRR and SRR
for cross-region replication and same region replication.
At its core of the idea,
we have an S3 bucket for example in one region
and we want to replicate it asynchronously
into another region, into another buckets.
So to do so we first must enable versioning
in the source and destination buckets.
And then we can set up two different things,
cross-region replication if the two buckets
are in different regions or same region replication, SRR,
if the two buckets are in the same regions.
Note that the buckets can be in different accounts.
So it is very possible for you to save a copy of your data
into another account using S3 replication.
The copying happens asynchronously,
but it is very, very quick, and for the cupping to happen,
you need to create an IAM role,
we'll see this in the hands-on
and that IAM role will have the permissions
from the first S3 bucket
to copy through the second S3 buckets.
So the use cases for cross-region replication
is for compliance or lower latency access of your data
into other regions, or to do cross accounts replication
and SRR, so same region replication,
the use cases could be log aggregation.
So you have different logging buckets
and you wanna centralize them into one bucket
or live replication, for example,
between a production and your test accounts.
And so here is the fine print about S3 replication.
After you activate S3 replication,
only the new objects are replicated.
So it's not retroactive,
it will not copy your existing states of your S3 buckets.
And if you do a delete operation,
so if you delete without a version ID,
it will add a delete marker,
and it's not going to be replicated.
And you can deletes with a version ID,
again you will delete in the source and it's not replicated.
So do you make it short,
any deletes operation is not replicated.
And finally there is no chaining of replication.
That means that if bucket one has replication to bucket two,
which has replication into bucket three,
then any objects created in bucket one,
will be in bucket two,
but will not be replicated to bucket three,
so we can not chain your replication.
So that's a fine print for S3 replication,
now let's go to hands-on to see how that works.