
<v Narrator>So a very quick lecture about Opsworks.</v>
Chef and Puppet are two open source software and
they allow you to perform server configuration
automatically or you can perform repetitive actions.
And so,
they work amazing with EC2 and On Premise VM
and in the AWS world,
Opsworks is Managed Chef and Puppet.
So Opsworks is just another name for Chef and Puppet.
And overall,
if you wanted to know exactly what it does,
it's kind of an alternative to AWS SSM.
It allows you to do a lot of the similar things.
Now, in this section of this course,
there's no hands-on because no knowledge of
Chef and Puppet are required for passing the exam.
Basically in the exam,
anytime in any question,
you see that we need to apply Chef and Puppet,
this is you thinking,
hey I need to use AWS Opsworks and that's about it.
Otherwise, it would be way too complicated
and way unneeded for this course.
Now, I still want to give you idea
of what Chef and Puppet are.
They're basically help managing configuration as code.
If you heard of this,
this is basically where all the stuff you run onto your VMs,
onto your machines,
is coded.
And that helps in having consistent deployments
because the same code can be applied
on many different machines.
That works with Linux and Windows,
and you can automate a lot of things,
such as user account,
cron jobs, NTP, packages, services, etc.
Some wording a bit,
in Chefs it's called Recipes
and Puppet is called Manifest.
So they leverage Recipes or Manifests,
which is basically code to apply.
They have a lot of similarities with some AWS products.
So Chefs, SSM, Beanstalk, CloudFormation.
But the idea of what you would use
to Chef and Puppet in AWS
is because they're open source products,
and they work across different clouds.
So if you have Amazon Cloud,
if you have Microsoft Azure,
and maybe Google Cloud,
you won't just have one way of managing all your instances,
and maybe that way is Chef and Puppet.
And this is why it's offered on AWS as Opsworks.
Well, that's it.
That's all you need to know about it.
Just remember for the exam,
anytime you see Chef and Puppet,
think Opsworks.
That's it.
I will see you in the next lecture.