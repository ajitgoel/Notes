
<v Lecturer>So now let's talk about RDS Security</v>
and the first topic I want to talk about is Encryption.
So we have at rest encryption,
which is data that's not in movement
and there's a possibility to encrypt the master database
and the read replicas using AWS KMS,
which is the key management service
of AWS using AES-256 encryption.
So when you do encryption you define it at launch time
and if the master is not encrypted,
the read replicates cannot be encrypted.
So there is a common scenario question of the exam as well.
You can also enable Transparent Data Encryption,
also called TDE for Oracle and SQL Server
and that provides you an alternative way
of encrypting your database.
Now there's in-flight encryption
which is always going to be around SSL certificates
and they're used to encrypt data to RDS while in-flight.
So while being sent from your clients into your database.
For this, you provide SSL options with a trust certificates
when connecting to the database
and you will have established an SSL connection.
To enforce SSL to make sure that all the clients
must use SSL, if you're using PostgrSeQL,
there is a console Parameter Group you need to set
called rds.force_ssl=1, that's pretty explicit
and you're using MySQL.
Within the database, you need to run this SQL statement
called the GRANT USAGE ON *.* TO 'mysqluser'@%'REQUIRE SSL.
Again, it's pretty obvious what it does.
Just so you know, PostgreSQL is a Parameter Group
and MySQL is going to be a SQL command within the database.
So there are some RDS Encryption Operations
that you should know.
And the first one is; how do I encrypt an RDS backup?
So something you should know is that if you have
an un-encrypted RDS database and you take a snapshot of it,
then the snapshot itself will be un-encrypted.
And similarly, if you take a snapshot
of an encrypted RDS database,
then by default all the snapshots are going to be encrypted
by default all the time.
And so what you can do, though, is copy a snapshot
that is un-encrypted into an encrypted one.
So if you take a snapshot of an un-encrypted RDS database
and you copy it, you can create an encrypted version
of that snapshots, fairly easy, right?
So now that brings us into; how do we encrypt
an un-encrypted RDS database?
Based on the information received,
the first thing we do is that we create a snapshot
of an unencrypted RDS database, which will be un-encrypted
and then we'll copy the snapshot
and for the copied snapshots will enable encryption.
So now we have a copied encrypted snapshot.
And thanks to that encrypted snapshots,
we can restore the database from the encrypted snapshots
and that will give us an encrypted RDS database.
And then we just migrate all our applications
from the old un-encrypted RDS database
to the new encrypted RDS database
and we'll delete the old database.
And that is some operations you should know.
So fairly simple, you just see it once
and when it comes up in the exam, you know about it.
So now let's talk about Network and IAM Security.
For Network Security, well, our RDS database
are usually deployed within a private subnet,
not a public one.
So make sure not to expose your database
to the World Wide Web.
And RDS Security works by leveraging security groups
that you attach to your RDS instance,
they're exactly the same concept as for EC2 instances
and it controls which IP or which security groups
can communicate with RDS.
for Access Management, which is user management
and so on and permissions,
you have IAM policies,
they help you only control who can manage AWS RDS,
so who can create a database,
who can delete a database,
who can create or read replica and so on.
And for traditionally connecting to the database,
you need to use a Traditional Username and Password,
okay, to log into the database
or as we'll see in the next slide
for just RDS, MySQL
and RDS, PostgreSQL,
you can use IAM based authentication, okay?
So bottom line is,
the database security usually is from within the database.
Now let's talk about how we can connect to RDS
using IAM Authentication.
So as I said, it is only for MySQL and PostgreSQL
and you don't need a password this time.
You just need something called an authentication token
and that can be obtained directly
using IAM and the RDS API calls,
we'll see this in the diagram in a second.
And the authentication token, because it's short lived,
it has a lifetime of 15 minutes.
So here's the example;
we have our EC2 security group and our EC2 instance
and then we have our MySQL RDS database
in RDS Security Group.
So the EC2 instance will have something called an IAM Role
and we'll see what that means when we get deep
into IAM Roles for EC2.
But the idea is that, the EC2 instance,
thanks to that IAM Role, is going to be able to issue
an API call to the RDS service
to get back an authentication token
and using the token, it's going to pass that token
all the way to while connecting to the MySQL database
and make sure the connection is encrypted, by the way,
and then it will connect securely
to MySQL database, fairly easy.
The benefits of this approach is that
the network in and out must be encrypted using SSL.
IAM is going to be used to centrally manage users
instead of managing users from within the database.
So it's a more central type of authorization.
And you can leverage IAM Roles and EC2 instances, profiles
for easy integration and as I said,
we'll see what IAM Roles
and EC2 instance profiles are very, very soon.
So, summary for RDS Security;
you have encryption at rest,
which is done only when you first create
the database instance.
And if it's, by the way, un-encrypted,
you need to create a snapshot, copy of the snapshots
to encrypt it and then you create a new database
from the encrypted snapshot
and that will encrypt your database.
And your responsibility is to check all the ports,
IP security groups, inbound rules,
free database security group
or take care of all the in-database
user creation and permissions
or, as we saw from before, managing through IAM
for MySQL and PostgreSQL,
create a database with or without public access,
so is it going to be in a public subnets
or in a private subnets,
ensure the parameter groups and the database
is properly configured to only allow SSL connections,
so making sure encryption is happening.
And what is Amazon's Web Services responsibility?
Well, it is to make sure that you don't have SSH access,
that you don't have to do a DataBase patching,
you don't have to do OS patching, the (mumbles)
will do this for you,
and you don't have a way to look at the underlying instance.
Again, that is it's responsibility.
So the RDS is a service offered to you
and you can leverage it or not,
but to me, honestly, it's one of the best service of AWS,
so it makes a lot of sense to use RDS.
All right, that's it for this lecture.
I will see you in the next lecture.