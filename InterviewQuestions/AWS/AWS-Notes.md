**Achieving high availability: availability zones, auto-scaling, and CloudWatch: Recovering from EC2 instance failure with CloudWatch**  
==the process in the case of an outage affecting a virtual machine:==
==1 The physical hardware fails and causes the EC2 instance to fail as well.==
==2 The EC2 service detects the outage and reports the failure to a CloudWatch metric.==
==3 A CloudWatch alarm triggers recovery of the virtual machine.==
==4 The EC2 instance is launched on another physical host.==
==5 The EBS volume and Elastic IP stay the same, and are linked to the new EC2 instance.==

**Decoupling your infrastructure: Elastic Load Balancing and Simple Queue Service**  
The Elastic Load Balancing (ELB) service provides different types of load balancers that sit between your EC2 instances and the client to decouple your requests synchronously. For asynchronous decoupling, AWS offers a Simple Queue Service (SQS) that provides a message queue infrastructure.   
== Application Load Balancer (ALB)—HTTP, HTTPS==
== Network Load Balancer (NLB)—TCP==
== Classic Load Balancer (CLB)—HTTP, HTTPS, TCP, TCP+TLS==  
you can use load balancers in front of any systems that deal with request/response-style communication as long as the protocol is based on TCP.  

==SQS is only a message queue. Don’t expect features like message routing or message priorities.   
SQS FIFO (first-in-first-out) queues FIFO queues guarantee order of messages and have a mechanism to detect duplicate messages. The disadvantages are higher pricing and a limitation on 300 operations per second.  
Amazon MQ provides Apache ActiveMQ as a service and speaks the JMS, NMS, AMQP, STOMP, MQTT, and WebSocket protocols.==  

 Decoupling makes things easier because it reduces dependencies.
 ==Synchronous decoupling requires two sides to be available at the same time, but the sides don’t have to know each other.==
== With asynchronous decoupling, you can communicate without both sides being available.==
 ==Most applications can be synchronously decoupled without touching the code, by using a load balancer offered by the ELB service.==
== A load balancer can make periodic health checks to your application to determine whether the backend is ready to serve traffic.==
== Asynchronous decoupling is only possible with asynchronous processes. But you can modify a synchronous process to be an asynchronous one most of the time.==
 Asynchronous decoupling with SQS requires programming against SQS with one of the SDKs.  

**Designing for fault tolerance**  

====Fault tolerance means expecting that failures happen, and designing your systems in such a way that they can deal with failure.==
== To create a fault-tolerant application, you can use idempotent actions to transfer from one state to the next.==
== State shouldn’t reside on the EC2 instance (a stateless server) as a prerequisite for fault-tolerance.==
== AWS offers fault-tolerant services and gives you all the tools you need to create fault-tolerant systems. EC2 is one of the few services that isn’t fault-tolerant out of the box.==
== You can use multiple EC2 instances to eliminate the single point of failure. Redundant EC2 instances in different availability zones, started with an autoscaling group, are the way to make EC2 fault-tolerant.==

**Scaling up and down: auto-scaling and CloudWatch**  
==You can use auto-scaling to launch multiple identical virtual machines by using a launch configuration and an auto-scaling group.==
== EC2, SQS, and other services publish metrics to CloudWatch (CPU utilization, queue length, and so on).==
== CloudWatch alarms can change the desired capacity of an auto-scaling group. This allows you to increase the number of virtual machines based on CPU utilization or other metrics.==
== Virtual machines need to be stateless if you want to scale them according to your current workload.==
== To distribute load among multiple virtual machines, synchronous decoupling with the help of a load balancer or asynchronous decoupling with a message queue is necessary.==  

------

## On-Premise, SaaS, PaaS, IaaS

SaaS, PaaS, and IaaS are simply three ways to describe how you can use the cloud for your business.

