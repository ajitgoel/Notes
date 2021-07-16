
<v Instructor>So, let's talk about Cross Account's</v>
AMI copying, because this quite a frequent exam question,
and there is a small little tip you need to have.
So, you can share an AMI with another AWS accounts.
And when you do so,
it does not change the ownership of the AMI.
So, if you share the account with someone else's account,
you still own the AMI.
But you need to know that if they do copy your AMI, okay,
and they copy your AMI into another region,
then they become the owner of that AMI.
So, it doesn't prevent against copying.
So basically, if you need someone to not copy your AMI,
you either not grant them EBS snapshot access,
or S3 bucket access.
But that's not all, there's not enough.
You can't just like prevent someone from copying,
because there is a way that if someone launches
an EC2 instance from an AMI you own,
and then makes a AMI from that EC2 instance,
basically they'll be able to create
and effectively copy your AMI.
So, the limit is that you can't copy
an encrypted AMI that was shared
with you from another account.
Instead, if you have access to the underlying snapchat
and encryption key, you copy while re-encrypting
with a key of your own.
So, that means that you register
the copy snapshot as a new AMI.
And more importantly, for the exam, you can't copy an AMI
with an associated billing product code that was shared
from you from another account.
So basically, if you get an Windows AMI,
or an AMI from the AWS Marketplace,
they will have their billing product.
Instead, if you wanna copy these things,
what you do is that you create an EC2 instance,
launch it from that AMI, and then you make a AMI
from it, from the instance,
and it effectively makes you a copy.
And this is what the exam will ask you.
The exam will ask you about billing product,
and say okay, billing product
must be coming from Windows AMI or the AWS Market Place.
And so when you do want to copy an AMI
with a billing product, you first launch
an EC2 instance from that AMI,
and then you make an AMI from that EC2 instance.
And that's it.
Alright, let's just quickly see the UI, how that works.
So, to share an AMI, fairly easy.
You right click, and then you modify the image permissions.
And here, you can make it either public,
and anyone can see it, or private,
and in which case you have to set the account numbers
that you want to have access to.
So, you can have whatever you want.
So, for example, if I take my account number right here,
right click, modify the image permissions,
I can add whatever number I want.
So, I'll just add a three at the end, and add permissions.
And so, all these accounts will have access to my AMI.
If I tick the box, create volume permissions,
that basically means that these account numbers
have the opportunity to make a copy of my AMI, okay.
If I don't tick it, they can still launch an instance
from my AMI, and then from the EC2 instance
they can create their own AMI.
So, it doesn't prevent them fully from copying it.
It just prevents them from copying
it, using the copy utility.
So, they can't do Copy AMI right away,
they have to launch an EC2 instance,
and then from that EC2 instance, create a AMI from it.
So, that's what you should know.
This is also valid for Marketplace images.
So if someone shares an AMI from the Marketplace
with you, you can't directly copy it.
You would have to launch an EC2 instance,
and from the EC2 instance,
you would have to basically create a new AMI from it.
So that's it, that's as simple as it is.
But it is something that comes up in the exam,
so you need to see it once to know it.
Alright, that's it.
I will see you in the next lecture.