
<v Lecturer>Okay, now let's talk about another service</v>
that I find really amazing in AWS
and that I've used all the time
while I was doing consulting on AWS,
which is called the SSM Parameter Store.
So this is to securely store your configuration and secrets
in AWS and you can have optional encryption with KMS,
so you can store your secrets, have them KMS encrypted
directly from within the SSM Parameter Store.
It is a serverless service, it's scalable, durable
and the SDK is super easy to use so I would use it
anytime you need to encrypt secrets, for example.
You have versioning of your configuration and secrets.
All your security for your configuration management
is done using path and IAM policies.
You can get notifications with CloudWatch Events,
integration with CloudFormation to police parameters
and so it's a very complete service
as we'll see in the hands-on.
So at the most of it's core, so we have the applications
and they have, for example, a parameter stored
in the Parameter Store so it could be
a plain-text configuration in which case,
if we request that configuration then the Parameter Store
will check with IAM permissions to make sure
that we can get them and then return them to us,
or we can also ask for encrypted configurations,
in which case the parameter Store will also ask with IAM
but on top of it, check the KMS permissions
and if so, call the decrypt API from the KMS service
to give us our decrypted secret.
So here is a way to store your parameters
in your Parameter Store.
So you can create a hierarchy.
For example, my department underneath my app.
Then your dev environments and then the name of your config,
for example, the DB URL.
Maybe another secret, the DB password
and then maybe you have the dev environment
so you would also have the prod environment
with the same DB URL and DB password config and secrets.
Then if you have another application then you could create
another application in the hierarchy
and another department and so on.
So it's sort of like a folder structure that you know
for example, like a file system.
And then you're also able, using the Parameter Store,
to reference secrets from the Secrets Manager as we'll see.
And you're also able to reference parameters
directly from AWS.
For example, the last one here allows you
to retrieve the latest AMI ID
for Amazon Linux 2 from AWS, which is very handy.
So if you ever learn the function and it wants to
access your dev parameters, then you would set
an environment variable and then you'll end the function
with get your parameters
or get them by path and retrieve them.
And if you have a prod in the function
with another environment variable
then it would retrieve automatically the prod values
and so this is how we could use, for example, lambda
and the Parameter Store.
So we have two tiers of parameters in the Parameter Store.
We have the standard tier and the advanced tier
and the standard tier is going to be free,
advanced tier's going to be paid.
And so, for the standard tier
you have up to 10000 parameters per account,
which is a large amount of parameters.
The maximum size is four kilobytes
and you don't have the parameters policies available,
as we'll see in the next lecture.
If you're using the advanced tier,
then you get up to 100 thousand parameters.
They can be up to eight kilobytes,
you do get parameters policies
and you do have to pay for your parameters.
So I have a feeling the exam is going to ask you
to choose between the standard and advanced tiers
for Parameter Store but it's good to know
as you when you go into the console.
So what are these Parameters Policy?
They're only for advanced parameters and they allow you,
for example, to assign a TTL, so a Time to Live
to a parameter, which effectively creates an expiration date
and the idea behind this is to force updating or deleting
sensitive data such as passwords in your Parameter Store.
And you can assign multiple policies at a time.
So here are three examples:
The first one is the Expiration, to delete a parameter.
So in this example, I'm going to say hey,
my parameter expires in December 2020.
Then we have an ExpirationNotification,
so you're saying hey, this one,
send me a notification through Cloud Watch Events
15 days before the expiration happens.
And here is a NoChangeNotification.
So this is saying, if my parameter hasn't been changed
in 20 days then send me a notification
through CloudWatch Events.
So this is the kind of policies you can attach
to your advanced parameters to trigger some sort of
automation and to force yourself to change them quite often.
So that's it for the Parameter Store.
I hope you liked it and in the next lecture
we'll get some practice to make it a bit more real.