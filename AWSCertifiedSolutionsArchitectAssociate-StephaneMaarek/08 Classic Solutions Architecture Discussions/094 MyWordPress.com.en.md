
<v ->Okay, so yet another Stateful Web application</v>
and we are going to name this MyWordPress.com
so here we are trying to create a fully scalable
WordPress website and WordPress is a very, very
common way of creating a website it is very popular.
There is hosted WordPress available
but people like to deploy WordPress on AWS
and so we want to access that website
and we want to correctly display picture uploads,
so that it works that WordPress will store the pictures
somewhere on some drive and then basically
all your instances must access that data as well.
We'll see this in the solution architecture discussions
anyway. And so our user data, the blog content
and everything should be stored in a MySQL database
and we want this to scale globally
so let's see how we can achieve this.
So the first thing we have to do is to create a layer
that has RDS so we are now very familiar
with this kind of architecture with RDS in the back end
its Multi AZ it's going to be kind of
get through all of these 2 instances
but what if I just wanna go and go big
and really scale up, maybe I want to replace this layer
with Aurora MySQL an I can have Multi AZ, read replicas
even global databases if I wanted to.
Right here we're just basically getting less operations
by using Aurora, it's just a choice I'm making
as a solutions architect you don't have to
make that choice but I like Aurora,
I like the fact that it scales better
and I like the fact that it is easier to upwrite.
Okay, excellent, so now lets talk about storing images
so let's go back to the very simple
solution architecture when we have one EC2 instance
and it has one EBS volume attached to it
so it's in one AZ and so we're gonna get to
our loaded answer and so our user wants to
send an image to our loaded answer
and that image makes it all the way through to EBS
so the image is stored on EBS so now it works really well
we only have one EC2 instance
and so it goes straight the the EBS Volume
and we're happy. If we wanted to read that image,
same thing, the image can be read from the EBS Volume
and sent back to the user so very good, right?
The problem arrives when we start scaling
so now we have two EC2 instances and two different AZ
and each of these EC2 instances have their own
EBS Volumes and so what happens is that if I send
an image right here from this instance
and it gets stored on that EBS Volume
if I want to read that image maybe I'll make it this way
and yes, I can read it or, very common mistake
I can read that image and it will go here
and here on the bottom there is no image present
and so because it's not the same EBS Volume
and so here I won't be able to access my image
and so that's really, really bad.
So the problem with EBS Volumes is that it works really well
when you have one instance but when you start scaling
across multiple AZ or multiple instances
then it's starting to become problematic.
So for this we have seen it and how to store it basically
we can use EFS so let's use the exact same architecture
but now we are recording in EFS Network File System Drive
so EFS is NFS and so EFS basically creates ENI's
for Elastic Network Interface
and it creates these ENI's into each AZ
and this ENI can be used for all our EC2 instances
to access our EFS drive and the really cool thing here
is that the storage is shared between all the instances
so if we send an image to the M5 instance
to the ENI, to EFS so the image is stored in EFS
now if you wanna read the image,
it goes all the way to the bottom
and through the ENI and it's going to read on EFS
and yes EFS has that image available
so we can send it back and so this is a very common way
of scaling website storage across many different
EC2 instances to allow them all to have access to
the same files regardless of their availability zone
and how many instances we have.
So that's it that's that little subtlety
for WordPress but I wanted to discuss EBS vs EFS.
So we talked about Aurora Database
to basically have less operations
and have multi AZ and read replicas
and we've talked about storing data in EBS
which works great when we're in a single instance
application but it doesn't work really great when we have
many, and so maybe we can use EFS then
to have a distributed application
across multi AZ and that kind of stuff
now the costing aspect of it is that EBS is cheaper
than EFS but we do get a lot of advantages by using EFS
especially in these kind of use cases
so again, it's up to you as a solution architect
to really understand the trade offs for doing
and why you're doing things and the cost
implications of what you're doing.
So I hope that was helpful for this lecture
and I will see you in the next lecture.