
<v Instructor>So this is going to be a short hands-on</v>
because we can't really say that SSO we've had
multiple accounts and so on.
But let's just go in the UI and see what it looks like.
So, let's go to AWS Single Sign-On
and see the options we have for setting it up.
So, it is loading and we can enable AWS SSO,
this step is a process that takes about 30 seconds.
Once since enabled, we have three steps to do.
The first is to choose our identity source,
which is where we are going
to administer our user end groups
and it's going to be our active directory.
The second one is configure SSO
to access all your AWS accounts
that would be within your organization.
And then, use SSO to access your cloud application
or anything that is going to be SMAL 2.0 compatible.
And then, the cool thing is I'm getting
this user portal right here,
which is given by SSO.
And this is the portal I would have to login to
obviously, once its been set-up.
To login to this, there would be my SSO portal
and once I'm login through here,
it would check my identity with identity source
and then, it would get SSO access to all the accounts
and the cloud applications.
So, very handy.
Now, to choose the identity source,
we can have SSO itself as in identity source,
or active directory, or an external identity provider,
each with its own setup.
So, we'll choose SSO right now cause its easier.
Next, I can click on manage SSO access to our organizations
and we have access to a bunch of accounts
within my organization.
And I can say, "Okay, this will be the accounts
"I am willing to access to."
And finally, access to access to cloud applications,
and we can add applications.
And there's an either a catalog of applications
that already worked with AWS SSO,
or I can add a custom SAML 2.0 application.
In which case, I will need to specify
a bunch of properties to properly configure it.
But overall, very very handy.
It's a free service of AWS
and it saves you a lot of time and trouble.
So, if you manage your users through AWS SSO,
you could add them through here,
as well as, groups.
Like what I said before, SSO is a really good candidates
when you want to innovate your source
with another identity source.
And for example, that would be active directory
or an external IDP.
All right, that's it for this hands-on.
I just wanted to show you the different options.
I hope you like this.
And I will see you in the next lecture.