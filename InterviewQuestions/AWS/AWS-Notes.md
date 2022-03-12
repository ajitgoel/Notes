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

**<u>SQS Cons:</u>**
a. DOESN’T GUARANTEE THAT A MESSAGE IS DELIVERED ONLY ONCE  
b. DOESN’T GUARANTEE THE MESSAGE ORDER  
c. DOESN’T REPLACE A MESSAGE BROKER: ==SQS is only a message queue without features like message routing or message priorities.   
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

==Fault tolerance means expecting that failures happen, and designing your systems in such a way that they can deal with failure.==
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

Summary
 An object consists of a unique identifier, metadata to describe and manage the object, and the content itself. You can save images, documents, executables, or any other content as an object in an object store.
 Amazon S3 is an object store accessible only via HTTP(S). You can upload, manage, and download objects with the CLI, SDKs, or the Management Console.
 Integrating S3 into your applications will help you implement the concept of a stateless server, because you don’t have to store objects locally on the server.
 You can define a lifecycle for your objects that will move them from Amazon S3 to Amazon Glacier, a special service for archiving data that you don’t need to access frequently. Doing so reduces your cost dramatically.
 S3 is an eventually consistent object store. You have to consider this if you integrate it into your applications and processes, to avoid unpleasant surprises.  

------

