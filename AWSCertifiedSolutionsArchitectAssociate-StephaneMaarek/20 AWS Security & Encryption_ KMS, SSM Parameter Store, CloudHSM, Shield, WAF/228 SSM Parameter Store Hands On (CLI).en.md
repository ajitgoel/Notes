
<v ->So let's use the Systems Manager parameter store.</v>
And for this, I'm just going to type parameter
and it takes me directly to Systems Manager.
You could also type systems manager to find the UI.
So within Systems Manager now,
to find the parameters store,
on the left hand side you have to scroll all the way down
and you'll find it right here,
second to last, Parameter Store.
So the Parameter Store is for secrets
and configuration data management
and it is a way to centralize all these parameters
within your AWS accounts, which is great.
So here you can see how it works.
You create a new parameter,
then you specify the parameter type and value,
and you reference that parameter
from within your commands on your code,
which is exactly what we're going to do.
So for this, to get started,
click on create parameter.
So here I'll create a parameter called my-app,
and it's in the dev environment.
And the first one is a database URL.
And so I'll say database URL for my app in development.
Okay.
Now here we can have three type of types,
we can have a String,
and we can put whatever characters we want.
StringList, you have a list of strings using commas,
or SecureString, what it's encrypted.
Let's go with String first.
And so for example, here is a database URL.
So you can put whatever you want,
but it has to be 4096 characters.
So let's go ahead and say,
dev.database.stephanetheteacher.com.
And that's just something very random,
and maybe I'll add the port 3306.
So it's just whatever you want it to be, okay.
So here's just a random URL for me,
dev.database.stephanetheteacher.com:3306.
I'll go ahead and create that parameter.
And so here, the create parameter request succeeded.
And we have our first parameter.
Turns out that we can see the description,
the type and also the version.
So if we ever modify this parameter,
we'll get a last modified data that will be new,
and the last modify user that will be tracked as well,
so we can know who modified what.
If I click on this, again you get a summary.
You can see the history of the values,
and you can see the tags.
And we have our db-url.
So what I want to do is maybe create another parameter,
so I'll create a parameter
and this time, I call it db-password for our database.
And so I'll just say database password
from my app in development.
And here I have a SecureString,
so this time we're going to encrypt our secret.
And so we'll use KMS to encrypting.
We can use our current account or another account.
For our KMS key source we'll use our current account.
And we can use the AWS provided key, okay,
but we also can use the key we've created from before
so I've created a tutorial KMS key from before.
And so we can just use that one as well.
It's whatever you prefer based on how
you wanna manage your security.
So I'll use the my tutorial.
And here's the value.
And I'll say, this is the dev password.
And we don't see it because it's a secret value,
and this will be encrypted.
So I'll create the parameter.
And now we see that we have a new parameter right here,
called dev/db-password.
It's a SecureString now so that means it's encrypted
and the key ID is alias/tutorial, and the version is one.
If I click on it, we can see that the value is hidden,
but I can click on show,
and this will decrypt the value for me on the fly
and say this is the dev password.
So this is pretty cool now,
because what we can do is definitely copy these
and so we're going to do it again but this time in prod.
So let's go ahead and create parameters.
I'll create this in prod.
So I'll just change a bit, the path,
and I'll say database URL,
URL for my app in prod.
And I'll just be quick,
prod.database.stephanetheteacher.com:3306.
I'll create it.
And I'll just create one last parameter.
And we're going to create the db-password in prod
and the description is going to be in production
and SecureString, I'll use my same tutorial value
and here I'll say prod password, okay.
I'll create the parameter.
So now we have four parameters
and we want to be able to access them.
So what we can do is access them,
for example, using this CLI first.
So we are going to use this CLI to get the parameters.
So it's called get-parameters.
And you have to provide a names
and for this we have to provide
the names of the parameters we want.
So for me, I'll just say I want
my db-url and my db-password, and press Enter.
And now we get back from the API, two results.
We get the db-password back and the db-url.
So let's look at the result, right.
The first one is that it's a String for the db-url,
and here's the value of the String.
And as you can see, because it was not encrypted,
the value comes back decrypted,
and the version is one.
So that's perfect, we can see our database URL and use this.
But for the password it's a SecureString,
and here is the value of it,
which is an encrypted value.
So for this, you basically need to decrypt it.
And for this you have a special parameter
and it's called with-decryption,
so I'll do with-decryption.
And so this will check whether or not
I have the KMS permission to decrypt
this secret that was encrypted with the KMS tutorial key.
So press Enter.
And now this time, for my SecureString,
the value has been decrypted
because I specified the with-decryption parameter.
And so this is pretty cool
because very, very quickly,
we're able to have encrypted values
and people that can't access them
because they don't have access to KMS
that protects my password.
But if I have access to KMS,
I'll just provide one extra flag with-decryption
and here we go,
I get the value of my dev password.
So it's really, really neat.
The other thing we can do is
do aws ssm get-parameters-by-path
and lets go to the help.
So the get-parameters-by-path
allows us to go through a path
and we have to provide the path name.
And it has to start with a forward slash.
So if we do get parameters by path,
and I'm going to delete this,
I'm just going to keep my-app/dev/.
And I'll say get-parameters-by-path
and the path is going to be this.
Then this is going to query
for all the parameters under this path.
And this is why we have a tree structure.
And what we get out of it, obviously,
is dependent on we had from before.
So what we could do now is go one level up to just my-app,
and you --recursive to get
all the parameters recursively under my-app.
Press Enter and now we get our four parameters back,
db-password, db-url, db-password for prod
and db-url for prod.
So using this tree structure,
we're basically able to organize our secrets
and get them all at once which is really neat.
So that's it.
You can also obviously provide
the with-decryption flag and get the decryption.
So that's just for this CLI,
but in the next lecture I just wanna show you
how it works with AWS Lambda
because it is very simple as well.
So see you in the next lecture.