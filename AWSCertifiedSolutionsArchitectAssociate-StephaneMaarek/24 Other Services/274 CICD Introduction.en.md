
<v ->Okay so the first thing I want to talk about</v>
in this other section is CICD.
CICD is something we have to know in depth
for there Certified Developer Exam but not
for the Solution Architect Exam.
Yet I still want to give you a little bit
of introduction just so you know what it is.
So let's first talk about continuous integration.
So developers usually when they do code,
the push the code through a repository
and you've heard of GitHub, you heard maybe of Bitbucket
but on AWS it's called CodeCommit.
So the developers they push the code often.
And then there should be a testing or build server
that basically checks the code as soon as it's pushed
so it's going to test it.
For this we have Jenkins,
that's one of the most popular ones but
on AWS it's called CodeBuild.
So it's going to get the code, build it and test it.
And the reason we do this is
so the developer gets feedback about the test
and checks if it passed or failed.
So basically as a developer, the more often you push code
the more you know faster if it's good code,
if it's passed the build and the test.
So you can find bugs early and fix them early.
The reason is you deliver faster
as the code is tested often
and you deploy often and therefore
you get happier developers because
they're unblocked in their workflow.
So this is for continuous integration.
Now you have continuous delivery.
It's to ensure that the software that
has been created and built
can be released reliably whenever needed.
What does that mean?
That means that the deployments happen
often and very quick.
You shift from the mindset of
a release every three months to
five releases a day, maybe once per hour as well
and that means automatic deployment.
So the technologies on AWS that allow you to do this
is CodeDeploy, Jenkins CD, Spinnaker, et cetera.
So what does it look like?
Well as a developer again we push code often,
the build server which has CodeBuild
will get the code, build and test
and then every time there's a passing build
maybe you want to deploy this through deployment server
and that could be using CodeDeploy.
Then we get our application server
there V1 and then after the upgrade
there become V2 and so this is the idea
behind continuous delivery.
So now from AWS's perspective
where does all the technology go and play?
So we have code, build, test, deploy and provision.
To basically store codes, we have AWS CodeCommit
which is similar to GitHub or a third party code repository.
Then to build and test we use CodeBuild
and it's kind of similar to Jenkins CI
if you hear of Jenkins before.
Then for deploying and provisioning,
we have two options.
We have Beanstalk, which does kind of both.
You provision both the infrastructure
and then on top of it,
there is an API to deploy often.
Or you can manage your own EC2 fleet,
maybe using CloudFormation
and then to deploy to the EC2 fleet,
you would use something like AWS CodeDeploy.
Because you need to orchestrate
all these tools one after the other,
maybe you need something like a pipeline orchestrator
and this is called AWS CodePipeline.
So that's all you need to know.
Just remember this diagram.
Remember CodeCommit equals checking code,
CodeBuild building and testing code,
CodeDeploy deploying code,
CodePipeline orchestrating everything.
So that's it for this lecture.
I hope you enjoyed this very short introduction to CICD
and I will see you in the next lecture.