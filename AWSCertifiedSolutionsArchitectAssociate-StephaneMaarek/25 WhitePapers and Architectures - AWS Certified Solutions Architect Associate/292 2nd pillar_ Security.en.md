
<v Instructor>Security is the second pillar</v>
of the Well-Architected Framework and I really like it.
So security we all know what it is,
but it includes the ability to protect information,
systems and assets while delivering business value
through risk assessment and mitigation strategies.
So usually people see security as like oh we have to do it
but in the end when your application is secure,
you're really minimizing a risk over time and you save cost
from disasters and you really don't want to have a risk,
or a security issue in your company.
Now how do we design strong security?
Well we need to have a strong identity foundation.
So we want to centralize how we manage user accounts.
We want to rely on least privilege and maybe IAM
is going to be one of these services to help us do that.
We want to enable traceability, that means we need to look
at all the logs, all the metrics and store them
and automatically respond and take action,
every time something looks really weird.
We need to apply security at all layers, okay?
You need to secure every single layer,
such as if one fail maybe the next one will take over.
So edge network, VPC, subnet, load balancer,
every institute instance you have, the OS, patching it,
the application, making sure it's up to date,
all these things.
You need to automate security best practices, okay?
Security is not something you do manually,
it's mostly done well, when it's automated.
You need to protect data in transit and at rest.
That means always enable encryption, always do SSL,
always use tokenization and do access control.
And you need to keep people away from data.
So why is someone requesting data?
Isn't that a risk when you allow someone to access data,
do they really need it or is there a way to automate
the need for that direct access
in that manual processing of data?
And then you need to prepare for security events.
So security events must happen some day
in every company, I think, and so run response simulations,
use tools to automate the speed of detection,
investigation and recovery, okay?
So in terms of AWS Services, what does that mean?
Well the first one is going to be identity
and access management.
So we all know what that means, that means IAM,
STS for generating temporary credentials,
maybe Multi-Factor Authentication token
and AWS Organization to manage
multiple address accounts centrally.
Then detective controls.
So how do we detect stuff goes wrong?
AWS Config for compliance, CloudTrail to look
at API calls that look suspicious.
CloudWatch to look at metrics and things
that may go completely out of norm.
And then we get infrastructure protection.
So how do we protect our own Cloud?
Well CloudFront is going to be a really great
first line of defense against DDoS attacks.
Amazon VPC to secure your network
and making sure you set the right ACLs.
And then Shield, we haven't seen this, but it's like
basically a way to protect your AWs account from DDoS.
WAF which is a Web Application Firewall
and Inspector to basically look at the security
of our institute instances.
Now we haven't see all these services, they are more
for the SysOps exam, but again I just wanna give you here
an overview of all the AWS Services
that can help you achieve full security.
For data protection, well we know there is KMS
to encrypt all the data at rest.
Then there is S3, which has a tons of encryption mechanism,
we have SSES3, we have SSEKMS,
SSEC or client setting encryption.
On top of it we get bucket policies and all that stuff.
And then every, you know, every managed service
has some kind of data protection.
So Load Balancer can enable to expose a HTPS end point.
EBS volumes can be encrypted at rest, RDS instances
also can be encrypted at rest and they have SSL capability.
So all these things are here to protect your data.
Incident response, what happens when there's a problem?
Well IAM is going to be your first good line of defense
if there is an account being compromised
and just delete that account or give it zero privilege.
CouldFormation will be great, for example
if someone deletes your entire infrastructure,
how do you get back into a running state?
Well CloudFormation is the answer.
Then, for example, how do we automate
all these incident response?
How do we automate the fact that if someone deletes
a resource, maybe we should alert, CloudWatch Events
could be a great way of doing that.
So that's it, again just to show you the synergy.
Here there is a lot of AWS Services
and this is just an example of how you could achieve
all these principles with the Services.
I hoped you liked it and I will see you in the next lecture.