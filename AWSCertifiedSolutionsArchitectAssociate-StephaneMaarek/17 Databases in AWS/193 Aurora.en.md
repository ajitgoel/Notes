
<v Instructor>Okay now we have Aurora.</v>
So Aurora we view it in depth as well
and it's a database managed by AWS
it's under the RDS service for now
and the API is compatible for either PostgreSQL or MySQL
so we get compatibility for these two type of databases.
The data though is very different
it's held six replicas across three AZ
so there is a lot of durability for our data
and it has some auto healing capabilities
so the underlying architecture of Aurora
we don't exactly know but we know it's really really good
and there is some kind of auto healing capabilities
so even if we lose one replica
Aurora and Amazon will automatically recover that for us.
There is multi AZ available by default
and auto scaling read replicas
so it gives as less operations to do
and we get seemingly better performance
and the read replicas can be global which is really nice
and you can also have a global Aurora database
which can be used for disaster recovery purposes
or latency decrease purposes.
Overall the auto scaling of storage
is a really nice feature on Aurora
so no need to worry about sizing the storage
the right way the way we did for RDS
so auto scaling can go from 10 gigabytes
all the way to 64 terabytes of data
so it's a consistent sizable amount of data
that we can have in Aurora.
We define an EC2 instance type still for the Aurora
instances where we can change that in the future.
And then we get the same security,
monitoring and maintenance features as RDS.
Finally there is this option for Aurora Severless
so this is a bits of forward thinking here
but just remember
that there is this option as Aurora Serverless
which removes all the need to manage servers.
Overall the use case is gong to be the same a RDS
but here you are looking for more
at a enterprised grade database maybe replacing Oracle
and you want less maintenance more flexibility
and more performance but it's gonna be a little bit pricier.
Overall AWS is pushing for Aurora to be used
instead of RDS instances
and I do like Aurora better personally
if I were to create a enterprise grade application.
Now from a solutions architect perspective
based on the five pillars of the well architected framework
well operations definitely compared to RDS
we get less operations
and there is auto scaling of storage
so we basically don't need to think too much about aurora
we just set up the aurora database
and setup auto scaling for maybe real replicas
and we are done.
We will have a database that will not need many operations.
In terms of security
well we have a kinda have the same security for RDS
and we can authorize basically users in database use SSL
I mean its pretty much the same as RDS.
For reliability now it's more reliable,
it's multi AZ, highly available
we have six replicas of the data
so it's possibly more highly available than RDS
and then we even have Aurora Serverless option
if you want to have even more reliable
unless operations type of option.
For performance AWS boasts five X performance
of five times the performance
due to the architectural optimization they've done
around how they designed Aurora
and we can have up to 15 read replicas verses five for RDS
so seemingly we get much better perfomance
and much better scaling on aurora than we do for RDS.
Finally for cost we still pay per hour
based on the EC2 instance type of operation
and the storage usage
but it is possibly a much lower cost
compared to an enterprised grade database such as Oracle
for even better performance.
So this gives you an idea
of why Amazon is pushing for Aurora to be used on RDS
is because aurora is less maintenance more performance
more reliability and possibly similar costs
or a little bit ahead of cost
but probably worth all the performance increase.
So that's it for this lecture I hope you enjoyed it
and i will see you in the next lecture.