
<v Instructor>Okay now lets talk about</v>
Elastic Network Interfaces or ENI.
So if you hear me say ENI I mean
Elastic Network Interfaces.
They're a logical component in a VPC
and they represent a virtual network card.
So they're what gives EC2 Instances access to the network,
but they're used outside EC2 Instances as well
as we'll see later in this course.
So for example we have an availability zone
and we have one EC2 Instance
and to it is attached on eth0, your primary ENI
and this will provide your EC2 Instance network connectivity
and for example, a private IP.
So each ENI can have the following attributes.
Number one it can have a Primary private IPv4
and one or more secondary IPv4. Okay.
So in this example, I have one of zero but
you are more than welcomed to add a secondary ENI to EC2
and that will be eth1
and this will give you another private IPv4 as well, okay. `
Each ENI can also have an elastic IPv4 per private IPv4
or one or more public IPv4,
so it gives you a private and a public IP
as will see in the hands-on.
You can have one or more security groups attached
to your ENI.
You can have a Mac address attached to it
and other things but I've just give you
the most important bits right now in this lecture.
And you can create ENI's independently from
your EC2 instances
and attach them on the fly
or move them from EC2 instances for failover.
So, let's have a look at what it looks like.
And by the way, they're bounded
to a specific availability zone or AZ.
So that means that if you create a ENI in the specific AZ,
you can only have it bound to that specific AZ.
So here's another issue to instance
and it has another ENI attached to it.
And for example, we can do is we can move eth1
from the first EC2 instance into the second EC2 Instance
to move that private IP.
And what it means is that that private IP will change
from the first issue to instance
and will be attached to the second EC2 Instance.
And it's very very helpful for failovers.
For example, if you're easy to instance is accessed
by a private static IP,
then you can move the IP around between
these two instances for failover purposes, okay.
So let's have a look in the hands-on
to see what it looks like.
Let's go ahead and create two instances very quickly.
So I'm going to choose Amazon NX2
and I'm going to use t2.micro
and I'll click on configure instant details.
I will launch two instances
and I will go ahead and run them
in the same availability zone.
So for the submit, I will choose this one,
for example eu-west-1a.
And then I will click on add storage, add tags
and configure security group,
review and launch, and launch.
And I will say, okay, I have this keypad.
Here we go so two instances are being launched
and they are in the same availability zone
which is eu-west-1a so if you click on this one,
for example, we can see that there is a IPv4 public IP
because they're launch publicly,
but also there is a private IP that has been assigned, okay,
so we have both a private and a public IP
but the interesting thing is that
on the network interface is,
it says eth0
and so if we click on it this network interface eth0
is going to be the primary interface for your EC2 instance
and it represents an interface ID which is an ENI
and this long ID right here
and so what we can look at is go to this ENI tab
and see what happens.
So the two instances will have both of the eth0 in here
and they have a different private IP and by the way,
if you wanted to access your network interfaces,
you would go scroll all the way down
and under networking security you have network interfaces.
So two ways of getting to that screen right here
and I'm going to remove the search filter.
And so as we can see here we have two network interfaces
that have been created for me
as I've been creating my two EC2 instances,
so we have this one and that one.
And if you look at each network interface ID,
as we can see if we go all the way to the right it's in use
and we have a IPv4 public IP assigned to it
and also a primary private IP and they're both different
because they're both attached to a different EC2 instance.
And so here we can see that
as we've created two EC2 Instances,
each one gets its own ENI.
The interesting bit is that we can go ahead
and create our own network interfaces.
So I'll just call it my secondary ENI
and we choose a subnet
and we need to share the subnet
that's going to be eu-west-1a as well,
so we are in the same AZ
and we can choose to assign a private IP,
do auto-assign or have a custom one.
That we'll just keep on auto-assign.
We could choose to be an Elastic Fabric Adapter
and we'll see this in hands-on when we go
to the HPC section, so at the very end.
Um, and for now we are good.
So we'll say IPv4 auto-assigned,
we can attach the security group,
so we can attach the same security group as before.
Click on create.
And we have our new ENI.
So if I remove the search filter, again.
Now we have three ENI's and it turns out
that one of them is available,
well the other two are in use.
So what I can do is take this ENI right click
and click on attach and that will allow me
to attach this ENI that's available
to one of my two instances.
So for example addition to this one and I click on attach,
as we can see now, on the right hand side it's in use
so it's been attached
and if I go back to my instances and refresh this page.
What we should be seeing is for one of the instances
it's going to have two ENIs.
So click on the first one and yes,
as we can see for the network interfaces now,
we have two ENIs, we have eth0 and eth1
and so this one provides us this private IP right here
and this one provides us a secondary private IP
that is different from the first one.
And the really cool thing about it is that
I'm able to move this ENI.
So right now it's attached to this instance,
but if I go back to my network interfaces, detach it
and I say, yes, I want to detach it
and wait for it to happen.
So it's going to take a few seconds.
So, let me refresh.
Now it's available So I can right click again,
attach it and this time I can select an instance
and will be my other instance that's running.
And here we go. I've made that ENI switch from instances.
So if I go to my second instance now refresh,
this one only has eth0 , which is expected.
And the second one has eth0 and eth1 as 2 ENI's.
So the really cool thing about it is,
now we can start playing with a lot of ENIs
and each of these ENI can be,
they can be specified and manage accordingly.
So you can manage IP addresses and assign more IP addresses.
For example this one now has two private IP addresses.
Which is quite nice.
Then you can go ahead and also change
the security groups attach to this ENI.
So I can attach a different security group to different ENIs
to manage security with a more granularity.
And I can change other settings such as
tags, descriptions, flow logs and create a flow long
and so on.
So right now the thing you need to remember is that
an ENI is a virtual network interface,
and you can attach it to EC2 instances and detach them.
There is a primary ENI, which is eth0
and a secondary ENI, which is eth1 and their different
and one can be detached and reattached
to other instances on demand where eth0 is the primary
and it cannot be detached, okay.
And so just you finish this hands-on,
you can detach this DNI
and then you can delete it when you're ready.
So you need to wait for it to be done,
but then you can delete it.
Right click deletes.
And then you can go ahead back to our instances
and terminate our two instances in here
and we're done with this hands-on.
Alright, that's it.
I hope you like this lecture
and I will see you in the next lecture.