
<v Narrator>Step Functions are actually very simple:</v>
it's basically a way to have a serverless visual workflow
to orchestrate your Lambda functions.
So if you have a ton of Lambda functions,
and you do a ton of things that need to be orchestrated,
so run this Lambda function,
and then this Lambda function, then this one,
you can use Step Functions to orchestrate all of that.
All the flow is represented as a JSON state machine,
so, remember the keyword state machine,
any time you see state machine in your exam,
this is probably when Step Functions are going to be used.
You can use sequence of Lambda functions,
parallel Lambda Functions, conditions, timeouts,
error handling, so you get a lot of flexibility.
You can also integrate with other services,
but it's less popular, such as EC2, ECS,
On premise servers, and API Gateway,
but I think for the exam the scope is to have
Step Functions really help with Lambda functions overall.
The maximum execution time is one year,
so you get a lot of time to complete the workflows.
And you have the possibility to implement
human approval feature,
but it's a little bit tricky and complicated.
In terms of use cases, we can do: order fulfillment,
we can do data processing, web applications,
or any workflow you can think of.
So any time it says workflow, state machine,
orchestration of Lambda functions, think Step Functions.
Now, what does it look like in the UI?
Well, you're going to create a JSON state machine,
and it's going to give you a beautiful graph.
So here we see we have a 'Start' and an 'End',
and so you have 'Submit Job', 'Wait a number of seconds',
'Get a job status',
and 'Is the job complete? If so, come back to wait',
'If it's complete then go to the next thing',
then you get 'Is the job failing' or 'Is the job succeeded?'
and then you go to the end.
So it's just a visual way of representing
how to orchestrate everything,
and so all these little boxes may be Lambda functions
or a specific Step Function's features.
Now, when you actually start a job,
you can see it as it happens, going through the chart.
So you can see right now it's been submitted,
and then it goes into the 'Wait X Seconds',
so it's in progress and it's blue.
And so it goes along and does all the things,
and then when it's done, you can see the complete path
of what it took, which branch it went into,
and you can look into the status of all these steps.
So this is as easy as it seems, just imagine
a way to orchestrate Lambda functions,
and to just link them to one another.
Okay, now you have SWF which is a little bit more confusing,
because it kind of has the same thing,
it coordinates work amongst applications,
this time the code works on EC2,
so it's not exactly serverless,
there's a one year maximum runtime,
there's a concept of 'activity step' and 'decision step',
and it has a built-in 'human intervention' step.
So it looks pretty much like Step Functions, right?
It has an order fulfillment from the web to warehouse
to delivery as a feature.
You can just do whatever you want, it's a workflow again,
but the big difference with Step Functions
is that SWF is older,
and this is pretty much not supported any more by AWS,
it's still supported, but not so much.
Step Functions is where the new stuff is happening,
so the documentation and the FAQ recommend you
to use Step Functions for new applications,
except if you need external signals
to intervene in the process, and to have child processes
that return values to parent processes.
So overall, I suggest that, at the exam
if you see SWF and Step Functions in the same question,
just ask yourself the question,
"Do I need external signals or child processes?"
But I believe that all the questions now
are gonna go towards the Step Functions
versus the SWF Service.
I just wanted to give you an overview of both,
but really, the big difference is that
you have Step Functions, that's recommended by AWS,
and SWF is a bit older.
Okay, that's it.
I will see you in the next lecture.