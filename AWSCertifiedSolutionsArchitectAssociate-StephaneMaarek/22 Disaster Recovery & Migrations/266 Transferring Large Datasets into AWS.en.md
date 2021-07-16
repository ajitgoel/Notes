
So here is a quick summary lecture
to describe to you all the ways
you can transfer a large amount of data into AWS
and which one is going to be the most
appropriate based on the constraints you have.
So, for example, let's say we want to transfer
200 Terabytes of data into the cloud,
and what we have currently is
a 100 Megabits per second internet connection.
Option number one would be to use the internet,
the public internet, or establish a Site-to-Site VPN,
which also uses the public internet.
And the advantage of this is that it's immediate to set up,
we can leverage our connection right away.
And if we do a quick computation,
what we get is that it will take 200 terabytes
converted into gigabytes and then megabytes,
then you have to convert this into megabits, so times 8.
Then you divide by the speed you have,
so 100 megabits per second, and that gives you about
16 million seconds, which is the equivalent of 185 days.
So almost half a year to transfer 200 terabytes of data
over 100 megabits internet connection.
So this can take a long time.
Obviously, based on the size you have the data
it could be appropriate or not.
And in this case, I will never probably transfer
200 terabytes over this internet connection speed.
If I want to transfer, now, over direct connect,
and say we have provisioned a one gigabits per second line,
then the first thing is that it's going to be
a long, one-time setup.
So if I'd never had direct connect before
it will take about a month
to get this connection established
and then, once I have this connection,
it will take about, if we do the exact same computation,
ten times faster than my first connection,
so it's going to end up being 18.5 days.
So a lot quicker, but still quite long.
Now, if I use Snowball, how long do I need?
Well, first of all, I need to order in my snowballs,
and then I need to get about two to three snowballs,
and I can order them in parallels,
so they will arrive at my facility at the same time.
And then it takes about one week, all in all,
from the snowball to being delivered,
to being loaded, to being packed,
sent back to AWS, and to the end being transferred,
it will take about one week for the end-to-end transfer.
And, on top of it, if there was a database
that was being transferred through Snowball,
it could be combined with DMS to transfer
the rest of the data, aferwards.
So, finally, for ongoing replications,
so this is for one-off transfers,
for ongoing replications, we could use techniques
such as Site-to-Site VPN, again, because we'll have
less data to transfer on an ongoing basis.
Or use direct connect, or use DMS,
or use a service like we just saw, like DataSync.
So all these things would allow us
to transfer the data, ongoing,
on the ongoing basis, continuously or not,
through some more reasonable internet's lines,
such as Site-to-Site VPN or direct connect.
Snowball is going to be used
more for one-off, large transfers,
and as we can see, Snowball, in this case,
is really, really helpful into speeding up
our fist data transfer into AWS.
So this lecture's just about to make you realize
which use case is more appropriate,
and what are the constraints of each use case.
And then, in the exam, you will be asked
to figure out what is the easiest, fastest,
or most reliable way to send data into AWS,
if it's a small data or a large data sets.
All right, that's it.
I will see you in the next lecture.