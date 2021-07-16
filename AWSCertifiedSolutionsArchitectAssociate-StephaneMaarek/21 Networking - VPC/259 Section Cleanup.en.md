
<v Instructor>Okay so, we have created a lot</v>
of things in this section and it's time to clean up.
so for this let's go to EC2 and first I'm just going to
delete all of these instances,
I'm going to terminate all these three instances
I've created and we should be good.
Alright, next, maybe something we have to do
is go to Route 53,
so let's open a tab, go to route 53...
and in there, I can go to my hosted Zone,
and this was a private hosted zone but now I can delete it,
I don't need it anymore.
Okay, before you delete this hosted zone,
first we have to do is to delete all the records within it
so this demo record I can just delete it,
yes, delete it and then back to hosted zone,
I go to the hosted zones and then
delete the hosted zone itself.
And it's gone. OK excellent. In S3 we have a bunch
of flow logs so if you want to just clean up
your VPC flow log you can just,
for example delete everything so we;
action and we delete all the AWS' logs and then once it's
deleted we can even delete the bucket,
so go to stephane VPC flow logs and then,
I could if i wanted to, delete the bucket,
but I'm not going to do this.
See now we don't need to delete everything/anything,
this is serverless and we don't use it is not going to cost
us anything, but if you wanted to delete that table you
could just click onto the table and
that table would just go away.
Next we have to go to the VPC specifics section,
this is a bit more.
so the first thing we have to do is
maybe delete that internet gateway so I'll just
detach it from the VPC and it says
for now it has some mapped public address so
we need to wait for these instances to go down first,
so maybe we can start deleting the VPC peering connection
and this is sort of like a trial and error type of thing
because all of a sudden you have to delete a lot of things
so sometimes the order won't work,
anyways we just trying it out, so VPC peering connection
will also delete the related route table entries.
yes delete, and this has been deleted, great.
let's talk about route tables.
maybe we can delete these two route tables,
so I'll delete them and this said -
what's the problem, they have association so,
they cannot be deleted, so we need to first unassociated
these subnets with these so I go to subnet Association
edit them and then untick, press on save
and same for public route, I will untick the associations,
press on save and now I'm able to delete route tables.
Excellent, they're being deleted this is the main route
table and it will get deleted when the VPC
gets deleted itself.
the egress only internet gateway, we can also delete it,
that will be great. Now let's try to delete this one again
will it work?
Still not working, we'll see this later.
OK for endpoints we can delete that Endpoint,
so I'll delete that Endpoint entirely to connect to a string
okay, network ACL's, we have default NACL and new Nacl
so this one, we can delete. delete the new network ACL
Okay. now this looks like we have deleted
a lot of things already, but we could also delete
our subnets so all these subnets we can delete,
but I think we delete them automatically if we delete
our VPC so one thing I'm wondering is,
if we go now into deleting up the NAT gateway
obviously so delete Nat gateway, okay here we go,
this one is in deleting state so it will take a little
bit of time to get deleted, I'll just wait a minute or two
until it does. While this happens we can go into our VPC and
we can delete the flow logger entries so,
we'll just one by one delete the flow logs.
This one has been deleted and now the other one, delete
the flow log so I suspect this Nat gateway that
now has been deleted was the problem as why we
couldn't delete this internet gateway so let's try again,
see if this works, yes, he has now we don't have any
internet gateways in the region and so now I
think we are ready to delete the VPC entirely
so we'll delete the VPC and it says okay we'll delete
all of these things as well so some things we didn't
have to delete to automatically but whatever.
click on delete VPC and everything gets deleted,
it seems like there are no errors so we're clean.
So now we should be good, no more VPC everything
we've created is gone and that's it for this lecture,
it's a long clean up I know but it's a good way to see
everything you've deleted and everything we've created and
how they are linked together,
And I will see you in the next lecture.