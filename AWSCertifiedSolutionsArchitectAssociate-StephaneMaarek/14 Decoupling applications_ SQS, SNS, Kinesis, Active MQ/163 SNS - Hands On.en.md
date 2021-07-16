
<v ->Okay. Let's practice with SNS</v>
so I'm going to click on SNS
and we'll get right to the service.
You may get to this screen
or you may get to this screen if you don't have any topics.
Let's start by this screen.
Here we can create a topic.
For example, I'll call my first topic, MyFirstTopic.
Then click on Next Step.
Here I can go and customize the settings of this topic.
I have the option to have a display name,
so I won't put anything.
I can set encryption so that all the messages are encrypted
at rest on top of in transit encryption.
I can enable encryption and choose a key,
but for now I'll just enable it.
You could also set an access policy,
retry policy, delivery status logging, and tags,
but these are advanced and you don't need
to know them going to the exam.
Remember you can just set the topic name and the encryption,
and then we'll go ahead and create the topic.
MyFirstTopic was created successfully.
As of right now, there's zero subscriptions for the topic,
that means that we don't have anything
that is listening to the messages going in that topic.
AS such, we should create a subscription.
Here's my topic ARN.
The protocol I can choose is one of those.
You need to remember these protocols going into the exam.
There's HHTP or HTTPS to send data to an endpoint.
Email or Email-JSON, SQS, and AWS Lambda.
As such, I will choose Email
and I need to put an email address.
For this, I have a service called Mailinator
and I'm just going
to create an email called stephantheteacher.
Here we go.
This is just a public inbox
that I will be using for this demo.
The email is stephantheteacher@mailinator.com
and this is great.
I'm going to create the subscription.
The subscription has been done for my email.
Right now, it needs to be pending confirmation
so I need to confirm it.
Let me go back to my inbox
and here we go.
I just received an email saying "Subscription Confirmation,
"Please click here to confirm this subscription"
Now it's confirmed and this email
is now subscribed to the topic.
I can now go back into SNS and refresh this page.
Here I can see that the status
is confirmed for this subscription.
Back into MyFirstTopic, you can now see one subscription.
You could totally go ahead and create more subscriptions
if you wanted to but for now we'll keep it as simple
and we'll keep it as one.
Back into my topic, I'm going to MyFirstTopic
and here is my subscription.
What I can do is test a message and see if that works.
I click on public message
and the subject can be something,
"Hello World Subject."
You could have a TTL but this is optional
so I'm not going to put anything.
Then you enter the body to send to the endpoint.
I'm just going to say,
"Hello world from the console!"
I will scroll down and I don't need
to set any attributes right now.
I'll click on publish message
and my first message has been published to this topic.
To make sure it has been delivered,
why don't we go into Mailinator
and I'll go back to my inbox.
My inbox is right here.
I'll go in Public Inboxes.
We have just received an AWS notifications
with a subject "Hello Word Subject"
and the content of it is
"Hello world form the console!"
From here we're really able to have subscriptions
and send notifications to emails or SQS or Lambda or so on.
We can obviously customize that topic a lot more,
but as far as the features you need to know going
into any of the Associate Exam, then this is it.
Cool, hands-on. I like it.
We have done our first topic
and if we go back to the topics now,
we see we have three topics.
That's because when we did our hands-on so far,
we may have been creating a codecommit_nodejsapp
and so therefore we had an SNS topic.
And also a CloudWatch alarm.
That alarm was sending data to an SNS topic,
so we had this one.
If you don't have those, you're not in the right course
but don't worry.
This is just fine for the hands-on purposes.
Here is our SNS first topic
and we've added one subscription to it
and we've published one message.
And it was being received directly into the inbox.
Really cool.
I hope you liked this lecture
and I will see you in the next lecture.