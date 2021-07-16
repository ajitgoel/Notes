
<v Instructor>Okay, so now let's talk</v>
about SSL and TLS certificates.
So this is a dumbed down version of how this works.
This is obviously way more complicated,
but I want to introduce you to the concept
in case you don't know it.
And even if you do know SSL and TLS,
please watch this lecture,
I'm going to talk about SNI and I'm going to talk about
the integrations with load balancers.
So bear with me, please.
So an SSL certificate, allows the traffic
between your clients and your load balancer to be encrypted
while in transit, this is called inflight encryption.
So it means that data, as it goes through a network
is going to be encrypted and only going to be able
to be decrypted by the sender and the receiver.
So SSL refers to Secure Sockets Layer,
and it's used to encrypt transfer connections.
And TLS is the newer version of SSL.
And it refers to Transport Layer Security.
But the thing is nowadays, TLS certificates are the one
that are mainly used by people including myself,
I will still refer this as SSL.
So I'm making a mistake, but I'm making it on purpose, okay?
So it's better to say a TLS certificate,
than SSL certificate, but for many reasons,
I'm still going to say it's SSL
'cause it's easier to understand.
So, public SSL certificates are issued
by certificates authorities,
and they include something like Comodo, Symantec, GoDaddy,
GlobalSign, Digicert, Letsencrypt, and so on.
And using this public SSL certificate
attached to our load balancer,
we're able to encrypt the connection
between the clients and the load balancer.
So whenever you go to your website,
for example google.com or anything, any other website
and you have a lock, or a green lock,
that means that your traffic is encrypted.
And if your traffic is not encrypted,
you'll have a red sign saying,
"Hey, traffic is not encrypted,
"don't put your credit card details,
"don't put your login information, because it's not secure."
So the SSL certificates, they have an expiration date
that you set, and they must be renewed regularly
to make sure that they're authentic, okay?
So how does it work from a load balancer perspective?
So users connect over HTTPS, and it's S
because it's using SSL certificates
and it's encrypted, it's secure,
and it connects over the public internet
to your load balancer.
And internally, your load balancer does something called
SSL certificate termination.
And in the backend, it can talk to your EC2 instance,
using HTTP, so not encrypted,
but the traffic goes over your VBC,
which is private traffic network,
and that is somewhat secure.
So the load balancer will load and X509 certificate,
which is called SSL or TLS server certificate.
And you can manage these SSL certificates in AWS using ACM,
meaning AWS certificates manager.
So we're not going to view ACM in that lecture,
but just to get an idea of what it is.
Now you can also upload your own certificates
to ACM if you wanted to.
And when you set an HTTP listener, you must,
HTTPS listener, you must specify a default certificate.
Then you can add an optional list of certs
to support the multiple domains,
and clients can use something called SNI
or server name indication,
to specify the hostname they reach.
Now, don't worry, I'm going to explain
what SNI is in details in the next slide,
because it is really, really important for you
to understand what it means.
That means that, and you can also finally for as HTTPS
set a specific security policy if you wanted to,
if you want to support older versions of SSL and TLS,
called also legacy clients.
Okay, so let's talk about SNI 'cause it is so important.
SNI solves a very important problem, which is
how do you load multiple SSL certificates
onto one web server, in order for that web server
to serve multiple websites?
And there's a newer protocol that now requires the client
to indicate the hostname of the target server
in the initial SSL handshake.
So the client will say, "I want to connect to this website"
and the server will know what certificate to load.
And so this is a newer protocol,
and this is something new, not every client supports this.
So it only works when you use the application load balancer
and the network load balancer,
so the newer generations, or a CloudFront,
and we'll see what CloudFront is later in this course.
And it does not work when you use the classic load balancer
because it is older generation.
So anytime you see multiple SSL certificates
onto your load balancer, think ALB or NLB.
So as a diagram, what does it look like?
We have our ALB here, and we have two target groups.
The first one is ww.my corp.com
and the second one is Domain1.example.com.
So the ALB will be routing to these target groups
based on some rules, and the rules may be directly linked
in this case, to the hostname.
So the ALB will have two SSL certificates,
domain1.example.com and ww.mycorp.com
which corresponds to the corresponding target groups.
Now the clients connects to our ALB and says,
"I would like ww.my corp.com"
and that is part of server name indication.
And the ALB says, "Okay, I've seen that you want mycorp.com
"let me use the correct SSL certificates
"to fill that request."
So it's going to take the right SSL certificates,
encrypt the traffic and then thanks to the rules
it's going to know, to redirect
to the correct target group mycorp.com.
And obviously if you have another client
connecting to your ALB for Domain1.example.com
then you will be able to pull the right SSL certificate
again and connected to the right target group.
So using SNI or a server name indication,
you are able to have multiple target groups
for different websites using different SSL certificates.
Excellent.
So finally, what is it supported for SSL certificates?
So classic load balancer, is yes,
you can only support one SSL certificate.
And if you want multiple host names
with multiple SSL certificates,
the best way is to use multiple classic load balancer.
For ALB, the V2 in which, you can support multiple listeners
with multiple SSL certificates,
and that's the great part of it.
And it uses SNI to make it work and we just saw what it is.
And for the NLB or network load balancer,
it supports again multiple listeners
with multiple SSL certificates.
And it will use SNI again to make it work.
Okay, so let's look at the classic load balancer.
And if we go to listeners, here I'm able to edit
and add an HTTPS listener,
and I need to set up a cipher,
which is the protocols we want to support,
and that's a security cipher.
And then I need to set up an SSL certificate,
and I can import it directly
and have it here, manually encoded.
Or I can choose a certificate from ACM,
which is Amazon certificate manager,
but we don't have one yet, so we can't use it.
But I wanted to show you that yes,
you can set up an HTTPS certificate in here,
and it supports only one SSL certificate.
So that is for the classic load balancer.
Next for the application load balancer,
we can add another listener as well.
So we'll say, "Okay, this listener is HTTPS."
And the default action is to forward
to our target group, excellent.
Now we set a security policy, this one and then we say
what is the default SSL certificate.
So is it from ACM from IAM or imports, okay?
And we can choose a certificate to be want.
But the idea is that now for each rule,
we can have a different SSL certificate
and that would allow us using server name indication, SNI
to have multiple SSL certificates
on different target groups.
So very, very good.
But again, I'm not going to do it
because we don't have the right certificates in place.
And for NLB listener, again, you can add a listener,
and this one can be TLS for secure TCP,
and again, the default SSL certificates we have
can be imported from ACM, IAM or written manually.
All right, so that's it for this lecture.
So just to show you how the settings work.
So what I need you to remember is that
the CLB is the old way of doing things
it does not support SNI.
And ALB and NLB do support SNI
and multiple SSL certificates.
All right, that's it.
I will see you in the next lecture.