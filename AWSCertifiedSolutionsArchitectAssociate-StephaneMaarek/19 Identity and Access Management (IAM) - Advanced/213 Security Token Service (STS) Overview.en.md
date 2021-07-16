
<v Instructor>Now let's talk about a service that is</v>
in the backbone of all the other AWS services.
This is STS, and STS stands for Security Token Service.
STS, as the name indicates, allows you to grant limited
and temporary access to AWS resources.
And they will issue a token,
and that token will be temporary, valid up to one hour.
So if you want to reuse that token,
you must be refreshed, and so the credentials
must be re-verified before you have a new token
that allows you to access your AWS resources.
So there's a bunch of API in STS,
but one of the most important is going to be AssumeRole.
So you can use the AssumeRole within your own account
for enhanced security, for example you have your
users assume a role that allows them to delete each
to instances, so the reason we do this is that we want
to have an extra layer of security,
such as they don't accidentally delete each instances.
They just have to assume a role first to do that.
Or you can use AssumeRole for cross account access.
And in that case, we assume a role in a target account,
which is not our account, and because we have assumed
a role there, we can perform actions
on the resources of that account.
There is also AssumeRole with SAML,
and we will have a detail at it when we look at
Identity Rederation, but this will be helpful
to return credentials, when our users are federated
through SAML.
There is AssumeRole with WebIdentity,
which is to return credentials for users that are
going to be logged in through an identity provider
such as Facebook Login, Google Login or any
OIDC compatible login.
And it's going to return as credentials,
but AWS recommends against using this,
and we'll see this again in the
hands-on in the next lectures,
and we have to use cognitive instead
that is the most recommended way.
And finally, there is GetSession Token,
which is for multi-factor authentication,
for user or AWS account root users.
So anytime your users have MFA, they have to use
GetSessionToken, to get a token allowing them access
to the consol or through the CLI and stuff like this.
So we can see STS is really at the center of providing
our users our applications, tokens that allow them to
talk to our AWS resources.
So, let's look at the most common use case for STS,
which is how to Assume a Role.
So first, we define an IAM role; it could be within
your account or a cross-account,
and we'll just have a look at it in this account.
Then you define which principles can access this IAM role,
so which users, which other roles can access this IAM role,
and then you use the STS service to retrieve controls
and impersonate the IAM role,
and this is using the AssumeRole API as we just discussed.
And then the credentials will be valid for between
15 minutes to one hour based on how you
configure your AssumeRole API.
So we have the user, and it wants to assume a role within
the same or another accounts,
so it's going to say "Okay, I want to assume that role,"
so I'm going to use that AssumeRole API, okay,
and invoke STS.
STS is going to check with IAM
if we have the permissions to do so,
then it will return us temporary credentials,
and these credentials can be used to access
that role in our account.
So we can see the whole process,
we first ask stuff from STS who checks with IAM,
returns us security credentials,
and then we are able to assume that role and endorse it.
This is very very similar when you have cross
account access, so this is a low quality diagram
from the website of STS but I think it is clear enough.
So we have a production account on the left hand side,
and a development account on the right hand side.
And as we can see, the first thing to do is that the admin
will create a role in the production account.
Then the admin in the development account will create a
developer's group with the permission to access
this UpdateApp role.
Then the user will request access to the role.
STS will return the role credentials,
so now we have the credentials to use that role
in this account, and then the user using these new
credentials can access, for example,
an extra bucket in the other account.
So this is a process for cross account access
and this is done using STS so you never share credentials
across accounts, you never ever do that,
like create a new user and send the credentials, no.
You create a role, and you make sure that your user
assume that role, and STS will return to you,
role credentials that are temporary so even if you
somehow lose them, then it is not as bad as
leaking entire credentials of an account.
Okay?
So remember, any time in the exam you see,
cross account access you see, AssumingRoles think STS.
Okay?
Well that's it for STS, I will see you in the next
lecture for some more Identity Federation.