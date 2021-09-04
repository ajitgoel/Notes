
<v Instructor>Welcome to the section</v>
on AWS integration and messaging.
So this section is kinda cool because we're going
to see how we can orchestrate stuff
between our different services using middleware.
And so in this section basically,
when we start to deploy multiple applications,
they will inevitably have to communicate with one another.
Okay, your services need to share information, share data.
And so there will be two patterns
of application communication out there.
There's going to be a synchronous communication
so your application will be directly connecting
to another application of yours.
And so for example we have, you know,
we sell something online, and we have a buying service,
and when something is bought, we need
to talk to the shipping service
to send that item that was just bought.
As you can see here,
my buying service and my shipping service,
they're directly connected to one another,
so there is some synchronous communication happening.
My buying service says, hey something happened,
shipping service, do it, okay?
The other type of integration and pattern
is going to be asynchronous or event based.
And so there will be a middleware called
a queue or called something else,
basically that will connect your applications.
So this time the buying service says,
hey, someone bought something,
and so I'm gonna put that into a queue, and that's it.
And the shipping service says, hey queue,
is there something that got bought recently?
And the queue will return that element
and the shipping service can do whatever it wants.
So as you can see here, the buying service
and the shipping service are not directly connected.
There is a queue in between.
And so because they don't directly talk
to one another, this is asynchronous.
Now, synchronous between applications can be
a little bit problematic sometimes,
because if one service overwhelms the other
because there is a sudden spike of purchases or whatever,
it could be a big problem right.
So if you need to encode, for example
we have a video encoding service,
and we need to encode 1,000 videos but usually it's 10.
Well, our encoding service is going to be overwhelmed
and we're going to have outages.
So, when you have these sudden spikes of traffic
or you can't predict anything,
then it's usually better to decouple your application
and have the decoupling layer scale for you.
So in that case that could be SQS for a queue model,
that could be SNS for a pub/sub model,
and that could be Kinesis, if you do real time streaming
and you have like big data.
So we'll learn all about those in this section.
And what we'll learn is that now,
using these three things, our services
can scale independently from SQS, SNS, and Kinesis.
And these three things scale as well really, really, well.
So that's the whole paradigm.
And so we're gonna get started with learning
these three technologies in this lecture.
So, see you in the next lecture.