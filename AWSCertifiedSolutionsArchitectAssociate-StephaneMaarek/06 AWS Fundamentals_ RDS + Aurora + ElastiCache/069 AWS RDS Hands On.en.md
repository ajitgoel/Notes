
<v Lecturer>Okay, so let's go ahead and play with RDS.</v>
So I'm going to go to the RDS service
and we are going to create our first database in RDS.
So we'll go to the Databases tab
and we'll click on Create database.
Now we are getting into this new interface
and we need to create a database.
Now we have the Standard Create or the Easy Create.
Obviously we want to learn how RDS works
so we'll not go into the Easy Create
because this will set up everything for us.
We want to know all the options
and understand how we can tune them one by one.
So we'll go into the Standard Create.
Now as we scroll down
we can see we have six different engine types at the moment.
We have Amazon Aurora, MySQL, MariaDB,
PostgreSQL, Oracle and Microsoft SQL Server.
So if you want to use the free tier with RDS
Aurora does not work.
Aurora is the new kind of offering by AWS for databases
and it is not compatible with the free tier.
So we'll not use Aurora.
In this lecture we'll be using MySQL
because it is free tier compatible.
You could also use PostgreSQL if you wanted to
but for this hands-on it will be MySQL.
So we'll use MySQL Community
and we'll use a recent version for example 5.7.22.
Now scroll down and then we can have templates.
So do you want it to be ready for production,
Dev/Test or Free tier?
So obviously we want to implement with the new features.
So I'll click on Free tier.
And this will come with a few values already set up for us.
But we'll still go ahead and scroll down
and see what we can do with it.
So first we need to name our database
which is a database instance identifier.
And this needs to be unique across your region.
So I'll just call it myfirstmysql.
Then we need to specify credentials for the master username.
So in this case I'll choose stephane
and then for the master password
I'll choose something very simple, for example password.
And I'll enter the password again.
So this is for the master logging in your database
and it will have admin power in it.
Now we need to scroll down and look at the DB instance size.
So because we are in the free tier
we want to only have the option to do a db.t2.micro.
So all the other options are grayed out
for the very reason that we have specified
that we wanted free tier.
So it's a safety.
But if you click on Dev/Test or Production,
then you would have access
to all the different kind of instances in here,
we can choose standard class or memory optimized and more.
So in this case though, we'll continue with db.t2.micro,
which has one vCPU and one GB of ram.
Then we need to learn about
how much storage we want for our database.
In our case we want SSD storage and 20 GB.
This is something that is available only for free tier
so it can be up to 20.
And sometimes you get these really weird UI quirks.
So if you get this just increase to 21 and back to 20
and it will be fixed.
Okay.
Now for the storage autoscaling
we can enable storage autoscaling.
That means that if we keep on writing to our database
and we reach this 20 GB of storage
it will automatically increase it for us
so we don't have to do it for now,
but I will disable it and we'll go right back to 20.
Okay.
Now for the availability and durability
what do we do?
Do we want to have multi-AZ?
So multi-AZ as we saw is a way to have
a stand-by database instance
ready for use in case a availability zone goes down.
And so this is something we definitely want in production.
But this is not something that's available for us
when we do the free tier.
Therefore this option is disabled.
But if we wanted to have production
and wanted to make sure that one AZ could go down
and then we could still use our database
definitely using multi-AZ deployment will be the way to go.
Now for connectivity, you launch your database in a VPC
or Virtual Private Cloud, and so as such
we'll use the default VPC that's been created for us
when we created our account, to launch our database.
We can specify additional connectivity configuration.
And one that's very important is whether or not
we want this database to be publicly accessible.
So in most cases you will not want your database
to be accessible publicly
because you just want it to be available
within your Virtual Private Cloud or VPC.
But because that we want to connect
in this hands-on to our database just to show that it works
we'll use yes
and we'll allow connections to our database
directly from our machine.
Now for security group
we can choose an existing security group or create a new one
that will be directly created for us, for this database.
So I'll just enter my first RDS security group, SG.
And then where do we want this database to be created?
No preference,
but we could choose it in eu-west-3a, 3b or 3c.
Okay.
Finally the database port is the standard port for MySQL
which is 3306.
We'll scroll down and we could look
at the additional configuration.
So the initial database name will have mydb.
This will be automatically created by RDS.
The parameter group we don't touch right now.
We could have IAM db authentication,
so that means that we could connect
to our database directly using IAM users and roles,
but we won't enable it right now,
we just need to remember that it is an option.
For now we'll just connect to our database
using the standard username and password
that we have created from before.
But it's good to know that it's an option.
And then do we want to have backups?
Yes, we want to have automatic backups.
And how much do we want to retain these backups for?
Seven days all the way to 35 days.
So I'll just keep it at seven days.
The backup window, so do we want to specify
a specific window of time when we want RDS
to perform our backups, or do we have no preference?
I'll just keep no preference.
Then finally do we want Enhanced monitoring,
to get more metrics, such as number of threads and so on.
Log exports if you wanted to export the logs
into a service called Amazon CloudWatch Logs.
And the IAM role to do all this stuff,
we won't need to specify it, we only need to do it
if we had ticked one of these boxes.
We'll scroll down.
Do we want to enable auto minor version upgrades?
Does it mean, because RDS is a manage service
we definitely want it to automatically upgrade
our database for minor versions automatically.
And it will happen
during the maintenance windows of the database.
And for the maintenance window, what preference do we have?
We want to have a specific day, start time and duration,
or do we have no preference.
Finally, last one, and we're all good to go.
We'll have deletion protection.
And if we click on this,
that means that we won't be able to delete our database
without removing first the deletion protection.
So I'll leave this unticked for now.
So here we go,
we see that this RDS is within the free tier,
we get t2.micro instance, so this is good.
So what we have, single-AZ, it's not multi-AZ,
20 GB of SSD and 20 GB of automatic backup storage,
and so on.
So I'll click on Create database.
And here we go, the database should be created.
And this may take a few minutes to launch
so I'll be right back by clicking on the database right here
I'll be right back when this is done.
So while my instance is still being created
I want to show you a little SQL program I like
which is called Sqlelectron,
and Sqlelectron is basically a DB client.
Free database.
And so it works for Linux, Macs and Windows,
that's why I like it.
And it gives you a GUI, so a Graphical User Interface
to connect to your database.
So I invite you to download the GUI
and then install it on your computer.
Basically you go onto this GitHub page,
and here if you are on Mac you use the DMG,
if you are on Windows you use the WIN package
and if you're on Linux you can use SH package
or the DBN and the RPM.
So once you download it and install it
after this my Sqlelectron is installed
and I click at add, and here I can add a connection.
So I can connect to my RDS database,
and just the name for it, and I created a MySQL database.
Now we need to put the Server Address, the port and so on.
So for this we can go back to our page
and now we can see that the instance is backing up,
so it's been created.
And if we scroll down, all the way down
we can see a Connect block with the endpoint.
And the endpoint is basically the URL I need to use
to connect to my database, and the port is 3306.
And it's publicly accessible, so I should be able
to access it from within my computer.
So let's hope for this.
I copy this and put the Server Address right here
and then the username is going to be stephane
and the password is going to be password.
So it all looks good.
No we'd be able to enable SSL
if we wanted to be having a secure connection,
but for now we're good.
So we'll just click on Test and the connection test
said that it's successfully connected.
Happy days.
I save it, and I connect to my database
and here I am, I am in my database.
And we can see that there's mydb on the left-hand side.
This is the database that was created first for us.
You don't need to be a SQL expert to use MySQL or database,
but this is not the course about SQL anyway.
So as soon we're connected, we know everything worked
and that's about it for the hands-on.
Okay, what you should know about is that
all the connections and options you had
when creating this RDS database,
the fact that there is a security group that was created
for your instance and you can click on it
to go and see the details of your security group.
So we can see that it authorizes my IP on the port 3306,
which is good.
And you can see all the network and security configuration,
if you're backup, if you're multi AZ, etc etc.
So this is quite nice.
The last thing you can do is do instance actions,
and as you can see on the right-hand side
we could stop it, reboot it and create a read replica.
So if we wanted to create a read replica
we could just click here and have a second database
that we can connect to just for reads.
We can also take a snapshot
to basically take a backup on ourself.
And then restore to point in time using the backups,
and migrate a snapshot
if you wanted to move the snapshot away into another region.
So I hope that was helpful.
That was a quick overview of RDS
but we're able to create a database MySQL,
connect to it using Sqlelectron.
And basically this is a database that's available
for applications to be used, if they need to have one.
Okay.
So that was it.
Hope you enjoyed it and I will see you in the next lecture.