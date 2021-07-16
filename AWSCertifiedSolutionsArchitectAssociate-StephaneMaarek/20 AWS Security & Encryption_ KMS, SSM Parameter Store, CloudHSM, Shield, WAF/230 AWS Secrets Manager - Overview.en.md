
So here is another service in which you can helpfully store secrets in AWS and that one is
called obviously AWS secrets manager.
So it's newer service it came after the AWS.
SSM parameter store was out and really the sole purpose of secrets manager is to be storing secrets.
So the difference between secrets manager and the parameter store is that secrets manager is more oriented
towards secrets and it has a capability to force the rotation of your secrets.
Every X number of days there is also the capability to automate the generation of secrets on the rotation
so it uses AWS Lambda for this integration.
On top of it you can integrate secrets manager with RDS to synchronize your secrets between your
databases and secrets manager.
The secrets are obviously encrypted and you can encrypt it using KMS.
And so when you go into the exam anytime you see secret storing rotation of secrets integration with
RDS think secrets manager it's a really simple service.
And in the next lecture we'll go seeing the hands on how it works.