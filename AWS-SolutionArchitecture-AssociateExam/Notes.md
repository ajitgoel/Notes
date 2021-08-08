**<u>AWS Lambda:</u>**
	Function Policy
	Execution Policy
	Lambda Runtime API
	Lambda Container Image
	ECS
	Fargate
	CloudWatch Events EventBridge
	Execution Role
	Log Stream
	Execution Limits
	Deployment Limits
	SAM: Serverless application model
	**function policy** simply specifies which AWS resources are allowed to invoke your function. If I added an S3 as a trigger, and so Lambda automatically added the following function policy. The Function policy defines which AWS resources are allowed to invoke your function. 
	**role execution policies** determine what resources the function role has access to when the function is being run. 
	**Lambda: Networking section**: by default, AWS Lambda is only allowed to access resources that are accessible over the internet. For example, S3. Therefore, any resources that can only be accessed directly from within your VPC requires additional configuration. So this network section provides you with the capability of allowing your function to access your resources via your VPC. When configured, AWS Lambda assigns ENIs, which are Elastic Network Interfaces, to your resources using a private IP address. When this is configured like this, it's important to note that the previous default ability of accessing publicly accessible resources over the internet is removed.
And to overcome this you must attach the function to a private subnet which has access to a NAT instance or a NAT Gateway. Do not attach it to a public subnet. It should be within a private subnet for greater security and reduced exposure to external threats. Also, in addition to this, Lambda only assigns it a private ENI and not a public address. The network section allows you to add the following. VPC, so from here you can select the VPC that the function will need to access resources within. You could look at the subnets. And here you can select at least one subnet that the function can operate in within your VPC. For high availability and scalability, you really should add an additional subnet. Under security groups, here you can specify the security group for your function to use as a part of the VPC configuration. Once this information is added to your function, Lambda can then set up and configure ENIs as required to securely connect your VPC resources. 
You should also be aware of your limits on your selected subnets, as Functions will fail if those subnets run out of IP addresses or ENIs. An important point to be made aware of is that the execution role of Lambda will need to have specific permissions that allow it to operate within a VPC. And these include permissions that are required to configure the required ENIs, such as ec2:CreateNetworkInterface, ec2:DescribeNetworkInterfaces, and also ec2:DeleteNetworkInterface. 

​		

​		<img src="Notes.assets/image-20210731224421062.png" alt="image-20210731224421062" style="zoom: 50%;" />

​	Lambda Edge

​	<img src="Notes.assets/image-20210731224801071.png" alt="image-20210731224801071" style="zoom: 50%;" />	

**DynamoDB:**
**A Global Secondary Index** is an index with a partition and sort key that can be different from those in the table. It is considered "global" because queries on the index can span all of the data in a table, across all partitions.
DynamoDB provides two commands for searching data on the table: scan and query. **A scan operation** examines every item on the table and returns all the data attributes for each one of them. When you initially navigate to the **Items** tab for a table, a scan is performed by default. 

**RDS subnet Group:** Amazon Relational Database Service (Amazon RDS) makes it easy to set up, operate, and scale a relational database in the cloud. Before launching actual RDS instances, you need to configure a DB Subnet Group.
==Subnets are segments of a VPC's IP address range that allow you to group your resources based on security and operational needs.== A DB Subnet Group is a collection of subnets (typically private) that you create in a VPC and designate for your DB instances. Each DB subnet group should have subnets in at least two Availability Zones in a given region. Note that SQL Server Mirroring with a SQL Server DB instance requires at least 3 subnets in distinct Availability Zones.
When creating a DB instance in a VPC, you must select a DB subnet group. Amazon RDS uses that DB subnet group and your preferred Availability Zone to select a subnet and an IP address within that subnet to associate with your DB instance. When Amazon RDS creates a DB instance in a VPC, it assigns a network interface to your DB instance by using an IP address selected from your DB Subnet Group. If the primary DB instance of a Multi-AZ deployment fails, Amazon RDS can promote the corresponding standby and subsequently create a new standby using an IP address from an assigned subnet in one of the other Availability Zones.
You can create an RDS Subnet Group using the RDS launch wizard.

**<u>Amazon Neptune:</u>** Used in Fraud Detection, Recommendation engine
	Database cluster volume
	Instances
	Storage
	Neptune Storage Auto Repair
	Cluster endpoint, Reader endpoint, Instance Endpoint

