
<v Instructor>So, before we go heads-on with VPC,</v>
we need to first understand CIDR,
and CIDR stands for Classless Inter-Domain Routing,
but no-one says that, everyone says CIDR,
and this lecture is specific to IPv4.
So, CIDR are used when you have Security Group rules
and also, in general, for AWS networking,
as we'll see in this section.
We've seen CiDRs when we started
defining our security groups.
So, when we have 000/0, or 122/1, et cetera, /32,
this was actually a CIDR, but they were very specific ones.
So, overall, what do CIDRs do, is well,
they help define an IP address range.
So, we've seen /32 and that means one IP,
and we've seen /0, that means all IPs,
but there is in-between zero and 32, a lot of numbers,
so we can define, for example, 192.168.00/26,
which represents a range of 64 IPs,
from 192.168.00 to 192.168.0.63.
So, we have to see and understand
why this is the case and how this works.
So, to understand CIDR, we need to understand
that there is two components to it.
The first one is the base IP, whatever you want, and then,
there is something called the Subnet Mask, the /26 part,
and the base IP, represents an IP
that it will be contained in the range,
where as the subnet mask will define
how many bits can change in the IP.
So, IP, overall we see them XX.XX.XX.XX,
but actually it just zero's and ones,
and there are 32 of them.
Now, I don't wanna go into specifics of how IP works,
but basically the subnet mask allow a few bits
of the IP to change, and that will define your range.
Now, the Subnet Mask can take two form.
If you have a Windows computer,
maybe you'll see this, 255.255.255.0.
That's less common, or, if you use AWS online, or whatever,
you'll see more like /24,
which is more common and easier to read.
It's up to you though, and in this lecture,
and its whole section in AWS,
we'll use the more common form, /24.
So, let's talk about the Subnet Mask now.
They basically allow the underlying IP
to get next values from the base IP,
because their underlying bits change.
So, if you have /32, we allow for one IP,
and how do we get that, with 2^0.
If we have /31, we allow for 2 IP, because it's 2^1.
/30 is 4 IP, 2^2, /29 is 8 IP, 2^3, /28 is 16 IP, 2^4.
So, as you can see here, any time
we allow a number of bit to change,
it's 2 at the power of number of bit to change,
that will be added as number of IPs,
and as you see, 32 corresponds to 0, 31 corresponds to 1,
so, it's basically 32 minus this number,
will give us the power in here.
So, /27 is 2^5, /26, is 2^6, it's 62 IPs.
/25 is 2^7, 128, 256, you get the idea.
Now, /16 is 2^16, which is 65,536 IP,
and then we'll get /0, which allows all IPs of 2^32.
So, you don't need to remember all that, obviously,
but you need to understand that it's 2^32, minus the number,
right there with the slash, and Quick memo,
/32 means no IP number can change,
/24 means the last IP number can change,
/16, the last two IP numbers can change,
/8, the last three, and /0, all IP numbers can change.
Just a quick memo.
But, now is just go and practice,
because I guess this is a new concept for some of you.
So, when we have this CIDR, what is it?
So, think about it, take time to reflect.
So, we have an IP, and we've /24.
What does /24 mean?
Well, that means that the last number can change, so,
we have this range, 192.168.0.0,
all the way to 0.255, and that represents 256 IP.
/16, what does that mean?
Well, that means that the last two number can change,
so, we get this range, and that's 65,536 IP,
so, as you can see, the last two numbers
can change all the way to 255, and finally, this one.
So, what is it?
It is /32, so that means that no numbers can change,
so it's just one IP, were represented,
and 0.0.0.0/0, you know already, it's all IP's.
So, when in doubt, you can use this little website
that I like, called ipaddressguide.com/cidr,
and we'll go, have a look at it right now.
So, I like this website, because it allows you to convert
a CIDR to an IP Range, or, and IP Range to a CIDR.
So, it's really helpful if you just know the IP range,
you know that you can't figure out the CIDR right away,
you just happen in there and then you get the CIDR.
So, let's have a look, if we do 10.0.0.0/16.
Well, we remember, we do allow
the last two numbers to change,
so, these two numbers should be able to change.
We'll calculate this, and we get
the subnet mask, which is right here.
The first IP and the last IP and the total numbers of hosts.
So, perfect, that's what we expected.
The last two numbers can change,
and we get 65 thousand and so IP,
and if we do /17, for something a little bit less obvious,
and we'll calculate it, we'll get the first IP,
and the last IP, as well as the total number of hosts.
So, this is really, really handy, but you know, you can do,
alternatively, you can refresh this page,
so, I'll go back to this page,
and what I can do, is just enter an IP range,
so, 10.0.0/0, and then, maybe this one,
last IP, 'cause that's the range I want,
and calculate my CIDR,
and it automatically says the result is 10.0.0/17,
and this is what you use in AWS,
so, really, really handy to be honest.
So, finally, we need to define what the difference
between a private and a public IP, for IPv4.
So, there is this internet authority, called the IANA,
it's for Internet Assigned Numbers Authority,
and they basically define that certain blocks
of IPv4 addresses, are going to be used
for private purposes, and the rest is going to be public.
So, private IP's only allow certain values,
and it's quite easy to remember.
The first one is 10.0.0.0, all the way to 10.255.255.255,
so, that's basically the CIDR 10.0.0.0/8,
and that's for big networks, so, that allows for
a lot of machines to be in that private network.
Then we have 172.16.0.0/12,
and that's the default one we get,
when we have a default VPC created,
when we create a new account,
and then we'll get the 192.168.0.0/16,
and you've seen this, I guess, before,
because this is what's usually used,
when you have a home network, with the WiFi and the router.
That's the kind of IPs we get on your internal home network.
So, all the rest of the IPs are not
in this ranges, are public IP.
So, that's it.
We're ready to go on with the section on VPC,
now that we understand CIDR and private IP,
and we'll see you in the next lecture.