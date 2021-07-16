
<v Instructor>Okay,</v>
so just some extra bits of information,
before you go into the exam regarding ECS.
The first one is around IAM task roles.
So let's say we have an EC2 instance.
And on it because it's using ECS,
we have the ECS Agents.
And it's also running three tasks.
So it's going to run Application A Task one,
Application B task one
and Application A task two.
So in this case,
our Application A has two task instances
running on these two instance,
and our Application B has one.
So the EC2 instance,
should have an IAM role,
allowing it to access the ECS service.
And this is solely so that the ECS agent
can do what it needs.
So therefore, we're going to create an EC2 instance role.
And we're going to give it enough access
for the ECS agent to call the ECS API.
That makes sense,
but now that we have defined that EC2 instance role,
each task is going to inherit the
EC2 instance role in terms of permissions.
And each task needs to do something different,
maybe initiative to
DynamoDb, to S3 and so on.
So what we need to know, is how can we make sure
that each task can exactly do what it needs to do.
And for this,
we need to create what's called an ECS IAM task role,
to perform each API calls for the application.
So the idea now is that we're going
to create a task role specifically
for Application definition A.
And it's going to be attached to the two tasks,
and is going to be a different task role,
attached for Application B.
So, this task role,
will allow us to get the maximum amount of security,
meaning that our Application A is going
to have a role dedicated to it,
allowing you to do what it needs to do, for example,
talk to DynamoDb,
and Application B as well,
who get its own little task role,
allowing it to use IAM for talking for example, to S3.
And so this way,
we have two different kinds of instance roles.
For this example,
we have an EC2 instance role attached the EC2 level,
and they will help be helpful for the ECS agent,
and then each application
will have a task role attached to it.
And that is the best for security.
And how do we define this task roll?
Well, there is in the task definition,
a taskRoleAm parameter,
which allows us to just reference that task role.
Okay. Important concept to know,
but a very, very helpful one.
Finally, there is a launchable called Fargate,
that I just briefly mentioned.
So when you launch an ECS Cluster, normally,
you have to create your own EC2 instances.
And if you need to scale you need to add EC2 instances,
so we start to manage infrastructure.
But if you use the Fargate service,
it's going to be all serverless.
So that means you don't provision any EC2 instances,
you just create the task definitions,
you create what is new in your task definition,
so maybe you won't even need to reference an IAM task role.
And then we'll launch our service in AWS automatically,
will learn, will run the container for us,
and it will just find where to run it.
So we don't have any EC2 instances to manage.
It's all on AWS.
So to scale,
we just increase the number of tasks
that we want within our service.
It's super simple,
and we don't have any EC2 instance to manage.
To me, I find this is an amazing service.
So anytime we see,
doctored images, ECS, serverless senior scaling,
think Fargate.
Alright, that's it for this lecture.
I will see you in the next lecture.