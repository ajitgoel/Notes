
<v Narrator>Okay. So now let's talk about</v>
Amazon S3 Encryption for your objects.
The idea is that you upload objects onto Amazon S3
and these are servers of AWS
and so you may want to make sure that
these objects are not accessible
for example, if someone gets into the Amazon servers
or you wanna make sure you get adhere
to some security standards set up by your company.
So as such, Amazon gives you four methods to encrypt objects
in Amazon S3.
The first one is called SSE S3.
This is to encrypt S3 objects,
using keys handled and managed by AWS.
The second one is SSE-KMS
to leverage AWS key management service
to manage your encryption keys.
The third one is SSE-C,
when you manage your own encryption keys
and finally client-side encryption.
Now we're going to do a deep dive on all of those
so don't worry.
And it's important to understand which ones are adapted
to which situation for the exam
because the exam will definitely ask you questions
to choose the right level of encryption
based on the scenario.
So let's do a deep dive first on SSE-S three.
This is an encryption where the keys
used to encrypt the data are handled
and managed by Amazon S3.
The object is going to be encrypted server side.
SSE means server-side encryption.
And it's the type of encryption is AES-256,
which is in logarithm.
So for this to upload an object
and sets the SSE S3 encryption
you must set a header called X-amz-server-side-encryption
AES-256. X-amz stands for
X Amazon.
So X Amazon, a server-side encryption AES-256.
And this is how you remember the name of the header.
So let's have a look.
We have an object and it is un-encrypted.
We have it written out
and we want to upload it into Amazon history
and perform some SSE-S3 encryption.
So for this
we're going to upload the objects onto Amazon S3.
You can use the HTTP protocol or the HTTPS protocol
and you can add the editor that we said
the X-amz-server-side-encryption AES256.
And then Amazon S3
thanks to this header knows that it should apply its own
S3 managed data key
and using the S3 Managed Key and the object,
some encryption will happen
and the object will be stored encrypted
into your Amazon S3 buckets.
Very simple, but here in this instance
the data key is entirely owned
and managed by Amazon S3.
Next SSE-KMS.
So we haven't seen what KMS is right now.
We'll see us pretty much towards the end of this course
on the security side.
But KMS is key management service
which is an encryption service for you.
So SSE-KMS is when you have your encryption keys
that are handled and managed by the KMS service
why will you use KMS over SSEs free?
Well, it gives you control over
who has access to what keys
and also gives you an audit trail.
Each object is going to be again, encrypted server side
and for this to work, we must set the header
X Amazon service side encryption to be a value AWS KMS.
So the idea is exactly the same
because it is server-side encryption.
We have the object we uploaded using HTTP and N the header
and then using this header.
Amazon S3 knows to apply the KMS customer master key
you have defined on top of it
and using this customer master key.
So the key of defined and your object
there's some encryption that will happen
and the file will be stored
in your S3 buckets under the SSE-KMS encryption scheme.
Next, we have SSE-C
that stands for server-side encryption
using the keys that you provide yourself outside of AWS.
So in this case, Amazon S3
does not store the encryption key you provide
so it will have absolutely have to use it
because it needs to do encryption
for then that key will be discarded
for this to transmit the data into AWS,
you must use HTTPS
because you're going to send a secret to AWS
and so you must have encryption in transit.
Encryption key must be provided in the HTTP headers
for every HTTP request made
because it's going to be discarded every single time.
So we have the object
and we want to have it encrypted in Amazon S3
but we want to provide ourselves
the client side data key
to perform the encryption.
So we send both of these things over HTTPS
so it's an encrypted connection between you,
the clients and Amazon S3
and the data key is in the header
so therefore Amazon S3 received the exact same object
and the client provided data key.
And then again, it is server-side encryption
so Amazon S3 will perform at the incorporeal
using these two things
and store the encrypted object into your S3 buckets.
If you wanted retrieve that file
from Amazon S3 using SSE-C
you would need to provide as well
the same at clients' side data key that was used
so it requires a lot more management on your end
because you manage to do the data keys and Amazon
or AWS in general does not know
which data keys you have used.
So it's a bit more involved.
Okay. And then finally Clients Side Encryption.
So it is when the clients, so you encrypt the object
before uploading it into Amazon S3.
Some client libraries can help you do this
for example, the Amazon S3 encryption clients
is a way to perform that Client Side Encryption
and as I said, clients must encrypt data
before sending it to S3.
And then in case you receive
data that is encrypted using client side encryption,
also C S E
then you are solely responsible
for decrypting the data yourself as well
so you need to make sure you have the right key available.
So, as I said, in Client Side Encryption
the customer manages entirely
the keys and the encryption cycle.
So let's have an example.
Amazon S3 this time is just the buckets
where it's not doing any encryption for us
because it is Client-Side Encryption
not Server Side encryption.
And so in the clients we'll use Encryption SDK
for example, the S3 Encryption SDK
will provide the object
and our client's side data key.
The encryption will happen client side
so the object is going to be fully encrypted
on the client side
and then we are going to just upload
that already encrypted object into Amazon S3.
Okay. So that's the four types of encryptions
hopefully that makes sense.
And I've been mentioning
encryption in transit in this lecture,
and I'll make it very clear what it is.
That's around SSL and TLS connections
so Amazon S3 is initiative the service
and it exposes HTTP endpoint that is not encrypted
and it exposes HTTPS end point
which is encrypted and provide what's called
encryption in flight
which relies on SSL and TLS certificates.
So you're free to use the end points you want
but if you use the console, for example
you would be using HTTPS and most clients would
by the way use HTTPS endpoint by default
and so if you're using HTTPS,
that means that there is data transfer between your clients
and Amazon S3 is going to be fully encrypted
and that's, what's called encryption in transit.
And one thing to know is that
in case you're using SSE-C so server-side encryption
and the key is provided by your clients
then HTTPS is mandatory.
Encryption in flight is also called SSL TLS
because it uses SSL and TLS certificates.
So that let's go into the hands-on
to see how encryption works now.