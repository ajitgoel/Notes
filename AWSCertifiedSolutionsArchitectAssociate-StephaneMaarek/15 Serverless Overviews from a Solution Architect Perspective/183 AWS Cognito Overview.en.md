
<v Instructor>So, let's get into</v>
what I call the most confusing AWS service out there.
And, hang on, we're there.
I'm trying to make it easy for you.
So, Cognito is used when we want to give our users
an identity so they can interact with our servers
and our application.
Pretty simple, right?
Except Cognito is different products.
There's the Cognito User Pool,
and we've been seeing it
slightly already before.
There's a sign in functionality for app users.
And, then it's integrated with the API Gateway,
and this is where we saw it first.
Pretty simple.
Then there is the Cognito Identity Pools,
or Federated Identity.
And, so, this is to provide
AWS credentials directly to our app users
so they can access our AWS resources directly.
And, this also has an integration
with Cognito User Pools as an identity provider.
Don't worry.
User Pool and Identity Pool,
I have a whole slide on it with diagrams.
Finally, we have Cognito Sync,
which is to synchronize data from a device to Cognito,
and it's also probably deprecated and replaced by AppSync.
AppSync, which is currently out of scope for the exam,
but Cognito Synced is still asked
so I'm just going to show you what it is.
Now, let's start by User Pools or CUP.
So, this is basically a serverless database of users
for your mobile apps.
And, so it's a simple login.
Can be username or email and a password combination,
and you can verify emails or phone numbers.
You can add multifactor authentication.
You can have password policies.
And, you can also enable Federated Identities,
and this is where the confusion comes.
This is basically saying
you can allow your user to login
through Facebook, Google, and SAML
and get an identity into your User Pool.
Do not mistake this for Federated Identities,
which is different.
But you can still use the Facebook login
or Google login to log into your user pool.
What we get back out of it
is a JSON Web Token, or JWT,
and this token can be used to verify
the identity of someone.
And, this can be integrated with the API Gateway
for the authentication part.
So, how does it look like as a diagram?
We have our app and it wants to authenticate to CUP.
It's going to register our login using a password,
and CUP, after verifying the login,
says, "Okay here is a JWT or JSON Web Token."
Fairly easy, right?
So, remember, a database of users
you can have email passwords,
username passwords,
or you can even can have Facebook or Google login.
The second product we have is Federated Identity Pools.
And, so the goal is to provide
direct access to our AWS environment
from the client side.
So, no proxy, no API.
Just straight access.
And, how do we do this?
Well, we log into a Federated Identity Provider,
or we can choose to remain anonymous.
We have this option.
And, from this we get temporary AWS credentials
back from the Federated Identity Pool.
And, then these credentials
come with an IAM policy attached to it,
and so we can do stuff based on this IAM policy.
For example, say we wanted to provide
temporary access to write to an S3 bucket
using a Facebook login.
This use case would be great for using
Federated Identity Pools.
Let's go through a diagram.
It will probably make sense.
This diagram is pretty complicated,
but at least it represents the full story.
Here's our app.
And, our app is able to login to an identity provider.
The identity provider can be whatever you want.
It an be Google, Facebook, Twitter, SAML, OpenID.
And, even the Cognito User Pools
we have created from before.
So, from there our app gets to login
and gets a token.
Nothing new.
This is a basic login.
But, now using this token,
we are going to pass it on to our Federated Identity Pool.
So, we authenticate using that token to our FIP,
and it will verify the token with our identity provider
just to make sure we are who we say we are.
Once the token has been verified,
the Federated Identity will talk to the STS service
to get temporary credentials for AWS.
Once it has that,
it will pass on the temporary credentials
back to our application,
and now that our application
has these temporary AWS credentials,
it is, for example,
able to interact directly with our S3 bucket.
And, we have an IAM policy
which allows us to do certain things
and not do other things.
So, this is the whole idea of how
Federated Identity Pools work.
As you can see,
this is a pretty complex diagram,
but the idea is that we trade in a login
for an identity provider,
and we get, in the end,
temporary AWS credentials.
So, an access id, a secret id,
and a temporary session token.
So, that's it for these two identity pools.
They are very different as you can see.
The first one was just you provide an identity
and to integrate with the API Gateway
while this one is more to directly allow us
to interact with AWS for our app users.
Now, Cognito Sync is deprecated,
and we should use AWS AppSync now.
But, it is out of scope of the exam.
What is Cognito Sync?
It lets you store user preferences,
configuration, and the state of our application,
and it has a cross device synchronization capability.
Any platform, could be iOS, Android, etc.
You can do offline stuff.
So, if you were to change your preferences offline
and then you go back online,
then they're synchronized automatically.
So, it's a good feature.
And, then to have it working well,
you need to use Federate Identity Pools
in Cognito not User Pools.
Just something to know.
The data is stored in data sets,
and each data set could be up to one megabyte,
and we can have up to 20 data sets to synchronize.
So, that's it for Cognito.
We should just know
which product to use in which situation,
and we've seen this.
That's all there is to this lecture.
I will see you in the next one.