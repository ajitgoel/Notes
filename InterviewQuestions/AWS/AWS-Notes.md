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
==SQS is Amazon’s fully managed distributed queue service. Queues are useful for handling communication between different services or other components in distributed systems.
A DLQ is a special queue for messages that could not be processed properly. These queues are specially used for debugging and troubleshooting applications.==

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