- **IaaS:** cloud-based services, pay-as-you-go for services such as storage, networking, and virtualization. eg: ==AWS EC2, Digital Ocean,== Rackspace, Google Compute Engine (GCE), Magento 1 Enterprise Edition*.
- **PaaS:** hardware and software tools available over the internet. eg: ==AWS Elastic Beanstalk, Heroku,== Windows Azure (mostly used as PaaS), Force.com, OpenShift, Apache Stratos, Magento Commerce Cloud.
- ***\*SaaS:\**** software that’s available via a third-party over the internet. eg: BigCommerce, Google Apps, Salesforce, Dropbox, MailChimp, ZenDesk, DocuSign, Slack, Hubspot.
- **On-premise**: software that’s installed in the same building as your business.

![saas vs paas vs iaas breakdown](AWS-Notes.assets/saas-vs-paas-vs-iaas-breakdown-16455808686972.jpg)

------

Q: Suppose you have hired a team of DevOps freelancers to set up your infrastructure. You create an IAM group called “devops” and add the team to that group. After the team finishes setting your infrastructure up, they leave your project. What actions should you take?

==You should delete only the user accounts from the developers, and keep the IAM group. It is possible that, in the future, you will want to hire more DevOps freelancers to change your infrastructure. Keeping the IAM group will mean you kept the underlying set of policies, and therefore, future users can reuse those policies.==

Q: There are four main AWS services related to CI/CD: CodeCommit, CodePipeline, CodeBuild, and CodeDeploy. Describe each of them. 
AWS CodeCommit is essentially a managed service—i.e. Amazon manages and scales it behind the scenes for you, just like S3—for Git-based source control.
AWS CodeBuild is used to build, test, and generate artifacts—files that are generated from successful build steps—for deployment. This, too, is a managed service, doing provisioning and scaling automatically.
AWS CodeDeploy automates application deployments to several types of *compute resources* such as EC2 instances or ECS clusters.
AWS CodePipeline is a continuous delivery service that allows automating and integrating build, test, and deploy processes.

Q: Explain the following CloudFormation template and what is wrong with it:

```yaml
Mappings: 
  RegionMap: 
    us-east-1: 
      "HVM64": "ami-0ff8a91507f77f867"
    us-west-1: 
      "HVM64": "ami-0bdb828fd58c52235"
    eu-west-1: 
      "HVM64": "ami-047bb4163c506cd98"
    ap-southeast-1: 
      "HVM64": "ami-08569b978cc4dfa10"
    ap-northeast-1: 
      "HVM64": "ami-06cd52961ce9f0d85"
Resources: 
  myEC2Instance: 
    Type: "AWS::EC2::Instance"
    Properties: 
      ImageId: !FindInMap [RegionMap, !Ref "AWS::Region", HVM64]
      InstanceType: !Ref InstanceType
```

This CloudFormation template contains a `Mappings` section, which is useful for defining key-value pairs to be used in other parts of the template. In this case, the `RegionMap` is defining a mapping between region names and the respective AMI IDs of a virtual machine image in each of those regions.

In the `Resources` section, the `RegionMap` is then used to create an EC2 instance using the correct `ImageId`. However, the `InstanceType` property tries to use a parameter called `InstanceType`, which is missing. Parameters are useful for reusing templates, by allowing for those to be customized during stack updates or creations.

To fix this template, you could add the following section. It would allow entering an instance type and provide a default one:

```yaml
Parameters: 
  InstanceType: 
    Type: String
    Default: t2.micro
```

<u>Q: ==Explain what EC2 instance metadata is. How does an EC2 instance get its IAM access key and secret key?==</u>

EC2 instance metadata is a service accessible from within EC2 instances, which allows querying or managing data about a given running instance.
It is possible to retrieve an instance’s IAM access key by accessing the `iam/security-credentials/role-name` metadata category. This returns a temporary set of credentials that the EC2 instance automatically uses for communicating with AWS services.

<u>Q: What is an SQS dead-letter queue (DLQ), and what could you use it for?</u>
==**SQS** is Amazon’s fully managed distributed queue service. Queues are useful for handling communication between different services or other components in distributed systems. A **DLQ** is a special queue for messages that could not be processed properly. These queues are specially used for debugging and troubleshooting applications.==

