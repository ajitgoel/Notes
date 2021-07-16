
<v Instructor>So Route53 is also a registrar,</v>
and we've seen this before.
What is a registrar?
It's basically an organization that manages the reservation
of internet domain names.
And so there is some famous names in there
that we all know.
There's first of all, GoDaddy, or Google Domains, et cetera.
And also, we've seen this in this lecture,
in this whole section, Route53 or AWS is also a registrar.
So we can buy domain names on a registrar and on AWS.
But one thing you should know,
is that domain registrar is different from a DNS.
Although both on the Route53 name,
we get these two features.
They are very different.
One is to offer DNS and the other one
is to offer domain registration.
So there is something little known
that it is possible to use a third party domain registrar
with AWS Route53.
So if you buy your domain on another website,
you are still able to use Route53
to define all the rules, et cetera, et cetera.
How would you do it?
Well number one, you create a hosted zone in Route53.
And number two, you update the name server, so NS, records
on the third party website to use the Route53 name servers.
And then, again, I want to remind you,
domain registrar is not DNS,
but each domain registrar usually comes
with some sort of DNS features.
So I just wanna show you one of these things
on my personal domain.
So let me show you right now.
So here is my Google Domain for datacumulus.com,
which is my own company.
And so as we can see here, the name servers,
I got an option.
Either I use the Google Domain name servers,
or I can use custom name servers.
So if I use the Google Domain name servers,
then I choose my DNS to be the one that comes
with this interface.
But if I use custom name server,
I'm able to insert here the AWS name servers
and then from there I'll be able to create a public zone
and configure my DNS records in there.
And then what would I put in the name server space?
Well if I go back to Route 53, click on Hosted zones,
and then I would need to create a new hosted zone
for my domain name.
So it would be datacumulus.com, et cetera.
I will not do it right now, but if I were to do this,
then I would click on the domain name here,
on the radio button.
And on the right hand side, as we can see,
there is name servers and these four name servers,
all of these four URLs, is what I would have to put
in my Google Domain name server.
So put this one,
I would put the second one, you get the idea.
I would put the four of them,
and then I would click on Save,
and then automatically now,
for my domain, datacumulus.com,
it will be using this specific private hosted zone,
public hosted zone, in Route53.
So that's it.
It's just something that can come up with the exam.
How do you integrate a third party domain with Route53?
And I hope that just gives you a clear answer.
The idea is to create your domain elsewhere,
but have the name servers of your elsewhere point,
directly into your hosted zone.
So that's it, I hope you liked it,
and I will see you in the next lecture.