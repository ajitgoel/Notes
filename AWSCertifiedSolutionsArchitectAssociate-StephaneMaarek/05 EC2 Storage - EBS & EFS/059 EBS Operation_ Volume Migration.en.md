
<v Instructor>So something sysops need to know how to do</v>
is to do EBS migration.
So as I said, EBS volumes,
they're only locked to a specific AZ,
and so if you wanted to migrate it to a different AZ
or a different region,
you would need to snapshot the volume,
which you just did,
then would need to optionally copy the volume
to a different region,
and then we could create a volume from the snapshot
in the AZ of our choice.
Very simple, but it's good to see it once,
so let's practice.
So as a reminder,
if I go to my volumes,
both of my volumes are in eu-west-1b.
But say there was an instance in eu-west-1a
that I wanted to attach this volume to.
What I wanted to do is go to snapshots,
right click, create a volume,
and here I'll say, okay,
it's a five gigabyte gp2 volume, great.
And now the AZ I wanna put it in is eu-west-1a,
but I can choose whatever I want.
So now I'll just say create volume,
and here we go.
Now we go back to our volumes.
And very quickly, as we can see,
we'll get a new available volume right away here,
five gigabytes, restored from the snapshot,
as you can see.
So it says snapshot and this responds to my snapshot.
And it's available in eu-west-1a.
And so that's perfect.
We have very quickly using snapshots
migrated a volume from eu-west-1b to eu-west-1a.
Very simple thing to do, to be honest,
but you need to see it once as a sysops,
so I hope you enjoyed it,
and I will see you in the next lecture.