
<v ->The first pillar in the well-architected framework,</v>
is going to be operational excellence,
so operational excellence includes the ability to run
and monitor systems to deliver business values
and to continuously improve
supporting processes and procedures.
It's about having operations that are great.
There are design principles that you need to know about,
and questions that you ask yourself.
First of all,
all your operations should be code,
infrastructure as code is going to be the cornerstone
of operational excellence,
and remember infrastructure as code is CloudFormation.
You need to annotate documentation,
so when you create documentation,
make sure it's annotated,
make sure it's commented,
make sure it's clean
and generated after every build of your application.
You need to make frequent and small reversible changes,
so that, in case of failures, you can reverse it.
If you make huge changes every three months,
this is not going to go well.
You need to refine operations procedures frequently,
so as the team gets more familiar with the operations,
refine it, automate more, and make improvements.
Finally, anticipate failure, that will always happen,
and you need to learn from all these failures, okay?
Failures do happen and they're great,
failures is when you actually learn,
when I fail, I learn, so you should do the same,
and this is the design principles of operational excellence.
So now, I'd like to just transcribe it
in terms of AWS Services,
and the first one is going to be Prepare.
So, Prepare is going to be how do we basically
prepare everything to have operational excellence.
So you should use run books,
you should have good infrastructure standards,
you should do run deployments,
and like, mock deployments,
and for this, we could use AWS CloudFormation,
basically to prepare everything
as a nice infrastructure as code,
and then Config would be really nice as well,
to be using, we haven't seen Config in-depth in this course,
but Config could be used to evaluate
the compliance of your CloudFormation templates.
Then, Operate, you need to operate
and basically automate as much as you can,
you should release fast,
you should avoid manual processes.
So, again, CloudFormation would be a great tool for this.
Config as well.
CloudTrail to make sure to track
all the API codes that are done,
and make sure nothing is done on purpose,
or nothing is changed manually.
CloudWatch to basically monitor
the performance over time of your stack,
and make sure that if you need to operate it,
you know what operations to do.
And finally X-Ray,
it's not something we've seen in-depth in this course
but X-Ray will be able to trace API calls,
to trace HTP requests
and to make sure that they're working correctly,
and if they're not working correctly,
it will point us to where the incorrect stuff happened.
Finally, you need to evolve your infrastructure over time.
So how do we do this?
Well, again, CloudFormation as you understand it,
CloudFormation is a centerpiece
of this whole operational excellence pillar,
but also you need to be able to evolve over time,
so all this CICD tools basically CodeBuild,
CodeCommit, CodeDeploy, CodePipeline,
allow you to basically iterate quickly,
deploy quickly, deploy often,
deploy small changes,
and all these things will contribute
to operational excellence.
Now remember, just going into the exam,
you don't need to understand or remember any of that.
I'm just trying to educate you,
to all the AWS Services, and how they can help
with this operational excellence pillar.
This is just educative, okay?
Have a read through the pillar, by the way,
on the white paper if you want to,
but here I'm just trying to give you a small rundown.
You don't need to remember all these services,
and there's not, this service corresponds exactly to that,
operational pillar, or whatever,
but it's just to give you ideas of how all these services
can be used as a synergy to basically
drive operational excellence.
Alright, so that's it for this lecture,
I will see you in the next one.