
<v Instructor>Welcome to the section</v>
on Security and Encryption.
These are not necessarily the most fun sections
to deal with, but they are super important for the exam.
The exam will definitely ask you a lot of security questions
as well as encryption.
And so KMS, the Encryption SDK,
the Parameter Store, IAM, all these things
are essential piece of the exam.
And I want to make this as easy as possible,
because Security, I know you're not an expert,
or maybe not an expert,
but it's tough to understand sometimes,
but I try to make it as simple as I can
with some diagrams, and hopefully,
there gonna be sections you'll have a good grasp
of how security works, and which security to use
in which circumstances,
and then you will rock all your questions.
So first, an overview of encryption mechanism.
And the first one is going to be Encryption in flight.
Then why would we want even Encryption in flight?
Well, we want Encryption in flight because
if I send a very sensitive secret,
for example, my credit card, to a server
to make a payment online,
I want to make sure that no one else on the way,
where my network packet is going to travel,
can see my credit card number.
And so I wanna make sure that when I make a payment online,
I have that green lock, I have that HTTPS website,
which guarantees me that it is an SSL-enabled website,
and then I will get Encryption in flight.
And so when you have Encryption in flight
the data will be encrypted before I send it,
and then the server will be decrypting it
after receiving it,
but only myself and the server know how to do these thing.
Now, the SSL certificates are what's going to help
with the encryption,
and so another way to see it is HTTPS.
So any time we've been dealing with an amazon service,
and had an HTTPS end point, that guaranteed us that it was
encryption in flight.
And now the whole web, almost the whole web,
needs to run on SSL and HTTPS.
Basically, when you have this enabled,
you are protected against a man in the middle attack,
and so this guarantees that
when you have that green lock
and the server certificate is valid,
that no one can retrieve your sensitive information.
So let's do a quick example;
here is us, and we want to touch in HTTPS website,
AWS, could be DynamoDB, could be whatever it wants,
and then what we're going to do is that we're gonna have
to have our super secret data, we're going to
encrypt it with SSL Encryption,
and send this over the network
and then the website will receive the data,
and know how to decrypt it.
Okay?
Very, very simple, the idea of it,
but the execution is not as easy, so this is
how much it will give you.
The good news is that all programing languages
know how to do SSL encryption and decryption,
and all the libraries do this for you,
so you don't have to worry about anything;
this is not something you have to deal with directly.
The second thing is going to be called
Server side encryption at rest.
And so this is when the data is encrypted after being
received by the server.
So before that, the server was receiving data,
decrypting it, and using in its decrypted form,
here the server's going to store the data on its disk,
and so we need to know that the server is storing
the data in an encrypted form.
Because, in case the server gets hijacked
by someone else, we don't want to let someone else
to be able to decrypt the data.
And so the data will be decrypted before being sent
back to our client.
So, thanks to key, usually called a data key,
then the data is going to be stored
in an encrypted form, and the encryption and decryption keys
must be managed somewhere usually called a KMS,
or Key Management Service,
and the server must have the right to talk
to the Key Management Service.
So, here's our object, and we're going to transfer it
for example to EBS, so it's gonna be transferred over
whatever mechanism, and EBS will use a data key,
and using a data key, it will perform encryption
of the data, and now it's stored in an encrypted form,
and then the data we need to retrieve the data
for whatever reason,
then EBS, the AWS Service will do decryption for us,
using the data key, again, and we'll get the encrypted data,
and back to us over HTTP or HTTPS for example.
So this is how servers had encryption works,
and as you can see, the server side itself of the service
manages the encryption and decryption,
and uses a data key it has access to.
So this is for server side encryption at rest.
And we've seen that many AWS Services do use that
encryption at rest.
Now let's talk about client side encryption.
And, in client side encryption the data will be encrypted
by the client, and the client is us.
And the server will never be able to decrypt the data.
The data will then be decrypted by a receiving client.
So all in all, the data is just stored along the server,
but the server doesn't know what the data means.
And the server, as best practice, should never be able
to decrypt the data anyway.
And for this, we could leverage something called
Envelop Encryption, but I have whole lecture on this
later on, because it's pretty advanced, but
the exam will ask you about Envelop Encryption.
So for now, let's just do an abstraction of it.
And so we have our objects, and on our clients
we're going to use a data key,
and we're going to encrypt our data client side, okay?
So, we perform encryption, we got data key.
Now we send our data to any store of data we want,
could be FTP, could be S3, could be
whatever you want really.
You put your data wherever you want,
in amazon or somewhere else.
And then when you receive it, your client will
receive an encrypted object, and if it has access
to the data key, if can manage to retrieve the data key
from somewhere, then it will be able to perform
a decryption and get the decrypted object
as a result.
So as you can see now, the encryption happens
client side, okay?
The server, the data stored does not know how to
decrypt or encrypt the data,
it just receives encrypted data.
And so that's quite secure as well.
So here are the three kinds of encryption you can get
overall, except Envelop Encryption that I will
show you later on.
So, this is not using any KMS just yet,
this is just an abstraction of how encryption works,
I know this might be a little bit simplified,
but hopefully that clears up what encryption is,
and then the next lecture, we're going to do
a deep dive into KMS.