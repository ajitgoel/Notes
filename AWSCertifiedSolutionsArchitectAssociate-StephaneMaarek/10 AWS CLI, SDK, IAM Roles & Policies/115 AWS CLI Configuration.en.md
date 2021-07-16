
In this lecture we're going to configure the AWS CLI,
so I want you to do it properly.
That means that your computer, just to get an idea
of how it works.
Your computer will access the AWS network
in your registered accounts using the CLI at the compulite
interface over the world wide web.
And so when you connect your computer to the CLI and to your
AWS accounts it will check for credentials and permissions
and so we'll learn how to set up these credentials
and how to protect them
and also I want to say right now, do not share your AWS
access key and secret key with anyone.
They're just like your username and your password
and you should not share them or show it to anyone.
In this lecture I'm going to show mine to you
but right after I'm going to invalidate them, okay?
So let's get started.
Now that we have set up our AWS CLI we need to configure it
and to do this we need to get access credentials from the
IAM service, so let's navigate to the IAM service,
click on users, find your user and then click on
security credentials.
So here is basically how you can login and get your
security credentials.
Access keys is what we'll put into our
AWS configure commands.
The first thing we have to do is to create an access key
and it says success, this is the only time that the secret
access key can be viewed or downloaded and you cannot
recover them later.
So the idea is that these keys, you need to save them
somewhere, so you click on download CSV file and so on.
These keys are super secret, right now I'm showing you mine
but I will make them inactive right after this lecture
otherwise you can use my account.
What I have to do is, and don't do this with your
colleagues, okay?
Is to get the access key ID and the secret access key,
let's go ahead and configure our AWS CLI, I'll keep this
open just for a little bit.
We go to the CLI and type aws configure
and this basically prompts us for the access key ID,
fairly easy, I can take the one from here and paste it
then press Enter.
I also need the secret access key, which I can copy
from here and paste it,
then you get to the default region name
and this region name is wherever your AWS account is.
For me I'm operating in eu-west-3 but based where you are
in the world and what you've been doing in this tutorial
so far, you can choose whatever region you want.
Finally the default output format is none, we can leave
it as the default.
Press Enter and here we go, the AWS CLI is configured.
If you type AWS CLI configure again basically it show you
that you have an access key ID, that you have a secret
access key, here's the region name and here's the format
and you could modify those if you wanted to.
What happens is that when you run this aws configure command
it goes and creates some files into a small folder
called .aws on Linux and mac, and it's also called .aws
but it's somewhere else on Windows
and you can just type aws configure windows just to see
where it is.
It creates two files, one called config and one called
credentials, so if you just look at what these files are,
if we look at the config file it says by default that
the region is eu-west-3 and that means that my
AWS CLI calls will by the way default to this region.
Now if I cat the other files, so if I wanted print what the
other file is, the credentials we can see that by default
it will use this AWS access key ID and this AWS secret key.
These files are not to be shared with anyone of course,
and that's it.
This is how you configure your CLI, now let me just show you
how to invalidate your configuration.
What I'm going to do is basically delete everything,
so I'll delete this one, by the way you can make inactive
as well if you wanted to.
Temporarily just make inactive, but I'll go
and delete these two.
Basically you cannot access my AWS account
and what I will do offline, is create a new access key
and use this access key to configure my AWS CLI.
Once you have done that, we're all good to get started
onto the practice with the CLI, so see you in the next
lecture.