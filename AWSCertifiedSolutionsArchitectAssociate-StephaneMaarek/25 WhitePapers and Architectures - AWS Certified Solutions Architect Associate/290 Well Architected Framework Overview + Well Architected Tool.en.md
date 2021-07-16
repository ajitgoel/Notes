
<v Instructor>First, let's talk about</v>
the well architected framework.
So, there's some general guiding principles
that you need to know about
and these are going to be super important
if you go into a real AWS solutions architect job.
The first one is that you need
to stop guessing your capacity needs,
so use auto scaling when you can.
You need to test your systems at production scale.
There is no excuse in the cloud not to scale massively,
because and pay for it and then scale down
and not pay for it.
So, you need to also automate
to make architectural experimentation easier.
The more you automate, the quicker you can iterate,
the quicker you can experiment and the better
will be your architecture.
You need to also allow for your architectures
to evolve over time.
So, this is not your on premise data center,
this is a cloud and you can change everything
at your fingertips.
So you need to design based on changing requirements
and requirements will change and architectures will change
and then also, you need to look at your data.
What is your data telling you?
What are your patterns of your application?
What is the usage?
And then from that,
you're going to drive architecture changes.
Finally, you need to improve through game days,
so that means, when you have a huge sale,
you know, simulate it before you go into it.
For example, if you plan on running a Valentine's Day sale
and you haven't planned for that capacity
or you don't know how your application will behave,
then you may crash
and not have a great Valentine's Day experience.
So definitely test your systems production at scale,
simulate with game day,
so just simulate a massive amount of traffic,
and see if your architecture does hold ground.
Okay?
So now, the architected framework on itself
is five pillars, five categories.
The first one is Operational Excellence,
the second one is Security,
then we have Reliability, Performance Efficiency
and finally Cost Optimization.
And so all these things will have a deep dive
in the next lectures,
but just so you get an idea, at a high level,
I guess we've seen this all along the course
when I was doing some solution architecture
or when I was comparing databases.
So this should not be something new to you.
Now these things are not something to balance.
For example, you don't usually try security
for performance or whatever.
They're not trade offs.
If done correctly, all of these things enhance each other
and they become a synergy.
So it's not, oh do I want to really improve security,
but then have to pay more or whatever.
Yeah, surely you'll have to pay more,
but in the end, maybe you won't run into security issues
and so that will decrease your cost overall.
So, think about all these things as pillars
that need to work together to improve each other, okay?
They're not independent,
they're not trade offs, they're a synergy.
Okay, so the well architected framework
is not just these pillars, it's also questions
and there's a lot of them
and so when you are serious about designing an application,
what you should be doing
is look into the Well-Architected Tool.
This is a small quote-on-quote AWS service.
So let's have a look at it right now
to see what these questions are
and then in the next lecture,
we'll look at the pillars one by one.
Okay, so if I type well-architected tool,
here we go, this is an AWS service,
as surprising as it may seem.
And so, here we can start to define a workload
and basically, over time, we'll be able
to track our performance and evolve our architecture.
So let's define our workload and see how we are.
So for example, this is my demo workload
and you can have a description.
So this is my new cool website, a social media network.
Alright, then the industry type you're in.
So we are in education and the industry,
we are technologies and tools.
For example, it's a social media network for teachers.
Who knows, alright?
So then the environment, so where is my workload running?
It's running in production
and in which regions?
Well for now I'm starting small, I'm in US East 1
and also in US West 1.
Okay, you can also add where it's actually running
outside of AWS, so if I was running on premise I would say,
okay, on premise, or maybe I would say I'm on Azure
and Google Clouds, whatever.
And then the account ID, so where the workload is spanning
and currently it's spanning just across my own account,
but I could add all the account's IDs right here.
So these are just metadata field,
but basically it's just for you to remember,
you know, how your workload is defined.
Then, you need to start a review,
and so you will review, start review
by answering questions for each pillar
and this is what's really really cool.
At the end of it, you can generate a report and so on.
So you click on Start Review
and this review literally does ask you all the questions.
So let's have a look at these questions.
For example, Operational Excellence, question 1,
how do you determine what are your priorities?
So for example, do you need to evaluate customer needs?
Do you need to evaluate trade offs
and maybe manage benefits and risks?
And then click on Next
and if it does not apply, you'll say,
does not apply and you skip it.
But the idea is that you have nine questions for now
under Operational Excellence,
11 questions around Security,
nine questions on Reliability,
eight on Performance Efficiency
and nine on Cost Optimization
and so the idea is that when you stop, like,
when you start answering all these questions
and you're done, it's actually very precise.
First of all, you'll have thought of your architecture
and finally, basically what it will give you
is a report and you will get a report from it
and you can look at your solution architecture over time,
you can have milestones,
you can have improvement plans,
it gives you what is a high risk
and what is a medium risk in your architecture and so on.
So it says, for example, this one,
okay, there's a high risk and you need
to understand business needs,
you need to understand compliance requirements,
evaluate trade offs and whatever.
So you need to just answer these questions
if you're very serious about solution architecture
and understand what you can do better
and how you can evolve over time.
So that's it.
It's just a tool, really, to help guide you
as a solutions architect
and I wanted to demonstrate it to you,
just so you can use it in your work
if you are very serious about solution architecture.
Alright, that's it.
I will see you in the next lecture.