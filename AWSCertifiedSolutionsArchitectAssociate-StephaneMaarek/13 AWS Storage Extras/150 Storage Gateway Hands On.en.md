
<v Instructor>Okay, so just a quick hands-on</v>
with Storage Gateway.
We're actually not going to set up one,
but I want to show you how it works behind the scenes,
and just so you can see how you can create one.
So you would get started, and then you would have an option
to choose the gateway type.
You could choose a file gateway,
a volume gateway, or a tape gateway.
So the idea I wanted to show you here is
that file is to store files as objects in Amazon S3,
and there's a local cache for latency access.
Volume gateway will be for block storage in Amazon S3
with point in-time backups as EBS snapshots.
And you can choose either a cached volume,
or the stored volume.
So this is exactly what I showed you before.
And then tape gateway to backup your data to Amazon S3
in Glacier, using your existing tape-based processes.
And so, for each of these basically,
if you were to create a file gateway,
you click on Next, and then you would need
to select a host platform where you would actually
download an image and run it on Premise,
or you can even use EC2 and then
there are some setup instructions for EC2.
We won't do it right now, but the idea is
that once you do all these things,
you note the IP address of the new instance,
you click on Next, and you write the IP address right here.
If everything is connected correctly,
if it's all configured, and you click on Connect to gateway,
then you'll have to activate it,
and then configure local disk, and you'll be done.
But we won't do it right now.
All I wanted to show you is that we could have
three options, file gateway, volume gateway,
could be cached or stored, and finally tape gateway.
Okay, that's it for this quick hands-on.
I will see you in the next lecture.