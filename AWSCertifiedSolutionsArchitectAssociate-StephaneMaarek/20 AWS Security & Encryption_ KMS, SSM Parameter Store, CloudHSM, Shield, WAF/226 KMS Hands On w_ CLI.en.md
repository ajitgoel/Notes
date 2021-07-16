
<v Illustrator>Okay, so let's play</v>
with Key Management Service, or KMS.
And KMS is a service, as we said I've been using all along.
But let's go ahead and look at first on the left hand side,
the AWS managed keys.
So some of these keys that we see here are AWS manage keys.
And as we can see, we know they AWS managed
because they start with the AWS slash alias.
So we have one key for s3, one key for ACM,
one key for code commit, DynamoDB, Lambda,
elastic file system, you may have different keys
based on the services
you have enable encryption for or not.
So the idea is that, for example,
if we have an EFS volume,
or an Elastic File System in this example,
and we encrypted that Elastic File System with KMS,
then automatically, it would have used this Alias
aws/elasticfilesystem,
if we wanted to use the default AWS managed keys,
and this is a key that's going to be free.
So here we have six but you may have a different number.
And these are free and we don't have access over them
so we cannot use them outside of this service.
We cannot delete them, we cannot rotate them,
we can just get some default information about it,
and view the key policy, for example.
And these key policies allows EFS to access this key.
So if we look at it, we said principal AWS *,
and then if we scroll down,
we say that the via service has to be Elastic File System.
So that means that the service using the key has to be EFS,
which makes sense because this is an AWS/EFS key.
Okay, so this is the first kind of keys that we have,
the AWS managed keys,
and the second one we have is the customer managed keys.
So these are where we create our own keys in here.
And this is truly important to make sure
that if you do create a key here,
you're going to pay $1 per month.
So if you don't want to pay
then don't follow this hands on, just watch me do.
And finally, custom keys.
So just briefly, this is around the AWS CloudHSM cluster,
which is something that is out of scope for the exam,
so I don't include it in this lecture.
Okay, so customer managed keys, we are going to create a key
and now we have to configure the key type.
So it could be a symmetric key or an asymmetric key.
Symmetric key is the same key used
for encryption and decryption.
And asymmetric is when you have a public
and a private key pair.
If you want to do encrypt, decrypt
or sign verify operations.
So we're going to use a symmetric,
and in terms of the origin of the symmetric,
we're going to use KMS.
So KMS will generate our own key,
but we could provide the key value if you wanted to,
or use college SM, to generate that key for us.
But for now, we'll just use KMS, this is the most simple.
Okay, next, then we do enter an alias entity
in the description.
So I can just enter tutorial.
And for the description, I'm not going to enter anything.
Then we scroll down, do you want to type the key?
No, it is fine.
Then this is around the key policy.
So here, we can define key administrators.
If I don't do this,
then we're going to go with a default key policy.
So I'm going to keep it like this.
But if you want to have a more tailored key policy,
then in here you would choose what services
or what users and roles can administer
this key through the KMS API.
So I'm not going to do this right now,
I'm just going to say next.
And then who can use this key?
Again, if I don't set a new one,
we're going to use a default key policy,
which is what I want.
But if I wanted just one user,
for example, Stephen to access this key,
I would take this box and then click on Next.
But for now, no, we just want everyone
to be able to use it.
So we'll scroll down, and then click on Next.
And as we can see here, we can also specify other accounts
to access our key through here.
And this would be very helpful, for example,
if you wanted to copy a snapshot across accounts.
Okay, so next we have to review and edit the key policy.
And so this is what I call the default key policy,
which is to allow the root user
of my account to use this KMS key.
And by allowing the root user of my account,
this allows any user enrolls within my accounts
to access this KMS key, which is the most promising thing.
So this is great.
I wanna use this, and click on Finish.
So now my customer managed key has been created.
This is $1 per month, and it is enabled.
I can start using it, but I'm going to click on it
and see what more details about it before I do.
So here we can see the Alias the fact
that my key is enabled, it's ARN,
we can see some key actions, such as disabling the key,
or scheduling the key deletion.
We don't want to do this right now.
The cryptographic configuration shows me
it's a symmetric type of key,
and the source of who generated the key was KMS service.
And then it's symmetric default.
And with it, we can encrypt and decrypt.
There's a key policy, and right now it's empty.
If we go to the key policy view,
you can see it's allowing everyone in
because it's a default key policy.
So this is fine.
And then we don't have any key administrators,
and we haven't scheduled the key for deletion.
And we haven't added any key users or other accounts.
Finally, the key rotation will allow us to rotate this key
for extra security every year.
So if I take this box, then we automatically rotate
this CMK every year, and then you will click on Save.
Okay, so we have our key.
And this is great, but we wanna be able
to encrypt and decrypt some data.
So let's go ahead and play with the CLA.
So under KMS, I have kms-demo-cli.sh,
which is going to show us how to use the encrypt
and decrypt call of KMS with an example.
So, first we have to create a file
and we're going to call it ExampleSecretFile.txt.
And with it, I'm going to say
there is a super secret password.
Okay, so this is whatever you want in this text file.
For me, I just entered a password
called super secret password.
And we're going to encrypt it,
and then decrypt it using KMS.
So the first thing you have to do
for KMS encryption is use the encrypt command.
So we have to specify a key ID
for me its alias/tutorial.
So this corresponds to the key I have created in my console.
And you could use the alias,
you could use this key ID right here,
or you could use a full ARN, it doesn't really matter.
Just use whatever you want.
And then you need your pass in plaintext
the address of your file.
So for me it's ExampleSecretFile.txt.
The outputs of the query,
so you're querying for a CipherTextBlob,
which represents the encrypted contents.
And you want the text as is.
And finally, the region your key is in.
So for me mine is region eu-west-2.
This is going to give us a base64 file
containing the encrypted contents.
So let's copy this command right here, and paste it, run it.
And now I have a file
called ExampleSecretFileEcrypted.base64.
And this represents my encrypted file,
in base 64, so just with letters and numbers
that we can recognize.
Now, though, we're going to do a base64 decode
to get the binary encrypted value.
So if you're on Windows, the command is different.
So for Linux, I'm just going to run this one,
but for Windows, you can run the other one.
And so the idea is that you're going
to create a file called ExampleSecretFileEncrypted
without a base64.
So let me copy this
and paste it.
And now I have a new file,
called ExampleSecretFileEncrypted.
And if I try to open it with my text editor,
it's not going to work
because it uses either binary or unsupported text encoding.
So this is indeed a binary file.
So this is the kind of secret file
that you would share with someone.
And so now I want to go and decrypt it.
So this is completely gibberish.
And we cannot get any information of it,
even this one, we cannot get any information.
How do we know it's super secret password?
So this is an encrypted file.
But now we want to take this encrypted binary file
and decrypt it.
So for this, we're going to run a KMS decrypt command.
So this time, we pass in the file that was encrypted.
So this is where we pass in the file, in here.
Then we query for the plaintext value,
so the decrypted value,
and we write this to another file
that is going to be base64 encrypted.
And we specify the region.
So let's go ahead,
KMS knows automatically which key to use
for the encryption because it is included in the blob
of encrypted value.
So let me enter this.
And so this has succeeded.
So now if I go to my ExampleFileDecrypted.base64,
it is here, it's a much shorter thing.
And now we're going to base64 decode this
to get my text value, so we'll have a different command.
Again, if you're on Windows or if you're on Mac,
I'm on Linux so I'm going to use this one.
So I'm copying this command, pasting it.
And now we have done a base64 decoding of our file.
So if we go back to ExampleFileDecrypted.txt,
we find back our super secret password.
So we have shown the encryption
and it's reverse operation, the decryption.
Obviously, these are low level commands,
the SDK will abstract some of that for us,
but this shows you the full example
of how you can use the encrypt and decrypt command of KMS
with your own customer master key.
So that's it, super simple.
I hope that was helpful,
and I will see you in the next lecture.