<u>**Q:** What are the current types of load balancers present on AWS? How do you choose which one to use?</u>

There are currently three types of managed load balancers offered by AWS.

**Application Load Balancer**: This load balancer operates at Layer 7 of the OSI model. It can be used to load-balance HTTP and HTTPS applications and can invoke Lambda functions, among several other features.

**Network Load Balancer**: Used for extreme performance, this load balancer operates at Layer 4 of the OSI model. It can, therefore, load-balance any kind of TCP traffic and can handle large amounts of requests with low latency.

**Classic Load Balancer**: This load balancer operates at Layer 4 or Layer 7 of the OSI model. It is now mostly used for legacy applications that run on EC2-Classic since application load balancers provide more features.

**What are some differences between EKS, ECS, and Fargate?**

EKS, or **Amazon Elastic Container Service for Kubernetes**, is Amazon’s managed Kubernetes service. This service provides a managed *Kubernetes control plane* that’s highly available, i.e. they run multiple master nodes for you.

ECS, or **Elastic Container Service**, is Amazon’s container orchestration service. This service is used to manage containers and their lifecycle within clusters.

**Fargate** is an ECS launch type which allows you to run containers in serverless clusters. In other words, it allows you to run containers without needing to manage the underlying cluster infrastructure.
Explain these Elastic Beanstalk deployment modes:

- All at once
- Immutable
- Rolling
- Rolling with additional batches

**All at once**: This is the fastest mode. In this case, Elastic Beanstalk will simply stop all the running instances and then will deploy the new version to these instances.

**Immutable**: In this mode, Elastic Beanstalk will create a new Auto Scaling Group and deploy the new instances there. Then, if the deployment succeeds, it will replace the old Auto Scaling Group with the newly created one.

**Rolling**: During the deployment, Elastic Beanstalk will deploy the new application version to some of the currently running instances, and repeat that process until all instances are running the same version. Using this mode, the application will run below capacity, but with zero downtime and no additional costs.

**Rolling with additional batches**: In this mode, Elastic Beanstalk will make sure there is no capacity reduction. It does so by first starting new instances with the new version of the application, and only then deploying the new version to the old instances.

Explain the S3 consistency model.

The AWS S3 service provides read-after-write consistency for `PUT`s of new objects, meaning that as soon as an object is written to an S3 bucket, it can be retrieved.

However, suppose we tried retrieving an object and received a “Not Found” response. Because it’s not found, we immediately add it. For a small period of time, we’ll be unable to retrieve it because the Not Found response will be cached. Therefore, in this case, S3 is only *eventually* consistent. Deleting or updating existing objects are also eventually consistent operations.

