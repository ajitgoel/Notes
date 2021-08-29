
<v ->We've seen in AWS, how to create users</v>
with AWS accounts to access our services.
But, sometimes what you want to do
is identity federation.
Because you don't want to manage
all you users within AWS.
You want to have an external source
of truth for users and allowing them
through that source of truth to access
your AWS resources.
==So federation let's users outside==
==of AWS assume temporary roles==
==for accessing AWS resources.==
And these users assume identity provided access roles.
So, there's so many ways to do federation in AWS.
There's SAML 2.0, Custom Identity Broker,
Web Identity Federation with or without Cognito,
Single Sign On, Non-SAML with AWS Microsoft AD.
And, we'll see them all in this section.
And using user federation, you don't need to create
IAM users as I said.
The user management is outside of AWS.
So, ==at a very very high level.==
==We have our user and we have a 3rd party source==
==for our users.==
==And, so AWS is going to trust that 3rd party source==
==for managing our users.==
==And, the users will login to a 3rd party,==
==get credentials from it and be able to access==
==AWS this way.==
This is a very high level overview,
where as we can see here,
the user management is outside of our AWS account,
and AWS has to trust that outside source.
Okay
So the first very common way to do federation
is to use SAML 2.0.
So, SAML 2.0 has great integration
when we're talking Active Directory or ADFS.
But, there is other directories that are compatible
with a SAML 2.0 specification.
And, using SAML 2.0 federation,
we can get access to the AWS console or the CLI
using these temporary credentials.
And there's no need to create an IAM user
for each of your employees.
So, for example, Active Directory is a very common
way of having users on premise.
And so, you create your users on Active Directory
and they will be able to access AWS
thanks to SAML 2.0 federation.
So, here is a diagram showing how that works.
So, in this case our client application
wants to get access to an Amazon S3 buckets
within AWS.
But, the user management is done outside is done
within premise in your organization.
==So, the first thing your client app will do,==
==will be a request to your identity provider==
==to authenticate and your identity provider==
==will check with LDAP, maybe your identity store,==
==could be whatever you want,==
==that you're correctly authenticated.==
==Then, it will return back what's called a SAML assertion.==
==So, we'll retrieve a SAML 2.0 assertion==
==and the client has it.==
==And, we are going to exchange that SAML assertion==
==for some AWS credentials.==
==So, we are going to call the AssumeRole with SAML==
==STS API that we've seen from before.==
==And, STS will look at the SAML assertion,==
==will make sure that its correct==
==in compliance with the trust it has.==
==Then, it will return as==
==temporary security credentials,==
==and we can use these temporary security credentials==
==to access the Amazon S3 Bucket, for example,==
==that we have been trying to access.==
Similarly, we have the exact same process happening
when we want to access the console.
So, the browser again will authenticate
with our LDAP and our identity provider,
which will return a SAML 2.0 assertion.
And, we are going to post this SAML assertion
automatically to the sign in URL of AWS,
which will check with STS to give us
some temporary credentials.
And everything is working.
Then, we get back some credentials
and the client is redirected
to the AWS management console.
And, we can use AWS normally.
So, this is two ways.
One, is programmatically to access some buckets.
One is the other one to access the console.
But, they work the exact same way.
We first authenticate within our organization,
and we exchange the SAML 2.0 assertion
for some credentials within AWS
and thanks to STS
and then we're able to access
resources or the console.
Great.
So, what about ADFS?
If ADS is compatible with SAML 2.0,
then it is the exact same process.
So, let's have a look at the diagram.
Our browser interface will login with ADFS
and ADFS will check that our user
is properly authenticated
with our identity store.
And, ADFS will return us a SAML response,
and now you know the process,
we are going to exchange the SAML response
with STS with the assume role with SAML.
We'll get credentials back
and with these credentials we can either access
the management console or we can access some resources
within AWS specifically.
So, hopefully by now you understand
==**SAML 2.0 Federation.**==
And to trust, you need to setup a trust
between IAM and SAML, both ways.
SAML will enable web based, cross domain SSO.
And, it will use the API AssumeRoleWithSAML.
==Note that SAML federation is the "old way"==
==of doing things and there is a new service==
==that I will be describing later on called==
==Amazon single sign on or SSO.==
Which is going to be the new way
to create this federation and there is a blog
if you want to read about it, but don't worry
I will describe SSO in detail in a future lecture.
Okay.
==So, what if our current on premise store==
==is not compatible with SAML 2.0?==
==Then, we have to write our own==
==Custom Identity Broker Application.==
And this is only if you don't have compatibility
with SAML 2.0.
In which case, the identity broker you have to create
must determine the appropriate IAM policy
for your users.
This time, we can use the AssumeRole API
or GetFederationToken API.
And, the process is sort of similar.
Here, the users will authenticate
with the Identity Broker
and the Identity Broker will verify
that the user is correctly authenticated.
But, this time it's not AWS that gives us credentials
it's the Identity Broker that will talk to STS
to request some credentials for some specific
action and the Identity Broker,
we have to write ourselves
will return these credentials to us
and then we can access the console
or access the AWS APIs.
So, the difference here is that the Identity Broker
itself is the one talking to STS
and giving us back some credentials.
So, there's a lot of power into our
Identity Broker.
But, this is the only way to do it
if you don't have a SAML 2.0 implementation.
Okay, so we have seen how to have our users
on premise within our company
access AWS through Identity Federation.
But, what about if we want to have users of our
applications access AWS?
Then, we have to use
====Web Identity Federation.==
==And, let me start right away by saying==
==that this is today not the recommended way==
==to correctly do Web Identity Federation.==
==AWS recommends we now use Cognito==
instead of this method== I am going to show you
right now.
And, the reason is, Cognito will have
allowing access for anonymous users,
data synchronization and multi-factor authentication.
Still, I want to show you what Web Identity Federation
looks like using the STS API
AssumeRoleWithIdentity.
So, in this example, our mobile client
which is a app is going to login.
Maybe, could be Facebook, it could be Google,
it could be Amazon.com, whatever you want.
And then it's going to get back some credentials,
a token.
And that token is going to be exchanged with STS
using the AssumeRoleWithWebIdentity.
So, STS is going to look at this,
say yes, I trust this login, let me return to you to back
some AWS credentials.
And now, the mobile client has some AWS credentials
and can access a different IAM policy
and then maybe a data multi table
which is your GameScores.
So, the idea here is that its a 3-way process,
we first login with our identity provider,
we then exchange it with a STS,
and then we have access to AWS.
So, very similar process to what we seen before,
but now this is for Web Identity Federation.
But as I said, the recommended way
is to use Cognito.
So, let's have a look at that Cognito right now.
Cognito, the goal is to provide direct access
to AWS resources from the client side.
It could be your mobile or web application.
And for example, we want to provide
temporary access to write to S3 bucket
using a Facebook login
because its more efficient if our clients
have direct access to the S3 buckets.
The problem is, we do not want to create
IAM users for applications in your accounts.
Imagine you have millions of users
for your application.
You don't want to create one IAM user
for each application user.
This is why we use Identity Federation.
So, how do we do it?
We are going to login to our identity provider
or even remain anonymous.
And then, from the Cognito API,
we are going to get back AWS credentials.
And then, the credentials will come
with IAM role so we can access
our S3 buckets.
So, I think this is more clear
if I show you a diagram about the process.
So, this is our application, it could be a mobile
application or a web application.
And, its going to login with an identity provider.
The identity provider can be Google, Facebook, Amazon,
Twitter, SAML, Open ID or even something called CUP,
or Cognito User Poll.
So, we login with it and we get back a token,
so think the login is user name, password right.
We get back this token, and this token
can be exchanged with Cognito Federated Identity.
Which is going to verify the token first,
then get credentials from STS in the backend.
And, give us back some temporary AWS credentials.
And, these credentials themselves can be used
to access our Amazon S3 bucket thanks to the policy
we have attached to this role.
So, this is fairly similar, but now
Cognito is going to be at the center
of Web Identity Federation.
So, that's it for identity federation.
So far, I've shown you when we have a SAML 2.0,
when we have a custom identity broker,
with Web Identity Federation and now Cognito.
I know this may be overwhelming and complicated
but think about the use cases and hope that was
clear enough for you to understand how to use
which in which situation.
Okay, I will see you in the next lecture.