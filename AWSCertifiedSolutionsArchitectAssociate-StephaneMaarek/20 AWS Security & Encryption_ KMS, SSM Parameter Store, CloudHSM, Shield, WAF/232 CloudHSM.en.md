
<v Instructor>Let's talk about another way</v>
to perform encryption on your cloud,
and that is going to be different than KMS.
This one is called CloudHSM.
So with KMS, AWS is the one that manages
the software for the encryption.
But with CloudHSM, AWS will just provision
you the encryption hardware, and you have to use
your own client to perform the encryption.
So HSM is a dedicated hardware to you.
HSM actually means Hardware Security Module.
The idea is that they give you a hardware,
the physical thing within Amazon,
and you manage all the rest.
So you manage your own encryption keys entirely,
not AWS, and AWS does not have access to
your key, or cannot even recover them.
The HSM device is tamper resistant,
so no one from the AWS team can touch your device,
and it has very high level of compliance.
The HSM clusters can be spread
across multiple availability zones, so
it's highly available, but you must set this up as well.
It supports both symmetric and asymmetric encryption,
which can be really helpful if
you want to generate some SSL or TLS key.
There's no free tier available,
and to use CloudHSM you must use
your own CloudHSM Client Software.
So example of services that do integrate
with CloudHSM, for example Redshift has support
for CloudHSM for database encryption and key management.
Or CloudHSM is also a really good idea if
you choose to use SSE-C as an encryption mechanism for S3.
And then, in this case, the key management software
will be within your HSM.
So just to get an idea of HSM, this is a diagram.
So as you can see here, AWS only manages the hardware,
and AWS cannot recover your keys
if you lose your credentials.
So really, if you decide to go with HSM,
you need to make sure that you manage your keys
and have a very strong way in place to not lose the keys.
And then your CloudHSM clients
will have a connection to your HSM device
to get right and generate some keys.
So what is the IAM permissions then or how are they helpful?
For IAM, you can create, read,
update, and delete an HSM cluster.
But you cannot manage the keys within.
To manage the keys within you need
to use the CloudHSM software that is not within the console.
And that allows you to manage the key and manage the users.
But that is not regulated by IAM.
This is really up to you to set up
your own security within your CloudHSM.
So I hope that helps, and I will see
you in the next lecture.