[Introduction to IAM](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/iam#introduction-to-iam)

Interactions with AWS require both:

- **Authentication**: Checking that agent requesting access is who they claim to be.
- **Authorization**: Defining the actions that are allowed, and those that are denied.

AWS provides and uses a service called [Identity and Access Management (IAM) ](https://aws.amazon.com/iam/) to accomplish authentication and authorization.

IAM implements *authentication* of **Principals**. Principals are entities such as IAM users, federated users from third party identity providers, IAM roles, AWS accounts, and AWS services.

IAM implements *authorization* using JSON documents called **Policies**.

A good way to remember the main aspects around IAM is to use the **PARC** mnemonic:

- **P**rincipal: The entity that is allowed or denied access.
- **A**ction: The type of access that is allowed or denied.
- **R**esource: The AWS resources the action will act upon.
- **C**ondition: The conditions for which the access is valid.

IAM principals use *credentials* to interact with AWS. Credentials are a pair of special strings called an access key ID and secret access key.

[Authentication](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/iam/10-authentication#authentication)[Users](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/iam/10-authentication#users)

One of the most commonly used principals in AWS is the *IAM user*. An IAM user typically represents a human who has a username and password that they use to authenticate. You can have many IAM users in an AWS account. An IAM user could, for example, represent a member of your team.

[The Root User](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/iam/10-authentication#the-root-user)

When creating an AWS account, one usually signs up with an email address and password. This creates a special user associated with that email address and password that has complete access to all AWS services and resources in the account. This is the AWS account's *root user*.

We will talk more about the AWS account root user in the [AWS Account Administration](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/020_landingzone/prepare/aws-side/20-account-admin.html) section.

[Roles](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/iam/10-authentication#roles)

An IAM role is identical in function to an IAM user, with the important distinction that it is not uniquely associated with one entity, but assumable by many entities. Typically, IAM roles correspond to a job function.

A loose analogy for IAM roles are that of professional uniforms: a surgeon's scrubs, a firefighter's hardhat, or a startup CTO's favorite unwashed hoodie. Many people can *assume the role* of a surgeon, firefighter, and startup CTO, which identifies them with a certain job function.

It'd be pretty weird if you needed surgery and found out a firefighter would be performing it, or awarded a surgeon 20% equity in your company (with a one year cliff and four year vesting schedule, of course) to develop software.

[Service Roles](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/iam/10-authentication#service-roles)

==One of the most useful things about IAM roles is they can be associated not only with human entities, like an IAM user, but also with AWS services,== like [Amazon Elastic Compute Cloud (EC2) ](https://aws.amazon.com/ec2/), AWS's scalable virtual machine compute service. ==These types of roles are known as service roles.==

==This means we can assign an IAM role directly to an EC2 instance. With an IAM role assigned to an EC2 instance, we can associate specific IAM policies with the instance role, so that the EC2 instance itself can access other AWS services. This is extremely useful for automation, for example.==

[Authorization](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/iam/20-authorization#authorization)

So far we've been discussing IAM principals. These represent the authentication component of accessing AWS. We authorize principals by attaching JSON documents to them called *IAM policies*. Policies define elements you can remember by the pneumonic *PARC*.

[Principals](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/iam/20-authorization#principals)

As mentioned, *principals* are the entities that are allowed or denied access. Commonly these are IAM users and IAM roles.

[Actions](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/iam/20-authorization#actions)

*Actions* are the type of access that is allowed or denied. Actions are commonly AWS service API calls that represent create, read, describe, list, update, and delete semantics.

[Resources](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/iam/20-authorization#resources)

*Resources* are the AWS resources the action will act upon. All AWS resources are identified by an [Amazon Resource Name (ARN) ](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html). Because AWS is deployed all over the world, ARNs function like an addressing system to precisely locate which specific part of AWS we are referring to. ARNs have these hierarchical structures:

```text
arn:partition:service:region:account-id:resource-id
arn:partition:service:region:account-id:resource-type/resource-id
arn:partition:service:region:account-id:resource-type:resource-id
```

- Here **arn** means this string is an ARN,
- **partition** is one of the three AWS paritions: AWS regions, AWS China regions, or AWS GovCloud (US) regions,
- **service** is the specific AWS service like EC2,
- **region** is the AWS region like us-east-1 (North Virginia),
- **account-id** is the AWS account ID, and
- **resource-id** is the unique resource ID. Other forms for resource IDs like **resource-type/resource-id**, are used by services like IAM where IAM users have **resource-type** of **user** and **resource-id** a username like **Falcor**.

[Conditions](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/iam/20-authorization#conditions)

*Conditions* are specific rules for which the access is valid.

[Other Elements](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/iam/20-authorization#other-elements)

All IAM policies have an *Effect* field which either either **Allow** or **Deny**.

The **Version** field defines which IAM service API version to use when evaluating the policy. At the time of this writing the latest version of IAM is **2012-10-17**.

Finally, the **Statement** field consists of one or many JSON objects that contain the specific Action, Effect, Resource, and Condition fields described above.

[Example](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/iam/20-authorization#example)

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeInstances",
                "ec2:RunInstances"
            ],
            "Resource": "*",
            "Condition" :  {
                 "IpAddress" : {
                    "aws:SourceIp" : "12.34.56.78/32"
                }
            }
        }
    ]
}
```



Let's break this down.

- First notice there is no **Principal** element in the policy. This is because attaching a policy to a principal implicitly specifies the principal the policy applies to. Since policies can exist apart from principals, this allows us to reuse common policies amongst many users, roles, services, etc.

- The **Effect** is **Allow**, so this is a policy that explicitly grants access. This is the most common type of policy. You can write policies that explicitly **Deny** access as well.

- The **Action** is an array of multiple actions that permit using EC2 to run instances and describe instance metadata. Actions can be a single action, or multiple actions in an array like depicted here.

- There is no specific ARN in the **Resource** field, but instead *****, which is a wildcard character that means this policy applies to all resources.

- Finally, we have a **Condition** set that applies this policy only if the caller's IP address matches exactly 12.34.56.78. Conditions are optional, and do not need to be specified if the policy is to be applied unconditionally.

  The `/32` is part of [CIDR notation ](https://tools.ietf.org/html/rfc4632), which allows us to specify ranges of IP addresses in a compact way. You don't need to understand CIDR notation for this workshop, but in this case, the `/32` means this IP address is not a range, but that every number in the IP address is to be matched exactly.

So if, for example, an IAM user named **Falcor** had this IAM policy attached and was attempting to run an EC2 instance and retrieve metadata about it, calling the EC2 API from their laptop that has an IP address of 12.34.56.78, they would be allowed to do so.

[It can go a lot further than this ](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_examples.html). IAM policies can be combined each with varying degrees of sensitivity and specificity, the net effect of which allows for fine-grained access control to every resource in an AWS account.

[How Policies are Evaluated](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/iam/20-authorization#how-policies-are-evaluated)

==For IAM principals, like an IAM user or IAM role, all requests to AWS are implicitly ***denied\***. This means that if no policies are attached to a principal, IAM's default behavior is to deny access.==

==Next, if the principal does have an attached policy, and there is an explicit allow, the implicit deny is overriden. However, an explicit deny in any policy overrides any allows.==

[Root User Access](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/iam/20-authorization#root-user-access)

***Important:\*** Actions taken by the AWS account root user are always implicitly ***allowed\***. The root user is special in this regard and is the only AWS principal that has this type of access.

[Credentials](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/iam/30-credentials#credentials)

- Credentials are required to interact with AWS.
- Credentials are associated with IAM principals like IAM users and IAM roles.
- AWS credentials consist of at least two strings, the:
  - Access key ID, and
  - Secret access key
- Optionally, credentials may include a third string, the session token.

Nearly all AWS services present secure HTTPS based APIs that require authentication using HMAC signatures calculated with an algorithm called [Signature Version 4 ](https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html). You should rarely if ever have to use Signature Version 4 directly, because the AWS command line interface (CLI) and AWS Software Development Kit (SDK) perform it for you. You need only provide credentials in your environment.

When we speak of credentials in the context of using AWS services, we're referring to a pair of strings called an *access key ID* and *secret access key*. These credentials are associated with an IAM principal like an IAM user or IAM role.

Here are what credentials look like:

```toml
AWS_ACCESS_KEY_ID="AKIAIOSFODNN7EXAMPLE"
AWS_SECRET_ACCESS_KEY="wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
```

[Temporary Credentials](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/iam/30-credentials#temporary-credentials)

It is also possible to use credentials that permit temporary access. These credentials have a third value, a *session token*, that is included along with the access key ID and secret access key, which looks like this:

```toml
AWS_SESSION_TOKEN="000000000000011111111111112222222222233333333333444444444444444555555555556666666666666667777777888888888888899999999999999AAAAAAAABBBBBBCCCCCCCCCCCCDDDDDDDDDDEEEEEEEEEEEEEEFFFFFFFFFFF---------++GGGGGGGGGHHHHHHHHHHHHIIIIIIIIIIIJJJJJJJJJJJJKKKKKKKKKKKKKLLLLLLLLLMMMMMMMMMMMMMNNNNNNNNNNNNNOOOOOOOOOOOOOOOOOPPPPPPPPPQQQQQQQQQQQQQQRRRRRRRRRRRRRSSSSSSSSSSSSSTTTTTTTUUUUUUUUUUUUUUUUUUUUUUUUVVVVVVVVVVVVVVWWWWWWWWWWWWWWWWWWWWXXXXXXXXXYYYYYYYYYYYYYZZZZZZZZZZaaaaaaaaaaaaaabbbbbbbbbbbbbbcccccccccccdddddddddddddeeeeeeeeeeeeeeffffffffffffggggggggggggggghhhhhiiiiiiiiiiiiijjjjjjj//////////////kkkkkkkkkkkklllllllllllllmmmmmmmmmmnnnnnnnnnnnnnnoooooooooooooooopppppppppppqqqqqqqqqqqrrrrrrrrrrrrrrssssssssstttttttttttttuuuuuuuuvvvvwwwwwwwwwwwwwwwxxxxxxxyyyyyyyyyyyyyyyzzzzzzzzz="
```

[Introduction to CDK](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/cdk#introduction-to-cdk)

The AWS Cloud Development Kit (CDK) is a new software development framework from AWS. It intends to make cloud deployments fun and easy by providing the capability to define stacks in your favorite programming language. The compiled definitions are then deployed using AWS CloudFormation.

AWS CDK apps are composed of building blocks known as constructs. Constructs are composed together to form stacks and apps.

![CDK overview diagram](AWS-Notes.assets/CDK-overview.png)

[Constructs](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/cdk#constructs)

Constructs are the basic building blocks of AWS CDK apps. A construct represents a "cloud component" and describes everything that AWS CloudFormation needs to create the component.

A construct can represent a single resource, such as an Amazon Simple Storage Service (Amazon S3) bucket, or it can represent a higher-level component consisting of multiple AWS resources. Examples of such components include a worker queue with its associated compute capacity, a cron job with monitoring resources and a dashboard, or even an entire app spanning multiple AWS accounts and regions.

[Apps](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/cdk#apps)

We call your CDK application an app. Apps are represented by the AWS CDK class [App ](https://docs.aws.amazon.com/cdk/api/latest/docs/@aws-cdk_core.App.html).

The following diagram shows the phases that the AWS CDK goes through when you call `cdk deploy`. This command deploys the resources that your app defines.

![CDK Life cycle from app source code to deploy cloudformation](AWS-Notes.assets/Lifecycle.png)

1. Construction (or Initialization)

   Your code instantiates all of the defined constructs and then links them together. In this stage, all of the constructs (app, stacks, and their child constructs) are instantiated and the constructor chain is executed. Most of your app code is executed in this stage.

2. Preparation

   All constructs that have implemented the prepare method participate in a final round of modifications, to set up their final state. The preparation phase happens automatically. As a user, you don't see any feedback from this phase. It's rare to need to use the "prepare" hook, and generally not recommended. You should be very careful when mutating the construct tree during this phase, because the order of operations could impact behavior.

3. Validation

   All constructs that have implemented the validate method can validate themselves to ensure that they're in a state that will correctly deploy. You will get notified of any validation failures that happen during this phase. Generally, we recommend that you perform validation as soon as possible (usually as soon as you get some input) and throw exceptions as early as possible. Performing validation early improves diagnosability as stack traces will be more accurate, and ensures that your code can continue to execute safely.

4. Synthesis

   This is the final stage of the execution of your AWS CDK app. It's triggered by a call to `app.synth()`, and it traverses the construct tree and invokes the synthesize method on all constructs. Constructs that implement synthesize can participate in synthesis and emit deployment artifacts to the resulting cloud assembly. These artifacts include AWS CloudFormation templates, AWS Lambda application bundles, file and Docker image assets, and other deployment artifacts. Cloud assemblies describes the output of this phase. In most cases, you won't need to implement the synthesize method

5. Deployment

   In this phase the AWS CDK CLI takes the deployment artifacts that cloud assembly produced in the synthesis phase and deploys it to an AWS environment. It uploads assets to Amazon S3 and Amazon ECR, or wherever they need to go, and then starts an AWS CloudFormation deployment to deploy the application and create the resources.

By the time the AWS CloudFormation deployment phase (step 5) starts, your AWS CDK app has already finished and exited. This has the following implications:

The AWS CDK app can't respond to events that happen during deployment, such as a resource being created or the whole deployment finishing. To run code during the deployment phase, you have to inject it into the AWS CloudFormation template as a custom resource. For more information about adding a custom resource to your app, see the AWS CloudFormation module, or the custom-resource example.

The AWS CDK app might have to work with values that can't be known at the time it runs. For example, if the AWS CDK app defines an Amazon S3 bucket with an automatically generated name, and you retrieve the `bucket.bucketName` (Python: `bucket_name`) attribute, that value is not the name of the deployed bucket. Instead, you get a Token value. To determine whether a particular value is available, call `cdk.isToken(value)` (Python: `is_token`). See Tokens for details.

[Stacks](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/cdk#stacks)

The unit of deployment in the AWS CDK is called a stack. All AWS resources defined within the scope of a stack, either directly or indirectly, are provisioned as a single unit.

Because AWS CDK stacks are implemented through AWS CloudFormation stacks, they have the same limitations as in AWS CloudFormation.

[Environments](https://catalog.us-east-1.prod.workshops.aws/v2/workshops/13304db2-f715-48bf-ada0-92e5c4eea945/en-US/011-begin/cdk#environments)

Each Stack instance in your AWS CDK app is explicitly or implicitly associated with an environment (env). An environment is the target AWS account and region into which the stack is intended to be deployed.

------

## On-Premise, SaaS, PaaS, IaaS

SaaS, PaaS, and IaaS are simply three ways to describe how you can use the cloud for your business.

- ==**IaaS:** cloud-based services, pay-as-you-go for services such as storage, networking, and virtualization==. eg: ==AWS EC2, Digital Ocean,== Rackspace, Google Compute Engine (GCE), Magento 1 Enterprise Edition*.
- ==**PaaS:** hardware and software tools available over the internet.== eg: ==AWS Elastic Beanstalk, Heroku,== Windows Azure (mostly used as PaaS), Force.com, OpenShift, Apache Stratos, Magento Commerce Cloud.
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