Explain what this IAM Policy does:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::company-data"
    },
    {
      "Action": [
        "ecs:RunTask"
      ],
      "Effect": "Allow",
     "Condition": {
        "ArnEquals": {
          "ecs:cluster": "arn:aws:ecs:us-east-1:123456789012:cluster/prod"
        }
      },
      "Resource": "arn:aws:ecs:us-east-1:123456789012:task-definition/update-tables:*"
    }
  ]
}
```

This IAM policy allows any IAM identity or AWS resource that has it attached to list all objects from the `company-data` bucket.

It also allows running any revision of the `update-tables` task definition on the `prod` ECS cluster.

------

**The five pillars of a well-architected framework**
That all leads us nicely into this section. The reason the cloud in general and AWS in particular are so popular is that they simplify the development of well-architected frameworks. If there is one must-read white paper from AWS, it is the paper titled AWS Well-Architected Framework, which spells out the five pillars of a well-architected framework. The full paper can be found here:
https://d1.awsstatic.com/whitepapers/architecture/AWS_WellArchitected_Framework.pdf
In this section, we will summarize the main points about those five pillars.
**First pillar – security**
In both on-premises and cloud architectures, security should always be a high priority. All aspects of security should be considered, including data encryption and protection, access management, infrastructure security, monitoring, and breach detection and inspection. To enable system security and to guard against nefarious actors and vulnerabilities, AWS recommends these architectural principles:
==• Always enable traceability.==
==• Apply security at all levels.==
==• Implement the principle of least privilege.==
==• Secure the system at all levels: application, data, operating system, and hardware.==
==• Automate security best practices.==

**Second pillar – reliability**
Another characteristic of a well-architected framework is the minimization or elimination of single points of failure. Ideally, every component should have a backup, and the backup should be able to come online as quickly as possible and in an automated manner, without the need for human intervention. Another applicable concept to support reliability is the idea of self-healing systems. An example of this is how Amazon S3 handles data replication. At any given time, there are at least six copies of any object stored in Amazon S3. If, for some reason, one of the resources storing one of these copies fails, AWS will automatically recover from this failure, mark that resource as unavailable, and create another copy of the object using a healthy resource to keep the number of copies at six. When using AWS services that are not managed by AWS and are instead managed by you, make sure that you are following a similar pattern to avoid data loss and service interruption.
==The well-architected framework paper recommends these design principles to enhance reliability:==
==• Continuously test backup and recovery processes.==
==• Design systems so that they can automatically recover from a single component failure.==
==• Leverage horizontal scalability whenever possible to enhance overall system availability.==
==• Use automation to provision and shutdown resources depending on traffic and usage to minimize resource bottlenecks.==
==• Manage change with automation.==
Whenever possible, changes to the infrastructure should occur in an automated fashion.

**Third pillar – performance efficiency**
In some respects, over-provisioning resources is just as bad as not having enough capacity to handle your workloads. Launching an instance that is constantly idle or almost idle is a sign of bad design. Resources should not be at full capacity, but they should be efficiently utilized. AWS provides a variety of features and services to assist in the creation of architectures with high efficiency. However, we still have a responsibility to ensure that the architectures we design are suitable and correctly sized for our applications.
When it comes to performance efficiency, the recommended design best practices are as follows:
==• Democratize advanced technologies.==
==• Take advantage of AWS's global infrastructure to deploy your application globally with minimal cost and to provide low latency.==
==• Leverage serverless architectures wherever possible.==
==• Deploy multiple configurations to see which one delivers better performance.==

**Fourth pillar – cost optimization**
This pillar is related to the third pillar. If your architecture is efficient and can accurately handle varying application loads and adjust as traffic changes, it will follow that your costs will be minimized if your architecture can downshift when traffic slows down. Additionally, your architecture should be able to identify when resources are not being used at all and allow you to stop them or, even better, stop these unused compute resources for you. In this department, AWS also provides you with the ability to turn on monitoring tools that will automatically shut down resources if they are not being utilized.
We strongly encourage you to adopt a mechanism to stop these resources once they are identified as idle. This is especially useful in development and test environments. To enhance cost optimization, these principles are suggested:
==• Use a consumption model.==
==• Leverage economies of scale whenever possible.==
==• Reduce expenses by limiting the use of company-owned data centers.==
==• Constantly analyze and account for infrastructure expenses.==
Whenever possible, use AWS-managed services instead of services that you need to manage yourself. This should lower your administration expenses. 

**Fifth pillar – operational excellence**
The operational excellence of a workload should be measured across these dimensions:
• Agility
• Reliability
• Performance
The ideal way to optimize these metrics is to standardize and automate the management of these workloads. To achieve operational excellence, AWS recommends these principles:
==• Provision infrastructure through code (for example, via CloudFormation).==
==• Align operations and applications with business requirements and objectives.==
==• Change your systems by making incremental and regular changes.==
==• Constantly test both normal and abnormal scenarios.==
==• Record lessons learned from operational events and failures.==
==• Write down and keep standard operations procedures manual up to date.==
AWS users need to constantly evaluate their systems to ensure that they are following the recommended principles of the AWS Well-Architected Framework paper and that they comply with and follow architecture best practices.  