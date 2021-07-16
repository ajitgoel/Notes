
<v Instructor>So here is another database</v>
that we have not seen yet in this course
and we don't do a hands-on on it
because it's very simple to understand
the high level overview
and that's all you need
from a Solutions Architect's perspective.
So Neptune is a fully managed graph database.
So graph database are a little bit new,
a little bit different kind of databases.
So when do we use graphs?
Well you use graphs when you have a high relationship data.
When you do social networking, for example,
Users are friends with other Users,
they reply to your comment on the post of a user
and likes other comments.
So this is kind of data that's really highly linked
in a whole graph.
And so another good graph that we know about is Wikipedia
because in every Wikipedia article,
you have links to other Wikipedia articles
and that makes a giant graph.
So if we like to look at a diagram,
this will be the kind of graph data
that would be great for Neptune.
So you see here Users is friends with other Users,
likes, comments, connects,
read, check-in, play.
All that stuff.
All this is graph data
because all these things are linked together
and gives us a massive graph.
So overall, Neptune is when you see graphs at the exam
then this is Neptune.
Now Neptune is like any database on AWS,
highly available across 3 AZ
and you get up to 15 read replicas.
You also get point-in-time recovery
and continuous backup to S3.
And it supports obviously KMS encryption and HTTPS.
So it's kind of like the same song now on AWS.
From a Solutions Architect's perspective,
then operations is similar to RDS.
Security is similar to RDS,
but you also get IAM authentication to Neptune.
Reliability is great.
You get Multi-AZ and clustering.
Performance is at its best
when you use it for storing graph data
and you use clustering as well to improve performance.
And the cost is similar to RDS.
You basically provision the node and you pay for them.
So going into the exam,
remember that Neptune means graphs database.
All right, that's it.
Very short but sweet
and I will see you in the next lecture.