QUIZ 1 OF 2

# FREE AWS Certified Solutions Architect Associate Practice Exam (Timed Mode)

5 of 15 questions answered correctly

YOUR TIME:00:07:51

You have reached 5 of 15 point(s), (33.33%)

#### Categories

1. CSAA – Design Cost-Optimized Architectures33.33%
2. CSAA – Design High-Performing Architectures40%
3. CSAA – Design Resilient Architectures25%
4. CSAA – Design Secure Applications and Architectures33.33% 

To further increase your chances of passing the exam, we highly recommend that you enroll in the **premium version** of this course – our [AWS Certified Solutions Architect Associate Practice Exams](https://portal.tutorialsdojo.com/courses/aws-certified-solutions-architect-associate-practice-exams/).

To view your record of all previous attempts:

![img](https://w7e4q5w4.stackpathcdn.com/wp-content/uploads/2020/10/tutorialsdojo-view-results.gif)

Visit our [FAQ page](https://portal.tutorialsdojo.com/faqs/) for more information on the site’s features.

 						View All Questions 						View Incorrect Answers 						View Correct Answers 					

1. 1
2. 2
3. 3
4. 4
5. 5
6. 6
7. 7
8. 8
9. 9
10. 10
11. 11
12. 12
13. 13
14. 14
15. 15

1.  Answered
2.  Review

1. ##### 1. QUESTION

   A Solutions Architect created a new Standard-class S3 bucket to store financial reports that are not frequently accessed but should immediately be available when an auditor requests them. To save costs, the Architect changed the storage class of the S3 bucket from Standard to Infrequent Access storage class.

   In Amazon S3 Standard – Infrequent Access storage class, which of the following statements are true? (Select TWO.)

   

   - It provides high latency and low throughput performance.
   - ==It is designed for data that requires rapid access when needed.==
   - It automatically moves data to the most cost-effective access tier without any operational overhead.
   - ==It is designed for data that is accessed less frequently.==
   - Ideal to use for data archiving.

   

   **Correct**

   

   **Amazon S3 Standard – Infrequent Access (Standard – IA)** is an Amazon S3 storage class for data that is accessed less frequently, but requires rapid access when needed. Standard – IA offers the high durability, throughput, and low latency of Amazon S3 Standard, with a low per GB storage price and per GB retrieval fee.

   ![img](https://k2y3h8q6.stackpathcdn.com/wp-content/uploads/2019/01/S3-1024x585.jpg)

   This combination of low cost and high performance make Standard – IA ideal for long-term storage, backups, and as a data store for disaster recovery. The Standard – IA storage class is set at the object level and can exist in the same bucket as Standard, allowing you to use lifecycle policies to automatically transition objects between storage classes without any application changes.

   **Key Features:**

   – Same low latency and high throughput performance of Standard

   – Designed for durability of 99.999999999% of objects

   – Designed for 99.9% availability over a given year

   – Backed with the Amazon S3 Service Level Agreement for availability

   – Supports SSL encryption of data in transit and at rest

   – Lifecycle management for automatic migration of objects

   Hence, the correct answers are:

   – ***\*It is designed for data that is accessed less frequently.\****

   – ***\*It is designed for data that requires rapid access when needed.\****

   The option that says: ***\*It automatically moves data to the most cost-effective access tier without any operational overhead\**** is incorrect as it actually refers to Amazon S3 – Intelligent Tiering, which is the only cloud storage class that delivers automatic cost savings by moving objects between different access tiers when access patterns change.

   The option that says: ***\*It provides high latency and low throughput performance\**** is incorrect as it should be “low latency” and “high throughput” instead. S3 automatically scales performance to meet user demands.

   The option that says: ***\*Ideal to use for data archiving\**** is incorrect because this statement refers to Amazon S3 Glacier. Glacier is a secure, durable, and extremely low-cost cloud storage service for data archiving and long-term backup.

   **References:**

   https://aws.amazon.com/s3/storage-classes/

   https://aws.amazon.com/s3/faqs

   **Check out this Amazon S3 Cheat Sheet:**

   https://tutorialsdojo.com/amazon-s3/

2. ##### 2. QUESTION

   A Solutions Architect is working for a large global media company with multiple office locations all around the world. The Architect is instructed to build a system to distribute training videos to all employees. Using CloudFront, what method would be used to serve content that is stored in S3, but not publicly accessible from S3 directly?

   - Add the CloudFront account security group.
- ==Create an Origin Access Identity (OAI) for CloudFront and grant access to the objects in your S3 bucket to that OAI.==
   - Create an Identity and Access Management (IAM) user for CloudFront and grant access to the objects in your S3 bucket to that IAM user.
   - Create an S3 bucket policy that lists the CloudFront distribution ID as the principal and the target bucket as the Amazon Resource Name (ARN).
   
   **Correct**

   When you create or update a distribution in CloudFront, you can add an origin access identity (OAI) and automatically update the bucket policy to give the origin access identity permission to access your bucket. Alternatively, you can choose to manually change the bucket policy or change ACLs, which control permissions on individual objects in your bucket.

   ![img](https://d2908q01vomqb2.cloudfront.net/5b384ce32d8cdef02bc3a139d4cac0a22bb029e8/2018/06/27/4-v-2.png)

   You can update the Amazon S3 bucket policy using either the AWS Management Console or the Amazon S3 API:

   – Grant the CloudFront origin access identity the applicable permissions on the bucket.

   – Deny access to anyone that you don’t want to have access using Amazon S3 URLs.

   **Reference:**

   https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html#private-content-granting-permissions-to-oai

   **Check out this Amazon CloudFront Cheat Sheet:**

   https://tutorialsdojo.com/amazon-cloudfront/

   **S3 Pre-signed URLs vs CloudFront Signed URLs vs Origin Access Identity (OAI)**

   https://tutorialsdojo.com/s3-pre-signed-urls-vs-cloudfront-signed-urls-vs-origin-access-identity-oai/

   **Comparison of AWS Services Cheat Sheets:**

   https://tutorialsdojo.com/comparison-of-aws-services/

3. ##### 3. QUESTION

   A company hosted a web application in an Auto Scaling group of EC2 instances. The IT manager is concerned about the over-provisioning of the resources that can cause higher operating costs. A Solutions Architect has been instructed to create a cost-effective solution without affecting the performance of the application.

   Which dynamic scaling policy should be used to satisfy this requirement?

   

   - Use simple scaling.
   - Use scheduled scaling.
   - Use suspend and resume scaling.
   - Use target tracking scaling.

   

   **Incorrect**

   

   An **Auto Scaling group** contains a collection of Amazon EC2 instances that are treated as a logical grouping for the purposes of automatic scaling and management. An Auto Scaling group also enables you to use Amazon EC2 Auto Scaling features such as health check replacements and scaling policies. Both maintaining the number of instances in an Auto Scaling group and automatic scaling are the core functionality of the Amazon EC2 Auto Scaling service. The size of an Auto Scaling group depends on the number of instances that you set as the desired capacity. You can adjust its size to meet demand, either manually or by using automatic scaling.

   Step scaling policies and simple scaling policies are two of the dynamic scaling options available for you to use. Both require you to create CloudWatch alarms for the scaling policies. Both require you to specify the high and low thresholds for the alarms. Both require you to define whether to add or remove instances, and how many, or set the group to an exact size. The main difference between the policy types is the step adjustments that you get with step scaling policies. When step adjustments are applied, and they increase or decrease the current capacity of your Auto Scaling group, the adjustments vary based on the size of the alarm breach.

   ![img](https://docs.aws.amazon.com/autoscaling/ec2/userguide/images/as-basic-diagram.png)

   The primary issue with simple scaling is that after a scaling activity is started, the policy must wait for the scaling activity or health check replacement to complete and the cooldown period to expire before responding to additional alarms. Cooldown periods help to prevent the initiation of additional scaling activities before the effects of previous activities are visible.

   With a target tracking scaling policy, you can increase or decrease the current capacity of the group based on a target value for a specific metric. This policy will help resolve the over-provisioning of your resources. The scaling policy adds or removes capacity as required to keep the metric at, or close to, the specified target value. In addition to keeping the metric close to the target value, a target tracking scaling policy also adjusts to changes in the metric due to a changing load pattern.

   Hence, the correct answer is: ***\*Use target tracking scaling.\****

   The option that says: ***\*Use simple scaling\**** is incorrect because you need to wait for the cooldown period to complete before initiating additional scaling activities. Target tracking or step scaling policies can trigger a scaling activity immediately without waiting for the cooldown period to expire.

   The option that says: ***\*Use scheduled scaling\**** is incorrect because this policy is mainly used for predictable traffic patterns. You need to use the target tracking scaling policy to optimize the cost of your infrastructure without affecting the performance.

   The option that says: ***\*Use suspend and resume scaling\**** is incorrect because this type is used to temporarily pause scaling activities triggered by your scaling policies and scheduled actions.

    

   **References:**

   https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html

   https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html

    

   **Check out this AWS Auto Scaling Cheat Sheet:**

   https://tutorialsdojo.com/aws-auto-scaling/

   

4. ##### 4. QUESTION

   A company needs to design an online analytics application that uses Redshift Cluster for its data warehouse. Which of the following services allows them to monitor all API calls in Redshift instance and can also provide secured data for auditing and compliance purposes?

   

   - Amazon Redshift Spectrum
   - AWS X-Ray
   - Amazon CloudWatch
   - AWS CloudTrail

   

   **Incorrect**

   

   **AWS CloudTrail** is a service that enables governance, compliance, operational auditing, and risk auditing of your AWS account. With CloudTrail, you can log, continuously monitor, and retain account activity related to actions across your AWS infrastructure. By default, CloudTrail is enabled on your AWS account when you create it. When activity occurs in your AWS account, that activity is recorded in a CloudTrail event. You can easily view recent events in the CloudTrail console by going to Event history.

   ![img](https://media.amazonwebservices.com/blog/2014/cloudtrail_revised_flow_2.png)

   CloudTrail provides event history of your AWS account activity, including actions taken through the AWS Management Console, AWS SDKs, command line tools, API calls, and other AWS services. This event history simplifies security analysis, resource change tracking, and troubleshooting.

   Hence, the correct answer is: ***\*AWS CloudTrail.\****

   ***\*Amazon CloudWatch\**** is incorrect. Although this is also a monitoring service, it cannot track the API calls to your AWS resources.

   ***\*AWS X-Ray\**** is incorrect because this is not a suitable service to use to track each API call to your AWS resources. It just helps you debug and analyze your microservices applications with request tracing so you can find the root cause of issues and performance.

   ***\*Amazon Redshift Spectrum\**** is incorrect because this is not a monitoring service but rather a feature of Amazon Redshift that enables you to query and analyze all of your data in Amazon S3 using the open data formats you already use, with no data loading or transformations needed.

    

   **References:**

   https://aws.amazon.com/cloudtrail/

   https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html

    

   **Check out this AWS CloudTrail Cheat Sheet:**

   https://tutorialsdojo.com/aws-cloudtrail/

   

   

5. ##### 5. QUESTION

   The media company that you are working for has a video transcoding application running on Amazon EC2. Each EC2 instance polls a queue to find out which video should be transcoded, and then runs a transcoding process. If this process is interrupted, the video will be transcoded by another instance based on the queuing system. This application has a large backlog of videos which need to be transcoded. Your manager would like to reduce this backlog by adding more EC2 instances, however, these instances are only needed until the backlog is reduced.

   In this scenario, which type of Amazon EC2 instance is the most cost-effective type to use?

   

   - On-demand instances
   - Reserved instances
   - Spot instances
   - Dedicated instances

   

   **Incorrect**

   

   You require an instance that will be used not as a primary server but as a spare compute resource to augment the transcoding process of your application. These instances should also be terminated once the backlog has been significantly reduced. In addition, the scenario mentions that if the current process is interrupted, the video can be transcoded by another instance based on the queuing system. This means that the application can gracefully handle an unexpected termination of an EC2 instance, like in the event of a Spot instance termination when the Spot price is greater than your set maximum price. Hence, an Amazon EC2 Spot instance is the best and cost-effective option for this scenario.

   ![img](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/images/spot_lifecycle.png)

   Amazon EC2 Spot instances are **spare** compute capacity in the AWS cloud available to you at steep discounts compared to On-Demand prices. EC2 Spot enables you to optimize your costs on the AWS cloud and scale your application’s throughput up to 10X for the same budget. By simply selecting Spot when launching EC2 instances, you can save up-to 90% on On-Demand prices. The only difference between On-Demand instances and Spot Instances is that Spot instances can be interrupted by EC2 with two minutes of notification when the EC2 needs the capacity back.

   You can specify whether Amazon EC2 should hibernate, stop, or terminate Spot Instances when they are interrupted. You can choose the interruption behavior that meets your needs.

   Take note that there is no *“bid price”* anymore for Spot EC2 instances **since March 2018**. You simply have to set your **maximum price** instead.

   ***\*Reserved instances\**** and ***\*Dedicated instances\**** are incorrect as both do not act as spare compute capacity.

   ***\*On-demand instances\**** is a valid option but a Spot instance is much cheaper than On-Demand.

    

   **References:** 

   https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-interruptions.html

   http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/how-spot-instances-work.html

   https://aws.amazon.com/blogs/compute/new-amazon-ec2-spot-pricing

    

   **Check out this Amazon EC2 Cheat Sheet:**

   https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/

   

   

6. ##### 6. QUESTION

   A financial application is composed of an Auto Scaling group of EC2 instances, an Application Load Balancer, and a MySQL RDS instance in a Multi-AZ Deployments configuration. To protect the confidential data of your customers, you have to ensure that your RDS database can only be accessed using the profile credentials specific to your EC2 instances via an authentication token.

   As the Solutions Architect of the company, which of the following should you do to meet the above requirement?

   

   - Use a combination of IAM and STS to restrict access to your RDS instance via a temporary token.
   - Enable the IAM DB Authentication.
   - Create an IAM Role and assign it to your EC2 instances which will grant exclusive access to your RDS instance.
   - Configure SSL in your application to encrypt the database connection to RDS.

   

   **Incorrect**

   

   You can authenticate to your DB instance using AWS Identity and Access Management (IAM) database authentication. IAM database authentication works with MySQL and PostgreSQL. With this authentication method, you don’t need to use a password when you connect to a DB instance. Instead, you use an authentication token.

   An **authentication token** is a unique string of characters that Amazon RDS generates on request. Authentication tokens are generated using AWS Signature Version 4. Each token has a lifetime of 15 minutes. You don’t need to store user credentials in the database, because authentication is managed externally using IAM. You can also still use standard database authentication.

   ![img](https://udemy-images.s3.amazonaws.com/redactor/raw/2019-01-13_07-04-06-a2157247b0fa129795001208504fcb51.png)

   IAM database authentication provides the following benefits:

   1. Network traffic to and from the database is encrypted using Secure Sockets Layer (SSL).
   2. You can use IAM to centrally manage access to your database resources, instead of managing access individually on each DB instance.
   3. For applications running on Amazon EC2, you can use profile credentials specific to your EC2 instance to access your database instead of a password, for greater security

   Hence, ***\*enabling IAM DB Authentication\**** is the correct answer based on the above reference.

   ***\*Configuring SSL in your application to encrypt the database connection to RDS\**** is incorrect because an SSL connection is not using an authentication token from IAM. Although configuring SSL to your application can improve the security of your data in flight, it is still not a suitable option to use in this scenario.

   ***\*Creating an IAM Role and assigning it to your EC2 instances which will grant exclusive access to your RDS instance\**** is incorrect because although you can create and assign an IAM Role to your EC2 instances, you still need to configure your RDS to use IAM DB Authentication.

   ***\*Using a combination of IAM and STS to restrict access to your RDS instance via a temporary token\**** is incorrect because you have to use IAM DB Authentication for this scenario, and not a combination of an IAM and STS. Although STS is used to send temporary tokens for authentication, this is not a compatible use case for RDS.

    

   **Reference:**

   https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html

    

   **Check out this Amazon RDS cheat sheet:**

   https://tutorialsdojo.com/amazon-relational-database-service-amazon-rds/

   

   

7. ##### 7. QUESTION

   A company plans to implement a hybrid architecture. They need to create a dedicated connection from their Amazon Virtual Private Cloud (VPC) to their on-premises network. The connection must provide high bandwidth throughput and a more consistent network experience than Internet-based solutions.

   Which of the following can be used to create a private connection between the VPC and the company’s on-premises network?

   

   - AWS Site-to-Site VPN
   - Transit Gateway with equal-cost multipath routing (ECMP)
   - Transit VPC
   - AWS Direct Connect

   

   **Correct**

   

   **AWS Direct Connect** links your internal network to an AWS Direct Connect location over a standard Ethernet fiber-optic cable. One end of the cable is connected to your router, the other to an AWS Direct Connect router.

   ![img](https://media.tutorialsdojo.com/aws-direct-connect-tutorialsdojo-saa-c02-aws.png)

   With this connection, you can create virtual interfaces directly to public AWS services (for example, to Amazon S3) or to Amazon VPC, bypassing internet service providers in your network path. An AWS Direct Connect location provides access to AWS in the region with which it is associated. You can use a single connection in a public Region or AWS GovCloud (US) to access public AWS services in all other public Regions

   Hence, the correct answer is: ***\*AWS Direct Connect.\****

   The option that says: ***\*Transit VPC\**** is incorrect because this in itself is not enough to integrate your on-premises network to your VPC. You have to either use a VPN or a Direct Connect connection. A transit VPC is primarily used to connect multiple VPCs and remote networks in order to create a global network transit center and not for establishing a dedicated connection to your on-premises network.

   The option that says: ***\*Transit Gateway with equal-cost multipath routing (ECMP)\**** is incorrect because a transit gateway is commonly used to connect multiple VPCs and on-premises networks through a central hub. Just like transit VPC, a transit gateway is not capable of establishing a direct and dedicated connection to your on-premises network.

   The option that says: ***\*AWS Site-to-Site VPN\**** is incorrect because this type of connection traverses the public Internet. Moreover, it doesn’t provide a high bandwidth throughput and a more consistent network experience than Internet-based solutions.

    

   **References:** 

   https://aws.amazon.com/premiumsupport/knowledge-center/connect-vpc/

   https://docs.aws.amazon.com/directconnect/latest/UserGuide/Welcome.html

    

   **Check out this AWS Direct Connect Cheat Sheet:**

   https://tutorialsdojo.com/aws-direct-connect/

    

   **S3 Transfer Acceleration vs Direct Connect vs VPN vs Snowball vs Snowmobile:**

   https://tutorialsdojo.com/s3-transfer-acceleration-vs-direct-connect-vs-vpn-vs-snowball-vs-snowmobile/

    

   **Comparison of AWS Services Cheat Sheets:**

   https://tutorialsdojo.com/comparison-of-aws-services/

   

   

8. ##### 8. QUESTION

   There was an incident in your production environment where the user data stored in the S3 bucket has been accidentally deleted by one of the Junior DevOps Engineers. The issue was escalated to your manager and after a few days, you were instructed to improve the security and protection of your AWS resources.

   What combination of the following options will protect the S3 objects in your bucket from both accidental deletion and overwriting? (Select TWO.)

   

   - Enable Versioning
   - Provide access to S3 data strictly through pre-signed URL only
   - Enable Multi-Factor Authentication Delete
   - Enable Amazon S3 Intelligent-Tiering
   - Disallow S3 Delete using an IAM bucket policy

   

   **Correct**

   

   By using Versioning and enabling MFA (Multi-Factor Authentication) Delete, you can secure and recover your S3 objects from accidental deletion or overwrite.

   Versioning is a means of keeping multiple variants of an object in the same bucket. Versioning-enabled buckets enable you to recover objects from accidental deletion or overwrite. You can use versioning to preserve, retrieve, and restore every version of every object stored in your Amazon S3 bucket. With versioning, you can easily recover from both unintended user actions and application failures.

   You can also optionally add another layer of security by configuring a bucket to enable MFA (Multi-Factor Authentication) Delete, which requires additional authentication for either of the following operations:

   – Change the versioning state of your bucket

   – Permanently delete an object version

   MFA Delete requires two forms of authentication together:

   – Your security credentials

   – The concatenation of a valid serial number, a space, and the six-digit code displayed on an approved authentication device

   ***\*Providing access to S3 data strictly through pre-signed URL only\**** is incorrect since a pre-signed URL gives access to the object identified in the URL. Pre-signed URLs are useful when customers perform an object upload to your S3 bucket, but does not help in preventing accidental deletes.

   ***\*Disallowing S3 Delete using an IAM bucket policy\**** is incorrect since you still want users to be able to delete objects in the bucket, and you just want to prevent accidental deletions. Disallowing S3 Delete using an IAM bucket policy will restrict all delete operations to your bucket.

   ***\*Enabling Amazon S3 Intelligent-Tiering\**** is incorrect since S3 intelligent tiering does not help in this situation.

    

   **Reference:** 

   https://docs.aws.amazon.com/AmazonS3/latest/dev/Versioning.html

    

   **Check out this Amazon S3 Cheat Sheet:**

   https://tutorialsdojo.com/amazon-s3/

   

   

9. ##### 9. QUESTION

   A company plans to set up a cloud infrastructure in AWS. In the planning, it was discussed that you need to deploy two EC2 instances that should continuously run for three years. The CPU utilization of the EC2 instances is also expected to be stable and predictable.

   Which is the most cost-efficient Amazon EC2 Pricing type that is most appropriate for this scenario?

   

   - Reserved Instances
   - On-Demand instances
   - Spot instances
   - Dedicated Hosts

   

   **Correct**

   

   **Reserved Instances** provide you with a significant discount (up to 75%) compared to On-Demand instance pricing. In addition, when Reserved Instances are assigned to a specific Availability Zone, they provide a capacity reservation, giving you additional confidence in your ability to launch instances when you need them.

   ![img](https://media.amazonwebservices.com/blog/2016/ri_purchase_with_zone_benefit_1.png)

   For applications that have steady state or predictable usage, Reserved Instances can provide significant savings compared to using On-Demand instances.

   Reserved Instances are recommended for:

   – Applications with steady state usage

   – Applications that may require reserved capacity

   – Customers that can commit to using EC2 over a 1 or 3 year term to reduce their total computing costs

    

   **References:** 

   https://aws.amazon.com/ec2/pricing/

   https://aws.amazon.com/ec2/pricing/reserved-instances/

    

   **Check out this Amazon EC2 Cheat Sheet:**

   https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/

   

   

10. ##### 10. QUESTION

    One member of your DevOps team consulted you about a connectivity problem in one of your Amazon EC2 instances. The application architecture is initially set up with four EC2 instances, each with an EIP address that all belong to a public non-default subnet. You launched another instance to handle the increasing workload of your application. The EC2 instances also belong to the same security group. Everything works well as expected except for one of the EC2 instances which is not able to send nor receive traffic over the Internet.

    Which of the following is the MOST likely reason for this issue?

    

    - The EC2 instance does not have a public IP address associated with it.
    - The EC2 instance is running in an Availability Zone that is not connected to an Internet gateway.
    - The route table is not properly configured to allow traffic to and from the Internet through the Internet gateway.
    - The EC2 instance does not have a private IP address associated with it.

    

    **Incorrect**

    

    IP addresses enable resources in your VPC to communicate with each other, and with resources over the Internet. Amazon EC2 and Amazon VPC support the IPv4 and IPv6 addressing protocols.

    By default, Amazon EC2 and Amazon VPC use the IPv4 addressing protocol. When you create a VPC, you must assign it an IPv4 CIDR block (a range of private IPv4 addresses). Private IPv4 addresses are not reachable over the Internet. To connect to your instance over the Internet, or to enable communication between your instances and other AWS services that have public endpoints, you can assign a globally-unique public IPv4 address to your instance.

    You can optionally associate an IPv6 CIDR block with your VPC and subnets, and assign IPv6 addresses from that block to the resources in your VPC. IPv6 addresses are public and reachable over the Internet.

     

    ![img](https://docs.aws.amazon.com/vpc/latest/userguide/images/case-1.png)

     

    All subnets have a modifiable attribute that determines whether a network interface created in that subnet is assigned a public IPv4 address and, if applicable, an IPv6 address. This includes the primary network interface (eth0) that’s created for an instance when you launch an instance in that subnet. Regardless of the subnet attribute, you can still override this setting for a specific instance during launch.

    By default, nondefault subnets have the IPv4 public addressing attribute set to **`false`**, and default subnets have this attribute set to `true`. An exception is a nondefault subnet created by the Amazon EC2 launch instance wizard — the wizard sets the attribute to `true`. You can modify this attribute using the Amazon VPC console.

    In this scenario, there are 5 EC2 instances that belong to the same security group that should be able to connect to the Internet. The main route table is properly configured but there is a problem connecting to one instance. Since the other four instances are working fine, we can assume that the security group and the route table are correctly configured. One possible reason for this issue is that the problematic instance does not have a public or an EIP address.

    Take note as well that the four EC2 instances all belong to a public **non-default** subnet. Which means that a new EC2 instance will not have a public IP address by default since the since IPv4 public addressing attribute is initially set to `false.`

    Hence, the correct answer is the option that says: ***\*The EC2 instance does not have a public IP address associated with it.\****

    The option that says: ***\*The route table is not properly configured to allow traffic to and from the Internet through the Internet gateway\**** is incorrect because the other three instances, which are associated with the same route table and security group, do not have any issues.

    The option that says: ***\*The EC2 instance is running in an Availability Zone that is not connected to an Internet gateway\**** is incorrect because there is no relationship between the Availability Zone and the Internet Gateway (IGW) that may have caused the issue.

    **References:**

    http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario1.html

     https://docs.aws.amazon.com/vpc/latest/userguide/vpc-ip-addressing.html#vpc-ip-addressing-subnet

    **Check out this Amazon VPC Cheat Sheet:**

    https://tutorialsdojo.com/amazon-vpc/

11. ##### 11. QUESTION

    A startup is building IoT devices and monitoring applications. They are using IoT sensors to monitor the traffic in real-time by using an Amazon Kinesis Stream that is configured with default settings. It then sends the data to an Amazon S3 bucket every 3 days. When you checked the data in S3 on the 3rd day, only the data for the last day is present and no data is present from 2 days ago.

    Which of the following is the MOST likely cause of this issue?

    

    - Amazon S3 bucket has encountered a data loss.
    - The access of the Kinesis stream to the S3 bucket is insufficient.
    - Someone has manually deleted the record in Amazon S3.
    - By default, data records in Kinesis are only accessible for 24 hours from the time they are added to a stream.

    

    **Incorrect**

    

    By default, records of a stream in Amazon Kinesis are accessible for up to 24 hours from the time they are added to the stream. You can raise this limit to up to 7 days by enabling extended data retention.

    ![img](https://docs.aws.amazon.com/streams/latest/dev/images/architecture.png)

    Hence, the correct answer is: ***\*By default, data records in Kinesis are only accessible for 24 hours from the time they are added to a stream.\****

    The option that says: ***\*Amazon S3 bucket has encountered a data loss\**** is incorrect because Amazon S3 rarely experiences data loss. Amazon has an SLA for S3 that it commits to its customers. Amazon S3 Standard, S3 Standard–IA, S3 One Zone-IA, and S3 Glacier are all designed to provide 99.999999999% durability of objects over a given year. This durability level corresponds to an average annual expected loss of 0.000000001% of objects. Hence, Amazon S3 bucket data loss is highly unlikely.

    The option that says: ***\*Someone has manually deleted the record in Amazon S3\**** is incorrect because if someone has deleted the data, this should have been visible in CloudTrail. Also, deleting that much data manually shouldn’t have occurred in the first place if you have put in the appropriate security measures.

    The option that says: ***\*The access of the Kinesis stream to the S3 bucket is insufficient\**** is incorrect because having insufficient access is highly unlikely since you are able to access the bucket and view the contents of the previous day’s data collected by Kinesis.

    **Reference:** 

    https://aws.amazon.com/kinesis/data-streams/faqs/

    https://docs.aws.amazon.com/AmazonS3/latest/dev/DataDurability.html

    **Check out this Amazon Kinesis Cheat Sheet:**

    https://tutorialsdojo.com/amazon-kinesis/

12. ##### 12. QUESTION

    A Solutions Architect working for a startup is designing a High Performance Computing (HPC) application which is publicly accessible for their customers. The startup founders want to mitigate distributed denial-of-service (DDoS) attacks on their application.

    Which of the following options are not suitable to be implemented in this scenario? (Select TWO.)

    - Add multiple Elastic Fabric Adapters (EFA) to each EC2 instance to increase the network bandwidth.
- Use an Application Load Balancer with Auto Scaling groups for your EC2 instances. Prevent direct Internet traffic to your Amazon RDS database by deploying it to a new private subnet.
    - Use Dedicated EC2 instances to ensure that each instance has the maximum performance possible.
    - Use AWS Shield and AWS WAF.
    - Use an Amazon CloudFront service for distributing both static and dynamic content.
    
    **Incorrect**

    Take note that the question asks about the viable mitigation techniques that are **NOT** suitable to prevent Distributed Denial of Service (DDoS) attack.

    A Denial of Service (DoS) attack is an attack that can make your website or application unavailable to end users. To achieve this, attackers use a variety of techniques that consume network or other resources, disrupting access for legitimate end users.

    To protect your system from DDoS attack, you can do the following:

    – Use an Amazon CloudFront service for distributing both static and dynamic content.

    – Use an Application Load Balancer with Auto Scaling groups for your EC2 instances. Prevent direct Internet traffic to your Amazon RDS database by deploying it to a new private subnet.

    – Set up alerts in Amazon CloudWatch to look for high **`Network In`** and CPU utilization metrics.

    Services that are available within AWS Regions, like Elastic Load Balancing and Amazon Elastic Compute Cloud (EC2), allow you to build Distributed Denial of Service resiliency and scale to handle unexpected volumes of traffic within a given region. Services that are available in AWS edge locations, like Amazon CloudFront, AWS WAF, Amazon Route53, and Amazon API Gateway, allow you to take advantage of a global network of edge locations that can provide your application with greater fault tolerance and increased scale for managing larger volumes of traffic.

    In addition, you can also use **AWS Shield** and **AWS WAF** to fortify your cloud network. AWS Shield is a managed DDoS protection service that is available in two tiers: Standard and Advanced. AWS Shield Standard applies always-on detection and inline mitigation techniques, such as deterministic packet filtering and priority-based traffic shaping, to minimize application downtime and latency.

    **AWS WAF** is a web application firewall that helps protect web applications from common web exploits that could affect application availability, compromise security, or consume excessive resources. You can use AWS WAF to define customizable web security rules that control which traffic accesses your web applications. If you use AWS Shield Advanced, you can use AWS WAF at no extra cost for those protected resources and can engage the DRT to create WAF rules.

    ![img](https://d1.awsstatic.com/aws-answers/answers-images/lb-app-ddos-mitigation.5fd8c473963ad36250ce5b01e631aaa6f657aff4.png)

    ***\*Using Dedicated EC2 instances to ensure that each instance has the maximum performance possible\**** is not a viable mitigation technique because Dedicated EC2 instances are just an instance billing option. Although it may ensure that each instance gives the maximum performance, that by itself is not enough to mitigate a DDoS attack.

    ***\*Adding multiple Elastic Fabric Adapters (EFA) to each EC2 instance to increase the network bandwidth\**** is also not a viable option as this is mainly done for performance improvement, and not for DDoS attack mitigation. Moreover, you can attach only one EFA per EC2 instance. An Elastic Fabric Adapter (EFA) is a network device that you can attach to your Amazon EC2 instance to accelerate High-Performance Computing (HPC) and machine learning applications.

    The following options are valid mitigation techniques that can be used to prevent DDoS:

    ***\*– Use an Amazon CloudFront service for distributing both static and dynamic content.\****

    ***\*– Use an Application Load Balancer with Auto Scaling groups for your EC2 instances. Prevent direct Internet traffic to your Amazon RDS database by deploying it to a new private subnet.\****

    ***\*– Use AWS Shield and AWS WAF.\****

     

    **References**:

    https://aws.amazon.com/answers/networking/aws-ddos-attack-mitigation/

    https://d0.awsstatic.com/whitepapers/DDoS_White_Paper_June2015.pdf

     

    **Best practices on DDoS Attack Mitigation:**

    

    <iframe src="https://www.youtube.com/embed/HnoZS5jj7pk" frameborder="0" allowfullscreen="allowfullscreen" name="fitvid0" style="box-sizing: border-box; margin: 0px; position: absolute; top: 0px; left: 0px; width: 1138px; height: 640.125px;"></iframe>

    

    

    

13. ##### 13. QUESTION

    A company is working with a government agency to improve traffic planning and maintenance of roadways to prevent accidents. The proposed solution is to manage the traffic infrastructure in real-time, alert traffic engineers and emergency response teams when problems are detected, and automatically change traffic signals to get emergency personnel to accident scenes faster by using sensors and smart devices.

    Which AWS service will allow the developers of the agency to connect the smart devices to the cloud-based applications?

    

    - AWS CloudFormation
    - AWS Elastic Beanstalk
    - AWS IoT Core
    - Amazon Elastic Container Service

    

    **Incorrect**

    

    **AWS IoT Core** is a managed cloud service that lets connected devices easily and securely interact with cloud applications and other devices. AWS IoT Core provides secure communication and data processing across different kinds of connected devices and locations so you can easily build IoT applications.

    ![img](https://d1.awsstatic.com/IoT/diagrams/AWS%20IoT%20Core%20-%20Process%20and%20Act.2b1f03813fbd3b4416e45c096336497f22954520.png)

    AWS IoT Core allows you to connect multiple devices to the cloud and to other devices without requiring you to deploy or manage any servers. You can also filter, transform, and act upon device data on the fly based on the rules you define. With AWS IoT Core, your applications can keep track of and communicate with all of your devices, all the time, even when they aren’t connected.

    Hence, the correct answer is: ***\*AWS IoT Core.\****

    ***\*AWS CloudFormation\**** is incorrect because this is mainly used for creating and managing the architecture and not for handling connected devices. You have to use AWS IoT Core instead.

    ***\*AWS Elastic Beanstalk\**** is incorrect because this is just an easy-to-use service for deploying and scaling web applications and services developed with Java, .NET, PHP, Node.js, Python, and other programming languages. Elastic Beanstalk can’t be used to connect smart devices to cloud-based applications.

    ***\*Amazon Elastic Container Service\**** is incorrect because this is mainly used for creating and managing docker instances and not for handling devices.

     

    **References:**

    https://aws.amazon.com/iot-core/

    https://aws.amazon.com/iot/

    

    

14. ##### 14. QUESTION

    A popular mobile game uses CloudFront, Lambda, and DynamoDB for its backend services. The player data is persisted on a DynamoDB table and the static assets are distributed by CloudFront. However, there are a lot of complaints that saving and retrieving player information is taking a lot of time.

    To improve the game’s performance, which AWS service can you use to reduce DynamoDB response times from milliseconds to microseconds?

    - ==Amazon DynamoDB Accelerator (DAX)==
- Amazon ElastiCache
    - AWS Device Farm
    - DynamoDB Auto Scaling
    
    **Incorrect**

    ==Amazon DynamoDB Accelerator (DAX) is a fully managed, highly available, in-memory cache that can reduce Amazon DynamoDB response times from milliseconds to microseconds, even at millions of requests per second.==

    ![img](https://d2908q01vomqb2.cloudfront.net/887309d048beef83ad3eabf2a79a64a389ab1c9f/2017/06/28/ReadThroughCache-1.png)

    ***\*Amazon ElastiCache\**** is incorrect because although you may use ElastiCache as your database cache, it will not reduce the DynamoDB response time from milliseconds to microseconds as compared with DynamoDB DAX.

    ***\*AWS Device Farm\**** is incorrect because this is an app testing service that lets you test and interact with your Android, iOS, and web apps on many devices at once, or reproduce issues on a device in real time.

    ***\*DynamoDB Auto Scaling\**** is incorrect because this is primarily used to automate capacity management for your tables and global secondary indexes.

    **References:**

    https://aws.amazon.com/dynamodb/dax

    https://aws.amazon.com/device-farm

    **Check out this Amazon DynamoDB Cheat Sheet:**

    https://tutorialsdojo.com/amazon-dynamodb/

15. ##### 15. QUESTION

    A company is using Amazon VPC that has a CIDR block of `10.31.0.0/27` that is connected to the on-premises data center. There was a requirement to create a Lambda function that will process massive amounts of cryptocurrency transactions every minute and then store the results to EFS. After setting up the serverless architecture and connecting the Lambda function to the VPC, the Solutions Architect noticed an increase in invocation errors with EC2 error types such as `EC2ThrottledException` at certain times of the day.

    Which of the following are the possible causes of this issue? (Select TWO.)

    

    - The attached IAM execution role of your function does not have the necessary permissions to access the resources of your VPC.
    - The associated security group of your function does not allow outbound connections.
    - Your VPC does not have sufficient subnet ENIs or subnet IPs.
    - Your VPC does not have a NAT gateway.
    - You only specified one subnet in your Lambda function configuration. That single subnet runs out of available IP addresses and there is no other subnet or Availability Zone which can handle the peak load.

    

    **Incorrect**

    

    You can configure a function to connect to a virtual private cloud (VPC) in your account. Use Amazon Virtual Private Cloud (Amazon VPC) to create a private network for resources such as databases, cache instances, or internal services. Connect your function to the VPC to access private resources during execution.

    AWS Lambda runs your function code securely within a VPC by default. However, to enable your Lambda function to access resources inside your private VPC, you must provide additional VPC-specific configuration information that includes VPC subnet IDs and security group IDs. AWS Lambda uses this information to set up elastic network interfaces (ENIs) that enable your function to connect securely to other resources within your private VPC.

    Lambda functions cannot connect directly to a VPC with dedicated instance tenancy. To connect to resources in a dedicated VPC, peer it to a second VPC with default tenancy.

    

    <iframe src="https://www.youtube.com/embed/JcRKdEP94jM" frameborder="0" allowfullscreen="allowfullscreen" name="fitvid1" style="box-sizing: border-box; margin: 0px; position: absolute; top: 0px; left: 0px; width: 1138px; height: 640.125px;"></iframe>

    Your Lambda function automatically scales based on the number of events it processes. If your Lambda function accesses a VPC, you must make sure that your VPC has sufficient ENI capacity to support the scale requirements of your Lambda function. It is also recommended that you specify at least one subnet in each Availability Zone in your Lambda function configuration.

    

    By specifying subnets in each of the Availability Zones, your Lambda function can run in another Availability Zone if one goes down or runs out of IP addresses. If your VPC does not have sufficient ENIs or subnet IPs, your Lambda function will not scale as requests increase, and you will see an increase in invocation errors with EC2 error types like `EC2ThrottledException`. For asynchronous invocation, if you see an increase in errors without corresponding CloudWatch Logs, invoke the Lambda function synchronously in the console to get the error responses.

    Hence, the correct answers for this scenario are:

    ***\*– You only specified one subnet in your Lambda function configuration. That single subnet runs out of available IP addresses and there is no other subnet or Availability Zone which can handle the peak load.\****

    ***\*– Your VPC does not have sufficient subnet ENIs or subnet IPs.\****

    ![img](https://udemy-images.s3.amazonaws.com/redactor/raw/2019-04-03_03-53-45-3550f2ecbfad29ea60f49fd5ea8d2809.gif)

    The option that says: ***\*Your VPC does not have a NAT gateway\**** is incorrect because an issue in the NAT Gateway is unlikely to cause a request throttling issue or produce an `EC2ThrottledException` error in Lambda. As per the scenario, the issue is happening only at certain times of the day, which means that the issue is only intermittent and the function works at other times. We can also conclude that an availability issue is not an issue since the application is already using a highly available NAT Gateway and not just a NAT instance.

    The option that says: ***\*The associated security group of your function does not allow outbound connections\**** is incorrect because if the associated security group does not allow outbound connections then the Lambda function will not work at all in the first place. Remember that as per the scenario, the issue only happens intermittently. In addition, Internet traffic restrictions do not usually produce `EC2ThrottledException` errors.

    The option that says: ***\*The attached IAM execution role of your function does not have the necessary permissions to access the resources of your VPC\**** is incorrect because just as what is explained above, the issue is intermittent and thus, the IAM execution role of the function does have the necessary permissions to access the resources of the VPC since it works at those specific times. In case the issue is indeed caused by a permission problem then an `EC2AccessDeniedException` the error would most likely be returned and not an `EC2ThrottledException` error.

     

    **References:**

    https://docs.aws.amazon.com/lambda/latest/dg/vpc.html

    https://aws.amazon.com/premiumsupport/knowledge-center/internet-access-lambda-function/

    https://aws.amazon.com/premiumsupport/knowledge-center/lambda-troubleshoot-invoke-error-502-500/

     

    **Check out this AWS Lambda Cheat Sheet:**

    https://tutorialsdojo.com/aws-lambda/

https://portal.tutorialsdojo.com/courses/free-aws-certified-solutions-architect-associate-practice-exams-sampler/lessons/free-practice-exam-timed-mode-4/quizzes/free-aws-certified-solutions-architect-associate-practice-exam-timed-mode/

