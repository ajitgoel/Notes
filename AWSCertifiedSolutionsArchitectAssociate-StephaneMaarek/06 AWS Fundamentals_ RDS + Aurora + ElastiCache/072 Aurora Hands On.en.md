
<v Instructor>So let's create an Aurora database.</v>
And we are in the new interface.
So there was an old interface.
And now we can switch back to the old one.
But I'll keep the new so that
the video is more compatible with you.
And so we're going to create an Aurora database.
So we can do a standard create to configure everything
or an easy create but obviously,
we want to configure everything.
So we'll go into standard create,
I'll choose Aurora and then you have to choose
either if you want aura with MySQL compatibility,
or PostgresSQL compatibility.
So these are the only two modes you can have Aurora with.
So we'll choose MySQL because it has more options.
But whether you choose MySQL or Postgres,
you can see there's a version drop down,
and you can choose the version you want.
Now, for this hands-on, I'm going to use MySQL,
because it has the most features for Aurora to demonstrate.
And then for the version, I'm going to use 5.6.10a.
And the reason I do so is that if you look
in between here, for example,
we have a database location, regional, global,
but if I select next version,
for example, if I select this one,
I don't have that feature anymore,
so I don't demonstrate as much.
So if you wanna follow along with me,
remember, by the way that this is not a free hands-on, okay,
this is something you'll have to pay
because Aurora is not part of the free tier.
But just to see the options you can follow along
so, choose Aurora MySQL 5.6.10a,
just you have an option on the database location.
So regarding database location,
you can either have a Regional Aurora a database
within a single region
or you can choose a Global Aurora a database
in multiple AWS regions,
in which case the rights are going to be replicated
to your other regions within one second.
And there is a way for you,
in case there is a regional outage,
to failover to a different region
by separating the different region as its own cluster.
So we'll keep it as regional for now
because it also shows us a lot of cool features
we can get out of Aurora.
So here we have to choose the database features
and we can see there's four different modes we can use,
either we have one writer and multiple readers,
which is the one I explained to you,
which is the most appropriate
for general purpose type of workloads.
But we can also have one writer and multiple reader
parallel query to analyze,
to improve the performance of analytics queries,
you have multiple writers, where you can have
multiple writers at the same time in Aurora
this is when you have
a lot of writes happening continuously.
And finally, you have serverless,
which is when you don't know how you will need Aurora
you have an unpredictable workload,
maybe you need a little bit in the morning,
maybe need a lot at night,
it's in which would be more scalable,
in which case you would choose serverless
and this would be a great option.
So regarding the exam,
the one you should know definitely
are going to be the general one,
and the serverless one, okay.
So we're going into the general one configuration
'cause there is more configuration to do
than the serverless.
So for the general one, we can go to either production,
or dev/test, and these are like templates prefilled
that will fill the settings in the bottom,
so I'll choose production, and we'll go one by one.
So in terms of the DB identifier,
you can call it whatever you want,
I'll call it to My Aurora DB.
And then if I scroll down, then that's the username,
I'm going to use something that I know.
For example, I'm going to use Stephane.
And then for the password,
I'll use password just like before.
So password in here, password, okay, great.
So next, I'm going to scroll down.
And we have the DB instance size.
So this is where you choose
the performance of your database.
So you can choose either memory optimized classes
with r and x classes.
So you can see all these instances in this drop down,
or we can have burstable instances
are going to be cheaper and includes a t classes.
So a t2 small is going to be my cheapest option,
right now for this demo so that's why we're choosing.
But as you can see, based on the workload you're having,
you know, if you have a production type workload,
memory optimized is definitely going to be better,
if you're doing dev and test
DB t2 small is going to be probably a better option
with the most cost saving,
but still not a free tutorial to do this one.
Okay, now let's talk about availability and durability.
So we can create Aurora read replica
or reader note in a different AZ
Which is great because if an AZ is down,
then we can failover to different availability zone.
And that gives us high availability.
And so this is why it says multi AZ deployments.
So we can create one, or don't create one.
Regardless if we do so the storage itself
is across multiple AZ.
That's a feature of Aurora.
But it's more about getting your instances of Aurora
into across multiple AZ.
And if you want a multi AZ deployment,
then please enable this.
And I will keep it as is because it's a good option,
but obviously a more expensive one.
Then for connectivity,
so where do you want to deploy your Aurora cluster
in your VPC and then
what do you want to have in terms of subnets?
Do you want to be publicly accessible, yes or no?
I'll leave it as no, we won't connect to it.
And then you want to default security group
or create a new one.
It's up to you to choose whatever you want.
This is not important.
We won't connect to this database anyway,
I just want to show you the options.
And finally, you have a lot of additional configurations.
Okay, so the DB instance identifier,
you could for example, have it as a,
this one, this is great.
The initial database may be Aurora.
And then you could specify parameter groups.
These are not in scope for the exam,
you can define a preference for failover
but we won't do that.
Backup is really great if you want to have
snapshots of your database,
and you want to restore from them.
So they're great for disaster recovery.
So you can set up the retention you want for your backup
between one day and 35 days.
Okay, then encryption.
So do you want your data to be secure
and encrypted with KMS
and this is a great option if you want to make sure
that your data is not accessible by anyone, even AWS.
So encryption is maybe something you want to enable.
And then finally backtrack which is allowing you to use,
to actually go back in time for your database.
So if you did some bad commits, some bad transactions,
you can go back in time, which is a nice feature.
We won't enable it right now.
Monitoring, to monitor database with a high,
with an enhanced monitoring with a high granularity.
And finally, the log exports and so on.
So as you can see, there's a lot of different options.
Finally, maintenance for the maintenance windows
and the upgrades of the version,
which are very similar to what we get in RDS normal.
And finally, the last setting is deletion protection
to ensure that we don't delete this database, mistakenly,
by just right, by just clicking delete,
no, we have an extra step to make sure
that we don't do that.
So when we're ready, and we've seen all the options,
so from an exam perspective, again,
the very important ones are going to be around multi AZ,
it's going to be around the fact that you can have
one writer and multiple readers or serverless.
These are going to be the important points of Aurora.
Okay, so when we're ready,
we'll just create the database.
And here we go.
Okay, so it took a bit of time,
but my Aurora cluster is now created.
So as we can see, we have a regional instance of Aurora.
And we have a writer database and a reader database.
So remember, the writers and the readers are separate.
So I'm going to click on this Aurora database
to get a bit more details.
And as we can see, we have two endpoints here.
We have a writer endpoint
and then we have a reader endpoint.
And we know it because it says minus r o here,
which means read only, okay.
So this is recommended to use the writer endpoint
to write to Aurora and to use a reader endpoint
to read from or regardless of how many databases you have.
But if you wanted to,
you could click on this database itself
and get the endpoint to connect to it.
But this is not recommended,
what the recommended way and what the exam will test you on
is that you should select an endpoint
that is either the writer endpoint to write
or the reader endpoint to read.
Okay, you can have lots of options in here,
we won't go over them we have seen the main ones.
Lastly, we can have a bit of fun,
and we can on the top right,
either add a reader so I have to cross region read replica,
create a clone or add replica auto scaling
to give us some aspect of elasticity.
So I'll say my scaling Aurora,
and then you could select for example,
a target CPU utilization of 60%
For your scaling, which looks a lot like what we had for
auto scaling groups,
and we could also specify additional configuration
through the cooldown period, the scale in and so on.
And finally, the min and the max capacity,
we'll leave it as is and add the policy.
And all of a sudden, we have added auto scaling
to our Aurora database.
That was really simple
and now we have a fully functional Aurora database.
So before finishing this hands-on,
if you did create a database with me,
please make sure to delete it,
so you don't spend some money.
So to do so, you click on this one and you delete it,
you delete this one instance.
So you type delete me and do the same,
you have to do the same with the reader endpoint
so actions, delete, and then say delete me,
and this can take a bit of time.
Okay, so now if I refresh,
I can see my database and have zero instances
but you completely delete it.
I cannot do it right now because deletion protection is on.
So I click on modify
and then at the very bottom of this page,
I'm going to disable deletion protect
and I'll click on continue.
And then I will apply this immediately
to make sure that I do have disabled my deletion protection.
And so now if I click on my database
and under actions, I'm able to delete it.
Do I want to take one final snapshot?
No, I'm fine,
and then I won't recover my data.
That's fine and I'll delete the database cluster.
And I'm done.
So that's it for Aurora I hope you liked it
and I will see you in the next lecture.