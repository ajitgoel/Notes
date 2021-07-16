
<v Narrator>Let's quickly talk about DNS resolution</v>
in a VPC.
There are two very important settings
and the exam may ask you about them.
The first one is enableDnsSupport
and that is a DNS resolution setting.
The default is True.
It helps decide if the DNS resolution
is supported for the VPC.
That means that if it's true there is an AWS DNS server
that will be queried automatically as a primary DNS
that's 169.254.169.253.
There's second setting called enableDnsHostname which is
a DNS hostname setting as well seen in the hands on.
By default it's false when you create a new VPC like we did.
It's true by default when you create a default DBC.
So when it's comes with your accounts
or if you use the VPC wizard.
It won't do anything, this setting,
unless you also have enableDnsSupport=true.
If it's true as well then it will assign public hostname
to EC2 instances.
If it has a public IP.
If you use a custom DNS domain the trick is,
if you have a private zone in Route 53 then you
must set both these attributes to true for your instances
to resolve that private zone.
Let's have a look at this setting
and their impact right now.
Let's go to our VPC.
We have our demo VPC right here available.
If you right-click and we edit DNS resolution we
can see that this setting is by default enable.
This will basically resolve the AWS DNS for us.
This is great.
If I look at the DNS hostname, by default it is disabled.
What happens when we enable it?
I'll show you in a second.
First let's go to EC2.
If we look at our public instance that was created
in our public Subnet, it does have an IPv4 public IP.
It does not have a public DNS.
This is what this setting does.
If we do change the setting to enable and click on save.
DNS hostnames have been updated.
Now if you go back to our EC2 management console
and we wait just a little bit.
As you can see, now my instance has a public DNS
that was assigned to it automatically.
Thanks to these things now we could go into Route 53.
This is where you would be able to create
a private hosted zone.
Go to hosted zones, create zone.
Then you would make this a private hosted zone.
You have the domain of whatever you want.
We'll just say fubar.internal.
It's just a random domain.
I'll call it internal domain.
Now we'll set the type as a Private Hosted Zone
for Amazon VPC.
It says, "To use private zones you must set
"the following Amazon VPC settings to true."
"Enable DNS hostname."
"Enable DNS support."
This is what we just did right here.
If we wanted to go with this.
We'll select the VPC ID we want to assign
this private zone to.
We'll select our demo VPC and click on create.
This will cost you $.50 if you do create
that zone so just be aware.
We created that zone fubar.internal.
I'm going to create a record set.
I'll just call it demo.fubar.internal.
It's going to be a CNAME that points to, say, google.com.
Www.google.com.
Just for fun, we're just creating a very simple record.
Click on create.
Now, let's see if we can resolve that DNS directly
from our EC2 instances.
Let's go to our EC2 instance.
Here is one and I'll do a dig.
On fubar.internal.
Here we get the answer section
which is google.com as a CNAME.
This worked.
Now basically thanks to these settings,
we can have a private hosted zone in our VPC
which is really cool because now we can create a bunch
of records for domains we don't necessarily own
because this is a private zone.
This is accessible within our VPC.
It is a very common exam question.
When you do have private Route 53 zones.
I think no one shows you how to do this.
I wanted to show you how to do this right now.
This is how you would create a private zone on Route 53
and have it resolve within your VPC.
That's it.
I will see you in the next lecture.