**Redshift:**
	Cluster
	Redshift engine
	Leader node
	Compute Node
		Node slice
		**<u>types:</u>** RA3-high performance nodes, Dense-legacy node types
	Massively Parallel processing(MPP)
	Columnar Data storage
	Result caching

**Quantum Ledger Database (QLDB):**
	

**DocumentDB:**
**Keyspaces:**

**Setting up Security Group Rules for Connecting to the RDS Instance:** You will use an EC2 instance to run queries against the RDS database in upcoming Lab Steps. In order to allow incoming traffic from EC2 instances to the RDS instance inside the same VPC. ==The rules of a Security Group control the inbound traffic that's allowed to reach the instances that are associated with the security group and the outbound traffic that's allowed to leave them. By default, security groups allow all outbound traffic and deny all inbound traffic.== You can add new rules to a VPC Security Group using the AWS Management Console.

**RDS Storage type:** 
***General Purpose (SSD)*** storage is suitable for a broad range of database workloads. Provides baseline of 3 IOPS/GiB and ability to burst to 3,000 IOPS.
***Provisioned IOPS (SSD)*** storage is suitable for I/O-intensive database workloads. Provides flexibility to provision I/O ranging from 1,000 to 80,000 IOPS.

**Starting an AWS Systems Manager Session Manager Browser Shell Session:** Session Manager is part of AWS Systems Manager suite of tools for gaining operational insights and taking action on AWS resources. Session Manager gives you browser-based shell access to EC2 instances running the Systems Manager agent. Both Windows and Linux instances are supported. Session manager provides secure access to instances without the need to distribute passwords or SSH keys. Session Manager also allows you to connect to instances without having to open any inbound ports. All communication is encrypted and IAM policies can restrict access to sessions running in Session Manager.

You will use Session Manager to start a session on an EC2 instance running in your Cloud Academy Lab environment in this Lab Step.

**Fan-Out Orders using Amazon SNS and SQS:** Fanning-out messages is a common technique to increase the scalability of background processing tasks. It involves publishing a message which is then consumed by multiple endpoints asynchronously. In AWS this can easily be achieved by combining the Amazon Simple Notification Service (Amazon SNS) with the Amazon Simple Queue Service (Amazon SQS). Learning how to implement a fan-out scenario will increase your ability to build scalable and resilient solutions using Amazon Web Services.

**Configuring a Static Website With S3 And CloudFront:** AWS doesn't recommend serving websites directly from Amazon S3. Instead, they recommend using Amazon S3 as an origin for a Content Delivery Network (CDN). A CDN pulls copies of the site from the origin and stores them in multiple global locations. The main benefit of using a CDN is lower latency for users when they access the site.
**Amazon CloudFront** is a global Content Delivery Network (CDN) that delivers data securely and efficiently. CloudFront pulls your website out to the edge of the network, reducing latency when accessed from different global locations. ==There are two main types of origin that Amazon CloudFront supports, Amazon S3 buckets, and custom origins.== A custom origin could be a website being served by an EC2 instance, or it could be a web server outside of AWS.

<u>**Key Management Service (KMS) terms:**</u> 
==**Customer Master Keys (CMK)**== - The primary resources in AWS KMS are customer master keys (CMKs). Typically ==you use CMKs to protect data encryption keys (or data keys) which are then used to encrypt or decrypt larger amounts of data outside of the service.== CMKs never leave AWS KMS unencrypted, but data keys can. AWS KMS does not store, manage, or track your data keys. There is one AWS-managed CMK for each service that is integrated with AWS KMS. When you create an encrypted resource in these services, you can choose to protect that resource under the AWS-managed CMK for that service. This CMK is unique to your AWS account and the AWS region in which it is used, and it protects the data keys used by the AWS services to protect your data.

==**Data keys** - Data keys are used encrypt large data objects within an application outside AWS KMS.== In the context of S3 server-side encryption using KMS keys, the application is S3 itself.

**Key rotation and Backing Keys** - When you create a customer master key (CMK) in AWS KMS, the service creates a key ID for the CMK and key material referred to as a backing key that is tied to the key ID of the CMK. If you choose to enable key rotation for a given CMK, AWS KMS will create a new version of the backing key for each rotation. It is the backing key that is used to perform cryptographic operations such as encryption and decryption. Automated key rotation currently retains all prior backing keys so that decryption of encrypted data can take place transparently. CMK is simply a logical resource that does not change regardless of whether or of how many times the underlying backing keys have been rotated.

