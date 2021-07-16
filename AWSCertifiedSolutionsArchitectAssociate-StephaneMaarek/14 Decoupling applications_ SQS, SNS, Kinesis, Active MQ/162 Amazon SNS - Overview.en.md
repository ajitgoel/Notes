
<v Instructor>Now let's talk about Amazon SNS.</v>
So what if this time you want to send one message
and have many, many different receivers?
So you could have a direct integration, where for example,
a buying service application could send an email
notification, then send a message to your fraud service,
send a message to your shipping service and maybe even send
a message into an SQS queue.
This is cumbersome because every time you have to add
a new receiving service,
you need to create and writes that integration.
Instead, what you may want to do is called a pub sub
or publish subscribe.
The idea is that the buying service will send the message
into an SNS topic, which is publishing a message
into a topic.
And that topic will have many subscribers.
And each of the subscriber will be able to receive that
message from the SNS, SNS topic and have it for their own.
And so this is another type of pattern
called the pub sub pattern.
So in Amazon SNS,
the events producer only sends a message to one SNS topic,
and you can have as many events receivers
also also called subscriptions as you want to listen
to these SNS topic notifications and each subscriber
will get all the messages from the topic,
even though now I know there's a feature to filter messages,
but still by default,
each subscriber will receive all the messages
sent to the topic.
You can have up to 10 million subscriptions per topic.
So very, very high scale
and up to 100,000 topics in Amazon SNS.
Your subscribers of messages in Amazon SNS can be SQS,
it could be HTTP or HTTPS back end
and you can say how many times the retry should happen
in case it fails.
It could be Lambda functions.
It could be email notification, SMS messages,
and even mobile notifications.
Now SNS is going to be at the center of AWS because many
different services can send data or notifications
directly into SNS.
And a famous one is CloudWatch for alarms.
So CloudWatch Alarms send notifications into SNS topics,
but also auto scaling group notifications.
Amazon has three buckets,
whenever you have events happening on your buckets,
cloud formation templates, in case there's a state change,
for example, that it failed to build your stack and so on.
So SNS is going to be, as you'll realize,
during this course, really at the center of AWS.
Now, SNS, how does that work?
To publish a message into SNS
You use the topic publish SDK.
And so you create a topic.
Then you create subscriptions or many,
one or many subscriptions you publish to the SNS topic
and that's it.
All the subscribers will automatically retrieve that message
or there's something called direct publish for mobile apps,
SDK, and you need to create a platform application,
a platform endpoints,
and you publish into the platform endpoints and it works in
terms of subscribers for Google GCM, Apple APNS,
or Amazon ADM,
which are different ways for your mobile application
to receive notifications.
In terms of security,
Amazon SNS has the same kind of security as SQS.
So it has in-flight encryption by default,
at-rest encryption using KMS keys
and client site encryption,
if your clients wants to send some encrypted message
into SNS, but again,
it's up to your client responsibility to do the encryption
and the decryption.
In terms of the access controls,
IAM policies are going to be at the center of security
because all the SNS APIs will be regulated by IAM policies.
And you can define SNS access policies,
which are very similar to S three bucket policies.
And they're very helpful when you want
to have cross-accounts access to SNS topics,
or to allow other services such as your S3 events to rights
into your SNS topics.
So that's it, I hope you liked it,
and I will see you in the next lecture.