
<v Instructor>Okay, in this lecture,</v>
let's talk about network ACLs and security group.
So it is super important for you to understand
the distinction because it can come up very often
in the exam to understand what's the difference
between network ACLs and security group.
Now, for shortness purposes, I will refer to network ACLs
at NACLs sometimes, N-A-C-L.
All right, so we have an EC2 instance
and we know from a long time ago now
that we have a security group around it.
Now, our EC2 instance resides within the subnets,
so left of a blue vertical bar is my subnet
and so outside my subnet,
there is a network access control list or NACL.
And that's at a subnet level,
so it's before traffic even gets
into our subnet or EC2 instance.
So let's evaluate an incoming request.
Say for example that our EC2 is a web server
and we expose in the Apache application on port 22
and we want to see how the request works.
So the incoming request will come from the right-hand side
and the first thing that will get evaluated
is the network ACL inbound rules.
And we'll see whether or not the inbound rule works.
If the inbound rule passes,
then it will get passed on
to the security group inbound rule
because the traffic will go and will bass the subnet edge,
will go into the security group firewall
and we will evaluate the security group inbound rule.
If that rule passes, then our EC2 instance
receive the request on the web server
and now is going to serve it.
So it's going to say Here Is My Web Page
and now it has to send back the traffic
to the requester.
So, the first thing is that the outbound
will be allowed no matter what,
because security groups are stateful.
That means if an inbound request passes,
then the outbound request will pass as well,
even if there is a rule to deny any traffic
out of the EC2 instance.
An inbound rule passes, then the outbound rule
passes as well.
And then because the outbound rule passed,
we go into the network ACL rules
and we evaluate the NACL outbound rules
and that is stateless.
That means that outbound rule will get evaluated.
So that's the structure of an incoming request.
The really cool thing to note here
is that for our network ACL, this is stateless,
so both the inbound rules and the outbound rules
will get evaluated, where as for a security group,
if the inbound rule allowed the traffic to go in,
then the security group
will allow the traffic to go out for that request.
Super important.
Let's do it again, but for an outgoing request now.
The same, we have our EC2 instance with a security group
and it's behind a subnet
and we have a NACL at the subnet level
and now we're looking at outgoing request
so this time, our EC2 instance is making a request,
an outgoing one, so it's making,
we're going to evaluate the security group outbound rules
to make sure that they can leave the EC2 instance.
Then it's going to get into the NACL outbound rules
to make sure it works,
so now we request in maybe google.com
to respond to us. Google.com give us the reply.
We receive a request back from Google,
It's an inbound rule, this time, that will get evaluated
and that is stateless, so it will get evaluated,
and then it goes back into our EC2 instance,
but inbound will be allowed, no matter what,
because this is stateful, okay,
and we've seen that very often.
If we query google.com,
the request comes back to us
even though we haven't opened any port on our EC2 instance.
I guess that makes sense now.
So this is really important for you to understand and see
because this matters a lot.
We'll see this in the hands-on,
just to test out if you use cases.
So, what are network ACLs?
Well, they're like a firewall
that control access from and to a subnet.
So it's at a subnet level.
And the default NACL allows
everything outbound and everything inbound,
so it doesn't restrict anything, which is great
when you wanna get started,
and you define one NACL per subnet,
and new subnets will be assigned
the default NACL by default.
Now, to define NACL rules,
you'd basically assign a number between one and 32,766
and basically, if the rule has a low number,
then they have a higher precedence.
That means that they will,
as soon as there's a match,
the rule is being evaluated
and it's the highest number that wins.
So, if you define for example,
100 Allow IP and 200 Deny IP, then the IP will be allowed
overall because 100 is less than 200.
Last rule will be an asterisk
and that means that all the requests will be denied
if there's no rule match, and you can't change that,
and overall when you start adding rules,
AWS recommends adding rules by increment of 100,
just in case you wanna add rules later in between.
Now, if you great a new NACL, then it will deny everything
and overall, we'll see use case of NACL.
They're a great way, for example,
of blocking a specific IP at the subnet level.
So let's have a play with those right now
to understand exactly how they work.
So I'm going to my network ACLs right here
on the bottom left, and as we can see,
if I select a VPC to be the demo VPC,
I have one network ACL and that's the default NACL,
this one that was created by default
and it's associated with four subnets.
Okay, excellent.
So if we look at inbound rules,
we see that's all traffic and all port,
all protocols from anywhere is allowed
in this rule number 100.
Whereas all traffic from anywhere else
is the denied, so that's rule with an asterisk.
That means that if there's no rule match, then deny it.
And for outbound rules, again,
all outbound traffic is allowed
and that's rule number 100,
and then if it doesn't match any rules,
then the star will set it deny.
All right, so now let's have the play.
So what I'm going to do is that
I'm going to go on my EC2 instance, the public one,
and I'm going to run the small Apache server.
So I'm going to modify the inbound rules for this one,
so I'm going to my launch wizard, inbound,
and I'm going to edit and add an HTP rule
to allow from anywhere to connect to my EC2 instance.
So I'll say, OK, great.
Now, let's SSH into this instance.
Actually, it's already done,
so if I just disconnect from my private instance.
Here I am, I am in my public one.
We can just SSH again using your command,
so we're back into my public instance.
Now, I'm going to do sudo su
yum install httpd.
Yes.
Systemctl enable httpd
then systemctl start httpd
and then we're going to echo hello world
into var dub dub dub html index.html.
Okay,
so now if we go to our public instance public IP,
so this one, and we open a new window
the we get hello world back.
Excellent, so this is just the basics.
So right now, our NACL allows every traffic in
and then obviously, we get back to this hello world page.
So now, if we edit our inbound rules
and we wanna add a rule, so for example,
the rule number is going to be 80,
just to have a rule that will have higher precedence
and I will say OK.
Inbound rules http.
I'm going to just deny it from anywhere,
so here I denied http traffic on my inbound.
As you can see, well, it looks like it's denied
so if I refresh my page right here,
you see it starts to time out.
There's like an everloading thing.
So right now, it shows that yes,
I cannot access my instance on port 80,
even though my security group has not changed.
You see port 80 is still allowed,
but now NACL is actually stopping my request right now.
So if I change this rule and now make this 200
instead of making it 80,
because 200 is more than 100 then,
basically, what do you think will happen?
Well, because all traffic will be matched first as a rule,
then this will never be matched
and so our traffic should be allowed.
So if we stop this and refresh this page,
now we get the hello world back.
Excellent, right?
So now, to have a look at this statefulness
of our EC2 instance.
For example, right now, let's go to our launch,
to our security group.
As we can see, outbound, it allows all traffic,
but I'm just going to remove this,
so now, all traffic is denied.
So if I go back to my EC2 instance,
actually, it's blocked because actually
all traffic is denied.
I can't even touch anything right here,
but if we still access the url, it will work.
So even though all outbound traffic is denied,
then, because we can access it
through this inbound rule on port 80,
then because the security group is stateful,
we also get the response back no matter what.
So this works still,
even though there is no outbound rules right here.
So, for sake, I'm just going to allow all traffic again
from anywhere, so anywhere, here we go.
Just to put it back as normal.
So this just show the statefulness of our security group.
So here, you could play a little bit and see what happens.
Basically, you should change the network ACLs
where you deny http traffic, et cetera, et cetera.
But the really cool thing is now you can start
editing your rules and choose whatever you want.
So, you can log a specific IP, for example.
You can say rule number 80.
And you will say OK, All Traffic
All Traffic, and then you would have to put your IP
so you put 11-22-33-44, whatever your IP is,
slash 32 and deny
and this will effectively block your IP
from accessing any of your resources in your network ACL
so this could be quite interesting what you can do with it
and this will would be the primary usage
of a network ACL
is to basically deny all traffic.
Now, outbound rules, we have to be very careful
because they also get evaluated.
So if I go and edit my outbound rule,
right now, let's see.
This website works, it's just fine,
but if I go back to my network ACL
and remove this outbound rule.
So for example, I will say deny all traffic from anywhere.
Let's do this.
Deny all traffic from anywhere
and if I try to refresh,
well my EC2 instance get my request
and then it went back through the security group,
but then because the network ACL outbound rules denied me
from doing this request, then the request
is not coming a back to me and I get a time out.
So it's very important for you to see that
this network ACLs are stateless,
that means both the inbound rules and the outbound rules
get evaluated at every request.
So I click on Save, and we're back to normal.
So super important, right?
So here is the very handy comparison
between network Acls and security group.
So security group is at the instance level
whereas network ACL is at the subnet level.
Security groups support allow rules only
where as this support allow and explicit deny rules.
It is stateful, so that means the return traffic
is automatically allowed, regardless of any rules
and we just demonstrated this,
whereas network ACL is stateless
so the return traffic must be explicitly
allowed by the rules.
Then for security group, all the rules are evaluated
before deciding whether to allow traffic,
whereas for network ACLs, we look at the rule number
and the one with the lowest number
that matches the traffic winds
and then this security group applies to an instance
only if someone specifies security group
when launching the instance or associate later on,
whereas this one automatically applies
to all instances in the subnet associated with.
So we don't have to rely to users
to specify the security group
and that gives you another line of defense.
Finally, if you're wondering what
a strict network ACL looks like, have a look at this link.
So let's look at it together.
So in this example, we have a network ACL
and if we scroll down, it shows us
a default network ACL.
This is the one we have from before
where everything is allowed and then the rest is denied
and then if we scroll down, we get a custom network ACL,
an example of it, so if you look at it,
for example, here, inbound
allows anything on port 80 for http.
Anything on port 443 for https.
SSH only from a very small siter,
that is a private home network siter,
and RDP which is the SSH for Windows
as well on the same siter,
and then there is a custom TCP inbound for these ports
which are very high ports
and they are called ephemeral ports
and they're basically ports
that can be selected and we'll see what that means,
this is basically how the network connections
on the internet work when there's a request and response
and then every traffic else is denied.
So this is quite a restrictive network ACL
and then on the outbound, let's have a look.
It allows port 80, port 443,
and then it allows all these ephemeral ports again
to be allowed and we'll see what ephemeral ports right now.
So if we scroll down,
you're finding that ephemeral ports
are defined in this example to be this range.
But basically, let's look at it why.
A client that initiates a request
chooses the ephemeral port range, which is in this range,
and then the responding system
gives us back the answer at this port.
So we need to open these ports.
But basically, if you use a Linux kernel,
they will be this range.
If you use an ELB, it'll be a much wider range.
So 124 to 65,535
and if you use Windows server, it'll be a smaller range,
125 to 5,000, et cetera, et cetera.
So based on the operating system that you choose,
the ephemeral port that comes back
into your infrastructure may be different.
And so, in practice, it says,
to cover the different types of client
that might initiate traffic to public-facing instances
in your VPC, you can open ephemeral ports
124 to 65,535.
So this is very important for you to see
and then it says that you can add rules
explicitly to deny traffic on any malicious port
within that range.
So this is super important for you to understand.
Again, not something we have to implement right now,
but ephemeral ports must be opened
in the network ACLs if you have a very strict one.
Finally, last thing, promise.
If you create a new network ACL,
so if you create a new network ACL for your VPC,
by default, everything will be denied,
so if you look at this new NACL inbound rules,
everything is denied.
In outbound rules, everything is denied.
So we need to manually add our rules
and then we could associate that with different subnets.
So that's it for this lecture.
I hope you enjoyed it.
I know that was really long
but I hope it makes sense into what ACLs are
versus security groups,
and I will see you in the next lecture.