**<u>Key Types:</u>** 
==**Symmetric:** A single encryption key that is used for both encrypt and decrypt operations==
==**Asymmetric:** A public and private key pair that can be used for encrypt/decrypt or sign/verify operations==

**<u>Server-Side Encryption with KMS Managed Keys (SSE-KMS):</u>** With your own CMK created and enabled you are now able to use it for server-side encryption of data in S3 in the same region as the CMK. This is referred to as ==server-side encryption with customer master keys (CMKs) stored in AWS Key Management Service or more simply SSE-KMS.== ==In SSE-KMS, the CMK generates data keys that S3 uses to encrypt objects.== Not only do users need to have access to the S3 bucket and object with SSE-KMS users must also have permission to use the CMK. In comparison to the other server-side encryption option for S3, server-side encryption with Amazon S3-managed keys (SSE-S3), the user only needs permission to access the object and does not require separate permission to use S3's underlying key. SSE-KMS provides a higher degree of control, although it requires additional charges for the key and for performing operations with the key. SSE-KMS also provides an additional audit trail showing when the CMK was used and by who.

If you do not create your own CMK, S3 can still use an AWS managed KMS CMK that is created by default in your account in the S3 bucket's region. This key is visible in the KMS console under AWS Managed Keys and is named aws/s3. However, because the key is managed by AWS you don't have the same degree of access control over key as you do with a customer managed key.

==**<u>Bucket policies</u>** are IAM policies applied to a bucket rather than to a user or role as is conventionally done with IAM policies.==

==**<u>AWS CloudTrail</u>** is a service that enables you to log, monitor, and capture API-related events across your AWS infrastructure and most AWS services.== Events that CloudTrail captures get delivered to an S3 bucket, and are also available for viewing from the CloudTrail console. CloudTrail captures, creates, modifies, and deletes API calls triggered from the console, API, command line tools, or even other AWS services. Optionally, CloudTrail can be configured to send events to CloudWatch as well (and this Lab does indeed tackle that, too). Typical use cases for CloudTrail, operating with CloudWatch, are monitoring, auditing, and security (governance, compliance, analysis).

It is important to know that CloudTrail is not a replacement for CloudWatch. It simply adds to the monitoring capabilities offered by AWS. Notice the focus for each service:

- ==CloudTrail focuses on API activity==
- ==CloudWatch focuses on performance monitoring and overall system health==

==**<u>AWS Identity and Access Management (IAM)</u>** enables you to securely control access to AWS services and resources for your users.== With IAM, you can centrally manage users, security credentials such as access keys, and permissions that control which AWS resources users can access.
==**<u>An IAM role**</u> is an IAM entity that has specific permissions.== An IAM role is similar to an IAM user in that you can manage its access to AWS resources using policies. IAM roles are attachable to other IAM services like AWS EC2 and AWS Lambda, to manage resource access for those services.
==In AWS, you can designate an IAM role to attach to an EC2 instance when launching the instance, or any time after. Attaching an IAM role to an instance allows you to manage permissions for instances centrally with IAM.==
==Instead of creating and distributing your AWS credentials,  you can use IAM roles to delegate permission for making API requests.== 
==**A security group** is a set of firewall rules that control the traffic for your instance.== On this page, you can add rules to allow specific traffic to reach your instance. For example, if you want to set up a web server and allow Internet traffic to reach your instance, add rules that allow unrestricted access to the HTTP and HTTPS ports. You can create a new security group or select from an existing one below 
==Amazon Linux AMIs typically use `ec2-user` as a username. Other popular Linux distributions use the following user names:==

- ==Debian: admin==
- ==RedHat: ec2-user==
- ==Ubuntu: ubuntu==

**<u>Auto Scaling Group,</u>**

