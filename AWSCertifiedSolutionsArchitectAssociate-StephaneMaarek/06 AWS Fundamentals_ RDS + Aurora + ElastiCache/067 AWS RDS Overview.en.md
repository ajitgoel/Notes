
<v ->So let's get started with an overview of AWS RDS.</v>
RDS stands for Relational Database Service.
And what it means is that it's a managed database service
for database that use sequel as a query language.
So sequel is a structured language,
to query database it's very well adapted,
and it's running on many engines.
So it allows you to create databases the RDS service
in the cloud and these databases will be managed by AWS,
and you get a lot of benefits from it.
So, what types of database engine are managed by AWS?
Well the first one is PostgreSQL, then we have MySQUL,
MariaDB, Oracle, Microsoft SQL Server, and, finally,
Aurora, and we have a dedicated section to Aurora,
so right now you can just forget about it, okay?
But, so, the first five, Postgres, MySQL, MariaDB,
Oracle, and Microsoft SQL Server, you have to remember them.
So, why would we use RDS versus deploying our own database
service on top of, say, an EC2 instance?
Because this is possible.
Well, RDS is a managed service, and as such,
AWS provides a lot of services
on top of just giving us a database.
For example, the provisioning of the database
is fully automated, and so is the underlying
operating system patching.
There is continuous backups being made,
and you are able to restore to a specific timestamp.
It's called Point in Time Restore.
You can also have monitoring dashboards,
to view the performance of your database.
You can have read replicas, and we have a dedicated lecture
on read replicas in this course,
to improve read performance.
You can set up a multi AZ, and so we do have also
sections on multi AZ that will be helpful
for disaster recovery.
You have maintenance windows for the upgrades,
and you have scaling capabilities, both vertical,
by increasing the instance type type,
and horizontal, by adding read replicas.
Filing the storage is backed by EBS, so this is something
we already know, which is gp2 volumes, or io 1.
But the only thing we do not have is we cannot SSH
into the instances, the RDS instances.
So because this is a managed service,
AWS provides a service, and we don't have access
to the underlying EC2 instance.
But this is not too bad, because we get all these things
that we would have to set up on our own,
if we wanted to deploy our own database engine, on EC2.
So, let's talk about RDS backups for a little bit.
Backups are automatically enabled in RDS,
and you have automated backups.
They're daily full backups of the database,
which are done during the maintenance window
that you define.
And then, the transaction logs, the daily transaction logs,
are backed up by RDS every five minutes.
So, these two things together give you the ability
to restore to any point in time, your database.
From the oldest backup, all the way to what happened
up to five minutes ago.
There is a seven day retention of these automated backups
by default, but it can be increased to thirty five days.
And you have database snapshots.
So snapshots are slightly different from backups,
snapshots are backups that are manually triggered
by the user, and the backup retention,
so these snapshot retention,
is as long as you want.
So they're more helpful, if you wanted to retain
the state of your database
for six month at some point in time.
Oh, this isn't just for an overview RDS,
in the next lecture, I want to talk about read replicas
and multi AZ, and then we'll go into hands on.
So I will see you in the next lecture.
Oh, this isn't just for an overview RDS,
in the next lecture, I want to talk about read replicas,
and multi AZ, and then we'll go into hands on.
So I will see you in the next lecture.