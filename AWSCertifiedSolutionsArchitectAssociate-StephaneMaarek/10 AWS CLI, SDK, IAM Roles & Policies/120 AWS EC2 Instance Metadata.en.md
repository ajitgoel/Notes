
<v Instructor>So one more concept is called the</v>
EC2 Instance Metadata, it's a very powerful one
and I think it's one of the least known feature
to developers, so it's really good.
And when you discover it, you're like wow,
this is kind of awesome, so let's go through this.
It basically allows your EC2 instances to learn
about themselves, so they don't have
to use an IAM role for that purpose.
And that kind of makes sense right?
Your EC2 instances should be able to know
who they are and the URL for it,
and this something you should remember, is
169.254.169.254/latest/meta-data
and this is very, very, important.
This IP 169.254.169.254 is basically
an internal IP to AWS, it will not work
from your computer, it will only work
from your EC2 instances, and using this,
you can retrieve the IAM role name
from the Metadata, but you cannot
retrieve the IAM policy, right?
The only way to test the IAM policy is
to use the policy simulator or the dry run options.
But we cannot retrieve the content
of the IAM policy, using this URL.
Just to remember, the Metadata is the info
about the EC2 instance that we'll see in a second,
where as the user data, was to launch a script
of the EC2 instance, okay?
They are very, very, different concepts
and we'll be able to access both.
So let's practice and see what we can do
with this EC2 Instance Metadata.
So here I am in my EC2 instance
and the first thing I want to do is curl,
so curl is to query a URL and I will do a curl
on 169.254.169.254 and what we get out
of it is a bunch of numbers and dates.
This is basically the version of the API curl that
you're using and what I said is that,
for now we really don't care about the
API curl version and we'll just use slash, latest.
Now, when I run slash latest, let's just go right here,
slash latest, and you make sure
to always add the last slash, we get two
different fields, dynamic and metadata
and actually right here as well, you probably
don't see it, that's the third one, I'm sorry.
It is user data, so as you can see from this,
you're able to retrieve the metadata and the user data.
We're not interested into the user data right now,
we're interested into the metadata.
So let's go ahead and add metadata.
Always, never forget to add the slash at the very end.
From this, we get a bunch of different options.
We get AMI ID, launch index, host
name, IAM, et cetera, et cetera.
Anytime it ends with a slash, that means that there is
more to it, for example, IAM, there's a slash,
there's more to it, when it doesn't end
with a slash, that means it's a value.
So if we look for example, at the instance ID,
we'll do curl, instance, ID and what we get out
of it is my instance ID, pretty awesome right?
We could do the same with the local IPV four.
So local IPV four and we get the local IPV four
of our EC2 instance, so what you noticed here is that
we haven't been authorized through an IM role
to get this information, This comes for free.
Any EC2 instance without an IM role can request all
this information, and it is very important
for you to learn to navigate through it,
it's quite helpful when you do automation.
So for example, if I do host name,
I get the host name, and if I do IAM, as we'll see
in a second, we'll have more values to look at.
For example, info and there is this very one called
security credentials, so I'll just give
you a little insider about how things work.
Basically, when you attach an EC2 instance role,
and you type security credentials,
you're going to get the role name,
which is right here, my first EC2 role.
So my first EC2 role and what we get out
of this is an access key.
A secret access key and a token,
and so behind the scenes, when you attach an IAM role,
to an EC2 instance, the way for it
to perform API goals is that it queries
this whole URL right here, which it gets an
access key ID, a secret access key and a token.
And it turns out that this is a short lived credentials.
So as you can see, there is an expiration date
in here and that's usually something like one hour.
And so the idea is that your EC2 instance
gets temporary credentials through the IAM role that
it got attached to it.
So this is basically how the IAM roles work
on EC2 instances, I know that not many people tell
you about this, but I just wanted to peak
your curiosity, and show you the full URL.
But again, what you should remember is that using
this metadata, not user data, metadata
and this URL right here, 169.254., et cetera.
You can get information about a lot of stuff
from your EC2 instance, so I hope that was helpful
and I will see you in the next lecture.