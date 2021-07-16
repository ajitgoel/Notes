
<v Stephane>Okay so welcome to this section</v>
on databases, here it is more a section to compare
all the database technologies that we've seen in depth
such as RDS or Aurora to the ones we may not have seen
in depth such as Redshift or ElasticSearch.
We will be able to get an understanding
of how to choose the right database
for your right architecture and then we'll help you answer
all the exam questions on databases.
So choosing the right database is tough
because there's a lot of manage databases on AWS to choose
from and you need to ask yourself the right questions.
So these questions come from the ADAS white paper
and so let's have a look at them.
First of all you need to understand is your workload
more read-heavy like a lot of reads
or write-heavy a lot of writes
or is it more of a balanced workload?
What are your throughput needs? Maybe you need
high throughput maybe you need low throughput.
Will it change? Will it fluctuate over time
or will it need to scale over time?
Then how much data do you store and for how long?
Will it grow and what's your average object size?
Is it really small? is it really big? Is it average?
And how is your data accessed?
Is there some security needs around it?
Data durability, do you need your data
to be there for a week or forever?
Is your database going to be a source of truth
for all your data sets?
What are the latency requirements?
How many users at a time will you get?
And what's the data model? How will you query your data?
Do you query by primary key? Do you join? Is it structured?
Is it semi-structured? Do you need to search it?
And do we need strong schema or more flexibility?
Do we need reporting, search?
Do you want it to be RDBMS or NoSQL?
And finally is there any license cost?
Can you switch to a Cloud Native database such as Aurora
in the case of license cost say on Oracle?
So all these questions are questions you should ask yourself
when you look at a solution architecture and that will help
you steer your decision towards the databases.
Don't worry I've made this really easy for you.
So here are the database types on AWS.
There's what I call RDBMS, that means you're using SQL
and its OLTP so online transaction processing
and this is usually going to be your principal database
like RDS if you going to use Postgres, MySQL,
MyRDB, MySQL server, Oracle and Aurora
if you wanted to jump to a more enterprise grade database.
And so theses databases are great to power a website,
they're great for joins, they're great for normalized data.
Basically any time you see data in a tabular form,
RDS and Aurora are gonna be the way to go.
Then there's NoSQL databases and there are many on AWS.
There is DynamoDB which stores sort of like JSON documents,
it's not exactly JSON but it looks like JSON.
ElastiCache for key value pairs, high performance.
Neptune, we'll see this in this section is for graphs
and so in these databases we can't really do joins
and there's no SQL language to query your database
so it's more of a way to organize
your data that's going to be different
and you get performance benefits out of it.
Now maybe you want to have objects such as Object Store
so S3 is gonna be here for big objects so on that RDB
you can only store maybe 400 kilobytes of data per row
whereas on the S3 you can go up to five terabytes
of data per object so its really really big.
And then Glacier is going to be for backups and archives
but you can still store data there as well.
So S3 and Glacier they don't seem like databases
at the first glance but they actually are databases
and so I like to consider them as databases
because we put data on them and we retrieve it
so that's basically the definition of a database.
Then we have data warehousing so this is when you wanna do
analytics and BI based on SQL and so for this
we can use Redshift, Redshift is going to be an OLAP
so online analytical processing and so this is basically
helping you doing your data warehousing and all that stuff.
And Athena, people don't think it's a database,
I think it's a database, it can be used to query your data
in ESTRY and so I think that's a great candidate as well
to be considered as a data warehouse
for analytics and BI purposes
but it's up to you to choose whatever you want.
And then finally we have search capability
so ElasticSearch where you can like search around
free text, unstructured searches so it has a lot of good
querying and search capabilities as the name indicates.
And we have graphs again, I just wanted
to reiterate that Neptune may be considered
as a graph database and so it will be used
to display relationships between data.
Now this is just a high level overview
but if you need to go into your exam
and quickly remember all the database technologies
and how they're categorized watch this lecture again.
In the next lectures I'm going to do a deep dive
in each of these technologies and see how they're operated,
what are the cost performance, what are the use cases
and that kinda stuff so join me in the next lecture.