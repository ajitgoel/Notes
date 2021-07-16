
<v ->So, Athena is not a database in the terms that</v>
it holds data,
but it does provide a query engine on top of S3,
so you can see it as the SQL layer on top of S3.
So, AWS advertises it as a fully serverless query engine,
I like to call it database
and has SQL capabilities so you can start querying
your data in S3.
So, you're going to pay per each query you run
based on how much capacity you're using and how much data
you're analyzing et cetera, et cetera
and you can output the results back optionally to S3.
So, in that way it's a good query engine.
It's all secured through IAM
so which it makes it really nice to make sure
that you have access to the
bucket you're querying or the data you're querying
and so the Use Case is going to be for one time SQL query
so exploratory work and maybe serverless queries on S3
or log analytics, that kind of stuff.
So, in that way I think it's if you do light weight queries
or not too complicated, not too many joints,
Athena is a great candidate
and so as such, I want to have this,
a technology in the database sections on this course.
Now from a Solutions Architect's perspective.
Well, operations: It's serverless so this is the holy grail
in AWS, you don't have any operations.
Security is IAM + S3 security, so you need to remember that
there is an S3 security component in there,
usually through bucket policies.
Reliability: Well, it's a managed service and it uses
Presto as an engine, which is a very high performance engine
and on top of it, all the queries are done in a
highly available fashion, so you're pretty much sure that
they will succeed.
And then performance: Well the queries will scale based
on the data size, so you expect a big data chuck to be
analyzed and Athena will basically scale accordingly
and in terms of cost, you're going to pay per query
which are per terabyte of data scanned,
so that means that you only pay only for the actual usage
and that's what makes it as well, a serverless offering.
So I hope Athena makes sense in your head
where you can use Athena to analyze extra logs,
ELB logs, UBC vlogs, all that stuff
and so as such it's quite a cool query engine to use SQL
on top of S3.
So, that's it, I've said enough.
I will see you in the next lecture.