==**Groups** Your EC2 instances are organized into groups so that they can be treated as a logical unit for the purposes of scaling and management.== When you create a group, you can specify its minimum, maximum, and desired number of EC2 instances. 
**Launch configurations** Your group uses a launch configuration as a template for its EC2 instances. When you create a launch configuration, you can specify information such as the AMI ID, instance type, key pair, security groups, and block device mapping for your instances. 
**Launch template** A launch template is similar to a launch configuration, in that it specifies instance configuration information. ... However, defining a launch template instead of a launch configuration allows you to have multiple versions of a template. With versioning, you can create a subset of the full set of parameters and then reuse it to create other templates or template versions.
==**Elastic Load Balancing (ELB)** automatically distributes incoming application traffic across multiple Amazon EC2 instances.== They enable you to achieve greater fault tolerance in your applications and seamlessly provide the correct amount of load balancing capacity needed in response to incoming application requests. ELB detects unhealthy instances within a pool and automatically reroutes traffic to healthy instances until the unhealthy instances have been restored. Elastic Load Balancers can be enabled within a single Availability Zone or across multiple zones for greater consistent application performance. The **network load balancer** is a network layer (layer-4) load balancer operating on TCP connections and UDP. It can scale to millions of requests per second. With a network load balancer, backend targets are organized into *target groups* which the network load balancer distributes traffic across. 

**<u>Types of Load Balancers:</u>**
**Application Load Balancer** when you need a flexible feature set for your web applications with HTTP and HTTPS traffic. Operating at the request level, Application Load Balancers provide advanced routing and visibility features targeted at application architectures, including microservices and containers.
**Network Load Balancer** when you need ultra-high performance, TLS offloading at scale, centralized certificate deployment, support for UDP, and static IP addresses for your application. Operating at the connection level, Network Load Balancers are capable of handling millions of requests per second securely while maintaining ultra-low latencies.
**Gateway Load Balancer** when you need to deploy and manage a fleet of third-party virtual appliances that support GENEVE. These appliances enable you to improve security, compliance, and policy controls.
**Classic Load Balancer** when you have an existing application running in the EC2-Classic network.

==**<u>Cross-Zone Load Balancing</u>** allows every load balancer node to distribute requests across all availability zones,== although for the Network Load Balancer there are data transfer charges when this feature is enabled. (There are no data charges for other types of load balancers)



$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

**Introduction to Cloud Computing and AWS**  

![image-20210729170930883](Notes.assets/image-20210729170930883.png)

**<u>Amazon Elastic Compute Cloud and Amazon Elastic Block Store</u>**  

![image-20210729170902763](Notes.assets/image-20210729170902763.png)

**AWS Storage**  

![image-20210729171041626](Notes.assets/image-20210729171041626.png)

**Amazon Virtual Private Cloud**  

![image-20210729171125226](Notes.assets/image-20210729171125226.png)

**<u>Database services:</u>**

![image-20210729171236923](Notes.assets/image-20210729171236923.png)

![image-20210729171221707](Notes.assets/image-20210729171221707.png)

**<u>Authentication and Authorization—AWS Identity and Access Management</u>**  

![image-20210729171359056](Notes.assets/image-20210729171359056.png)

![image-20210729171344837](Notes.assets/image-20210729171344837.png)

https://tutorialsdojo.com/aws-certified-solutions-architect-associate-saa-c02/#common-exam-scenarios

### **Common Exam Scenarios for the SAA-C02 exam** 

