
<v Instructor>Okay so we're getting into</v>
first of all the IAM service in AWS.
IAM stands for Identity and Access Management,
and as you can expect from the name
that basically means users.
So the whole of your AWS security is going to be in IAM.
There's gonna be users, groups and roles.
You have to remember this and you surely will remember them
by the end of this course.
Root account is the account
with which you create your AWS accounts.
And basically you should only use it the very first time
and then you should never use it again
or even share it with someone,
because your root account is the accounts
and the user that has the most power.
The users then must be created with proper permissions
and we'll see how to do this in the lab.
And IAM is going to be at the center of AWS,
so every service in AWS is going to be helped
with IAM for security.
Now we'll have policies within IAM
and these policies will be written in JSON.
JSON stands for JavaScript Object Notation
and they're basically a way to write data.
So if you don't know anything about JSON
I strongly recommend just going online
for a quick tutorial on Google to get started with JSON
because they just assume that as a developer
you probably know what that is.
So how do we visualize IAM at a high level?
Well we have the users, and the users is usually going to be
a physical person like you or me,
we are physical person.
So I will get an account in IAM
and you surely will get an account in IAM.
That account should not be the root account.
Now users can be grouped together.
And group is whatever you want it to be
but usually it's by functions, for example admin,
devops or by teams, such as engineering, design
or anything you want.
Overall group, and you should know this,
contain users, okay.
So this way you can apply permissions to groups
and users will inherit these permissions.
Finally we have roles.
And roles are only for internal usage
within the AWS resources and services, okay.
So roles is what we're going to give to machines.
So this is a strong distinction to make.
Users is going to be for a physical person
and roles is going to be for a machine.
Now overall as I said, policies are JSON document
and they will define what each of these building blocks,
users, groups and roles, can and cannot do.
We'll learn how to write policies, don't worry
and we'll play with all these things at length
during this course.
Now IAM you should know has a global view.
When you create a user or a group or a role
in your AWS accounts it will be across all the regions
and that kind of makes sense.
As I said the policies are in JSON.
You can enable Multi Factor Authentication
for your root account and for your users,
and I strongly recommend it.
Now IAM comes with managed policies,
so basically you don't need to rewrite the whole policies,
you can reuse some that Amazon put together for you
for ease of management.
And we'll see in depth and length
how to create IAM policies.
Right now we'll just take it easy
and do a soft introduction.
Something you'll hear me say over and over and over
in this course it that it's best
to give users or roles the minimal amount
of permissions they need to perform the job,
and that's called the least privilege principles.
And so you absolutely want to make sure
that you don't over power any single person
in your organization or any single application or server.
And you will hear me say this so many times.
Now for big enterprises you use something
called IAM Federation.
We will not use it in this course
'cause we're not a big enterprise we're just users,
but basically if a big enterprise has like
their own repository of users, such as Active Directory,
you know they can integrate this with IAM.
And this way the users of a big enterprise
can log into AWS using their company credentials.
This uses something called the SAML standard
and Microsoft Active Directory for example,
is one of these big users of the SAML standard.
So it's just something you need to know about for the exam
but we will not practice this.
So just a quick brain dump.
And I'm gonna feel like I'm your father right now
but I have to say it once,
'cause my conscience needs to be clear,
one IAM user per physical person.
You do not share an IAM user with anyone.
Your account is your account and no one else's.
One IAM role per application.
Each application has it's own lifecycle,
their own independence and so you want one IAM role
per application, nothing shared.
Your IAM credentials should never be shared.
Again as I said, your IAM user and your credentials
are your own, you never share them with anyone.
Now never, ever, ever, ever,
I think I said it that many times,
write IAM credentials in code, ever.
This is extremely bad if you put your credentials in code
'cause if that code ends up in someone's hands
or on Github or on the Cloud or whatever
and someone intercepts them, I promise you someone
will mine bitcoin in your account
and you'll end up with a $20,000 bill in one day.
And that happened for real, you can Google it okay.
So never, ever, ever write IAM credentials in code, ever.
Never use your root account except for initial setup.
That's super important because the root account
is kind of the key to the kingdom.
If you lose it or if you compromise it, you're done.
So your root account is something you should create
at once and then lock in a safe and never use ever again.
So as I said never use the root IAM credentials.
Now I sound like someone who's trying to scare you
and I am and it's true.
Your AWS account can do a lot of things, okay
and can cost a lot of money if you misuse it
or someone misuses it for you,
so be careful around credentials and how you deal with them.
Apart from that, let's go in the next lecture
for the labs and hands on.