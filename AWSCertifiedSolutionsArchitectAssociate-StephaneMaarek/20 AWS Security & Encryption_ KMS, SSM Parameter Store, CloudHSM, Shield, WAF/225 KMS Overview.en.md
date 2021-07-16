
<v Instructor>So, we've seen encryption in this course</v>
but now let's do a deep dive into KMS,
or Key Management Service.
So usually, any time you hear encryption within a service
it's mostly likely going to be KMS
and KMS is great because with the KMS keys
you can easily control who and what can access your data
and it (mumbles) manage all the encryption keys for us.
KMS is fully integrated with IAM for authorization
so that makes the management of these rules
very simple and centralized.
KMS is at the center of AWS
and it was going to be integrated
into pretty much everything.
So your EBS volumes, you encrypt them
your S3 for doing server side encryption of your objects
Amazon Redshift to encrypt your data
RDS as well to encrypt your underlying data
SSM, the parameter store, as we'll see in the next hands-on
to perform and encrypt some secrets
et cetera, et cetera, et cetera.
And, to use KMS, not only can you use it
with the (mumbles) services you have
but you can also use it with the CLI or any AWS SDK.
So now, let's talk about customer master keys or CMK.
And there two types of KMS.
The first offering of KMS are called symmetric keys
and they're AES-256-bit type of encryption keys
and they were the first offering
you use a single encryption keys
for encrypting and decrypting data
and this is why it's called a symmetric encryption key.
Now, a lot of services that are integrated with KMS
actually used under the hood
this symmetric customer master keys.
They're also necessary, as we'll see
when we do envelope encryption
and with KMS, when you generate a symmetric key
you actually never get access to the key unencrypted
you must use the KMS API to use that key
and you actually never see the key.
The second types of keys you have in KMS
are asymmetric key
and they belong to the RSA and ECC key pairs.
So, with asymmetric, this time, you have two keys,
you have a public key for encryption
and the private key for decryption
and this is the basics, for example, of how SSL works.
So, how do we use this keys?
Well, we can use them for encryption and decrypting,
so, with a public key, we encrypt
and with a private key, we decrypt
or also a new use case in KMS called sign/verify operations.
Now, the public key is something you can download
because it is public
but again, access to the private key is impossible.
So the use case of asymmetric keys would be
to do an encryption outside of AWS
by users who can't call the KMS API.
So, from an exam perspective, I think we're gonna be tested
the most on is going to be symmetric keys
so I'm going to spend most of my time on KMS
on symmetric keys.
But you need to know that asymmetric keys
have a public and private key
that is used to anchor, decrypt or sign/verify operations
and the use case is to do encryption outside of AWS
by users who cannot call the KMS API.
Okay.
So, now let's go into the symmetric key in more details.
So we're able to fully manage the keys and the policies.
So you can create these keys,
you can define rotation polices,
disable them, enable them,
and then through CloudTrail integration
you're able to audit the key usage
so see who use the keys and when.
There are three types of customer master keys.
There is the AWS managed
service default customer master key, which is free
so this is the idea when you go into EBS volume
and use the AWS/EBS key, this is going to be free.
Then, if you create your own keys, this is $1 per month
and there is no free tier
and if you import your own keys,
so if you have to generate them outside of KMS,
even though it's not very recommended,
then it's also going to be $1 per month.
And then, for KMS,
you're going to pay for each API call done to KMS
so we're talking about 3 cents per 10,000 calls.
So when would you use KMS?
Well, anytime you need to share some sensitive information
you would use KMS such as database passwords,
credentials for an external service,
a private key of SSL certificates,
or anything you need to encrypted is going to be secret,
KMS is the way to go.
Now, the idea is that with KMS,
the real value is that we actually don't see the keys
to encrypt the data or decrypt
so the whole security belongs with AWS.
To use that key we're able to,
where we can use we can send data to KMS
to decrypt and encrypt
and so that's the real value of KMS.
On top of it, KMS can rotate these keys for extra security.
So, the idea with encryption is that
you would never, ever, ever store any of your secrets
of database password et cetera et cetera
in plaintext, and especially in your code.
So what you should do
is that you should encrypt these secrets instead,
so you can encrypt them
and then you can store them in code or environment variables
and that's fine because they are encrypted.
So KMS has a limit,
and you can only encrypt up to 4 kilobytes of data per call
and so, if you want to have more data encrypted,
which is most often going to be the case,
then you need to use something called envelope encryption
which is advanced and you only need to know
in the certified developer exam.
So we'll see this in the certified developer courses.
So, to give access to KMS to someone,
they need to make sure that the key policy
allows the user to access the key
as well the IAM policy to allow the API call
and when these two things are together,
then you get access to KMS key.
It should make a lot of sense when we go into the hands-on.
Another thing is that with your KMS keys
are bound to a specific region.
So that means that when you create a KMS key in region A
it cannot be transmitted over to region B.
So let's say we have an encrypted EBS volume with KMS
and a KMS key in the region eu-west-2
and we'd like to copy that volume across to a new region
for example, ap-southeast-2.
So, because KMS keys are linked to a specific region
you would need to do a specific operation.
So here is the process
and this applies to EBS volumes, Redshift snapshots,
pretty much everything that is encrypted with a AWS KMS.
So, first you would create a snapshot of your volume
and any snapshot made from an encrypted volume
is also encrypted with KMS and the same key.
Then, you need to copy that snapshot over to the new region
but you will specify a new KMS key
to re-encrypt the data with
so became KMS Key B in the other region
and now you have a snapshot encrypted with KMS
in the other region but with a new key.
And finally, when you recreate a volume from that snapshot
then that volume will be encrypted with a new KMS Key B.
So super important to see here
that because KMS keys are bound to a specific region
when you copy snapshots over
they have to be re-encrypted.
Now, let's talk about key policies.
To control access to KMS, we saw there was IM policies
and key policies.
So key policies are similar to S3 bucket policies
and you can resource policies we've seen in this course
but the difference is that
you cannot control access without them.
So if you don't specify a key policy,
then no one can access your key.
In so as such, the default KMS key policy, by default,
is very permissive, it's created by default
if you don't provide a specific KMS key policy
and it's going to give access to the root user
which means that your entire AWS account
has the right to use this KMS key, on top of
only if they have the IM policy available obviously.
So to give users access to KMS keys
using this default KMS key policy
very simple, you just create the correct IM policy
and attach it to the user.
If you define a custom KMS key policy
then you would specifically define the users
and the roles they can access this specific KMS key
and define who can administer the key
and finally, this is going to be very helpful
when you do cross-account access of your KMS key.
So, let's finally talk about
cross-account copying of snapshots
now that we know about key policies.
So when you create a snapshots
it would be encrypted with your own CMK,
then you would attach a key policy
to authorize cross-account access on that key.
This would be an example key policy
in which we allow the target account to read our KMS key
then we would share the encrypted snapshots
and in the target account,
we would create a copy of the snapshots
which would be possible
because we have access to the KMS key
in our original accounts
and then finally,
we would create a volume from that snapshots
and this is how we was create and copy
a snapshot across accounts.
So that's it for KMS, it's a long introduction, I know,
but there is everything you need to know here
and let's go into the hands-on
to see how we can practice this.