
<v Instructor>All right finally let's</v>
talk about the last operation,
which is how do you encrypt an EBS volume?
So when you created an encrypted EBS volume,
right away you get the following.
You get data at rest being encrypted inside your volume.
All the data in flight between the instance
and the volume is encrypted.
All the snapshots will be encrypted.
And all the volumes created from the snapshots
are encrypted so there is encryption all around the place.
And the old encryption and decryption mechanism
is handled transparently for you,
so you have nothing to do.
It's all handled by EC2 and EBS behind the scenes.
So encryption overall is something you should use,
because it has a very, very minimal impact on latency,
almost nothing.
And it leverages keys from KMS, so AES-256.
That's something that you should know.
And so when you copy an unencrypted snapshot,
then you enable encryption.
So let's talk about a very important thing
which is how do you encrypt an unencrypted EBS volumes?
So to encrypt an unencrypted EBS volumes,
which is a very tough thing to say (chuckles),
you create and EBS snapshot of the volume.
Then you encrypt the EBS snapshot, using the copy function.
Then we create a new EBS volume from the snapshots
and that volume will also be encrypted.
And now we can attach the encrypted volume
to the original instance.
So let's go have a look at how we do this in the console.
Okay, so if we look at our volumes, this one,
that was the one we created from before.
The encrypted flag says not encrypted,
so this volume is not encrypted.
And maybe we wanted to encrypt it.
So we right click, we create a snapshot,
but we already done that, so we go to the snapshot
and here is our snapshot.
As we can see our snapshot, encrypted
is not encrypted.
So because we did a snapshot of a
non-encrypted EBS volume, we get a non-encrypted snapshot.
Now right click.
If I wanted to create a volume from it as you can see,
the volume will also be not encrypted,
so it's not what we want.
So as I said in the lecture,
what I need to do is right click and copy.
By copying this snapshot,
I can click here and encrypt this snapshot.
So I can put any region that I want,
but I can stay within this same region, which I will do.
And I will say okay, encrypt this snapshot
using the default AWS EBS master key.
Copy, and here we go.
Now the snapshot is being copied,
and if I refresh, now we can see that
we have a copied snapshot right away from here.
So the snapshot is being created.
Now the snapshot, if we look at the bottom right,
it says encrypted, encrypted, and then we get
some KMS information around how it's been encrypted.
Which is quite neat.
So then you just wait for the encrypted copy to happen.
And so now it's completed.
I right click and create a volume from it.
And here we go.
Now the encryption is encrypted.
And so if you were to create a volume of five gigabytes
and maybe eu-west-1b, just to keep the same AZ.
And click on create volume, and go to that volume now.
In the volume EBS thing, so I'll just wait
just a little bit, here we go.
Here it is.
Now we can see that this new volume in eu-west-1b,
is available and it is encrypted,
right away, for us, right off the bat.
So this is pretty cool, this is how you would go
and encrypt an EBS volume. (chuckles)
I know it's very manual, so you could
automate this if you wanted to,
but super important for you to see it once.
Okay I hope you enjoyed it.
I will see you in the next lecture.