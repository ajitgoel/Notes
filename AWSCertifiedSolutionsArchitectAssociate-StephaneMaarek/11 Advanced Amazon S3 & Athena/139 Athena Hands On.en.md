
<v Instructor>Okay, so let's have a play with Athena.</v>
So Athena is to query data in S3 without loading
it into a database directly using the SQL query language.
So, I'm going to get started and see how we can get set up.
So what we want to do is set up a query
in Athena onto one of our buckets in our S3 buckets,
and the bucket I also want to run
a query on is going to be my S3 access log.
So, I have created a bucket that contains
all my S3 access logs that we enabled from before
and named S3 access logs Stephane 2.
Okay, now I'm going to go to Athena
and we're welcome with a screen.
And as you said, it says, "before you run your first query,
"you need to set up a query result location in Amazon S3."
So this is something you can click on
or if you go to settings, you can also
set the query result location like this.
But, I'm going to use directly the prompt in here.
So, I'm going to set this up, and say, okay,
I need to query, create my query result location.
So, I'm gonna call this AWS Stephane Athena results
and here we're in Frankfurt so I'm gonna say Frankfurt.
Okay, and finally do we want to encrypt the query results
yes or no, and do we want auto complete
as an option, and for now we won't give anything
but we could have encryption and auto complete
if we wanted to, I'm just leaving them unchecked,
and we're just going to go and click on save.
So, now my query results have been saved in here,
and so we can go ahead and start typing some queries.
So, let me go ahead and first refresh
this page so we have the same screen.
Okay, so now the page is refreshed,
and I can go ahead and type my first query.
So what I'll do is that I'll go into my files
in my code and Athena S3 access logs,
and the first thing you have to do is to create a database.
So by default we're working on a default database,
but I want to create a specific database for these queries,
so I'm testing the entire command, create database,
S3 access logs DB, and I click on run query.
Or you can do Control + Enter to run the query as well.
If you don't see the run query button,
make sure to refresh this page
and it will appear automatically.
So now, in my database have access to default
and S3 access logs DB that has been created,
and next what I'm going to do is to copy an entire statement
to create a table named my bucket logs,
and this entire statement was taken from this URL.
So if I go onto the web and open up this URL,
then what I see is how do I analyze my Amazon S3
server access logs using Athena?
And the answer is use this entire query.
So, that's what I'm going to do, I'm just going to go ahead
in here and copy this entire query.
Here we go, all the way to location into my Athena console,
and the one thing I have to do is to replace the location.
So the location here, and you have to replace it too,
is right now S3 target bucket name, slash, prefix.
And for me, all my S3 access logs
are in this bucket and there is no prefix.
So, I'm just going to change this to
S3 access logs Stephane 2, and add a slash at the end.
Okay, so I'm going to run the query
and hopefully the query is successful.
So, once the query has been run, on the left hand
side on my tables, I see there is my bucket logs
that has been created, and if I click on the arrow here
I can see all the different columns
that have been defined for this table.
So, as you can see there are a lot of different columns,
and all these columns have also been defined right here.
So, that makes sense and what we can do is
start visualizing what data there is in this table.
So, I'm going to click here on the three dots,
and then click on preview table,
and this will start a new query called new query 2,
which is select star from, here is
the name of my database, limit 10.
And so what this will do is that
it will display the first 10 rows from my data in S3.
So, as we can see here the really cool thing that happened
with Athena, is that the data never left Amazon S3.
It is in this bucket, but it is being queried
by Athena directly onto my S3 bucket.
So, if we look at the results,
we can see there is a bucket owner,
the name of the bucket, the request date time,
the remote IP, the requester, request ID,
operations, operation et cetera, and the request key URI.
So, all this kind of information we get from before,
you can just visualize it here.
As you can see there, tons of columns in this table,
but we get some good information.
So, what can we do with it? Well, I guess we can do some
more interesting queries that I wrote for this example.
So, I'm going to go to new query 3,
and then I'm going to go to my file, and in here,
I have access to two queries that I wrote.
So, let's copy this first one, and see how we go with it.
So, I'm having select, request U-R-I operation,
HTTP status, count star, from this,
my buckets log, and then we group by it.
So, that seems that if we run the query,
we're gonna get some results around which
HTTP status gave us some HTP code.
So, we have, for example, a post request
after it's 200 we get two of those.
A head request with status 400, we have 20 of those.
A get of 404 we have 91 of those.
So maybe get 404 is not good because it means not found,
so, maybe we want to go ahead and investigate
these 404 further, or, if we scroll down,
we can see get 403 was six, so then we had six times
a file was requested but the access was denied.
So, maybe we want to have a look at these files as well.
So, we can do some also very simple operations.
We can just do select count star,
so I'm just going to go back to the first query.
Now, I'll do select count star from this,
and this will give me how many access logs row I have.
So, I run the query and in here its saying that I have,
and we have to wait maybe a little bit,
331 entries on my S3 access logs.
So, maybe you get something different, obviously,
but this gives you a cool SQL query
language on top of your database in S3.
And then finally, we can do investigate
these 403 errors we've been getting.
So, as we can see there was six and two 403 errors.
So, now if I go into a new query and paste this,
I'm going to see the list of these eight
denied queries and how they're happened.
We can see we have eight rows in here, and we can see
the bucket, the request date time, so when these happened.
We can very importantly see the key that was requested,
so, favico.ico, beach.jpg, and so on.
We can also have a look at a more information,
such as who was the referrer, and so on.
So, we get a lot of good information
to analyze these S3 access logs.
And so, that's the whole power of Athena in here.
By just creating a table on top of our data that sits in S3,
we were able to get a lot of information without
provisioning, for example, an RDS database,
or a Redshift database for anything
to do analytics on top of our data.
So, this what makes Athena very powerful serverless
query engine if you want to troubleshoot,
if you want to get, analyze your logs, and so on.
So, you can play around, for example, if you go in S3 and
you type logs in the search bar.
So, I've created a few logs buckets.
So, if I click on logs, I get my CloudFront logs,
my ELB logs, my S3 logs, my VPC flow logs and so on.
So if you type, for example, Athena analyze ELB logs,
then you get directly a documentation page.
For example, this one to say how to use Athena
to query application load balancer logs,
and you scroll down, and it shows you
how to create the table, and finally,
the entire table is here, and finally,
the simple queries for your ALB logs and so on.
So, have a play with it, it really
shows you the power of Athena.
And then that's it, you understand what Athena is used for,
and hopefully that was helpful.
I will see you in the next lecture.