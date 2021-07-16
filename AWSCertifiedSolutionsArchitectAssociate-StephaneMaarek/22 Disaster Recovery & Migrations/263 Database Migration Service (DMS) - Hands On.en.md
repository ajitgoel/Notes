
<v Instructor>So let's go into DMS</v>
to see how a database migration would work.
We obviously do not have a source in a target database,
so we will not be able to do it entirely,
but it's good to see the options
just to cement what we just learned.
So we need to name our replication, so our FirstReplication,
and then in the description we will not put it.
The instance class which represents the EC2 instance class
that is going to be pulling the data from targets
all the way from the source to the target,
and as we can see we can, from a t2.micro
all the way to some larger instance, such as r4.8xlarge.
So the idea it that if you have a big source database
you may want to have a big instance class in the middle
to perform all the replication continuously fast enough.
Then the engine version for DMS that we want to use.
How much storage is going to be on that instance,
because it needs to buffer
and write some log files and so on,
so maybe you want to have a big storage
if you have a big source database.
A VPC to deploy this database in,
and we can be fully resilient by choosing Multi AZ,
in which case we have a Multi AZ deployment
and we'll have a primary instance in one AZ
and a standby instance in another AZ.
So that makes DMS a Multi AZ service
that is going to be fault tolerant and highly available.
And do we want our DMS instance to be publicly available,
or do we want it to be privately available, okay?
Then we have advanced security and network configuration
where we can choose our subnet group,
we can choose a preferred AZ,
the VPC security groups and so on,
and a KMS key for encryption.
As well as a maintenance hour
in case we need to perform updates to our DMS instance.
And then we go ahead and click on Create,
and we would have our first instance.
Obviously, this will cost you money
if you click on Create, so I will not do this.
And then finally, once everything is done,
you can create a database migration task,
and you would go ahead and create this task.
So we will say MyTask,
and we need to choose a replication instance
that we would have created in the past section.
So choose a database source endpoint.
So for this we would go to the Endpoint tab,
and here we would be able to define
all the source and target endpoints.
So for a source endpoint and a target endpoint
we could choose an RDS DB instance
or enter some information directly.
And for the source we can see
all the technologies that are supported.
Same for the target, all the technologies
that are supported right here.
Makes sense, right?
So we'll say for example, okay,
our first instance is going to be an oracle,
and then we'll say MyOracle.
And obviously we would need to enter some information
such as the server name, the port,
the username, the password
that allows us to start getting into our support database
to perform the replication.
Some endpoint specific settings if we need to,
KMS master key for encryption,
and Test to connection to make sure it works.
We could create a source and a target endpoint.
So back into our migration task now,
we would select that source and the targets,
then we would want to migrate existing data,
and maybe do some replication for ongoing changes,
which is CDC for change data capture.
And then we would have more options,
but we're not going to set them up.
And the idea is that when you're done,
you would create the task.
Now you should remember
that if the source database endpoint
is different than the target database endpoint,
then it would internally use SCT,
for Schema Conversion Tool,
to make sure that the data at the source
is going to be compatible,
and transforming to the right format
for the data at a target.
So that's it for DMS.
Hope you see you'll have two databases to play with.
But you get the idea,
and I will see you in the next lecture.