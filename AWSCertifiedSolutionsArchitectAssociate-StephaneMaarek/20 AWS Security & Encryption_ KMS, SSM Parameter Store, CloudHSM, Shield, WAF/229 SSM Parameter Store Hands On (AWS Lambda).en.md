
<v Stephane>So we're seeing how</v>
to use the CLI to retrieve those,
but how about we use Lambda
just to spice it up and use the SDK?
I think it's a valid use case to know about,
so let's just go through it because it's fun.
So we're going to create a function,
and so this function is going to be called hello world SSM,
and for the runtime I'm going to choose Python 3.6,
for example, 3.7 actually,
but you can choose any Python 3-dot-whatever,
and for permissions we need to have
an IAM role for a Lambda function.
So I'm going to create an execution role,
and I'll create a new role
with basic Lambda permissions in here,
and I'll click on create the function,
so this will create a role named hello world SSM role,
and then the blovus text as here,
and that will give the function
the permissions to write to CloudWatch Logs.
What we will have to do afterwards is take this role
and we'll add extra permissions into it
to allow it to read and write to the SSM parameter store,
and then we'll scroll down
and we'll find our Lambda function code that we'll modify.
So because this is AWS we'll do import Boto,
and this will allow us to use Boto to call an SDK.
Now I'll say SSM is equal to boto.client,
the name of the client is SSM,
and the region name is equal to,
and this is up to you to put whatever you want.
For me it's EU west 3 because I'm in the Paris region.
Okay, so we have our SSM client, and as you can see,
it's defined outside of our Lambda function obviously,
and so what we want to do is number one,
get the DB URL, so I'll say DB URL equals blah,
and then we want to get the DB password,
so I'll say DB password equals this,
and we're going to print the DB URL to the console
and also we're going to print the DB password, okay?
And we'll just return "worked."
Okay, so that's very simple.
Now we need to go ahead and use the SSM API.
So for this it's pretty simple again.
For the DB URL we'll do ssm.get parameters,
and here you have a names variable,
and the names, I'm just putting one name,
so I'll just use this one, the dev name right here, okay?
And for the DB password I'll use the same API,
get parameters, but this one I'll say DB password.
So this looks good enough,
and let's just try it out to see how things work.
Obviously things won't work, but we'll see why in a second.
So this is just our function.
I'll click on test, I'll create a new event name,
and I'll say helloworld, and I'll just say create.
Okay, so our function is saved.
Now I'm going to test it, and we get a failure.
The first one, it says unable
to import module "Lambda function."
So no module named "boto,"
this is because I messed up and it's boto3
that I need to import and not boto.
Click on save, click on test again,
and now we get another error.
So here it says an error occurred.
Access denied exception when calling
get parameters operation.
My Lambda basic execution SSM is not authorized
to perform SSM get parameters, so that makes sense,
we haven't changed our IAM roles, so let's do it right now.
So let's go into roles,
then I'm going to find my hello world SSM role in here,
and I'm going to add an inline policy in here,
and I have to choose a service.
For the service I will type systems manager.
Then we're going to choose an action,
so in read I'm going to allow to get parameters
and also get parameters by path,
and then for resources we're going to choose
specific resources, and I'll click on add ARN.
In terms of region I'll just allow any region.
Of account I'll just allow any account.
But for the fully qualified parameter name
if we go back to system manager
maybe I just want to allow my app.
So I'll just say my app,
and so because of the tree now we only allow anything
that's under my app and then with a star.
So anything under my app with a star should be allowed.
We'll click on add, and so here we have a very strict
IAM policy that really is best practice.
Now we're going to review the policy,
and okay, we have limited access to SSM,
to this path, which should go under
this parameter right here, so that makes sense.
Okay, we're excellent, create policy.
Oh, and the name, we'll call it SSM access for my app.
Okay, create policy, and now we have
the SSM access for my app inline policy,
so let's go back to the Lambda management console.
We're going to refresh this page,
and now we see from the designer
that we have access to Amazon Simple Systems Manager
because we changed the IAM role.
So if we click on test we get a new failure,
and so we still get a authorization exception,
so sometimes you have problems and IAM gets cached
or it's not immediate for IAM
to be reflected onto your function,
so we just have to wait a little bit.
So after waiting maybe five minutes I'll try again
and click on test, and now it says "worked"
because IAM allowed us to do what we wanted to do.
If we scroll down we can see the parameters.
There is a dev URL that is
dev.database.stephanetheteacher.com,
and then in terms of the dev password, which is right here,
we can see that this is a secure string
and the value is encrypted.
So what we'd like to do is now decrypt it,
so let's scroll down, and so for this there is a flag
and it's called with decryption equals true,
and so we're saying now okay, our DB password,
I want decryption to happen.
I'll click on save,
and now one more time I'm going to test my function,
but this time I get an error,
and obviously we're going to get an error,
an access denied exception again
because we're not allowed to use the customer master key
and decrypt our secrets.
So it turns out that because having given KMS access
to my IAM role we're not allowed to decrypt the secrets,
so this is a good proof that even though
I have access to this database password,
because it's encrypted and I don't have access to KMS
I'm not able to decrypt it,
and so that DB password is really safe and secure.
So you know the drill, to fix this I go to IAM
and I'm going to add an inline policy.
For the service I will choose KMS,
and for the action under right I'm going to allow decrypt
because we need to decrypt our secrets,
so this is the only thing I need to add,
and in terms of resources I can access
I'm going to say you can access a specific key,
and the region is going to be any,
the account's going to be any, and the key ID is,
and we need to find the key ID for this,
so let's go back to our EC2.
We're just going to go to IAM very quickly.
IAM, we're going to encryption keys.
Encryption keys I'm going to go to my region,
and here is my tutorial key in the middle,
so I'm going to keep the ID from here,
and this is exactly what I'm going to put, add.
So now we have access to this key and we're able to decrypt.
We'll review policies
and we'll say KMS decrypt tutorial key, create policy,
and so now we have given some KMS capability
to our Lambda function.
So if I go back to my Lambda console
and now I refresh my UI,
I should be seeing KMS in the designers.
That's great, now we have access to parameter store and KMS.
So if I test my function this time I get a success,
and it worked, and so if I look now
my dev URL is still the same,
but if I look at my database password
it has been decrypted to the value.
This is the dev password,
so the IAM policy was applied right away
and we're able to do this, so it's pretty cool.
Now we have basically showed how to use
get parameters using decryption,
and so now just want to show you a little trick
for switching between dev and prod,
so let's go to the environment variables
and I'm going to say dev or prod,
and this time I'm going to say dev,
and so we're going to use this environment variable.
So we're going to say dev or prod equals an os.environ,
and we have to just do this.
So I'll import the OS as well,
and now we're going to be able
to reference dev or prod within our code,
so to be very quick I'm going to have this in the middle.
So now we are saying basically based on
if we're in dev or in prod we're going to change
the name of the parameter we're trying to access.
I'll save this, so now if I test my function,
right now it worked and I'm getting my dev parameters,
so we're in dev, but if I scroll down
and go to my environment variable
and now say I want to access prod,
I'll save it, and I test my function.
Again, it worked but this time if you scroll down
we're seeing that we're getting my app/prod/db URL,
which is prod.database.stephane,
and also access the prod DB password, which is prodpassword,
and so this is really, really awesome
because now just using a simple environment variable
we're able to have our Lambda function
point to the right parameters in SSM.
So that's it, that's all I wanted to show you,
but I thought that was a cool tutorial
to show you the CLI and then Lambda.
I hope you liked it and I will see you in the next lecture.