| ***\*Scenario\****                                           | ***\*Solution\****                                           |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ***\*Domain 1: Design Resilient Architectures\****           |                                                              |
| Set up asynchronous data replication to another RDS DB instance hosted in another AWS Region | Create a Read Replica                                        |
| A parallel file system for “hot” (frequently accessed) data  | Amazon FSx For Lustre                                        |
| Implement synchronous data replication across Availability Zones with automatic failover in Amazon RDS. | Enable Multi-AZ deployment in Amazon RDS.                    |
| Needs a storage service to host “cold” (infrequently accessed) data | Amazon S3 Glacier                                            |
| Set up a relational database and a disaster recovery plan with an RPO of 1 second and RTO of less than 1 minute. | Use Amazon Aurora Global Database.                           |
| Monitor database metrics and send email notifications if a specific threshold has been breached. | Create an SNS topic and add the topic in the CloudWatch alarm. |
| Set up a DNS failover to a static website.                   | Use Route 53 with the failover option to a static S3 website bucket or CloudFront distribution. |
| Implement an automated backup for all the EBS Volumes.       | Use Amazon Data Lifecycle Manager to automate the creation of EBS snapshots. |
| Monitor the available swap space of your EC2 instances       | Install the CloudWatch agent and monitor the SwapUtilizationmetric. |
| Implement a 90-day backup retention policy on Amazon Aurora. | Use AWS Backup                                               |
| ***\*Domain 2: Design High-Performing Architectures\****     |                                                              |
| Implement a fanout messaging.                                | Create an SNS topic with a message filtering policy and configure multiple SQS queues to subscribe to the topic. |
| A database that has a read replication latency of less than 1 second. | Use Amazon Aurora with cross-region replicas.                |
| A specific type of Elastic Load Balancer that uses UDP as the protocol for communication between clients and thousands of game servers around the world. | Use Network Load Balancer for TCP/UDP protocols.             |
| Monitor the memory and disk space utilization of an EC2 instance. | Install Amazon CloudWatch agent on the instance.             |
| Retrieve a subset of data from a large CSV file stored in the S3 bucket. | Perform an S3 Select operation based on the bucket’s name and object’s key. |
| Upload 1 TB file to an S3 bucket.                            | Use Amazon S3 multipart upload API to upload large objects in parts. |
| Improve the performance of the application by reducing the response times from milliseconds to microseconds. | Use Amazon DynamoDB Accelerator (DAX)                        |
| Retrieve the instance ID, public keys, and public IP address of an EC2 instance. | Access the URL: http://169.254.169.254/latest/meta-data/ using the EC2 instance. |
| Route the internet traffic to the resources based on the location of the user. | Use Route 53 Geolocation Routing policy.                     |
| ***\*Domain 3: Design Secure Applications and Architectures\**** |                                                              |
| Encrypt EBS volumes restored from the unencrypted EBS snapshots | Copy the snapshot and enable encryption with a new symmetric CMK while creating an EBS volume using the snapshot. |
| Limit the maximum number of requests from a single IP address. | Create a rate-based rule in AWS WAF and set the rate limit.  |
| Grant the bucket owner full access to all uploaded objects in the S3 bucket. | Create a bucket policy that requires users to set the object’s ACL to bucket-owner-full-control. |
| Protect objects in the S3 bucket from accidental deletion or overwrite. | Enable versioning and MFA delete.                            |
| Access resources on both on-premises and AWS using on-premises credentials that are stored in Active Directory. | Set up SAML 2.0-Based Federation by using a Microsoft Active Directory Federation Service. |
| Secure the sensitive data stored in EBS volumes              | Enable EBS Encryption                                        |
| Ensure that the data-in-transit and data-at-rest of the Amazon S3 bucket is always encrypted | Enable Amazon S3 Server-Side or use Client-Side Encryption   |
| Secure the web application by allowing multiple domains to serve SSL traffic over the same IP address. | Use AWS Certificate Manager to generate an SSL certificate. Associate the certificate to the CloudFront distribution and enable Server Name Indication (SNI). |
| Control the access for several S3 buckets by using a gateway endpoint to allow access to trusted buckets. | Create an endpoint policy for trusted S3 buckets.            |
| Enforce strict compliance by tracking all the configuration changes made to any AWS services. | Set up a rule in AWS Config to identify compliant and non-compliant services. |
| Provide short-lived access tokens that act as temporary security credentials to allow access to AWS resources. | Use AWS Security Token Service                               |
| Encrypt and rotate all the database credentials, API keys, and other secrets on a regular basis. | Use AWS Secrets Manager and enable automatic rotation of credentials. |
| ***\*Domain 4: Design Cost-Optimized Architectures\****      |                                                              |
| A cost-effective solution for over-provisioning of resources. | Configure a target tracking scaling in ASG.                  |
| The application data is stored in a tape backup solution. The backup data must be preserved for up to 10 years. | Use AWS Storage Gateway to backup the data directly to Amazon S3 Glacier Deep Archive. |
| Accelerate the transfer of historical records from on-premises to AWS over the Internet in a cost-effective manner. | Use AWS DataSync and select Amazon S3 Glacier Deep Archive as the destination. |
| Globally deliver the static contents and media files to customers around the world with low latency. | Store the files in Amazon S3 and create a CloudFront distribution. Select the S3 bucket as the origin. |
| An application must be hosted to two EC2 instances and should continuously run for three years. The CPU utilization of the EC2 instances is expected to be stable and predictable. | Deploy the application to a Reserved instance.               |
| Implement a cost-effective solution for S3 objects that are accessed less frequently. | Create an Amazon S3 lifecyle policy to move the objects to Amazon S3 Standard-IA. |
| Minimize the data transfer costs between two EC2 instances.  | Deploy the EC2 instances in the same Region.                 |
| Import the SSL/TLS certificate of the application.           | Import the certificate into AWS Certificate Manager or upload it to AWS IAM. |

