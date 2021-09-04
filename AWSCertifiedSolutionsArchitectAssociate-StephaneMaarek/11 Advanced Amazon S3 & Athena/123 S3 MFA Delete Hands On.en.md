
<v Instructor>Okay, so let's demonstrate MFA delete.</v>
So I'm going to create a bucket,
and I'll call it demo stephane MFA delete 2020 in eu-west-1.
And I'm going to enable bucket versioning,
and click on create buckets.
Okay, good.
Now, if we go to this bucket,
the MFA bucket,
and go to properties and bucket versioning
and click on edit.
As you can see, Multi-Factor authentication (MFA) delete
is currently disabled,
and you cannot change this
through the UI of Amazon console, for some reason.
So maybe someday they will allow us to enable it.
But for now,
what you have to do is to enable it
directly using the AWS CLI.
So a prerequisite of this hands-on is to make sure that,
under IAM,
you have already set up an MFA device
for your root accounts.
So I'm using my root account right now,
as you can see, it's, I'm logged in as roots.
And what I need to do is click on it and click on my
security credentials.
This is taking me to the security credentials I have in IAM.
And under a Multi-Factor authentication MFS,
you can see I've set up already a virtual device for my MFA,
and the ARN is right here.
Okay, so this is good.
Next, we have to go ahead and actually configure the ADA CLA
to use this root account.
Now, this is something I don't recommend on doing,
except for enabling MFA delete on your S3 bucket.
So what I'm going to do is to create new access keys,
and I will download the key file and then show the access
keys as well.
I will remove them, so don't worry about seeing mine,
but you should never share your root access key with anyone
as well as your secret access key.
And so what I need you to do now is to set up the CLA with
these two little settings.
So I'm going to configure my command line.
So AWS configure and then I'm going to create a profile
and I've called this profile, roots-MFA-delete-demo.
And this file, you can find under,
s3advanced.mfadelete.sh.
So we're using the comments from there.
So I'm going to set up this profile and then after you enter
my access key Id, which is right here.
So let's go ahead and paste this, my secret access key,
which is all the way here, paste it.
Default region name, eu-west-1, and we're good to go.
Now, if I do AWS S3 LS, does it work?
and do it with my profile that I've just created,
which is called by the way, root-MFA-delete-demo.
Yes this gives me my three buckets that I have.
So my profile is correctly set up.
Next, what I have to do is to enable the MFA delete.
So for this, there is this full setting right here
that I'm going to copy and then edit, with you.
So I paste it and I need to first change the bucket names.
So the bucket for now is called, MFA-demo-stephane
but I'm going to change it by demo-stephane-MFA-delete-2020,
which is good.
Versioning configuration status enabled.
MFA delete equals enabled.
So we are good to go here and then we need to specify the
ARN of the MFA device and this I can find.
So let's find it's right here.
This is the ARN of the MFA device,
So I'm going to paste it.
And finally, the MFA code.
This is something that I'm going to get directly from my
application, that gives me my MFA code.
So seven one zero three four three, press enter.
And apparently this is not correct.
So let's wait another one.
(typing)
And we're good to go.
Okay, so this was set up.
So now, how do we know if it worked?
Well, if I go into my bucket versioning and refresh,
as we can see now, bucket versioning,
it says bucket versioning is enabled
as well as Multi-Factor authentication,
MFA delete is enabled.
And so, how do we know if it worked?
Well, let's say I'm going to my objects
and I'm going to upload objects.
So let me upload, for example,
a copy of the JPEG file,
I will upload it, so this is working
Now If I go back to my buckets,
take that objects and delete it.
Okay, we're going to delete it,
but we have enabled versioning,
so this is just going to add a delete marker.
This is working as well.
So all in all so far, so good.
And if I list my bucket versions now,
okay I have two versions for my file,
but now if I wanted to, for example,
delete this specific version ID.
Okay, so this one is called a permanent delete.
It says, you cannot delete object
because Multi-Factor authentication, MFA deletes
is enabled for this bucket.
And so to do so we need to use the CLI command to delete
this file or disabled MFA delete.
So we can just go ahead and disable MFA delete,
so for this, the command is right here.
So it's the same command that this time will do
MFA delete equals disabled.
So I'm going to take the command from before and I'm going
to edit it out, so here we go.
MFA delete equals disabled and obviously
the MFA code I need to change.
So let me wait for the next MFA code to appear on my screen.
Hopefully it will work.
Press enter.
And here we go, this works.
So now if I try another time to delete, for example, delete,
the delete marker.
Yes, it is working because I have disabled MFA delete.
So let's confirm it by typing in this texts.
And then finally going back to my buckets,
go into my properties and under bucket versioning,
yes, we can see that MFA delete is disabled.
So that's it for this lecture.
I hope you liked it.
And obviously at the end of the lecture, I almost forgot,
but no, I didn't forget.
Please delete your route access key.
This is really bad to you have them
so, I will deactivate them and we're good to go,
and then finally I can probably delete them at some point.
Okay, so that's it.
Thank you so much, and I will see you in the next lecture.