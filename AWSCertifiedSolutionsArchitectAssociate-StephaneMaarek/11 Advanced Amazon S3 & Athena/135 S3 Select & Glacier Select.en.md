
<v Instructor>Quick theory lecture on S3 Select</v>
and Glacier Select.
The the idea is we want to retrieve less data,
so subsets of what we're requesting using SQL
by performing server side filtering,
and so the SQLs queries are quite simple.
They can only be used to filter by rows and columns
so they're very simple SQL statements.
You cannot do aggregations or anything like this,
and you will use less network and less CPU cost client-side
because you don't retrieve the full file.
S3 will perform the select, the filtering for you
and only return to you what you need.
So the idea is that before you have Amazon S3
sending all the data into your application
and then you have to filter it application-side
to find the right rows you want
and only keep the columns you want,
and after you request the data from S3 using S3 Select
and it only gives you the data you need,
the columns you want and the rows you want
and the results Amazon is telling you is
that you are up to 400% faster and up to 80% cheaper
because you have less network traffic going through
and the filtering happens server-side, okay.
So similarly, let's just do another diagram.
We have the client asking to get a CSV file
with S3 Select to only get a few columns and a few rows.
Amazon S3 will perform server-side filtering
on that CSV file to find the right columns
and the rows we want
and send back the data filtered back to our client,
so obviously, less network, less CPU, and faster,
so this is great.
To summarize from an exam perspective,
any time you see filtering of data server-side
in S3 to get less, think about S3 Select English or select,
that works on Glacier as well
and then for more complex querying,
that's gonna be server less on S3,
you'll see in the future lectures
we have something called Amazon Athena.
All right.
That's it. I will see you in the next lecture.