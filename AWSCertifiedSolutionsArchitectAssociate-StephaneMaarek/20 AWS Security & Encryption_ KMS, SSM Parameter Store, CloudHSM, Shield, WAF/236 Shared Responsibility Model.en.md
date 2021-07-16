
<v Narrator>So first let's talk about something</v>
that I think you should know already.
It is the AWS Shared Responsibility Model.
So let's understand what is your responsibility,
and what is AWS's responsibility.
So, Amazon's responsibility is to secure their cloud.
That means that they need to protect their infrastructure.
And that means everything, the hardware, the software,
the facility, the networking that runs all their services.
So they're responsible for the data centers,
they're responsible for their wire,
they're responsible for their network.
Everything like this.
They're also responsible for services like
S3, DynamoDB, RDS, et cetera.
They're basically responsible for anything they manage
and they advertised as a managed service.
Yet, they're not responsible for everything.
You are also responsible for the security in the cloud.
That means, that for example, for the EC2 instance,
you're responsible for the management of the guest OS.
That includes all the security patches and the updates.
You're responsible for the firewall,
so that means a security group.
And the network configuration, that means the ENIs.
And you're responsible for the IAM roles,
et cetera, et cetera, et cetera.
So I think that's pretty clear.
Amazon does not give you access to their hardware,
they don't give you access to their network,
they don't give you access to their facility.
So that's for them to manage.
But they give you access to a lot of things,
and the security of these things
that they give you access to, such as an EC2 instance,
is your responsibility.
Now we go through two quick examples.
The first one is for RDS.
For RDS, think about it in your head,
what is Amazon's responsibility
and what is your responsibility?
Now, I'll go ahead.
For Amazon's responsibility,
while they will manage the underlying EC2 instance,
they will disable SSH access.
They will automate the database patching.
They will automate the OS patching on the EC2 instance.
They will audit everything for the underlying instance
and the disk and guarantee it works.
Whereas, your responsibility is going to be that you need to
check the ports, the IP, the security group inbound rules
for DB's security group.
You also need to make sure that you control, entirely,
the database user creation as well as their permissions
and their roles within the database.
You also need to make sure you create a database
with or without public access.
Usually, it is without public access.
And then you need to ensure parameter groups
or the database is configured.
For example, to only allow SSL connections for encrypted,
in-transit traffic.
And, you are also responsible for
any other type of encryption setting,
such as KMS enablement.
So, this is where you see really
what is Amazon responsibility,
more on the lower level type of settings.
And, your responsibility, which is on the user settings.
If we take an example, such as S3,
AWS responsibility is to guarantee you
almost unlimited storage,
to guarantee you that you get encryption,
to ensure that separation of the data between you
and their different customers.
To ensure that Amazon's employees cannot access your data.
Whereas, your responsibility on your own,
is to make sure the bucket is configured correctly.
That the bucket policy
and the public setting are set correctly.
That you need to make sure that your IAM users and roles
are set correctly.
And, finally, whether or not, you want to enable encryption.
I think that's pretty clear, I won't go over other examples.
But, you get the idea.
Amazon is responsible for their stuff
and you're responsible for your stuff.
Now, what is their stuff and what is your stuff?
There's a cool diagram that they have
on the Amazon websites for compliance.
Which is, what is your responsibility as a customer
versus what is Amazon's responsibility as their provider.
And so, as you can see, Amazon's responsibility
is to be for the hardware and the global infrastructure,
that includes regions, AZ, Edge locations,
and for the software, just compute, storage, database
and networking.
Whereas, you, as a customer,
you're responsible for your own data security,
you're responsible for your own IAM users, et cetera.
Your OS network and firewall configuration
for EC2 instances, for example.
And, you're responsible for whether or not
you want to enable encryption,
if you want to verify data integrity,
you want to have server-side encryption
or some kind of network traffic protection,
such as encryption and integrity and identity.
So, I hope that makes sense.
It's quite a simple lecture
but the exam will ask you sometimes
what is your responsibility versus
what is Amazon's responsibility.
So make sure you're on point with that.
And, I will see you in the next lecture.