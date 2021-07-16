
<v Instructor>Okay so in my Management Console,</v>
I'm gonna go to EC2.
And in EC2 I'm going to go to Instances
and I will create and Instance,
so I will launch an Instance
and I will choose Amazon Linux 2, that's perfect.
I'll select this one
t2.micro because it's free tier eligible.
Instance details, I will leave everything as-is.
This is perfect.
Click on Next: Add Storage.
And here we can see now that,
we've been skipping this all along
but our root volume is gonna be dev/xvda
and it's eight gigabytes in size and its a gp2 volume
but I could choose io1 if I wanted to.
And here we get some information about IOPS.
We'll get more details on this later,
and Throughputs, and there's a tick box
saying Delete on Termination.
So when our Instance gets deleted
the volume will get deleted as well.
Now let's play and add a new volume.
We're going to add an EBS volume.
Device is where you want to attach it,
so the point of attachment.
We'll just use /dev/sdb.
And we could use a snapshot to restore from,
but for now we don't know what snapshots are
so we'll just forget about it.
We'll say two gigabytes in size
and it's going to be a gb2 volume.
And I can say encrypted/not encrypted
but right now I will say not encrypted.
I could tick the box delete on termination
but I don't want to
so I'll leave Delete on Termination unticked.
As you can see when you're a free tier eligible customer
you can get up to 30 gigabytes of EBS volume for free.
So it's kinda neat.
Alright, Next: Add Tags.
I'm fine with this.
I will maybe add a tag and say:
Name, EBSDemo just to have one tag,
and then click on Next: Configure a Security Group.
I'll just select one, maybe AWSSSH,
the one we have, which is great,
which allows me to SSH into it.
Review and Launch.
And then I will just launch it.
In terms of key pair, I'll choose my AWSCourse key pair,
and click on Launch Instances.
So now what has happened is that we have created
an EC2 Instance
and it has two EBS volumes attached to it.
So if we look at the bottom right, right here,
the root device is dev/xvda
and the block devices are dev/xvda and dev/sdb.
So here is my second EBS volume that was attached.
If we go to Volumes on the bottom left,
we can see that we have two volumes right here.
They inherited the nametag EBSDemo.
The first one is going to be the root volume.
It's eight gigabytes in size,
and the second one is going to be
the volume that I created, two gigabytes in size.
And they're both in the same availability zone, eu-west-1b,
which is the exact same as were my Instances.
And so here we are starting
to get a good idea of how things work.
Now we can go into this Instance and maybe SSH into it,
just to have a look at a few things.
So I will run the SSH command
and I will add the IP of my machine.
Here I am, I am in.
And so let's see what it is.
So there's something that you use called lsblk,
and this shows you basically all the attached drives.
So we have xvda, which is our eight gigabyte EBS volume
that is mounted onto slash, so that's our root volume.
And then we have xvdb which is two gigabytes
and is our added EBS volume.
And right now it's not formatted,
it's not mounted anywhere, so we can't access it.
So I'll just show you how to do this.
For this, no secret.
We have to go to the Amazon documentation
because this is the kind of thing
that you don't remember (chuckling) on the spot.
And so it just shows you how to do
making an EBS volume available for use on Linux.
So let's go and scroll down,
lsblk is what you run, it's to see all the disks available.
So we do see that xvdb has been attached.
Then we scroll down and we do sudo file -s on the device.
So sudo file -s on the device, so /dev/xvdb
and this gives us data.
So when we get data,
that means that there is no file system on the device
and we must create one, and then we go to step four.
In case there was a file system,
we will get this kind of output right here.
So let's go to step four
to basically format this file system
and we'll create a ext4 file system for the volume.
So for this, we'll do
sudo mkfs -t ext4 and then the device name.
So let's do this right now;
sudo mkfs -t,
t is ext4, so ext4 is just a way of formatting the volume,
and then /dev/xvdb.
Okay, excellent, it's done.
So you get a lot of output.
And now we need to mount our directory,
maybe in a data folder.
So we'll create sudo mkdir and then /data.
So we have created a data folder.
And then we introduce sudo mount,
the device name, which is /dev/xvdb
onto the data folder.
Done, so now (chuckling)
let's have a look at how this works.
If we do lsblk, now we can see that our xvdb drive
has been mounted to the data folder.
And so if I go to the data folder,
do data folder with a forward slash,
and then I will just sudo touch Hello.txt.
Here I just have a Hello.txt file being created on my drive.
So pretty cool, and we can just say sudo nano Hello.txt
just to edit that file,
and I'll just say hello world.
And I'll exit, save, yes, okay.
So as you can see now
in my Hello.txt file there is hello world,
and that file directly lives on my second EBS volume,
which is quite cool.
So, optionally, you can mount this EBS volume
on every system reboot,
and for this we need to add a entry to etc/fstab.
So we'll just back up etc/fstab,
I'll just copy this command right here, okay.
Now we're going to open this etc/fstab
and then we're going to add some information.
So for this I'll do sudo nano /etc/fstab
and here, basically, you need to add a line.
So we need to add the device name, the mount point,
the file system type, and some information.
So let's go ahead and do it.
/dev/xvdb then the mount point's going to be /data
the file system type is going to be ext4
and then the mount options
is something we can just get from here.
So we'll just copy this defaults,nofail 0 2
and that's a bit simpler,
and we're done.
Exit and save, okay, now we're done.
And now basically on reboot of our Instance
our disk is going to be automatically mounted
to /data so we can verify this by just
cat-ing this file and looking at the fact that, yes,
all looks good.
Alright, so next what we can do, as we scroll down,
is to basically verify
that our file system has been formatted.
So let's do this, we can do sudo file -s /dev/xvdb
and this now says that our xvdb EBS volume
is now ext4 filesystem data,
quite cool, quite interesting.
And yeah, we're pretty okay with this.
Now we can just unmount data,
so we'll do sudo unmount, so umount/data
and that's basically to end
because I'm in the wrong directory.
Let's do it again,
sudo umount/data
now my drive has been unmounted.
So if I do lsblk now we can see that my drive is unmounted,
and if I do sudo mount -a
we're going to test our fstab file.
It worked, and then lsblk, yes,
the mount point is now data.
So that's it.
It's just a little bit (chuckling) of stuff to do
but I think is quite a cool way of seeing
how to attach an EBS volume and format it.
It's something that you should be knowing as a sysop.
It's not something that they might ask you in the exam
but always good to know these things.
It helps your understanding.
So that's it for the intro to EBS.
I will see you in the next lecture.