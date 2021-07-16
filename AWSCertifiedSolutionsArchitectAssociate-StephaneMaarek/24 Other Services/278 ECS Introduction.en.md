
<v Instructor>So ECS is a bit tricky</v>
because I think that it's going to become
a much greater part of the exam over time,
maybe in two years from now.
Now, they just ask basic questions about ECS,
so I'm keeping this in this other section.
But it is very possible that one day I move this
to an entire section on its own
because ECS might grow in popularity at the exam.
So what is ECS?
It's a container orchestration service
and it helps you to run Docker containers on EC2 machines.
The reason I think it's not that popular in the exam yet
is because Docker is still a new technology for some.
And so not everyone understands Docker
and it takes a bit of time to go over Docker.
Here, it's just an introduction to everything.
So ECS is a bit complicated, convoluted,
and it's made of multiple things now.
It's made of what I call ECS Core.
It's just me calling it ECS Core,
but that's the original ECS,
where you run Docker container and ECS
on user-provisioned EC2 instances.
You have Fargate.
And I don't think the exam asks for Fargate yet.
But you run ECS again on AWS-provisioned compute this time,
so it's more server-less.
In the first instance, you provision your own server.
In the second one, you run it on Amazon servers,
so it's server-less.
And then you have EKS to run ECS on Kubernetes.
That's provided by AWS.
So if you wanna use Kubernetes as an orchestration service,
you can use EKS.
And then finally, you have ECR,
which is the Docker Container Registry hosted by AWS.
So ECS to Docker, overall, they are very popular
when you wanna have microservices.
So anytime you see microservice,
you either think Lambda or ECS.
And for now, I believe the exam will only ask you
about ECS Core and ECR,
so this is what I'm going to view in this entire lecture.
IAM security is supported and it's very important.
And the roles are at the ECS task level,
but you'll see me speak about it again in this lecture.
So what's Docker for now?
Docker is basically a container technology.
And it takes more than two minutes and one slide
to explain Docker,
so I'll just sort of give you a high level overview.
But if you're really interested,
you should learn about it online.
I think it's a fascinating technology.
And so you basically run a containerized application
on any machine that has Docker installed.
So first, you containerize your application
and then it can run anywhere.
And so basically, this is that portability
that is provided to us that's really amazing.
And so having containers, allowing our application to work
the same way anywhere, whether it be on your local laptop,
on an EC2 machine, on an on-premise server,
really, anywhere is what makes Docker super popular.
On top of it, when containers run on a machine,
they're isolated from each other, so it's secure.
And you can control how much memory and CPU
will be allocated to each container.
You're also able to restrict network rules,
so how these containers communicate with one another.
And you may be like, oh, but this just a virtual machine.
Yes, kind of, but it's more efficient than virtual machines.
I won't go into the details why,
but it's more efficient and faster.
And a metric that you can see is that
you can scale containers up and down very quickly
in a matter of seconds,
whereas virtual machines, per experience,
they take a lot more time.
So use cases for ECS is going to be running microservices.
So you can run multiple containers
on the same machine, for example.
You can do service discovery features.
You have a direct integration with a load balancer
and I'm showing this to you in the next slide.
And you have auto-scaling capability.
You can also run batch processing or schedule tasks.
So you can run ECS containers to have on-demand,
reserved, the spot instances for EC2 instances.
And you can also help migrate applications to the cloud
using ECS because if you Dockerize,
Dockerize is the action of making a container,
a Docker container out of an application,
if you Dockerize a legacy application
that's running on-premise, then you can quickly move it
after that to ECS because your Docker container
can run on ECS as well.
So these will be the three use cases.
So migration and microservices are going to be
the most popular at the exam, for sure.
In terms of concept about how ECS works,
you're going to run, for example, three EC2 instances.
And the first thing we're going to define is an ECS cluster.
And your ECS cluster is going to be a set
of these EC2 instances.
On top of it, you're going to define ECS services.
And so services is basically an application,
so it's an application definition.
And you're going to be running on your ECS cluster
and this is where you're going to say how many
applications you want running and the auto-scaling rules,
et cetera, et cetera.
And your ECS service is going to create ECS task,
alongside their definition.
And so the tasks are going to be basically
a Docker container running on your EC2 machine.
And so they can be running on any machine of that cluster.
So here, I have, for example, four,
but you can always have six.
So for example, here, I have six task containers
running on three EC2 machines.
And as you can see, it is possible for the same service
to run multiple times on the same EC2 machine
and that's provided as a capability by Docker.
You can run not just one ECS service,
but you can run another ECS service.
And you don't need to know that it runs across
all your EC2 machines.
It can run maybe across two EC2 machines
if you only have two task containers that you need.
So it really gives you a lot of possibility around here.
And on top of this, each task container can have a IAM role.
So each task container can be isolated and secure
and have its own set of permissions.
So a very popular, I think, question at the exam
is going to be around the ALB integration.
So ALB is application load balancer.
And so it's very popular to use ALB with ECS
because of a feature called port mapping.
And that is a new feature of the application load balancer.
The classic load balancer does not have this feature.
So basically, what we can do with it is we can run
multiple instances of the same application
on the same EC2 machine.
And the use case of this is that
you have increased resiliency
even if you have only one EC2 instance.
You can maximize your utilization of CPU and cores.
And you're able to perform rolling upgrades
without impacting application uptime.
So concretely, what does this look like?
We have an ECS instance
and it's going to be running our application.
So maybe we have four containers
and they all run a node.js.
And so we have control over what the container does,
but then Docker automatically assigns a dynamic port for us.
So here, we have four ports, they're all different
and they're all dynamic.
And so the idea is that we want to expose this application
to the world.
So for this, we have an application load balancer
and it's going to be exposed on port 80 for HTTP
or 443 for HTTPS.
And so our application load balancer,
if it was a classic one, it would just map to one port, 6789
and say, okay, there's only one application I can reach.
But because of this dynamic port mapping feature,
the application load balancer is super smart
and it will just redirect the traffic to each container
with the right port.
So using this architecture, you're basically able to run
the same application, the same container
many, many times over the same ECS instance,
leveraging the dynamic port mapping
of the application load balancer.
So remember this.
I think this is one of the main points of ECS
that you need to remember for the exam.
The other point you need to remember is how to set up ECS.
So for this, you have to run an EC2 instance.
And on it, you will install the ECS agent
alongside the ECS config file.
If you use an ECS-ready Linux AMI,
you already have the ECS agent installed on it and running,
but you will still need to modify the config file.
Now, that config file is going to be
what you need to know about.
So there's four configs that you need to know about
out of, like, maybe 35 configs you have for this file.
And I've got them for you right here.
So the location of this file is /etc/ecs/ecs.config.
And within it, to me, you have four settings
you need to know about absolutely for the exam.
The first one is ECS_CLUSTER
and it's to say to the EC2 instance
to which cluster it belongs.
Then the second one is ECS_ENGINE_AUTH_DATA,
so if you want to authenticate to private registries.
The third one is LOGGING_DRIVER.
So if you wanted to enable CloudWatch logging,
you would have ECS_AVAILABLE_LOGGING_DRIVERS being changed.
And the final one, which is, I think,
one of the most important, is ECS_ENABLE_TASK_IAM_ROLE,
which is how to enable IAM roles for ECS tasks,
and so you need to have this variable to be close to true.
You don't need to remember exactly the name.
They will not ask you, hey, what's the exact name,
and try to trick you into it.
But you need to remember that you have configuration
that you need to enable
to number one, assign an EC2 instance to a cluster,
number two, pull images from private registry,
number three, enable CloudWatch integration, for example,
CloudWatch logs integration,
and finally, to enable IAM task roles for your ECS task.
Okay, so just remember this and then you'll be all right.
Finally, you have ECR, which is a container registry.
So basically, your Docker containers,
they need to be stored somewhere before they can be run.
And so this will be ECR.
And it's fully integrated with IAM and ECS,
which is really neat.
And the data is sent over HTTPS,
so there is encryption in flight
and your images, when they're stored,
they're also encrypted at rest,
so you have full encryption everywhere.
Concretely, here is your ECR
and it's going to run two images.
Maybe application A, so image A, and application B, image B.
And you have an ECS instance
and maybe you want to run the image B,
so you're going to do a request
to pull the Docker images from ECR.
ECR is going to check with IAM that you can indeed
pull the Docker images.
And then your images will be pulled from the ECR
onto your ECS instance, which will run
your containers in return.
Now, how do containers arrive to ECR?
We have to push them.
And for this, you can use something like the CLI
or you can CodeBuild for your CICD to automate this task.
And so that just gives you an idea of how CICD
ties into ECS.
You push images to ECR and ECR will get pulled
by the ECS instance when they run your application.
So that's it for EC2 at a high level.
Again, don't overthink it.
If you don't understand everything, it's okay.
Most likely, what you remember is enough for this.
Just remember ECS Core, ECS task, ECS config, and ECR,
and you'll be just fine.
Hope you liked it and I will see you in the next lecture.