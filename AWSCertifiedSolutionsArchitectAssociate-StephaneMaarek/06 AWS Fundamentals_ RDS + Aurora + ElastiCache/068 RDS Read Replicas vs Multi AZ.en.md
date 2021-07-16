
<v Speaker>Going into the exam,</v>
it's going to be extremely important
to understand the difference between RDS Read Replicas,
and Multi AZ
and understand exactly the use cases for those.
So this lecture is really dedicated
to understanding Read Replicas and Multi AZ.
So let's get started with the Read Replicas.
Read Replicas, as the name indicates,
help you to scale your reads.
So let's have an example.
Here we have our application
and we have an RDS database instance.
And our application performs, reads and writes
to our database instance.
But say we want to scale the reads
because that main database instance cannot scale enough.
It receives too many requests.
Well we can create up to five Read Replicas,
and they can be within the same the same availability zone,
cross the availability zone or cross-region.
So three different options
and they're very important to remember.
So say we have another RDS instance Read Replica,
and another one, and what will happen
is that there will be an asynchronous replication
between the main RDS database instance,
and the two Read Replicas.
Asynchronous, that means that the reads
are eventually consistent.
What that means is that,
for example, if your application
reads from the Read Replica,
before they had their chance to replicate the data,
then you may get all data.
And this is why it's called
eventually consistent asynchronous replication.
And these replicas, they can be awesome!
For reading, for scaling your reads.
But they can also be promoted to their own database,
so you can take one of these replicas
and say, okay I wanted to be its own database now
and take rights.
And so you promote it to its on database.
It's completely out of the replication mechanism after that.
But, it lives and has its own life cycle afterwards.
So in case you want to use Read Replicas,
the main application in orange, in the top of the screen,
must update the connection string to leverage
the list of all the Read Replicas
you have in your RDS cluster.
Okay, very nice.
So let's talk about the classic use case
for your Read Replica.
So in this example we have a production database,
and it is taking on normal load.
So here we go.
Our production database is having read and write,
to our main RDS database instance,
and the new team comes in,
and say we want to run some reporting,
and some analytics on top of your data.
And so if you plug in that reporting application
onto the main RDS database instance,
then it's going to overload it,
and possibly, slow down the production application,
and you don't want that.
So instead what you do as a solutions architect,
Is you create a Read Replica to run the new workload there.
So you create a Read Replica,
there is some asynchronous a replication
that happens between your main RDS database instance
and your read replica.
And then you're reporting application can just do reads
from your Read Replica and run the analytics there.
The production application is completely
unaffected in this case.
And that's perfect!
So remember if you have a Read Replica,
you need to ensure that it is only
for select type of statements,
and select is a sequel keyword.
Select means read and so you cannot use keywords
such as, insert, update or delete,
which change the database itself.
Okay, Read Replicas is only for reads.
Next let's talk about Read Replicas network costs,
'Cause this is something that very, very few people know.
In AWS there is a network cost when your data,
your network, goes from one availability zone
to another availability zone.
So we have two for example.
We have AZ 1 and AZ B,
us-east-1a and us-east-1b, okay?
And we have our main RDS database instance in 1A,
and our read replica in 1B.
As we replicate the data from 1A to 1B, asynchronously.
Because the data goes from one availability zone,
to another availability zone,
then it's going to go across AZ,
and so is going to cost us a lot of money.
But if you want to reduce the cost,
you can have your Read Replica be within the exact same AZ.
So let's look at this example,
we have one AZ this time so,
us-east-1a and we have our read RDS database instance
and the Read Replica within the same AZ.
Now when we perform asynchronous replication,
within the same AZ, the network cost is free,
because the network stays within your same AZ.
Okay?
I think that's makes a lot of sense,
but you have to say it once to really see it.
Finally let's talk about RDS Multi AZ,
and Multi AZ is mainly used for Disaster Recovery.
So we have our application and it performs,
reads and writes to our Master database instance,
which is an availability zone A,
and what we're going to have is asynchronous replication,
to a standby instance in AZ B,
and it will replicate every single change in the Master,
synchronously.
So that means that when your application writes
to the Master,
that change needs to also be replicated to the standby
to be accepted.
And so what we get out of it is one DNS name.
So your application talks to one DNS name,
and in case there is a problem with the Master,
there will be an automatic failover to the standby database.
Thanks to that one DNS name.
So thanks to this, we increase the availability,
this is why it's called Multi AZ.
And they will be failover in case we lose an entire AZ,
or we lose the network,
or there is an instance or storage failure
for the Master database,
in which case obviously the standby database
will become the new Master.
You don't need to do any manual intervention to your apps,
as long as it tries to keep on connecting to you database
automatically, at some point it will failover to the standby
that will be promoted as the Master,
and you'll be good.
And it's not used for scaling.
So you can see here,
the standby database is just for standby.
No one can read to it, no one can write to it.
It's just here, as a failover, in case anything goes
on with your Master database.
So quick question is,
is there a possibility to have the Read Replicas
being set up as Multi AZ for Disaster Recovery?
And the answer is yes.
You can set up your Read Replicas as a Multi AZ
if you wanted to,
and that is a common exam question.
Okay?
So that's it for the difference between Read Replicas
and Multi AZ,
but you need to absolutely understand this going to the exam
because a lot of questions will go,
and be about it.
Alright that's it, I will see you in the next
lecture for some hands-on.