## 7 Steps to Passing the Exam: AWS Certified Solutions Architect Exam Tips

And now for the details of exactly how to go about AWS Certified Solutions Architect exam preparation even if you do not have any formal engineering or [AWS training](https://www.toptal.com/aws/aws-cloud-infrastructure-benefits).

### 1. Earn the AWS Certified Cloud Practitioner [Certification](https://aws.amazon.com/certification/certified-cloud-practitioner/)

Yes, this article promises steps on how to earn your Solutions Architect - Associate certificate, but if you do not have prior AWS engineering experience or knowledge, I would *strongly* recommend passing this first. This exam is just a 1,000-foot overview and can be passed in just two weeks if you study daily.

Honestly, even if you *do* have prior experience with AWS, it may still be good to take this as the certification exams cover AWS services that you may have never actually used.

Here’s what you need to pass this exam in only two weeks:

- Take the A Cloud Guru (ACG) Certified Cloud Practitioner [course](https://acloudguru.com/course/aws-certified-cloud-practitioner-2020). You will want a full subscription to this—not just the standalone Udemy version—because you will need to use ACG heavily for the AWS Solutions Architect exam. ACG also has a section of hands-on AWS labs that are incredibly helpful for passing the exam.
- Take [these practice exams](https://www.udemy.com/course/aws-certified-cloud-practitioner-practice-test/). **Note:** These practice exams represent only the most difficult questions on the exam. If you are struggling on the practice exams but still close to passing, then you should do well on the actual test itself. The actual test is much easier than these.

#### TIPS FOR PASSING

- Take notes throughout the course and organize them so you can use that as part of your study guide for the Solutions Architect exam.
- Re-watch all of Ryan’s summaries on the day of your exam at 2x speed. This is incredibly helpful to recap everything you need to know.

### 2. Complete ACG’s AWS Certified Solutions Architect - Associate [Course](https://acloud.guru/learn/aws-certified-solutions-architect-associate)

While this course alone is not enough for a complete newbie to pass, it is still an incredible course and will be the foundation of your exam prep. It covers everything on the test, in one way or another, with some gaps here and there (we’ll get to that).

#### TIPS FOR THE COURSE

- Take detailed notes and build an organized study guide.
- Use the A Cloud Guru app and download the lectures for offline listening. Play lectures and summaries over again while doing things like driving or walking your dog. My prep strategy involved a lot of daily immersion, like this.
- Do not skip the hands-on labs. In my opinion, using AWS is the best way to learn AWS. This will really help internalize the content from the lectures.

### 3. Deep Dives on Specific AWS Services

As mentioned above, the ACG course lectures alone are not enough for most people to pass. There are a few services that will come up on the exam **a lot**, and you will need a strong understanding of them in order to pass. The best way to learn what you need is to just use them with hands-on labs.

The areas to deep dive are as follows:

#### ==AMAZON VPC==

I struggled with an overall understanding of VPCs initially, and [Cole Morrison’s article](https://start.jcolemorrison.com/aws-vpc-core-concepts-analogy-guide/) and its analogies helped immensely. I strongly suggest reading it if you are confused about VPCs. Also:

- Complete the ACG Hands-on Labs for VPCs. These are outside of the course from step #2, in the Hands-on Lab section. Filter on “AWS” and “VPC” and complete each lab. They are only a few minutes apiece but are incredibly helpful.
- The exam is very heavy in VPC questions. Learn to build one from memory.
- ==Understand the differences between using a VPN and Direct Connect.==

#### ==AMAZON S3==

Take *parts* of the A Cloud Guru S3 Masterclass [course](https://acloud.guru/learn/s3-masterclass). You do not need to take this entire course for the exam, just a few areas that come up often, including:

- ==Bucket policies vs. access control lists==
- ==S3 encryption options==
- ==Storage types==
- ==Lifecycle policies==

------

#### ==AMAZON RDS==

Take the ACG Intro to RDS [course](https://acloud.guru/learn/aws-rds), with a focus on areas that come up often, which include:

- ==Multi-AZ Replication==
- ==Read Replicas==
- ==Understand snapshots==

#### ==AMAZON KINESIS==

Be sure that you understand AWS Analytics and data warehousing tools at a high level:

- ==Kinesis: Streams vs. Firehose vs. Analytics==
- ==Kinesis vs. Redshift vs. EMR (you will get scenario-based questions with these)==
- ==Athena’s differences from Kinesis==

#### ==AMAZON LAMBDA AND SERVERLESS COMPONENTS==

Take the ACG Intro to Lambda [course](https://acloud.guru/learn/aws-lambda) but focus on:

- ==Limits/timeouts==
- ==Events and what services are generally used with Lambda triggers==

Serverless will probably show up more and more on AWS exams over time, so you’ll want to know this.

### 4. Read the AWS Storage Services Overview [Whitepaper](https://d0.awsstatic.com/whitepapers/AWS Storage Services Whitepaper-v9.pdf)

You will get *many* scenario-based questions about what kind of storage to use. You’ll want to know the differences between them and when to use each (e.g., EFS vs. EBS, S3, DynamoDB vs. RDS)

### 5. Learn the Test-taking Strategies for This Exam

**When presented with a scenario-based question**, *read the kicker first.* Scenario-based questions always start with a large paragraph, followed by a “kicker” that actually asks you the question. Read the kicker and *then* read the scenario. Example:

*“You are building a transcription service for a company in which a fleet of EC2 worker instances processes an uploaded audio file and generates a text file as an output. You must store both of these frequently accessed files in the same durable storage until the text file is retrieved by the uploader. Due to an expected surge in demand, you have to ensure that the storage is scalable and can be retrieved within minutes.*

*“Which storage option in AWS can you use in this situation that is both cost-efficient and scalable?”*

The kicker here is the last line. Pay attention to exactly what they’re asking. Many times, they’ll present multiple solutions that would work, but you have to select the ones that meet the specific requirements (in this case, cost efficiency and scalability).

**Use process of elimination for every question.** Questions will almost always have one or two options that are definitely *not* the answer. If you can get rid of these right off the bat, your odds of selecting the right one will improve. While this may seem obvious, it is really important to use on the AWS SA exam because in many cases, they will try to trick you. Look for the obvious tricks and mentally cross them out.

**Read questions twice.** Most of the questions are designed to be tricky. Do not just glance and then answer immediately. One small nuance in the wording can easily change what the right answer is, and if you go too fast, you can make the wrong choice.

**Use the “Mark for Review” feature.** The real exam will allow you to mark answers for review and then go back at the end to check them again. When a question is tough, select the best choice and then mark it for review at the end based on how much time you have left. Use this feature.

**Use questions to answer other questions on the real exam.** This is one of the main reasons to use “Mark for Review.” In many cases, one question can actually give you the answer to another question. On my exam, I noticed this a few times and was able to go back and adjust a previous answer because of that. This is why you want to “mark for review” anything you are unsure of.

### 6. Take Udemy Practice Exams

Purchase this set of [Udemy practice exams](https://www.udemy.com/course/aws-certified-solutions-architect-associate-amazon-practice-exams/) and work through them. Note that these practice exams are incredibly difficult and represent the most challenging questions you would be presented with on the exam. The actual test is easier than these.

As a rule of thumb, if you are passing these practice exams (even just barely), you should be good to pass the real thing with room to spare.

### 7. Optional: Take this [Udemy course](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c01/) to fill in the gaps.

If you are finding that there are still some gaps in your knowledge and you can’t pass the practice exams, purchase this course. I would not go through this entire course, but rather focus on the areas where you have knowledge gaps. The practice exams will show you where these gaps are.

Udemy courses also have a very cool feature where you can simply search for a keyword, and it will show you everywhere in the entire course that this word is mentioned, which you can then click on and listen to that portion. So for example, if you keep missing questions about AWS KMS, you could just search that in the Udemy course, and it will show you every section where it was discussed.

As with Cloud Practitioner, be sure to rewatch all of the ACG Solutions Architect Summary lectures on 2x speed the morning of your exam. This helps a lot with recapping everything you’ve learned.

## AWS Certified Solutions Architect Exam Prep: Practice Makes Perfect

As with any test, studying will ensure success, and the AWS Certified Solutions Architect exam is no different. While it may take up some of your free time, the benefits are worth it. Besides validating your technical skills, this certification will foster your expertise, making you more attractive to potential recruiters, which will only continue to [advance your career](https://www.toptal.com/aws/boost-your-productivity-with-aws) in the long haul.

Good luck, and please reach out with any tips you’ve found helpful!