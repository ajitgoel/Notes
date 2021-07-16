
So, let's go to the Route 53 console.
And, as we can see here, that's a scalable DNS.
So, Route 53 is a global service.
It does not require any region selection.
And then when you go to your hosted zones,
currently it shows a new AWS account for you.
You'll see nothing.
But for me, I already bought a purchase
and domain name and created a hosted zone from it.
So, we see stephanetheteacher.com.
So, let's go ahead, say we have nothing in it.
What you want to do is to purchase a domain.
So, for this, you go to Registered domains
and click on Register Domain.
And here you're able to choose a domain name,
so say whateveryouwantasadomainname.com.
Hopefully, that's available.
And it's available.
So, okay, $12 per year,
so just know that it's going to be pricey.
Then you add to cart.
You say register for one year.
You scroll down, say continue.
Then you put on all your information
and you should enable privacy protection
just to make sure that no one can know
what's your personal details.
So, you click on Enable here, which is by default.
Finally, you check your contact details.
You check the terms and conditions and say I agree,
and then finally, you click on Complete Purchase,
and it will go ahead and actually do the purchase.
Now, I'm not going to do it
because I already have a domain name.
Then it'll take about, maybe, an hour to get ready,
and then you can follow me along in this class.
After doing the request, it will be in Pending requests,
and you'll see it and you can see the status.
You'll receive some emails.
And then when you're all done,
it will be under Register Domain,
and you'll see the expiration date,
whether or not there is auto renew on, et cetera, et cetera.
All right.
So then you go to Hosted Zone,
and automatically because you purchased
a domain through Route 53,
then a hosted zone will be created for you.
And we can go ahead and click on it
and start creating some records.
So, currently, I do have some records created
for some of my applications, but don't worry about it.
Right now, you should only have two records.
And so what we'll do is that we'll create a record set,
and we'll create just a random record set.
We'll call it myfirstrecord.
And then we'll say A-IPv4 address,
and I'll say the value will be 11.22.33.44.
Just a very simple DNS record right here,
and click on create.
And here we go, it's been created.
And so now, basically, if I go on the internet
and look for this URL, myfirstrecord.stephanetheteacher.com,
I will be redirected in the back end
to this URL 11.22.33.44, this IPv4 address.
Now, obviously because I don't have any servers
at this address or anything like that,
it will not work, but you get the idea
of how these things work.
Now, how do we verify programmatically
that the DNS record of this thing actually points
to this IP is what I want to show you right now.
So, for this, we will go to the command line,
and if you're on Windows, it's called nslookup,
and you type the domain name.
So, my domain name here was
myfirstrecord.stephanetheteacher.com, so let's do it.
myfirstrecord.stephanetheteacher.com,
and this will give you something like this in Windows.
So, it tells you
that myfirstrecord.stephanetheteacher.com resolves
to 11.22.33.44, which is excellent.
And if you're on Mac, and I'll use this because I'm
on Mac and I'm more familiar with dig command,
you type dig and then myfirstrecord.stephanetheteacher.com,
and it give you something similar,
just a little bit more information.
So, here we see from the answer section
that myfirstrecord.stephanetheteacher.com
is the same, 11.22.33.44.
So, you're free to use whatever command you want.
If you're on Windows, nslookup.
If you're on Mac, Linux, use dig.
It's whatever you want, really.
I like dig, so I'll just follow along with dig,
but you're free to just use whatever you want.
So, this is how we check that a DNS record works.
I will say we haven't achieved much here.
We just created a record pointing to an IP
that we don't control, so there's not much going on,
but we'll see in this lecture
how we can make things interesting with a Root 53 DNS
and some applications running in the background,
so see you in the next lecture.