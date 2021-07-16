
<v Instructor>So let's talk about Athena</v>
to conclude this section.
Athena is awesome.
To me, it is really, really, really cool.
It's a serverless service and you can perform analytics
directly against S3 files.
So, usually you have to load your files from S3
into a database which has redshift
and do queries there or something.
But with Athena, you leave your files in S3
and you do queries directly against them.
For this, you can use the SQL language
to query the files which everyone knows,
and it even has a JDBC or a ODBC driver
if you wanted to connect your BI tools to it.
You get only charged per query
and for the amount of data scanned.
So you can go really, really crazy
and you can just get billed for what you are actually using.
It supports many, many, different types of file formats
such is CSV, JSON, ORC, Avro, Parquet
and in the back end it basically runs Presto.
Presto if you know is a query engine.
So the use cases for Athena are so many
but you can do BI, analytics, reporting,
you can analyze and query VPC Flow Logs, ELB Logs,
CloudTrail trails, S3 excess Logs,
CloudFront Logs, all these things.
So in the exam, they will ask you,
"Hey, how can we analyze data directly on S3?
"How can we analyze our ELB Logs?
"How can we analyze our VPC Flow Logs?"
Well they answer is, use Athena.
So that's it.
That's all you need to know.
We're actually going to one hands on
just to get some practice with Athena and see how it works
but for the exam it's really really straight forward.
Anytime you need to analyze data directly on S3,
usually the Logs or ELB Logs et cetera,
you would use Athena.
That's it, I will see you in the next lecture.