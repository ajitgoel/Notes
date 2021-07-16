
<v Instructor>So now let's talk about</v>
Microsoft Active Directory and AWS Directory Services.
In case you don't know what Microsoft AD is,
it is a software that is found on any Windows server
with AD Domain Services.
It's a database of objects, and the objects can be
user accounts, computers, printers,
file shares, security groups.
So all your users managed within your entire
Microsoft ecosystem on-premise
is going to be managed by Microsoft Active Directory.
And there's going to be a centralized security management.
You can create accounts, assign permissions and so on.
And all the objects will be organized into a tree
and a group of trees is called a forest,
that's just for some terminology.
So next thing, to take an example,
we have a domain controller
and we're going to create an account on it.
We'll create an account, user name is John
as the password is password.
And the idea is that all the other Windows machines
we have within our network are going to be connected
to the domain controller,
so if we're using the John password on the first machine
it's going to look it up in the controller
and say yes, we have that login,
and then allow you to log in from that machine.
So all these machines are going to be connected
to your domain controller,
and that allows you to have the users
accessible on any single machine.
So that's the whole idea behind Active Directory
at a very, very high level.
Now we have AWS Directory Services,
which is to provide you a way to create
an Active Directory on AWS.
And we have three flavors on it.
We don't have to do a deep dive on them,
but you have to understand the differences
between these three flavors.
The first one is AWS Managed Microsoft AD
to create your own Active Directory in AWS.
And you can manage your users locally,
and it supports multi-factor authentication.
The idea is that with this standalone Active Directory
you can also create a trust connection
with your on-premise AD,
where you have your own users there as well.
And what that means is that your AD,
in here for example, can be trusted with the on-premise AD.
So AWS trusts the on-premise AD
and on-premise AD trusts AWS.
So that means that if your users
use an account that is not managed by AWS,
it can go and look up the accounts
into the on-premise Active Directory.
And similarly, if an on-premise directory user
goes and authenticates your on-premise AD
using the AWS accounts,
it can be trusted to go and look it up.
So here our users are going to be shared
between our on-premise Active Directory and AWS, okay?
A little bit complicated, I know, if you're new to this,
but hopefully it makes sense.
The AD connector is a little bit different.
This is a direct gateway proxy
to redirect to the on-premise AD,
and the users are solely managed into the on-premise AD.
So here is the example.
In this example, our AD connector
is just acting as a proxy, so if the users
start to authenticate with our AD connector,
it's going to proxy the request
back to our on-premise AD and look it up.
So the idea here is that in the first case
with Managed Microsoft AD
we have users sitting in AWS Managed AD
and users sitting in on-premise AD,
whereas with AD Connector, as the name indicates,
it connects, it proxies the queries,
the connection requests,
back to our on-premise Active Directory,
and the only place where we can manage users
is going to be on the on-premise AD.
Finally, you have Simple AD,
and it's an AD-compatible managed directory on AWS.
It doesn't use Microsoft Directory, and it cannot be joined
with an on-premise Active Directory.
So the idea is that if you don't have
an on-premise AD, and you need an Active Directory
for your AWS Cloud, then you can have just a Simple AD
as a standalone thing.
And the idea here is that, using Active Directory,
you can create EC2 instances
that are going to be running Windows,
and these Windows instances can join the domain controllers
for your network and share all the logins
and the credentials and so on.
So this is why you want to have a directory in AWS,
to have a directory closer to your EC2 instances
running Windows, and hopefully that makes sense.
Now, the exam should ask you
some very, very high-level questions
saying we want to proxy our users to on-premise,
and therefore you need AD Connector,
or we want to manage our users on the cloud in AWS
and have MFA, and therefore you need AWS Managed AD.
Or we just want a Simple AD
and we don't have any on-premise stuff.
In this case, you want a Simple AD.
So if you go to the console and type "directory service"
we can see the different options offered to us.
I'll just go through them at a high level
because they can be complicated to set up individually.
So we have four options, and actually the fourth one
is Amazon Cognito User Pool,
which is redirecting you to the Cognito service,
so don't count this into Directory Services.
So we have AWS Managed Microsoft AD
where we can have an Active Directory
that's going to be integrated with AWS Cloud
and can have a trust relationship
with your on-premise directory.
And to set it up, you can see it's two editions,
the Standard Edition up to 30,000 objects
or the Enterprise Edition up to 500,000 objects,
so a lot more.
And then you need to set it up,
and I won't go over this setup because AD-specific
and you don't need to know this for the exam.
This next one is Simple AD
which is going to be a standalone managed directory
that has an Active Directory-compatible API,
but it cannot be connected
to your on-premise Active Directory.
Or AD Connector, which is a proxy
for redirecting directory requests
to your existing Microsoft Active Directory on-premise.
You have two levels,
you have a Connector for up to 500 users
or you have a Connector for up to 5,000 users, okay?
So remember, the first one supports MFA,
the second one is just standalone,
and AD Connector is a proxy.
All right, that's it for this lecture.
I will see you in the next lecture.