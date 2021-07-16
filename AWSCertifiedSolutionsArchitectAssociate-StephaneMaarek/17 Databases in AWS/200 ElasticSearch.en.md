
<v Instructor>So Elasticsearch is an open source technology</v>
and it is sold as a service on AWS.
So what problem does it solve?
Let's first look at DynamoDB.
DynamoDB when you have it, you can only find data
when it has primary key or has indexes
that you create on top of it.
So, you can only find data for the exact match
of the primary key and the exact match of indexes,
and that makes doing queries on DynamoDB
very optimized, if that's what you do.
But if you're doing a search,
then it's not really flexible and not good at all.
So with Elasticsearch,
it's a technology meant as you can expect,
as the name indicates for search.
And so with Elasticsearch you can search any field
and you can even search for partial matches.
So, if your name is John but you just look for J O,
the first two letters of John,
its going to return you a match as well.
So it's a really complimentary to use Elasticsearch
as a compliment to another database.
So you would use maybe DynamoDB to store all your data,
but then to provide a search capability
in your application you would use
something like Elasticsearch.
Elasticsearch is also now commonly used
for big data applications although
I won't go too deep into it.
You can provision a cluster of instances
and has built-in integrations for data ingestion.
So you can get Kinesis Data Firehose, AWS IoT,
and CloudWatch Logs.
Finally, you get security through Cognitos and IAM,
KMS encryption, SSL &amp; VPC security.
It also comes with two other tools,
called Kibana for visualization
and Logstash for log ingestion.
And together Elasticsearch, Kibana and Logstash
makes the ELK stack.
So going into the exam, just remember
that Elasticsearch allows you to search any field.
Now, from a solutions architect perspective,
according to the pillars,
while the operation is going to be similar to RDS,
security is done through Cognito, IAM, VPC, KMS and SSL.
So it's a bit different than other technologies here
because we have Cognito and then reliability
well we get Multi-AZ and clustering
and performance, it's really hard to evaluate (laughs),
but it's based on the Elasticsearch project
which is open source and really, really good performance
and AWS says that the Elasticsearch service
can scale two petabytes of data.
So that means that it's really, really good
as terms of performance.
The cost is going to be pay per node provisioned.
So based on how many instances in your
cluster you provision you're going to pay for them,
so its similar to RDS.
And remember going into the exam,
Elasticsearch is greatly used and it's a great fit
when it's for search and indexing capability.
So that's it for this lecture.
I will see you in the next lecture.