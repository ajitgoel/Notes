
<v Instructor>Okay, then we have Amazon EKS,</v>
and EKS is going to be something you want to know
at a high-level for the exam.
But really no in-depth details,
so no hands-on for this one.
So EKS stands for Amazon Elastic Kubernetes Service.
And so it is a way to launch managed
Kubernetes clusters on AWS.
If you remember this,
you should be good to go for the exam.
Now, what is Kubernetes?
Kubernetes is an open-source system
to do automatic deployment, scaling, and management
of containerized application, usually they're dockerized,
so they're running under Docker containers.
So you may say, well, EKS looks an awful lot like ECS.
Yes, both ECS and EKS have the same goals,
to run your Docker containers onto AWS,
but it's a different API.
ECS is going to be specific to AWS,
because AWS is the easiest service,
whereas Kubernetes is open-source, it's crate,
it's also shared by many cloud providers,
for example, Google cloud provider, Azure, AWS,
but also on-premises infrastructure.
And so this could be a great way for you
to migrate to Amazon by using EKS,
if you're already running Kubernetes.
So what does EKS support?
Well, you can run your EKS clusters on EC2
to deploy worker nodes,
so you deploy EC2 instances,
and they subscribe to your EKS cluster,
and you can run your containers on them.
So this is very similar to ECS classic.
And then you have Fargate,
and Fargate is allowing you to deploy
serverless containers onto EKS.
So as you can see,
EKS and ECS have the exact same capability.
You have ECS classic to run on EC2
and you have ECS Fargate,
and so for EKS you get EKS, EC2 and also EKS Fargate.
And so the only difference again,
is that ECS is going to be to run Docker containers,
the Amazon way, whereas EKS is the Kubernetes way.
So use case for EKS is that,
if your company is already using Kubernetes on-premises
or from another cloud, and you want to migrate to
AWS then, you should start using EKS.
This way you don't have to reinvent the wheel.
And that's it for EKS, you know more than enough,
I hope you liked it and I will see you in the next lecture.