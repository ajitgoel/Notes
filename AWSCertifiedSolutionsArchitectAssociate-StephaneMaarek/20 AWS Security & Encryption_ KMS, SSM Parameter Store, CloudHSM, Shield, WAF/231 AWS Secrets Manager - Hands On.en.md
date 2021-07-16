
So now let's look into a service called Secrets manager.
And the name is extremely obvious for one of the services that will be easily storing secrets into AWS.
And so with this you can rotate then manage them and you retrieve them.
And with API calls for their lifecycle.
So the big difference of secrets manager you'll have with something like parameter store with an encrypted
value like a secure string is that with secrets manager you can set up some rotation and you can link
it to a lambda function that will allow you to rotate your credentials on top of it.
It has very tight integration with RDS, Aurora postgres and so on and so the idea is that it will be a
little bit more easy to use and more secure with this.
But the idea is the same you're going to store secrets into a store and retrieve them at runtime.
So the pricing is that you have 40 cents per secrets per month and five cents for 10000 API calls and
you get a 30 day free trial available for the secret manager.
OK.
So it's all obviously managed by IAM for access to the do the secrets.
So this is kind of like this similar thing to parameter restore.
So let's go ahead and store a new secret.
And so as you can see we get different type of secrets and I'm pretty sure they will add secrets over
time to make this even more integrated with other AWS services.
But we can do a credential for an RDS database a credential for a Redshift cluster for a document
DB database for an other database or an other type of secrets.
And this is for example an API key.
So here this is really important.
Whenever you have a database it will prompt you would like a user name and a password and pretty much
username and password for everything here.
OK but if it's an other type of secrets then you will have key value pairs that you can place and you
will have secrets placed in here so you can set for example API key and then you would have the secret
value of the API key.
Right.
And this would be the your key value pair.
But you could have multiple ones you can just store not just one API key.
You could store for example secrets key for the API and you have a second value.
A second secret value.
Right.
So you're really free.
You have many as many key value pairs.
And that's also a little bit of a difference versus something like the parameter store.
So you can do this in secret or you can also do it in plaintext in your plaintext.
in JSON so this is would be a way to copy and paste.
JSON if you prefer this to entering things manually in this UI then you select the encryption key.
So do you want a default encryption key or do you want to use a KMS key you have created and so
on to encrypt these secrets so I'll use my KMS for example and then I'll click on next.
Then you need to give it your secret a name so I'll call it prod my secret API and then you can
have a description and you can have tags and then you click on next and then here we can configure automatic
or not automatic rotation.
So that means that if you have automated rotation automatically your secrets will be rotated.
And so that means that for example here I can say every 60 days I want you to rotate my secret.
You can have a custom value if you wanted to the max being one year.
And so that means that after 60 days there will be a Lambda function that will be invoked.
And so you need to create that Lambda function and that lambda function needs to have the role to rotate
that secrets.
So that means for example generating a new user name or refreshing the API key credentials with a third
party.
And so you're free to do whatever you want with your lambda functions.
But the idea is that after 60 days it will be invoked automatically by secrets manager to rotate the
secret the secrets we have just stored and that makes it a really powerful secret management solution.
So right now disable the automatic rotation and click on Next.
And so we're good to go and we can have simple code in any of our languages that we commonly used to
retrieve that secrets for example with Python.
If we look at it there is a get secret function and you best in the secret name the region name and
then you just initiate a total client to do API calls and then to get the value you do clients that
get secret value you put in this you pass in the secret IP which is a secret name and then you get the
response and in the response then you can just look at the keys that you need for example in the key
value pair we had and here secret string is the value of the key you want to retrieve and that's it's
very very fairly simple and you have this for it the language you are.
So if you're more of a good person here's go JavaScript Java and so on.
OK.
And that's as easy as it is to use the secrets manager.
And so this is just a normal key value pair of secrets.
And let me just show you how to do our guest database.
So I'll call this admin and then super secret password and then we would encrypt those as well.
And similarly you can also link this to an RDS database that the secret will access.
So the idea is that with these special integrations with RDS or redshift or document DB you would have
to select a database to integrate this with.
So that makes it a little bit more powerful because now the secret's manager will hold the value of
the username and password.
But on top of it it will also set these values on the linked RDS database automatically.
And you can also enable rotation as well to make sure that the secret rotates every so often.
So this wanted to just to show you this but you were not going to create an RDS database just
for the sake of linking the secrets to it but you get the idea.
So that's it's in a nutshell for secrets manager and when you're done you can just delete that secrets
and you'll be good to go and you can have a waiting period as well just to make sure that it doesn't
get updated deleted hastily.
So that's it for this lecture.
I hope you liked it.
And then we'll see you in the next lecture.