**Template:** In CloudFormation, you use a JSON or YAML formatted text file as blueprints for building your AWS resources.
When you use CloudFormation, you manage related resources as a single unit called a **stack**. You create, update, and delete a group or collection of resources by creating, updating, and deleting stacks.All the resources provisioned in a stack are defined by the stack's CloudFormation template. If you need to make changes to the running resources in a stack, this means you need to update the stack.Before making changes to your resources, you should generate a change set.
A **change set** is like a summary of your proposed changes.This allows you to see how your changes might impact the resources in your current stack, especially if you are working with critical resources, before implementing them.

**VPC endpoints** are virtual devices. They are Amazon VPC components that allow communication between instances in an Amazon VPC and services

**CloudWatch:**
a. https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html

<img src="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/images/alarm_graph.png" alt="Alarm threshold trigger alarm"  />

the alarm threshold for a metric alarm is set to three units. Both **Evaluation Period** and **Datapoints to Alarm** are 3. That is, when all existing data points in the most recent three consecutive periods are above the threshold, the alarm goes to `ALARM` state.

PeriodInSeconds: 300,
EvaluationPeriods: 3,
DatapointsToAlarm: 2,
Threshold: 1000

=> check every 300 seconds, if in 900 seconds time frame if two values are more than 1000 then alarm. 

b. https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Statistics-definitions.html
**Percentiles versus trimmed mean**
A percentile such as p99 and a trimmed mean such as tm99 measure similar, but not identical values. ==Both p99 and tm99 ignore the 1% of the data points with the highest values, which are considered outliers. After that, p99 is the maximum value of the remaining 99%, while tm99 is the average of the remaining 99%. If you are looking at the latency of web requests, **p99** tells you the worst customer experience, ignoring outliers(**used when alarming on latency**), while **tm99** tells you the average customer experience, ignoring outliers(**good latency statistic to watch if customer experience is being optimized**).==
~~Trimmed mean is a good latency statistic to watch if you are looking to optimize your customer experience. For alarming on latency, we recommend to use a percentile statistic, to receive alerts early if there is an issue that leads to a partial loss of service.~~

**Interface endpoint**
- allows you to connect to services powered by AWS PrivateLink. 
- can be secured using resource policies on the endpoint itself, and the resource that the endpoint provides access to. 
- allow the use of security groups to restrict access to the endpoint.

**Route 53 hosted zone**
- is analogous to a traditional DNS zone file
- it represents a collection of records that can be managed together, belonging to a single parent domain name. 
- All resource record sets within a hosted zone must have the hosted zone's domain name as a suffix.

**Virtual IPs (VIP)** 
- completely private cross-zone routable IP addresses available in the AWS VPC environment. 
- add very little latency or other overhead to storage traffic, and provide routing redundancy across the zones, all without the risks inherent in using a public facing IP.

-----------
[Difference between AWS Elastic Container Service's (ECS) ExecutionRole and TaskRole](https://stackoverflow.com/questions/48999472/difference-between-aws-elastic-container-services-ecs-executionrole-and-taskr)
Referring to [the documentation](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html) you can see that the ==**task execution role** is the IAM role that executes ECS actions such as pulling the image and storing the application logs in cloudwatch.==
==The **TaskRole** then, is the IAM role used by the task itself. For example, if your container wants to call other AWS services like S3, SQS, etc then those permissions would need to be covered by the TaskRole.== Using a TaskRole is functionally the same as using access keys in a config file on the container instance. **Using access keys in this way is not secure and is considered very bad practice.**
There are also [Container Instance Roles](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/instance_IAM_role.html). The important thing to note is that your containers will automatically be able to use these roles as well. So best practice is to have the Container instance Roles at minimum, and extend it (if needed) by task roles.

![[Pasted image 20221025113907.png]]

------------
##### Definations:

**AWS CodePipeline:** automates the build, test, and deploy phases of your release process every time there is a change
- **Deployment group:** specifies where and how to deploy an application
- **Pipeline:** consist of a set of stages, with the output of one stage serving as input to the next stage. Each stage defines a set of actions, which could be executed in parallel
**AWS CodeDeploy:** you can manage the deployment of any application to your servers. You provide scripts that correspond to deployment events, and CodeDeploy runs the appropriate script when an event occurs.
Amazon Linux 2 uses systemd to manage service (init) scripts-which contains information about a process managed by systemd.
**AWS Secrets Manager:** stores secrets in encrypted format. 
**AWS Systems Manager Parameter Store:** stores the name of the secret
