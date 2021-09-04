
<v Stephane>Okay, so now I am in the AWS console</v>
and that's the main page you see
when you start with AWS.
Now, in the area services, you can click on services
and see all of them and you will not learn all of them
'cause that's probably ages to learn all of them,
but what we'll learn is the most important ones
for the certification exam.
The first one we should get started with is IAM.
Now, you can also look in there
and find that IAM is right here,
but, as a developer, what I like to do is to be efficient,
so anytime I need to find a service,
I'll usually type it in the bar.
I'll type IAM, and it'll give you a link
straight to the service.
To me, I find this a little bit easier.
Now, when we start with IAM, as we see,
it's a global service, as I said. Okay?
The user is a roles; everything is credit globally.
Now, as you can see, we start
and we have almost nothing in our accounts.
We have zero users, zero groups. We have two roles,
but these are roles, basically, created by AWS for us,
and we get a security status that doesn't look good for now.
It says what you need to do to make sure
that your AWS account is secure.
So, this is exactly what we have to do right now.
The first one is delete your root access key.
The root access key provide access to your AWS accounts,
and you should never use them. Okay?
So, never ever use them.
Basically, we'll have to delete them,
and throw them away.
Now we can activate MFA for multi-factor authentication
on our root accounts.
I want to do this right now.
Basically, you click on manage MFA,
and, then, basically, you say, "Okay"
we're accessing the credentials page.
We say continue to credentials,
and we can enable MFA, and click on activate MFA.
Then, you can choose whether to it's a virtual or hardware.
If it's a virtual, like me, you can use an application,
such as, Google authenticator, for this.
I'll let you do it, but, basically,
you can download Google authenticator, and do this.
What you have to do when you open Google authenticator
is to scan this QR code, so you scan the barcode,
and, then, once the barcode is recognized,
it's going to give you two authentication code.
For me, 662
498,
and this will appear in your app directly,
and, then, you need to wait a little bit,
okay, until the next code arrives,
and then enter that code.
My second code is 327933,
and then activate my MFA, and great.
The MFA was successfully associated.
Basically, now, our root account is protected
by multi-factor authentication,
and I'm sure that only me, with my own personal device
can log in to AWS.
I feel much better about it, and, now,
we have a green tick.
Now, we need to create individual IAM users.
To create users, it's, basically, create our first users,
so click on manage users, and add a user,
and I'll create my own super user,
and I'll call it "Stephane". Stephane. That's me.
What type of access do I want to give myself?
Well, I want to give myself a programmatic access.
That's for sure, and, also,
the AWS management console access,
so that I can use a password
to sign into my management console.
Now we can choose an autogenerated password or
a custom password. We'll just keep it autogenerated.
Then, basically, when I first log in,
it's going to require a password resets.
Then, I click on next permissions,
and, basically, I say whatever I want and stuff.
We can add a user to a group or
copy permission from an existing user or attach policies.
For me, I'll just attach directly policies,
just to be quick,
and I'll give myself an administrator access.
Basically, I want to use the accounts to do my course.
I'll give myself administrator access,
and, basically, if you look at the permission boundary,
you can just create it without one,
because this is an advanced feature,
and we don't need it right now.
We click on next to review, and, basically,
it says, "Okay", here is me. That's Stephane,
and the permissions I have is, I have administrator access,
which is great,
and I have it so I can change my own password,
which is great as well, right?
I'll go ahead and click on create,
and, all of a sudden, my user is created.
Basically, I successfully generated a user,
and I can view and download the security credentials
for that user if I wanted to,
so I click on download .csv, and this is something
I'm not showing you, and you should not see, okay?
Basically, this guarantees that I have a user,
and, then, once that page is gone,
I won't be able to see it again. Okay?
I'll close this page, and now we're good.
We have Stephane as a user, and what I'll do is,
I will re-log in to my page very soon as this user.
Now, if we go back to the dashboard,
we can also have groups, okay?
What we have as groups is, basically,
group the users together, such as,
we can know and group permissions and save a bit of time.
Manage a group, create a new group,
and, for this, I'll call new group "admin", okay?
I'll click on next step,
and I'll give administrator access to that group.
Click on next step, and, then, create the group.
Very simple, I create a group called admin,
but you can create a group name whatever,
developers, whatever, and create the group.
Now, the group admin, basically, has it's own permissions,
and the permission's administrator access.
What I want to do is add my users to my group.
This is myself. I'll add Stephane to this group.
Now we can see that Stephane is part of the administrators,
and, as such, you will inherit the permission of that group.
What I can do is, I can go back to the users now.
Go to Stephane, and what I can do directly,
is detach these permissions,
because they are attached directly,
and it's not very manageable,
so I can detach this administrator access,
which was attached through the group, okay?
Now, we have a much better set up,
because my administrator access has been provided
for the group.
This all looks great, and then, finally,
we can apply an IAM password policy.
Now, an IAM password policy is, basically,
to guarantee that IAM users, such as, myself
will create strong password,
and these password will change often,
because I don't want passwords to hang around for a year.
If I click on password policy,
you can see all the requirements that there is,
but, basically, you wanna choose a minimum length.
Allow users to change their own password,
and, maybe, I wanna expire passwords after 90 days, okay?
That sounds about right,
but you can use whatever requirement you want.
I'll apply the password policy,
and we should be good.
Now, all here is green, and, as I said,
I do not agree for anyone to use the root accounts,
so what we'll do is go to customize,
and we create an account, yes,
I'll call it "dataacumulus-courses", and I'll set yes,
create, and, basically, now,
the IAM user sign-in link is right here.
This link is what I will use to sign in to my AWS console.
I'll go and tab and click on console,
and, right here, I have the IAM user name,
which is gonna be Stephane,
and I need to set the password,
and the password is the one that you got
from the credentials; that .csv file.
What I'll do is that, basically,
I'm going to my credentials .csv file,
and you can't see it. I copy and paste the password,
and sign in. Now that I'm sign in,
as you can see, I must change my password to continue.
I paste my old password, and I'll just type a new password
that I'll generate and fill using my password manager,
but you can type whatever you want,
just make sure it's secure,
and, then, I'll confirm the password change.
Now, as you can see, on the top right,
I am logged in as the IAM user, Stephane
in my account, dataacumulus-courses.
Once you have IAM user, this is, basically,
saying, "Hey. I'm not using the root account anymore.
I'm using this user that I created from before",
and this is a much better thing to do.
If I go back to IAM, as you can see,
everything looks complete. Everything looks good,
and I'm created and I have all the users
and rights that I want.
That's it for the set up, just remember,
really, really, really important
for you to set up a user that has admin access
and use that user instead of your root accounts.
That's about it, and I will see you in the next lecture
for some much more funner stuff.