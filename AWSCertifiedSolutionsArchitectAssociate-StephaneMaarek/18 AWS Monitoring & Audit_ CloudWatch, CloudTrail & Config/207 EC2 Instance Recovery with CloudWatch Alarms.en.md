
<v Instructor>So here is a use case you should know</v>
about CloudWatch alarms.
It's called EC2 Instance Recovery.
So the idea is that on your EC2 instances,
you have status check.
And it could be an instance status to check
the EC2 virtual machine or a system status to check
the underlying hardware behind your EC2 instances.
So if either of these fell, then you lose,
you've lost your EC2 instance.
So the idea is that you could set up a CloudWatch alarm
to monitor a specific EC2 instance.
And this CloudWatch alarm will look
at the StatusCheckFailed_System metric, for example.
And the idea is that if this alarm gets triggered,
you can have an action called an EC2 Instance Recovery.
And what this EC2 Instance Recovery does is trigger
some internal mechanism within AWS to recover your instance.
What does instance recovery mean?
That means that you will have the same private IP as before,
the same public IP, the same elastic IP if one was attached,
the same metadata and the same placement group.
So this could be something quite helpful if you need
to recover an EC2 instance and make sure
it keeps a private IP.
Now, as you notice, for example,
any data that was stored, for example,
on an instance store will not be kept.
But if you have EBS volumes then the data will be kept
because it will be stored onto EBS volumes.
So the exam can come up and ask you how to recover
an instance automatically.
So you set up a CloudWatch alarm that will be checking
for the status checks of the EC2 instance
and the action of that CloudWatch alarm
can be an EC2 Instance Recovery.
And then finally because that alarm can be triggered,
it can alert and send a notification into an SNS topic.
So that's it, I hope you liked it
and I will see you in the next lecture.