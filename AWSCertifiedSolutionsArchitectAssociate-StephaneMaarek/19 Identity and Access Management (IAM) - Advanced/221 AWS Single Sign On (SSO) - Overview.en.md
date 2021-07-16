
<v Instructor>Let's talk about AWS Single Sign-On or SSO.</v>
It let's you centrally manage Single Sign-On
to access multiple accounts
and third-party business applications.
So you're going to go your portal
and once you're logged in to that Single Sign-On portal,
you can log in to any of your AWS accounts,
Dropbox, Office 365, Slack, without reentering your login.
That's why it's called Single Sign-On.
So you can log in once and you have access to all the things
that Single Sign-On is configured to access.
So the really cool thing is that it is integrated
with AWS organizations so if you have a tons
of accounts within your organization,
you just set up AWS Single Sign-On and you will have access
to log in to all the accounts within that organization.
So, one login for all the accounts.
It supports SAML 2.0 markup,
so it has integration with SAML,
and deep integration with on-premise Active Directory.
It's centralized permission management
so you can manage all the permissions of users
within Single Sign-On and you get centralized auditing
with CloudTrail for the logins.
So it's awesome.
So anytime you see a use case talking about doing a sign-on
to multiple AWS accounts or to business applications
that require SAML 2.0, think Single Sign-On.
Okay, so here's another graph.
So, in the center we have Single Sign-On,
so SSO, and we set up a connection
to maybe our on-premise Active Directory,
so we'll have an Active Directory on-premise,
but we could also use Managed Services by AWS
or we can use Microsoft Managed AD by AWS
to also manage our users from there.
So we set up that trust and then,
Single Sign-Ons know how to get the users from there.
Then the users can connect to Single Sign-On
and from Single Sign-On, we can integrate it
with different OUs and accounts within our organization.
So, once we log in to Single Sign-On,
we can access any organization accounts in here,
but also we can access business cloud application
that have deep integration with SSO
such as Office 365, Dropbox and Slack,
or we can even configure our own
custom 2.0 compliance application, okay?
And with these SAML applications,
we can enable it to work with SSO.
So the idea is that we log in once with SSO,
it checks our login with our on-premise AD or our managed AD
and then, we have access to AWS,
business cloud applications and custom SAML application.
So it's really cool but I want you
to notice exactly the difference between using SSO
and using the AssumeRoleWithSAML API
that I told you from before.
So if you use AssumeRoleWithSAML,
we have to set up our third-party IDP login portal
that will check our identity with the identity store,
that will return to us a SAML 2.0 assertion,
and then we have to send that SAML assertions
to STS to use the right AssumeRoleWithSAML,
and we get back security credentials
and we are connected to AWS.
But so, if you have multiple accounts on AWS,
we need to set up this process
for each and every single accounts.
On top of it, we have to manage this login portal and it's
not a thing that may be available in your company just yet.
But with SSO, a browser interface will log in
through the login portal of SSO so we don't have to set up
that login portal ourselves, this is the SSO service,
and SSO is already integrated with your identity store
so we don't have to run anything here.
They just talk to each other,
they generate credentials for you,
and you get credentials back right away,
so it's one less piece of integration to do.
The really cool thing is that this SSO portal
can give us credentials for one AWS account,
but also many others.
So, as soon as you wanna scale
with a number of multiple accounts you wanna connect to,
then SSO becomes an obvious choice.
So that's it for this lecture,
and then let's go quickly into the hands-on
to see how that works, but hopefully,
you get a better idea of what SSO is
and how it's used in your company.