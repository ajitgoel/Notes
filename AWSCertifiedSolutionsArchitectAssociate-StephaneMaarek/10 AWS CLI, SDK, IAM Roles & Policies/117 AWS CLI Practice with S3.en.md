
<v Instructor>So, now that we've set up</v>
the AWS CLI correctly,
it is time for us to practice and see how it works.
So, for this, we'll use, as an example, the S3 CLI.
So, I'll type AWS S3 CLI on Google,
and basically, it will give me
all the references of how I can use the CLI.
So, there's a bunch of comments,
such as CP, MV, remove, MB, RM, LS.
There's a lot of them, actually, okay?
So, let's go ahead and practice.
But, you can find the available
commands, all right here, and click on one.
Let's click on LS, for example.
LS is to list S3 objects and common prefixes,
under prefix for all S3 buckets.
So, for this, we can always go
to the example, and see how it works.
The number one command they
suggest us to do is AWS S3 LS.
And, this lists all your buckets in your AWS S3.
As you can see, I have two buckets.
Now we can list the content of one bucket, in particular.
So, I can do AWS LS, and then give S3 URL of
the bucket of Stephane.
Click enter.
And, as you can see now, within my bucket,
I have all these files, beach.jpeg,
coffee.jpeg, index.html.
So, using this command, it seems like
we are able to do all bunch of stuff in S3.
We can always play, and maybe download a file.
So, let's go back, and we'll do a copy.
So, copy allows you to, basically,
copy a local file, or S3 objects,
to another location, locally, or in S3.
So, basically, from your computer to S3
or from S3 to your computer.
So, let's have a look at how the examples work, obviously.
As you can see, there's always a lot of options happening.
So, something we can do is AWS S3 CP
minus minus help.
And, basically, when you use a help command,
you just don't put minus minus,
you just put AWS S3 CP help.
This will give you a bunch of documentation
that you can read directly in your command line.
This documentation is the exact same
that you can see on the website, on the left-hand side.
When you're ready to quit, just type Q.
Okay, so now let's use the command AWS S3.
So, we'll basically copy a file from S3,
from the bucket of Stephane.
And, we had a coffee.jpeg file that I really liked.
And, we have to copy it locally.
So, we'll say coffee.jpeg.
Press enter.
As you can see, my file has been downloaded.
So, if I do LL, I can see that I have
my coffee.jpeg file here.
I can do LS, so it's just a little bit clearer.
You know, there's a lot of AWS commands you can try,
especially for S3.
Another one that's pretty common is MB for make bucket.
And, so, you can basically create buckets on the fly.
So, let's just do an example.
AWS S3 MB S3,
and I'll just type some random stuff right here,
just so I know no one will have that bucket name before.
And, the make bucket succeeded.
And, if I do AWS S3 LS, we should be seeing three buckets.
And, alternatively, if I wanted to remove that bucket,
there will be a RB command.
And rb is to delete an empty S3 bucket.
So, again, just the example, right here.
I will do AWS S3 RB
and the URI of my S3 bucket,
which I will just copy here, for simplicity sake.
Press enter, and now my bucket is gone.
If I do LS again, we can see that my bucket is gone.
So, there's a lot of commands you can play with
for the AWS CLI.
There's not just S3.
I mean, there is all the possible services
of AWS we can get.
So, as you can see, all of the
available services are right here.
I mean, there's a lot of them.
Okay, EC2, autoscaling.
I mean, everything in AWS we can interact with, with a CLI.
But, S3 is quite a popular one.
And, in the next lecture, we'll
also explore some other CLI commands.
But, that's it, just to get a small practice on the CLI.
Obviously, if the CLI wasn't configured correctly,
you would get some errors.
But, overall, for me, it seems like
it's been configured correctly,
and I don't get any errors.
I hope you get the same.
That's just for a little taste here on the CLI.
I will see you in the next lecture.