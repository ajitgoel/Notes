1. 

2. ##### 1. QUESTION

   A Solutions Architect is working for a company that uses Chef Configuration management in their data center. She needs to leverage their existing Chef recipes in AWS.

   Which of the following services should she use?

   

   - Amazon Simple Workflow Service
   - AWS Elastic Beanstalk
   - AWS CloudFormation
   - AWS OpsWorks

   

   **Correct**

   

   **AWS OpsWorks** is a configuration management service that provides managed instances of Chef and Puppet. Chef and Puppet are automation platforms that allow you to use code to automate the configurations of your servers. OpsWorks lets you use Chef and Puppet to automate how servers are configured, deployed, and managed across your Amazon EC2 instances or on-premises compute environments. OpsWorks has three offerings – AWS Opsworks for Chef Automate, AWS OpsWorks for Puppet Enterprise, and AWS OpsWorks Stacks.

   ![img](https://media.amazonwebservices.com/blog/2016/opsworks_chef_auto_welcome_1.png)

   ***\*Amazon Simple Workflow Service\**** is incorrect because AWS SWF is a fully-managed state tracker and task coordinator in the Cloud. It does not let you leverage Chef recipes.

   ***\*AWS Elastic Beanstalk\**** is incorrect because this handles an application’s deployment details of capacity provisioning, load balancing, auto-scaling, and application health monitoring. It does not let you leverage Chef recipes just like Amazon SWF.

   ***\*AWS CloudFormation\**** is incorrect because this is a service that lets you create a collection of related AWS resources and provision them in a predictable fashion using infrastructure as code. It does not let you leverage Chef recipes just like Amazon SWF and AWS Elastic Beanstalk.

    

   **Reference:** 

   https://aws.amazon.com/opsworks/

    

   **Check out this AWS OpsWorks Cheat Sheet:**

   https://tutorialsdojo.com/aws-opsworks/

    

   **Elastic Beanstalk vs  CloudFormation vs OpsWorks vs CodeDeploy:**

   https://tutorialsdojo.com/elastic-beanstalk-vs-cloudformation-vs-opsworks-vs-codedeploy/

    

   **Comparison of AWS Services Cheat Sheets:**

   https://tutorialsdojo.com/comparison-of-aws-services/

   

   

3. ##### 2. QUESTION

   A Solutions Architect needs to launch a web application that will be served globally using Amazon CloudFront. The application is hosted in an Amazon EC2 instance which will be configured as the origin server to process and serve dynamic content to its customers.

   Which of the following options provides high availability for the application?

   

   - Use Amazon S3 to serve the dynamic content of your web application and configure the S3 bucket to be part of an origin group.
   - Use Lambda@Edge to improve the performance of your web application and ensure high availability. Set the Lambda@Edge functions to be part of an origin group.
   - Launch an Auto Scaling group of EC2 instances and configure it to be part of an origin group.
   - Provision two EC2 instances deployed in different Availability Zones and configure them to be part of an origin group.

   

   **Correct**

   

   An origin is a location where content is stored, and from which CloudFront gets content to serve to viewers. **Amazon CloudFront** is a service that speeds up the distribution of your static and dynamic web content, such as .html, .css, .js, and image files, to your users. CloudFront delivers your content through a worldwide network of data centers called edge locations. When a user requests content that you’re serving with CloudFront, the user is routed to the edge location that provides the lowest latency (time delay), so that content is delivered with the best possible performance.

   ![img](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/images/origingroups-overview.png)

   You can also set up CloudFront with origin failover for scenarios that require high availability. An origin group may contain two origins: a primary and a secondary. If the primary origin is unavailable or returns specific HTTP response status codes that indicate a failure, CloudFront automatically switches to the secondary origin. To set up origin failover, you must have a distribution with at least two origins.

   The scenario uses an EC2 instance as an origin. Take note that we can also use an EC2 instance or a custom origin in configuring CloudFront. To achieve high availability in an EC2 instance, we need to deploy the instances in two or more Availability Zones. You also need to configure the instances to be part of the origin group to ensure that the application is highly available.

   Hence, the correct answer is: ***\*Provision two EC2 instances deployed in different Availability Zones and configure them to be part of an origin group.\****

   The option that says: ***\*Use Amazon S3 to serve the dynamic content of your web application and configure the S3 bucket to be part of an origin group\**** is incorrect because Amazon S3 can only serve static content. If you need to host dynamic content, you have to use an Amazon EC2 instance instead.

   The option that says: ***\*Launch an Auto Scaling group of EC2 instances and configure it to be part of an origin group\**** is incorrect because you must have at least two origins to set up an origin failover in CloudFront. In addition, you can’t directly use a single Auto Scaling group as an origin.

   The option that says: ***\*Use Lambda[@Edge](https://portal.tutorialsdojo.com/members/edge/) to improve the performance of your web application and ensure high availability. Set the Lambda[@Edge](https://portal.tutorialsdojo.com/members/edge/) functions to be part of an origin group\**** is incorrect because Lambda[@Edge](https://portal.tutorialsdojo.com/members/edge/) is primarily used for serverless edge computing. You can’t set Lambda[@Edge](https://portal.tutorialsdojo.com/members/edge/) functions as part of your origin group in CloudFront.

    

   **References:**

   https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/high_availability_origin_failover.html

   https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Introduction.html

   https://aws.amazon.com/cloudfront/faqs/

    

   **Check out this Amazon CloudFront Cheat Sheet:**

   https://tutorialsdojo.com/amazon-cloudfront/

   

   

4. ##### 3. QUESTION

   A disaster recovery team is planning to back up on-premises records to a local file server share through SMB protocol. To meet the company’s business continuity plan, the team must ensure that a copy of data from 48 hours ago is available for immediate access. Accessing older records with delay is tolerable.

   Which should the DR team implement to meet the objective with the LEAST amount of configuration effort?

   

   - Use an AWS Storage File gateway with enough storage to keep data from the last 48 hours. Send the backups to an SMB share mounted as a local disk.
   - Create an SMB file share in Amazon FSx for Windows File Server that has enough storage to store all backups. Access the file share from on-premises.
   - Mount an Amazon EFS file system on the on-premises client and copy all backups to an NFS share.
   - Create an AWS Backup plan to copy data backups to a local SMB share every 48 hours.

   

   **Correct**

   

   **Amazon S3 File Gateway** presents a file interface that enables you to store files as objects in Amazon S3 using the industry-standard NFS and SMB file protocols, and access those files via NFS and SMB from your data center or Amazon EC2, or access those files as objects directly in Amazon S3.

   ![img](https://d2908q01vomqb2.cloudfront.net/e1822db470e60d090affd0956d743cb0e7cdf113/2020/06/25/How-File-Gateway-handles-writes.png)

   When you deploy File Gateway, you specify how much disk space you want to allocate for local cache. This local cache acts as a buffer for writes and provides low latency access to data that was recently written to or read from Amazon S3. When a client writes data to a file via File Gateway, that data is first written to the local cache disk on the gateway itself. Once the data has been safely persisted to the local cache, only then does the File Gateway acknowledge the write back to the client. From there, File Gateway transfers the data to the S3 bucket asynchronously in the background, optimizing data transfer using multipart parallel uploads, and encrypting data in transit using HTTPS.

   In this scenario, you can deploy an AWS Storage File Gateway to the on-premises client. After activating the File Gateway, create an SMB share and mount it as a local disk at the on-premises end. Copy the backups to the SMB share. You must ensure that you size the File Gateway’s local cache appropriately to the backup data that needs immediate access. After the backup is done, you will be able to access the older data but with a delay. There will be a small delay since data (not in cache) needs to be retrieved from Amazon S3.

   Hence, the correct answer is: ***\*Use an AWS Storage File gateway with enough storage to keep data from the last 48 hours. Send the backups to an SMB share mounted as a local disk.\****

   The option that says: ***\*Create an SMB file share in Amazon FSx for Windows File Server that has enough storage to store all backups. Access the file share from on-premises\**** is incorrect because this requires additional setup. You need to set up a Direct Connect or VPN connection from on-premises to AWS first in order for this to work.

   The option that says: ***\*Mount an Amazon EFS file system on the on-premises client and copy all backups to an NFS share\**** is incorrect because the file share required in the scenario needs to be using the SMB protocol.

   The option that says: ***\*Create an AWS Backup plan to copy data backups to a local SMB share every 48 hours\**** is incorrect. AWS Backup only works on AWS resources.

    

   **References:**

   https://aws.amazon.com/blogs/storage/easily-store-your-sql-server-backups-in-amazon-s3-using-file-gateway/

   https://aws.amazon.com/storagegateway/faqs/

    

   ***\*AWS Storage Gateway Overview:\****

   

   <iframe title="YouTube video player" src="https://www.youtube.com/embed/pNb7xOBJjHE" frameborder="0" allowfullscreen="allowfullscreen" data-mce-fragment="1" name="fitvid0" style="box-sizing: border-box; margin: 0px; position: absolute; top: 0px; left: 0px; width: 853.75px; height: 480.234px;"></iframe>

   

   **Check out this AWS Storage Gateway Cheat Sheet:**

   https://tutorialsdojo.com/aws-storage-gateway/

   

   

5. ##### 4. QUESTION

   A Solutions Architect is developing a three-tier cryptocurrency web application for a FinTech startup. The Architect has been instructed to restrict access to the database tier to only accept traffic from the application-tier and deny traffic from other sources. The application-tier is composed of application servers hosted in an Auto Scaling group of EC2 instances.

   Which of the following options is the MOST suitable solution to implement in this scenario?

   

   - Set up the Network ACL of the database subnet to deny all inbound non-database traffic from the subnet of the application-tier.
   - Set up the security group of the database tier to allow database traffic from the security group of the application servers.
   - Set up the security group of the database tier to allow database traffic from a specified list of application server IP addresses.
   - Set up the Network ACL of the database subnet to allow inbound database traffic from the subnet of the application-tier.

   

   **Correct**

   

   A **security group** acts as a virtual firewall for your instance to control inbound and outbound traffic. When you launch an instance in a VPC, you can assign up to five security groups to the instance. Security groups act at the instance level, not the subnet level. Therefore, each instance in a subnet in your VPC could be assigned to a different set of security groups. If you don’t specify a particular group at launch time, the instance is automatically assigned to the default security group for the VPC.

   ![img](https://docs.aws.amazon.com/vpc/latest/userguide/images/security-diagram.png)

   For each security group, you add *rules* that control the inbound traffic to instances, and a separate set of rules that control the outbound traffic. This section describes the basic things you need to know about security groups for your VPC and their rules.

   You can add or remove rules for a security group which is also referred to as *authorizing* or *revoking* inbound or outbound access. A rule applies either to inbound traffic (ingress) or outbound traffic (egress). You can grant access to a specific CIDR range, or to another security group in your VPC or in a peer VPC (requires a VPC peering connection).

   In the scenario, the servers of the application-tier are in an Auto Scaling group which means that the number of EC2 instances could grow or shrink over time. An Auto Scaling group could also cover one or more Availability Zones (AZ) which have their own subnets. Hence, the most suitable solution would be to ***\*set up the security group of the database tier to allow database traffic from the security group of the application servers\**** since you can utilize the security group of the application-tier Auto Scaling group as the source for the security group rule in your database tier.

   ***\*Setting up the security group of the database tier to allow database traffic from a specified list of application server IP addresses\**** is incorrect because the list of application server IP addresses will change over time since an Auto Scaling group can add or remove EC2 instances based on the configured scaling policy. This will create inconsistencies in your application because the newly launched instances, which are not included in the initial list of IP addresses, will not be able to access the database.

   ***\*Setting up the Network ACL of the database subnet to deny all inbound non-database traffic from the subnet of the application-tier\**** is incorrect because doing this could affect the other EC2 instances of other applications, which are also hosted in the same subnet of the application-tier. For example, a large subnet with a CIDR block of /16 could be shared by several applications. Denying all inbound non-database traffic from the entire subnet will impact other applications which use this subnet.

   ***\*Setting up the Network ACL of the database subnet to allow inbound database traffic from the subnet of the application-tier\**** is incorrect because although this solution can work, the subnet of the application-tier could be shared by another tier or another set of EC2 instances other than the application-tier. This means that you would inadvertently be granting database access to unauthorized servers hosted in the same subnet other than the application-tier.

    

   **References:**

   https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Security.html#VPC_Security_Comparison

   http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html

    

   **Check out this Amazon VPC Cheat Sheet:**

   https://tutorialsdojo.com/amazon-vpc/

   

   

6. ##### 5. QUESTION

   A company is building a transcription service in which a fleet of EC2 worker instances processes an uploaded audio file and generates a text file as an output. They must store both of these frequently accessed files in the same durable storage until the text file is retrieved by the uploader. Due to an expected surge in demand, they have to ensure that the storage is scalable and can be retrieved within minutes.

   Which storage option in AWS can they use in this situation, which is both cost-efficient and scalable?

   

   - Multiple Amazon EBS volume with snapshots
   - Amazon S3 Glacier Deep Archive
   - Multiple instance stores
   - A single Amazon S3 bucket

   

   **Correct**

   

   **Amazon Simple Storage Service (Amazon S3)** is an object storage service that offers industry-leading scalability, data availability, security, and performance. It provides easy-to-use management features so you can organize your data and configure finely-tuned access controls to meet your specific business, organizational, and compliance requirements. Amazon S3 is designed for 99.999999999% (11 9’s) of durability, and stores data for millions of applications for companies all around the world.

   ![img](https://d1.awsstatic.com/product-marketing/S3/How_it_works_diagram_Amazon_S3_Intelligent_Tiering.661d3eed1ef6d91ef168e55c3e697d8686d0c93e.png)

   In this scenario, the requirement is to have cost-efficient and scalable storage. Among the given options, the best option is to use Amazon S3. It’s a simple storage service that offers a highly-scalable, reliable, and low-latency data storage infrastructure at very low costs.

   Hence, the correct answer is: ***\*A single Amazon S3 bucket.\****

   The option that says: ***\*Multiple Amazon EBS volume with snapshots\**** is incorrect because Amazon S3 is more cost-efficient than EBS volumes.

   The option that says: ***\*Multiple instance stores\**** is incorrect. Just like the option above, you must use Amazon S3 since it is scalable and cost-efficient than instance store volumes.

   The option that says: ***\*Amazon S3 Glacier Deep Archive\**** is incorrect because this is mainly used for data archives with data retrieval times that can take more than 12 hours. Hence, it is not suitable for the transcription service where the data are stored and frequently accessed.

    

   **References:**

   https://aws.amazon.com/s3/pricing/

   https://docs.aws.amazon.com/AmazonS3/latest/gsg/GetStartedWithS3.html

    

   **Check out this Amazon S3 Cheat Sheet:**

   https://tutorialsdojo.com/amazon-s3/

   

   

7. ##### 6. QUESTION

   A company launched an EC2 instance in the newly created VPC. They noticed that the generated instance does not have an associated DNS hostname.

   Which of the following options could be a valid reason for this issue?

   

   - The DNS resolution and DNS hostname of the VPC configuration should be enabled.
   - The security group of the EC2 instance needs to be modified.
   - Amazon Route 53 is not enabled.
   - The newly created VPC has an invalid CIDR block.

   

   **Correct**

   

   When you launch an EC2 instance into a default VPC, AWS provides it with public and private DNS hostnames that correspond to the public IPv4 and private IPv4 addresses for the instance.

   ![img](https://dmhnzl5mp9mj6.cloudfront.net/security_awsblog/images/DrewDennis_DNSresolutionDNShostnames.png)

   However, when you launch an instance into a non-default VPC, AWS provides the instance with a private DNS hostname only. New instances will only be provided with public DNS hostname depending on these two DNS attributes: the **DNS resolution** and **DNS hostnames**, that you have specified for your VPC, and if your instance has a public IPv4 address.

   In this case, the new EC2 instance does not automatically get a DNS hostname because the **DNS resolution** and **DNS hostnames** attributes are disabled in the newly created VPC.

   Hence, the correct answer is: ***\*The DNS resolution and DNS hostname of the VPC configuration should be enabled.\****

   The option that says: ***\*The newly created VPC has an invalid CIDR block\**** is incorrect since it’s very unlikely that a VPC has an invalid CIDR block because of AWS validation schemes.

   The option that says: ***\*Amazon Route 53 is not enabled\**** is incorrect since Route 53 does not need to be enabled. Route 53 is the DNS service of AWS, but the VPC is the one that enables assigning of instance hostnames.

   The option that says: ***\*The security group of the EC2 instance needs to be modified\**** is incorrect since security groups are just firewalls for your instances. They filter traffic based on a set of security group rules.

    

   **References:**

   https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-dns.html

   https://aws.amazon.com/vpc/

    

   ***\*Amazon VPC Overview:\****

   

   <iframe title="YouTube video player" src="https://www.youtube.com/embed/oIDHKeNxvQQ" frameborder="0" allowfullscreen="allowfullscreen" name="fitvid1" style="box-sizing: border-box; margin: 0px; position: absolute; top: 0px; left: 0px; width: 853.75px; height: 480.234px;"></iframe>

   

   **Check out this Amazon VPC Cheat Sheet:**

   https://tutorialsdojo.com/amazon-vpc/

   

   

8. ##### 7. QUESTION

   A company needs to implement a solution that will process real-time streaming data of its users across the globe. This will enable them to track and analyze globally-distributed user activity on their website and mobile applications, including clickstream analysis. The solution should process the data in close geographical proximity to their users and respond to user requests at low latencies.

   Which of the following is the most suitable solution for this scenario?

   

   - Integrate CloudFront with Lambda@Edge in order to process the data in close geographical proximity to users and respond to user requests at low latencies. Process real-time streaming data using Kinesis and durably store the results to an Amazon S3 bucket.
   - Use a CloudFront web distribution and Route 53 with a Geoproximity routing policy in order to process the data in close geographical proximity to users and respond to user requests at low latencies. Process real-time streaming data using Kinesis and durably store the results to an Amazon S3 bucket.
   - Integrate CloudFront with Lambda@Edge in order to process the data in close geographical proximity to users and respond to user requests at low latencies. Process real-time streaming data using Amazon Athena and durably store the results to an Amazon S3 bucket.
   - Use a CloudFront web distribution and Route 53 with a latency-based routing policy, in order to process the data in close geographical proximity to users and respond to user requests at low latencies. Process real-time streaming data using Kinesis and durably store the results to an Amazon S3 bucket.

   

   **Correct**

   

   Lambda[@Edge](https://portal.tutorialsdojo.com/members/edge/) is a feature of Amazon CloudFront that lets you run code closer to users of your application, which improves performance and reduces latency. With Lambda[@Edge](https://portal.tutorialsdojo.com/members/edge/), you don’t have to provision or manage infrastructure in multiple locations around the world. You pay only for the compute time you consume – there is no charge when your code is not running.

   With Lambda[@Edge](https://portal.tutorialsdojo.com/members/edge/), you can enrich your web applications by making them globally distributed and improving their performance — all with zero server administration. Lambda[@Edge](https://portal.tutorialsdojo.com/members/edge/) runs your code in response to events generated by the Amazon CloudFront content delivery network (CDN). Just upload your code to AWS Lambda, which takes care of everything required to run and scale your code with high availability at an AWS location closest to your end user.

   ![img](https://d1.awsstatic.com/products/cloudfront/AWS-Lambda-at-Edge_User-Tracking-Analytics-diagram%20Oct%202018.5cc920f99c9450467b7290c20a8a4eb7c444e915.png)

   By using Lambda[@Edge](https://portal.tutorialsdojo.com/members/edge/) and Kinesis together, you can process real-time streaming data so that you can track and analyze globally-distributed user activity on your website and mobile applications, including clickstream analysis. Hence, the correct answer in this scenario is the option that says: ***\*Integrate CloudFront with Lambda[@Edge](https://portal.tutorialsdojo.com/members/edge/) in order to process the data in close geographical proximity to users and respond to user requests at low latencies. Process real-time streaming data using Kinesis and durably store the results to an Amazon S3 bucket.\****

   The options that say: ***\*Use a CloudFront web distribution and Route 53 with a latency-based routing policy, in order to process the data in close geographical proximity to users and respond to user requests at low latencies. Process real-time streaming data using Kinesis and durably store the results to an Amazon S3 bucket\**** and ***\*Use a CloudFront web distribution and Route 53 with a Geoproximity routing policy in order to process the data in close geographical proximity to users and respond to user requests at low latencies. Process real-time streaming data using Kinesis and durably store the results to an Amazon S3 bucket\**** are both incorrect because you can only route traffic using Route 53 since it does not have any computing capability. This solution would not be able to process and return the data in close geographical proximity to your users since it is not using Lambda[@Edge](https://portal.tutorialsdojo.com/members/edge/).

   The option that says: ***\*Integrate CloudFront with Lambda[@Edge](https://portal.tutorialsdojo.com/members/edge/) in order to process the data in close geographical proximity to users and respond to user requests at low latencies. Process real-time streaming data using Amazon Athena and durably store the results to an Amazon S3 bucket\**** is incorrect because although using Lambda[@Edge](https://portal.tutorialsdojo.com/members/edge/) is correct, Amazon Athena is just an interactive query service that enables you to easily analyze data in Amazon S3 using standard SQL. Kinesis should be used to process the streaming data in real-time.

    

   **References:**

   **https://aws.amazon.com/lambda/edge/**

   **https://aws.amazon.com/blogs/networking-and-content-delivery/global-data-ingestion-with-amazon-cloudfront-and-lambdaedge/**

   

   

9. ##### 8. QUESTION

   A company needs to use Amazon Aurora as the Amazon RDS database engine of their web application. The Solutions Architect has been instructed to implement a 90-day backup retention policy.

   Which of the following options can satisfy the given requirement?

   

   - Configure RDS to export the automated snapshot automatically to Amazon S3 and create a lifecycle policy to delete the object after 90 days.
   - Create a daily scheduled event using CloudWatch Events and AWS Lambda to directly download the RDS automated snapshot to an S3 bucket. Archive snapshots older than 90 days to Glacier.
   - Create an AWS Backup plan to take daily snapshots with a retention period of 90 days.
   - Configure an automated backup and set the backup retention period to 90 days.

   

   **Correct**

   

   **AWS Backup** is a centralized backup service that makes it easy and cost-effective for you to backup your application data across AWS services in the AWS Cloud, helping you meet your business and regulatory backup compliance requirements. AWS Backup makes protecting your AWS storage volumes, databases, and file systems simple by providing a central place where you can configure and audit the AWS resources you want to backup, automate backup scheduling, set retention policies, and monitor all recent backup and restore activity.

   ![img](https://d1.awsstatic.com/diagrams/fsx/product-page-diagram_cryo_how-it-works@1.5x.21bcc0935a82ac4531d02a4feddf51d6bfbd6080.png)

   In this scenario, you can use AWS Backup to create a backup plan with a retention period of 90 days. A backup plan is a policy expression that defines when and how you want to back up your AWS resources. You assign resources to backup plans, and AWS Backup then automatically backs up and retains backups for those resources according to the backup plan.

   Hence, the correct answer is: ***\*Create an AWS Backup plan to take daily snapshots with a retention period of 90 days.\****

   The option that says: ***\*Configure an automated backup and set the backup retention period to 90 days\**** is incorrect because the maximum backup retention period for automated backup is only 35 days.

   The option that says: ***\*Configure RDS to export the automated snapshot automatically to Amazon S3 and create a lifecycle policy to delete the object after 90 days\**** is incorrect because you can’t export an automated snapshot automatically to Amazon S3. You must export the snapshot manually.

   The option that says: ***\*Create a daily scheduled event using CloudWatch Events and AWS Lambda to directly download the RDS automated snapshot to an S3 bucket. Archive snapshots older than 90 days to Glacier\**** is incorrect because you cannot directly download or export an automated snapshot in RDS to Amazon S3. You have to copy the automated snapshot first for it to become a manual snapshot, which you can move to an Amazon S3 bucket. A better solution for this scenario is to simply use AWS Backup.

    

   **References:**

   https://docs.aws.amazon.com/aws-backup/latest/devguide/create-a-scheduled-backup.html

   https://aws.amazon.com/backup/faqs/

    

   **Check out these AWS Cheat Sheets:**

   [https://tutorialsdojo.com/links-to-all-aws-cheat-sheets/](https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/)

   

   

10. ##### 9. QUESTION

    A large Philippine-based Business Process Outsourcing company is building a two-tier web application in their VPC to serve dynamic transaction-based content. The data tier is leveraging an Online Transactional Processing (OLTP) database but for the web tier, they are still deciding what service they will use.

    What AWS services should you leverage to build an elastic and scalable web tier?

    

    - Elastic Load Balancing, Amazon EC2, and Auto Scaling
    - Elastic Load Balancing, Amazon RDS with Multi-AZ, and Amazon S3
    - Amazon RDS with Multi-AZ and Auto Scaling
    - Amazon EC2, Amazon DynamoDB, and Amazon S3

    

    **Correct**

    

    **Amazon RDS** is a suitable database service for online transaction processing (OLTP) applications. However, the question asks for a list of AWS services for the web tier and not the database tier. Also, when it comes to services providing scalability and elasticity for your web tier, you should always consider using Auto Scaling and Elastic Load Balancer.

    ![img](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/images/tutorial_as_elb_architecture.png)

    To build an elastic and a highly-available web tier, you can use Amazon EC2, Auto Scaling, and Elastic Load Balancing. You can deploy your web servers on a fleet of EC2 instances to an Auto Scaling group, which will automatically monitor your applications and automatically adjust capacity to maintain steady, predictable performance at the lowest possible cost. Load balancing is an effective way to increase the availability of a system. Instances that fail can be replaced seamlessly behind the load balancer while other instances continue to operate. Elastic Load Balancing can be used to balance across instances in multiple availability zones of a region.

    The rest of the options are all incorrect since they don’t mention all of the required services in building a highly available and scalable web tier, such as EC2, Auto Scaling, and Elastic Load Balancer. Although Amazon RDS with Multi-AZ and DynamoDB are highly scalable databases, the scenario is more focused on building its web tier and not the database tier.

    Hence, the correct answer is ***\*Elastic Load Balancing, Amazon EC2, and Auto Scaling.\**** 

    The option that says: ***\*Elastic Load Balancing, Amazon RDS with Multi-AZ, and Amazon S3\**** is incorrect because you can’t host your web tier using Amazon S3 since the application is doing a dynamic transactions. Amazon S3 is only suitable if you plan to have a static website.

    The option that says: ***\*Amazon RDS with Multi-AZ and Auto Scaling\**** is incorrect because the focus of the question is building a scalable web tier. You need a service, like EC2, in which you can run your web tier.

    The option that says: ***\*Amazon EC2, Amazon DynamoDB, and Amazon S3\**** is incorrect because you need Auto Scaling and ELB in order to scale the web tier.

     

    **References:**

    https://media.amazonwebservices.com/AWS_Building_Fault_Tolerant_Applications.pdf

    https://d1.awsstatic.com/whitepapers/aws-building-fault-tolerant-applications.pdf

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-increase-availability.html

    

    

11. ##### 10. QUESTION

    A company has multiple VPCs with IPv6 enabled for its suite of web applications. The Solutions Architect tried to deploy a new Amazon EC2 instance but she received an error saying that there is no IP address available on the subnet.

    How should the Solutions Architect resolve this problem?

    

    - Set up a new IPv6-only subnet with a large CIDR range. Associate the new subnet with the VPC then launch the instance.
    - Disable the IPv4 support in the VPC and use the available IPv6 addresses.
    - Ensure that the VPC has IPv6 CIDRs only. Remove any IPv4 CIDRs associated with the VPC.
    - Set up a new IPv4 subnet with a larger CIDR range. Associate the new subnet with the VPC and then launch the instance.

    

    **Incorrect**

    

    **Amazon Virtual Private Cloud (VPC)** is a service that lets you launch AWS resources in a logically isolated virtual network that you define. You have complete control over your virtual networking environment, including selection of your own IP address range, creation of subnets, and configuration of route tables and network gateways. You can use both IPv4 and IPv6 for most resources in your virtual private cloud, helping to ensure secure and easy access to resources and applications.

    A subnet is a range of IP addresses in your VPC. You can launch AWS resources into a specified subnet. When you create a VPC, you must specify a range of IPv4 addresses for the VPC in the form of a CIDR block. Each subnet must reside entirely within one Availability Zone and cannot span zones. You can also optionally assign an IPv6 CIDR block to your VPC, and assign IPv6 CIDR blocks to your subnets.

    ![img](http://media.tutorialsdojo.com/Amazon_VPC_IPv6.png)

    If you have an existing VPC that supports IPv4 only and resources in your subnet that are configured to use IPv4 only, you can enable IPv6 support for your VPC and resources. Your VPC can operate in dual-stack mode — your resources can communicate over IPv4, or IPv6, or both. IPv4 and IPv6 communication are independent of each other. You cannot disable IPv4 support for your VPC and subnets since this is the default IP addressing system for Amazon VPC and Amazon EC2.

    By default, a new EC2 instance uses an IPv4 addressing protocol. To fix the problem in the scenario, you need to create a new IPv4 subnet and deploy the EC2 instance in the new subnet.

    Hence, the correct answer is: ***\*Set up a new IPv4 subnet with a larger CIDR range. Associate the new subnet with the VPC and then launch the instance.\****

    The option that says: ***\*Set up a new IPv6-only subnet with a large CIDR range. Associate the new subnet with the VPC then launch the instance\**** is incorrect because you need to add IPv4 subnet first before you can create an IPv6 subnet.

    The option that says: ***\*Ensure that the VPC has IPv6 CIDRs only. Remove any IPv4 CIDRs associated with the VPC\**** is incorrect because you can’t have a VPC with IPv6 CIDRs only. The default IP addressing system in VPC is IPv4. You can only change your VPC to dual-stack mode where your resources can communicate over IPv4, or IPv6, or both, but not exclusively with IPv6 only.

    The option that says: ***\*Disable the IPv4 support in the VPC and use the available IPv6 addresses\**** is incorrect because you cannot disable the IPv4 support for your VPC and subnets since this is the default IP addressing system.

     

    **References:**

    https://docs.aws.amazon.com/vpc/latest/userguide/vpc-migrate-ipv6.html

    https://docs.aws.amazon.com/vpc/latest/userguide/vpc-ip-addressing.html

    https://aws.amazon.com/vpc/faqs/

     

    **Check out this Amazon VPC Cheat Sheet:**

    https://tutorialsdojo.com/amazon-vpc/

    

    

12. ##### 11. QUESTION

    An organization needs to provision a new Amazon EC2 instance with a persistent block storage volume to migrate data from its on-premises network to AWS. The required maximum performance for the storage volume is 64,000 IOPS.

    In this scenario, which of the following can be used to fulfill this requirement?

    

    - Launch an Amazon EFS file system and mount it to a Nitro-based Amazon EC2 instance and set the performance mode to Max I/O.
    - Launch a Nitro-based EC2 instance and attach a Provisioned IOPS SSD EBS volume (io1) with 64,000 IOPS.
    - Directly attach multiple Instance Store volumes in an EC2 instance to deliver maximum IOPS performance.
    - Launch any type of Amazon EC2 instance and attach a Provisioned IOPS SSD EBS volume (io1) with 64,000 IOPS.

    

    **Correct**

    

    An **Amazon EBS volume** is a durable, block-level storage device that you can attach to your instances. After you attach a volume to an instance, you can use it as you would use a physical hard drive. EBS volumes are flexible.

    The **AWS Nitro System** is the underlying platform for the latest generation of EC2 instances that enables AWS to innovate faster, further reduce the cost of the customers, and deliver added benefits like increased security and new instance types.

    ![img](https://portal.tutorialsdojo.com/wp-content/uploads/2020/09/aws-ebs-nitro.png)

    Amazon EBS is a persistent block storage volume. It can persist independently from the life of an instance. Since the scenario requires you to have an EBS volume with up to 64,000 IOPS, you have to launch a Nitro-based EC2 instance.

    Hence, the correct answer in this scenario is: ***\*Launch a Nitro-based EC2 instance and attach a Provisioned IOPS SSD EBS volume (io1) with 64,000 IOPS.\****

    The option that says: ***\*Directly attach multiple Instance Store volumes in an EC2 instance to deliver maximum IOPS performance\**** is incorrect. Although an Instance Store is a block storage volume, it is not persistent and the data will be gone if the instance is restarted from the stopped state (*note that this is different from the OS-level reboot. In OS-level reboot, data still persists in the instance store*). **An instance store only provides temporary block-level storage for your instance. It means that the data in the instance store can be lost if the underlying disk drive fails, if the instance stops, and if the instance terminates.**

    The option that says: ***\*Launch an Amazon EFS file system and mount it to a Nitro-based Amazon EC2 instance and set the performance mode to Max I/O\**** is incorrect. Although Amazon EFS can provide over 64,000 IOPS, this solution uses a file system and not a block storage volume which is what is asked in the scenario.

    The option that says: ***\*Launch an EC2 instance and attach an io1 EBS volume with 64,000 IOPS\**** is incorrect. In order to achieve the 64,000 IOPS for a provisioned IOPS SSD, you must provision a Nitro-based EC2 instance. The maximum IOPS and throughput are guaranteed only on Instances built on the Nitro System provisioned with more than 32,000 IOPS. Other instances guarantee up to 32,000 IOPS only.

     

    **References:**

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html#EBSVolumeTypes_piops

    https://aws.amazon.com/s3/storage-classes/

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html

     

    **Check out this Amazon EBS Cheat Sheet:**

    https://tutorialsdojo.com/amazon-ebs/

     

    **Amazon S3 vs EFS vs EBS Cheat Sheet:**

    https://tutorialsdojo.com/amazon-s3-vs-ebs-vs-efs/

    

    

13. ##### 12. QUESTION

    An application is using a RESTful API hosted in AWS which uses Amazon API Gateway and AWS Lambda. There is a requirement to trace and analyze user requests as they travel through your Amazon API Gateway APIs to the underlying services.

    Which of the following is the most suitable service to use to meet this requirement?

    

    - CloudTrail
    - CloudWatch
    - AWS X-Ray
    - VPC Flow Logs

    

    **Correct**

    

    You can use [AWS X-Ray](https://docs.aws.amazon.com/xray/latest/devguide/xray-services-apigateway.html) to trace and analyze user requests as they travel through your Amazon API Gateway APIs to the underlying services. API Gateway supports AWS X-Ray tracing for all API Gateway endpoint types: regional, edge-optimized, and private. You can use AWS X-Ray with Amazon API Gateway in all regions where X-Ray is available.

    X-Ray gives you an end-to-end view of an entire request, so you can analyze latencies in your APIs and their backend services. You can use an X-Ray service map to view the latency of an entire request and that of the downstream services that are integrated with X-Ray. And you can configure sampling rules to tell X-Ray which requests to record, at what sampling rates, according to criteria that you specify. If you call an API Gateway API from a service that’s already being traced, API Gateway passes the trace through, even if X-Ray tracing is not enabled on the API.

    You can enable X-Ray for an API stage by using the API Gateway management console, or by using the API Gateway API or CLI.

     

    ![img](https://docs.aws.amazon.com/apigateway/latest/developerguide/images/apigateway-xray-traceview-1.png)

     

    ***\*VPC Flow Logs\**** is incorrect because this is a feature that enables you to capture information about the IP traffic going to and from network interfaces in your entire VPC. Although it can capture some details about the incoming user requests, it is still better to use AWS X-Ray as it provides a better way to debug and analyze your microservices applications with request tracing so you can find the root cause of your issues and performance.

    ***\*CloudWatch\**** is incorrect because this is a monitoring and management service. It does not have the capability to trace and analyze user requests as they travel through your Amazon API Gateway APIs.

    ***\*CloudTrail\**** is incorrect because this is primarily used for IT audits and API logging of all of your AWS resources. It does not have the capability to trace and analyze user requests as they travel through your Amazon API Gateway APIs, unlike AWS X-Ray.

     

    **Reference:**

    https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-xray.html

     

    **Check out this AWS X-Ray Cheat Sheet:**

    https://tutorialsdojo.com/aws-x-ray/

     

    **Instrumenting your Application with AWS X-Ray:**

    https://tutorialsdojo.com/aws-cheat-sheet-instrumenting-your-application-with-aws-x-ray/

    

    

14. ##### 13. QUESTION

    A tech company that you are working for has undertaken a Total Cost Of Ownership (TCO) analysis evaluating the use of Amazon S3 versus acquiring more storage hardware. The result was that all 1200 employees would be granted access to use Amazon S3 for storage of their personal documents.

    Which of the following will you need to consider so you can set up a solution that incorporates single sign-on feature from your corporate AD or LDAP directory and also restricts access for each individual user to a designated user folder in an S3 bucket? (Select TWO.)

    

    - Configure an IAM role and an IAM Policy to access the bucket.
    - Map each individual user to a designated user folder in S3 using Amazon WorkDocs to access their personal documents.
    - Set up a Federation proxy or an Identity provider, and use AWS Security Token Service to generate temporary tokens.
    - Use 3rd party Single Sign-On solutions such as Atlassian Crowd, OKTA, OneLogin and many others.
    - Set up a matching IAM user for each of the 1200 users in your corporate directory that needs access to a folder in the S3 bucket.

    

    **Correct**

    

    The question refers to one of the common scenarios for temporary credentials in AWS. Temporary credentials are useful in scenarios that involve identity federation, delegation, cross-account access, and IAM roles. In this example, it is called **enterprise identity federation** considering that you also need to set up a single sign-on (SSO) capability.

    The correct answers are:

    ***\*– Setup a Federation proxy or an Identity provider\****

    ***\*– Setup an AWS Security Token Service to generate temporary tokens\**** 

    ***\*– Configure an IAM role and an IAM Policy to access the bucket.\**** 

    ![img](https://docs.aws.amazon.com/IAM/latest/UserGuide/images/saml-based-federation.diagram.png)In an enterprise identity federation, you can authenticate users in your organization’s network, and then provide those users access to AWS without creating new AWS identities for them and requiring them to sign in with a separate user name and password. This is known as the *single sign-on* (SSO) approach to temporary access. AWS STS supports open standards like Security Assertion Markup Language (SAML) 2.0, with which you can use Microsoft AD FS to leverage your Microsoft Active Directory. You can also use SAML 2.0 to manage your own solution for federating user identities.

    ***\*Using 3rd party Single Sign-On solutions such as Atlassian Crowd, OKTA, OneLogin and many others\**** is incorrect since you don’t have to use 3rd party solutions to provide the access. AWS already provides the necessary tools that you can use in this situation.

    ***\*Mapping each individual user to a designated user folder in S3 using Amazon WorkDocs to access their personal documents\**** is incorrect as there is no direct way of integrating Amazon S3 with Amazon WorkDocs for this particular scenario. Amazon WorkDocs is simply a fully managed, secure content creation, storage, and collaboration service. With Amazon WorkDocs, you can easily create, edit, and share content. And because it’s stored centrally on AWS, you can access it from anywhere on any device.

    ***\*Setting up a matching IAM user for each of the 1200 users in your corporate directory that needs access to a folder in the S3 bucket\**** is incorrect since creating that many IAM users would be unnecessary. Also, you want the account to integrate with your AD or LDAP directory, hence, IAM Users does not fit these criteria.

     

    **References:**

    https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html

    https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html

    https://aws.amazon.com/blogs/security/writing-iam-policies-grant-access-to-user-specific-folders-in-an-amazon-s3-bucket/

     

    **Check out this AWS IAM Cheat Sheet:**

    https://tutorialsdojo.com/aws-identity-and-access-management-iam/

    

    

15. ##### 14. QUESTION

    A customer is transitioning their ActiveMQ messaging broker service onto the AWS cloud in which they require an alternative asynchronous service that supports NMS and MQTT messaging protocol. The customer does not have the time and resources needed to recreate their messaging service in the cloud. The service has to be highly available and should require almost no management overhead.

    Which of the following is the most suitable service to use to meet the above requirement?

    

    - Amazon MQ
    - AWS Step Functions
    - Amazon SQS
    - Amazon SNS

    

    **Correct**

    

    ***\*Amazon MQ\**** is a managed message broker service for Apache ActiveMQ that makes it easy to set up and operate message brokers in the cloud. Connecting your current applications to Amazon MQ is easy because it uses industry-standard APIs and protocols for messaging, including JMS, NMS, AMQP, STOMP, MQTT, and WebSocket. Using standards means that in most cases, there’s no need to rewrite any messaging code when you migrate to AWS.

    Amazon MQ, Amazon SQS, and Amazon SNS are messaging services that are suitable for anyone from startups to enterprises. If you’re using messaging with existing applications and want to move your messaging service to the cloud quickly and easily, it is recommended that you consider Amazon MQ. It supports industry-standard APIs and protocols so you can switch from any standards-based message broker to Amazon MQ without rewriting the messaging code in your applications.

    ![img](https://d2908q01vomqb2.cloudfront.net/1b6453892473a467d07372d45eb05abc2031647a/2018/01/30/reference_diagram_resized.png)

    If you are building brand new applications in the cloud, then it is highly recommended that you consider Amazon SQS and Amazon SNS. Amazon SQS and SNS are lightweight, fully managed message queue and topic services that scale almost infinitely and provide simple, easy-to-use APIs. You can use Amazon SQS and SNS to decouple and scale microservices, distributed systems, and serverless applications, and improve reliability.

    Hence, ***\*Amazon MQ\**** is the correct answer.

    ***\*Amazon SNS\**** is incorrect because this is more suitable as a pub/sub messaging service instead of a message broker service.

    ***\*Amazon SQS\**** is incorrect. Although this is a fully managed message queuing service, it does not support an extensive list of industry-standard messaging APIs and protocol, unlike Amazon MQ. Moreover, using Amazon SQS requires you to do additional changes in the messaging code of applications to make it compatible.

    ***\*AWS Step Functions\**** is incorrect because this is a serverless function orchestrator and not a messaging service, unlike Amazon MQ, AmazonSQS, and Amazon SNS.

     

    **References:**

    https://aws.amazon.com/amazon-mq/

    https://aws.amazon.com/messaging/

    https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/welcome.html#sqs-difference-from-amazon-mq-sns

     

    **Check out this Amazon MQ Cheat Sheet:**

    https://tutorialsdojo.com/amazon-mq/

    

    

16. ##### 15. QUESTION

    A company has an On-Demand EC2 instance with an attached EBS volume. There is a scheduled job that creates a snapshot of this EBS volume every midnight at 12 AM when the instance is not used. One night, there has been a production incident where you need to perform a change on both the instance and on the EBS volume at the same time when the snapshot is currently taking place.

    Which of the following scenario is true when it comes to the usage of an EBS volume while the snapshot is in progress?

    

    - The EBS volume cannot be used until the snapshot completes.
    - The EBS volume cannot be detached or attached to an EC2 instance until the snapshot completes
    - The EBS volume can be used while the snapshot is in progress.
    - The EBS volume can be used in read-only mode while the snapshot is in progress.

    

    **Correct**

    

    Snapshots occur asynchronously; the point-in-time snapshot is created immediately, but the status of the snapshot is `pending` until the snapshot is complete (when all of the modified blocks have been transferred to Amazon S3), which can take several hours for large initial snapshots or subsequent snapshots where many blocks have changed.

    ![img](https://d2908q01vomqb2.cloudfront.net/e1822db470e60d090affd0956d743cb0e7cdf113/2019/05/17/CreateSnapshots.png)

    While it is completing, an in-progress snapshot is not affected by ongoing reads and writes to the volume hence, you can still use the EBS volume normally.

    When you create an EBS volume based on a snapshot, the new volume begins as an exact replica of the original volume that was used to create the snapshot. The replicated volume loads data lazily in the background so that you can begin using it immediately. If you access data that hasn’t been loaded yet, the volume immediately downloads the requested data from Amazon S3, and then continues loading the rest of the volume’s data in the background.

     

    **References:**

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-snapshot.html

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html

     

    **Check out this Amazon EBS Cheat Sheet:**

    https://tutorialsdojo.com/amazon-ebs/

    

    

17. ##### 16. QUESTION

    A company has 3 DevOps engineers that are handling its software development and infrastructure management processes. One of the engineers accidentally deleted a file hosted in Amazon S3 which has caused disruption of service.

    What can the DevOps engineers do to prevent this from happening again?

    

    - Create an IAM bucket policy that disables delete operation.
    - Set up a signed URL for all users.
    - Enable S3 Versioning and Multi-Factor Authentication Delete on the bucket.
    - Use S3 Infrequently Accessed storage to store the data.

    

    **Correct**

    

    To avoid accidental deletion in Amazon S3 bucket, you can:

      – Enable Versioning

      – Enable MFA (Multi-Factor Authentication) Delete

    Versioning is a means of keeping multiple variants of an object in the same bucket. You can use versioning to preserve, retrieve, and restore every version of every object stored in your Amazon S3 bucket. With versioning, you can easily recover from both unintended user actions and application failures.

    If the MFA (Multi-Factor Authentication) Delete is enabled, it requires additional authentication for either of the following operations:

      – Change the versioning state of your bucket

      – Permanently delete an object version

    ***\*Using S3 Infrequently Accessed storage to store the data\**** is incorrect. Switching your storage class to S3 Infrequent Access won’t help mitigate accidental deletions.

    ***\*Setting up a signed URL for all users\**** is incorrect. Signed URLs give you more control over access to your content, so this feature deals more on accessing rather than deletion.

    ***\*Creating an IAM bucket policy that disables delete operation\**** is incorrect. If you create a bucket policy preventing deletion, other users won’t be able to delete objects that should be deleted. You only want to prevent accidental deletion, not disable the action itself.

     

    **Reference:**

    http://docs.aws.amazon.com/AmazonS3/latest/dev/Versioning.html

     

    **Check out this Amazon S3 Cheat Sheet:**

    https://tutorialsdojo.com/amazon-s3/

    

    

18. ##### 17. QUESTION

    A company is in the process of migrating their applications to AWS. One of their systems requires a database that can scale globally and handle frequent schema changes. The application should not have any downtime or performance issues whenever there is a schema change in the database. It should also provide a low latency response to high-traffic queries.

    Which is the most suitable database solution to use to achieve this requirement?

    

    - An Amazon RDS instance in Multi-AZ Deployments configuration
    - Amazon DynamoDB
    - An Amazon Aurora database with Read Replicas
    - Redshift

    

    **Correct**

    

    Before we proceed in answering this question, we must first be clear with the actual definition of a “**schema**“. Basically, the english definition of a schema is: *a representation of a plan or theory in the form of an outline or model*.

    Just think of a schema as the “structure” or a “model” of your data in your database. Since the scenario requires that the schema, or the structure of your data, changes frequently, then you have to pick a database which provides a non-rigid and flexible way of adding or removing new types of data. This is a classic example of choosing between a relational database and non-relational (NoSQL) database.

    ![img](https://udemy-images.s3.amazonaws.com/redactor/raw/2019-03-08_21-57-30-7860e883ac634eb2e771a5f4694cbafa.png)

    A relational database is known for having a rigid schema, with a lot of constraints and limits as to which (and what type of ) data can be inserted or not. It is primarily used for scenarios where you have to support complex queries which fetch data across a number of tables. It is best for scenarios where you have complex table relationships but for use cases where you need to have a flexible schema, this is not a suitable database to use.

    For NoSQL, it is not as rigid as a relational database because you can easily add or remove rows or elements in your table/collection entry. It also has a more flexible schema because it can store complex hierarchical data within a single item which, unlike a relational database, does not entail changing multiple related tables. Hence, the best answer to be used here is a NoSQL database, like DynamoDB. When your business requires a low-latency response to high-traffic queries, taking advantage of a NoSQL system generally makes technical and economic sense.

    Amazon DynamoDB helps solve the problems that limit the relational system scalability by avoiding them. In DynamoDB, you design your schema specifically to make the most common and important queries as fast and as inexpensive as possible. Your data structures are tailored to the specific requirements of your business use cases.

    Remember that a relational database system **does not scale** well for the following reasons:

    – It normalizes data and stores it on multiple tables that require multiple queries to write to disk.

    – It generally incurs the performance costs of an ACID-compliant transaction system.

    – It uses expensive joins to reassemble required views of query results.

    For DynamoDB, it scales well due to these reasons:

    – Its **schema flexibility** lets DynamoDB store complex hierarchical data within a single item. DynamoDB is not a totally *schemaless* database since the very definition of a schema is just the model or structure of your data.

    – Composite key design lets it store related items close together on the same table.

    ***\*An Amazon RDS instance in Multi-AZ Deployments configuration\**** and ***\*an Amazon Aurora database with Read Replicas\**** are incorrect because both of them are a type of relational database.

    ***\*Redshift\**** is incorrect because it is primarily used for OLAP systems.

     

    **References:**

    https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/bp-general-nosql-design.html

    https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/bp-relational-modeling.html

    https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/SQLtoNoSQL.html

     

    Also check the ***AWS Certified Solutions Architect Official Study Guide: Associate Exam*** 1st Edition and turn to page 161 which talks about NoSQL Databases.

     

    **Check out this Amazon DynamoDB Cheat Sheet:**

    https://tutorialsdojo.com/amazon-dynamodb/

     

    **Tutorials Dojo’s AWS Certified Solutions Architect Associate Exam Study Guide:**

    https://tutorialsdojo.com/aws-certified-solutions-architect-associate/

    

    

19. ##### 18. QUESTION

    A production MySQL database hosted on Amazon RDS is running out of disk storage. The management has consulted its solutions architect to increase the disk space without impacting the database performance.

    How can the solutions architect satisfy the requirement with the LEAST operational overhead?

    

    - Increase the allocated storage for the DB instance.
    - Modify the DB instance settings and enable storage autoscaling.
    - Modify the DB instance storage type to Provisioned IOPS.
    - Change the `default_storage_engine` of the DB instance’s parameter group to `MyISAM`.

    

    **Correct**

    

    **RDS Storage Auto Scaling** automatically scales storage capacity in response to growing database workloads, with zero downtime.

    Under-provisioning could result in application downtime, and over-provisioning could result in underutilized resources and higher costs. With RDS Storage Auto Scaling, you simply set your desired maximum storage limit, and Auto Scaling takes care of the rest.

    RDS Storage Auto Scaling continuously monitors actual storage consumption, and scales capacity up automatically when actual utilization approaches provisioned storage capacity. Auto Scaling works with new and existing database instances. You can enable Auto Scaling with just a few clicks in the AWS Management Console. There is no additional cost for RDS Storage Auto Scaling. You pay only for the RDS resources needed to run your applications.

    Hence, the correct answer is: ***\*Modify the DB instance settings and enable storage autoscaling.\****

    The option that says: ***\*Increase the allocated storage for the DB instance\**** is incorrect. Although this will solve the problem of low disk space, increasing the allocated storage might cause performance degradation during the change.

    The option that says: ***\*Change the `default_storage_engine` of the DB instance’s parameter group to `MyISAM`\**** is incorrect. This is just a storage engine for MySQL. It won’t increase the disk space in any way.

    The option that says: ***\*Modify the DB instance storage type to Provisioned IOPS\**** is incorrect. This may improve disk performance but it won’t solve the problem of low database storage.

     

    **References:**

    https://aws.amazon.com/about-aws/whats-new/2019/06/rds-storage-auto-scaling/

    https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PIOPS.StorageTypes.html#USER_PIOPS.Autoscaling

     

    **Check out this Amazon RDS Cheat Sheet:**

    https://tutorialsdojo.com/amazon-relational-database-service-amazon-rds/

    

    

20. ##### 19. QUESTION

    A company has established a dedicated network connection from its on-premises data center to AWS Cloud using AWS Direct Connect (DX). The core network services, such as the Domain Name System (DNS) service and Active Directory services, are all hosted on-premises. The company has new AWS accounts that will also require consistent and dedicated access to these network services.

    Which of the following can satisfy this requirement with the LEAST amount of operational overhead and in a cost-effective manner?

    

    - Set up another Direct Connect connection for each and every new AWS account that will be added.
    - Set up a new Direct Connect gateway and integrate it with the existing Direct Connect connection. Configure a VPC peering connection between AWS accounts and associate it with Direct Connect gateway.
    - Create a new AWS VPN CloudHub. Set up a Virtual Private Network (VPN) connection for additional AWS accounts.
    - Create a new Direct Connect gateway and integrate it with the existing Direct Connect connection. Set up a Transit Gateway between AWS accounts and associate it with the Direct Connect gateway.

    

    **Correct**

    

    **AWS Transit Gateway** provides a hub and spoke design for connecting VPCs and on-premises networks. You can attach all your hybrid connectivity (VPN and Direct Connect connections) to a single Transit Gateway consolidating and controlling your organization’s entire AWS routing configuration in one place. It also controls how traffic is routed among all the connected spoke networks using route tables. This hub and spoke model simplifies management and reduces operational costs because VPCs only connect to the Transit Gateway to gain access to the connected networks.

    ![img](https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/images/image11.png)

    By attaching a transit gateway to a Direct Connect gateway using a transit virtual interface, you can manage a single connection for multiple VPCs or VPNs that are in the same AWS Region. You can also advertise prefixes from on-premises to AWS and from AWS to on-premises.

    The AWS Transit Gateway and AWS Direct Connect solution simplify the management of connections between an Amazon VPC and your networks over a private connection. It can also minimize network costs, improve bandwidth throughput, and provide a more reliable network experience than Internet-based connections.

    Hence, the correct answer is: ***\*Create a new Direct Connect gateway and integrate it with the existing Direct Connect connection.\**** ***\*Set up a Transit Gateway between AWS accounts and associate it with the Direct Connect gateway.\****

    The option that says: ***\*Set up another Direct Connect connection for each and every new AWS account that will be added\**** is incorrect because this solution entails a significant amount of additional cost. Setting up a single DX connection requires a substantial budget and takes a lot of time to establish. It also has high management overhead since you will need to manage all of the Direct Connect connections for all AWS accounts.

    The option that says: ***\*Create a new AWS VPN CloudHub. Set up a Virtual Private Network (VPN) connection for additional AWS accounts\**** is incorrect because a VPN connection is not capable of providing consistent and dedicated access to the on-premises network services. Take note that a VPN connection traverses the public Internet and doesn’t use a dedicated connection.

    The option that says: ***\*Set up a new Direct Connect gateway and integrate it with the existing Direct Connect connection. Configure a VPC peering connection between AWS accounts and associate it with Direct Connect gateway\**** is incorrect because VPC peering is not supported in a Direct Connect connection. VPC peering does not support transitive peering relationships.

     

    **References:**

    https://docs.aws.amazon.com/directconnect/latest/UserGuide/direct-connect-transit-gateways.html

    https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/aws-direct-connect-aws-transit-gateway.html

    https://aws.amazon.com/blogs/networking-and-content-delivery/integrating-sub-1-gbps-hosted-connections-with-aws-transit-gateway/

     

    **Check out this AWS Transit Gateway Cheat Sheet:**

    https://tutorialsdojo.com/aws-transit-gateway/

    

    

21. ##### 20. QUESTION

    An insurance company utilizes SAP HANA for its day-to-day ERP operations. Since they can’t migrate this database due to customer preferences, they need to integrate it with the current AWS workload in the VPC in which they are required to establish a site-to-site VPN connection.

    What needs to be configured outside of the VPC for them to have a successful site-to-site VPN connection?

    

    - A dedicated NAT instance in a public subnet
    - An Internet-routable IP address (static) of the customer gateway's external interface for the on-premises network
    - The main route table in your VPC to route traffic through a NAT instance
    - An EIP to the Virtual Private Gateway

    

    **Correct**

    

    By default, instances that you launch into a virtual private cloud (VPC) can’t communicate with your own network. You can enable access to your network from your VPC by attaching a virtual private gateway to the VPC, creating a custom route table, updating your security group rules, and creating an AWS managed VPN connection.

    Although the term **VPN connection** is a general term, in the Amazon VPC documentation, a VPN connection refers to the connection between your VPC and your own network. AWS supports Internet Protocol security (IPsec) VPN connections.

    A **customer gateway** is a physical device or software application on your side of the VPN connection.

    To create a VPN connection, you must create a customer gateway resource in AWS, which provides information to AWS about your customer gateway device. Next, you have to set up an Internet-routable IP address (static) of the customer gateway’s external interface.

    The following diagram illustrates single VPN connections. The VPC has an attached virtual private gateway, and your remote network includes a customer gateway, which you must configure to enable the VPN connection. You set up the routing so that any traffic from the VPC bound for your network is routed to the virtual private gateway.

    ![img](https://udemy-images.s3.amazonaws.com/redactor/raw/2018-10-27_22-45-01-dbcb3de60063eaba73e8d2d12c61d6dc.png)

    The options that say: ***\*A dedicated NAT instance in a public subnet\**** and ***\*the main route table in your VPC to route traffic through a NAT instance\**** are incorrect since you don’t need a NAT instance for you to be able to create a VPN connection.

    ***\*An EIP to the Virtual Private Gateway\**** is incorrect since you do not attach an EIP to a VPG.

     

    **References:**

    https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_VPN.html

    https://docs.aws.amazon.com/vpc/latest/userguide/SetUpVPNConnections.html

     

    **Check out this Amazon VPC Cheat Sheet:**

    https://tutorialsdojo.com/amazon-vpc/

    

    

22. ##### 21. QUESTION

    A web application requires a minimum of six Amazon Elastic Compute Cloud (EC2) instances running at all times. You are tasked to deploy the application to three availability zones in the EU Ireland region (eu-west-1a, eu-west-1b, and eu-west-1c). It is required that the system is fault-tolerant up to the loss of one Availability Zone.

    Which of the following setup is the most cost-effective solution which also maintains the fault-tolerance of your system?

    

    - 6 instances in eu-west-1a, 6 instances in eu-west-1b, and 6 instances in eu-west-1c
    - 3 instances in eu-west-1a, 3 instances in eu-west-1b, and 3 instances in eu-west-1c
    - 6 instances in eu-west-1a, 6 instances in eu-west-1b, and no instances in eu-west-1c
    - 2 instances in eu-west-1a, 2 instances in eu-west-1b, and 2 instances in eu-west-1c

    

    **Correct**

    

    Basically, fault-tolerance is the ability of a system to remain in operation even in the event that some of its components fail, without any service degradation. In AWS, it can also refer to the minimum number of running EC2 instances or resources which should be running at all times in order for the system to properly operate and serve its consumers. Take note that this is quite different from the concept of High Availability, which is just concerned with having at least one running instance or resource in case of failure.

    ![img](https://docs.aws.amazon.com/documentdb/latest/developerguide/images/RegionsAndAZs.png)

    In this scenario, ***\*3 instances in eu-west-1a, 3 instances in eu-west-1b, and 3 instances in eu-west-1c\**** is the correct answer because even if there was an outage in one of the Availability Zones, the system still satisfies the requirement of having a minimum of 6 running instances. It is also the most cost-effective solution among other options.

    The option that says: ***\*6 instances in eu-west-1a, 6 instances in eu-west-1b, and 6 instances in eu-west-1c\**** is incorrect because although this solution provides the maximum fault-tolerance for the system, it entails a significant cost to maintain a total of 18 instances across 3 AZs. 

    The option that says: ***\*2 instances in eu-west-1a, 2 instances in eu-west-1b, and 2 instances in eu-west-1c\**** is incorrect because if one Availability Zone goes down, there will only be 4 running instances available. Although this is the most cost-effective solution, it does not provide fault-tolerance.

    The option that says: ***\*6 instances in eu-west-1a, 6 instances in eu-west-1b, and no instances in eu-west-1c\**** is incorrect because although it provides fault-tolerance, it is not the most cost-effective solution as compared with the options above. This solution has 12 running instances, unlike the correct answer which only has 9 instances.

     

    **References:**

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-increase-availability.html

    https://media.amazonwebservices.com/AWS_Building_Fault_Tolerant_Applications.pdf

    

    

23. ##### 22. QUESTION

    A web application is using CloudFront to distribute their images, videos, and other static contents stored in their S3 bucket to its users around the world. The company has recently introduced a new member-only access to some of its high quality media files. There is a requirement to provide access to multiple private media files only to their paying subscribers without having to change their current URLs.

    Which of the following is the most suitable solution that you should implement to satisfy this requirement?

    

    - Configure your CloudFront distribution to use Match Viewer as its Origin Protocol Policy which will automatically match the user request. This will allow access to the private content if the request is a paying member and deny it if it is not a member.
    - Create a Signed URL with a custom policy which only allows the members to see the private files.
    - Configure your CloudFront distribution to use Field-Level Encryption to protect your private data and only allow access to members.
    - Use Signed Cookies to control who can access the private files in your CloudFront distribution by modifying your application to determine whether a user should have access to your content. For members, send the required `Set-Cookie` headers to the viewer which will unlock the content only to them.

    

    **Correct**

    

    CloudFront signed URLs and signed cookies provide the same basic functionality: they allow you to control who can access your content. If you want to serve private content through CloudFront and you’re trying to decide whether to use signed URLs or signed cookies, consider the following:

    Use **signed URLs** for the following cases:

    – You want to use an RTMP distribution. Signed cookies aren’t supported for RTMP distributions.

    – You want to restrict access to individual files, for example, an installation download for your application.

    – Your users are using a client (for example, a custom HTTP client) that doesn’t support cookies.

    Use **signed cookies** for the following cases:

    – You want to provide access to multiple restricted files, for example, all of the files for a video in HLS format or all of the files in the subscribers’ area of a website.

    – You don’t want to change your current URLs.

    Hence, the correct answer for this scenario is the option that says: ***\*Use Signed Cookies to control who can access the private files in your CloudFront distribution by modifying your application to determine whether a user should have access to your content. For members, send the required `Set-Cookie` headers to the viewer which will unlock the content only to them.\****

    The option that says: ***\*Configure your CloudFront distribution to use Match Viewer as its Origin Protocol Policy which will automatically match the user request. This will allow access to the private content if the request is a paying member and deny it if it is not a member\**** is incorrect because a Match Viewer is an Origin Protocol Policy which configures CloudFront to communicate with your origin using HTTP or HTTPS, depending on the protocol of the viewer request. CloudFront caches the object only once even if viewers make requests using both HTTP and HTTPS protocols.

    The option that says: ***\*Create a Signed URL with a custom policy which only allows the members to see the private files\**** is incorrect because Signed URLs are primarily used for providing access to individual files, as shown on the above explanation. In addition, the scenario explicitly says that they don’t want to change their current URLs which is why implementing Signed Cookies is more suitable than Signed URL.

    The option that says: ***\*Configure your CloudFront distribution to use Field-Level Encryption to protect your private data and only allow access to members\**** is incorrect because Field-Level Encryption only allows you to securely upload user-submitted sensitive information to your web servers. It does not provide access to download multiple private files.

     

    **Reference:**

    https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-choosing-signed-urls-cookies.html

    https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-signed-cookies.html

     

    **Check out this Amazon CloudFront Cheat Sheet:**

    https://tutorialsdojo.com/amazon-cloudfront/

    

    

24. ##### 23. QUESTION

    An organization plans to run an application in a dedicated physical server that doesn’t use virtualization. The application data will be stored in a storage solution that uses an NFS protocol. To prevent data loss, you need to use a durable cloud storage service to store a copy of your data.

    Which of the following is the most suitable solution to meet the requirement?

    

    - Use an AWS Storage Gateway hardware appliance for your compute resources. Configure Volume Gateway to store the application data and backup data.
    - Use an AWS Storage Gateway hardware appliance for your compute resources. Configure File Gateway to store the application data and create an Amazon S3 bucket to store a backup of your data.
    - Use an AWS Storage Gateway hardware appliance for your compute resources. Configure Volume Gateway to store the application data and create an Amazon S3 bucket to store a backup of your data.
    - Use AWS Storage Gateway with a gateway VM appliance for your compute resources. Configure File Gateway to store the application data and backup data.

    

    **Correct**

    

    **AWS Storage Gateway** is a hybrid cloud storage service that gives you on-premises access to virtually unlimited cloud storage by linking it to S3. Storage Gateway provides 3 types of storage solutions for your on-premises applications: file, volume, and tape gateways. The AWS Storage Gateway Hardware Appliance is a physical, standalone, validated server configuration for on-premises deployments.

    ![How File Gateway works](https://d1.awsstatic.com/cloud-storage/File-Gateway-How-it-Works.6a5ce3c54688864e5b951df9cb8732fc4f2926b4.png)

    The AWS Storage Gateway Hardware Appliance is a physical hardware appliance with the Storage Gateway software preinstalled on a validated server configuration. The hardware appliance is a high-performance 1U server that you can deploy in your data center, or on-premises inside your corporate firewall. When you buy and activate your hardware appliance, the activation process associates your hardware appliance with your AWS account. After activation, your hardware appliance appears in the console as a gateway on the *Hardware* page. You can configure your hardware appliance as a file gateway, tape gateway, or volume gateway type. The procedure that you use to deploy and activate these gateway types on a hardware appliance is the same as on a virtual platform.

    Since the company needs to run a dedicated physical appliance, you can use an AWS Storage Gateway Hardware Appliance. It comes pre-loaded with Storage Gateway software, and provides all the required resources to create a file gateway. A file gateway can be configured to store and retrieve objects in Amazon S3 using the protocols NFS and SMB.

    Hence, the correct answer in this scenario is: ***\*Use an AWS Storage Gateway hardware appliance for your compute resources. Configure File Gateway to store the application data and create an Amazon S3 bucket to store a backup of your data\****.

    The option that says: ***\*Use AWS Storage Gateway with a gateway VM appliance for your compute resources. Configure File Gateway to store the application data and backup data\**** is incorrect because as per the scenario, the company needs to use an on-premises hardware appliance and not just a Virtual Machine (VM).

    The options that say: ***\*Use an AWS Storage Gateway hardware appliance for your compute resources. Configure Volume Gateway to store the application data and backup data\**** and ***\*Use an AWS Storage Gateway hardware appliance for your compute resources. Configure Volume Gateway to store the application data and create an Amazon S3 bucket to store a backup of your data\**** are both incorrect. As per the scenario, the requirement is a file system that uses an NFS protocol and not iSCSI devices. Among the AWS Storage Gateway storage solutions, only file gateway can store and retrieve objects in Amazon S3 using the protocols NFS and SMB.**
    **

     

    **References:**

    https://docs.aws.amazon.com/storagegateway/latest/userguide/hardware-appliance.html

    https://docs.aws.amazon.com/storagegateway/latest/userguide/WhatIsStorageGateway.html

     

    ***\*AWS Storage Gateway Overview:\****

    

    <iframe title="YouTube video player" src="https://www.youtube.com/embed/pNb7xOBJjHE" frameborder="0" allowfullscreen="allowfullscreen" data-mce-fragment="1" name="fitvid2" style="box-sizing: border-box; margin: 0px; position: absolute; top: 0px; left: 0px; width: 853.75px; height: 480.234px;"></iframe>

    

    **Check out this AWS Storage Gateway Cheat Sheet:**

    https://tutorialsdojo.com/aws-storage-gateway/

    

    

25. ##### 24. QUESTION

    An auto scaling group of Linux EC2 instances is created with basic monitoring enabled in CloudWatch. You noticed that your application is slow so you asked one of your engineers to check all of your EC2 instances. After checking your instances, you noticed that the auto scaling group is not launching more instances as it should be, even though the servers already have high memory usage.

    Which of the following options should the Architect implement to solve this issue?

    

    - Enable detailed monitoring on the instances.
    - Install AWS SDK in the EC2 instances. Create a script that will trigger the Auto Scaling event if there is high memory usage.
    - Install the CloudWatch agent to the EC2 instances which will trigger your Auto Scaling group to scale out.
    - Modify the scaling policy to increase the threshold to scale out the number of instances.

    

    **Correct**

    

    **Amazon CloudWatch agent** enables you to collect both system metrics and log files from Amazon EC2 instances and on-premises servers. The agent supports both Windows Server and Linux and allows you to select the metrics to be collected, including sub-resource metrics such as per-CPU core.

    ![img](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/images/aeb-container-cw.png)

    The premise of the scenario is that the EC2 servers have **high memory** usage, but since this specific metric is not tracked by the Auto Scaling group by default, the scaling out activity is not being triggered. Remember that by default, CloudWatch doesn’t monitor memory usage but only the CPU utilization, Network utilization, Disk performance, and Disk Reads/Writes.

    This is the reason why you have to install a CloudWatch agent in your EC2 instances to collect and monitor the custom metric (memory usage), which will be used by your Auto Scaling Group as a trigger for scaling activities.

    Hence, the correct answer is: ***\*Install the CloudWatch agent to the EC2 instances which will trigger your Auto Scaling group to scale out.\****

    The option that says: ***\*Install AWS SDK in the EC2 instances. Create a script that will trigger the Auto Scaling event if there is a high memory usage\**** is incorrect because AWS SDK is a set of programming tools that allow you to create applications that run using Amazon cloud services. You would have to program the alert which is not the best strategy for this scenario.

    The option that says: ***\*Enable detailed monitoring on the instances\**** is incorrect because detailed monitoring does not provide metrics for memory usage. CloudWatch does not monitor memory usage in its default set of EC2 metrics and detailed monitoring just provides a higher frequency of metrics (1-minute frequency).

    The option that says: ***\*Modify the scaling policy to increase the threshold to scale out the number of instances\**** is incorrect because you are already maxing out your usage, which should in effect cause an auto-scaling event.

     

    **References:**

    https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/viewing_metrics_with_cloudwatch.html

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring_ec2.html

     

    **Check out these Amazon EC2 and CloudWatch Cheat Sheets:**

    https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/

    https://tutorialsdojo.com/amazon-cloudwatch/

    

    

26. ##### 25. QUESTION

    A cryptocurrency company wants to go global with its international money transfer app. Your project is to make sure that the database of the app is highly available in multiple regions.

    What are the benefits of adding Multi-AZ deployments in Amazon RDS? (Select TWO.)

    

    - Provides enhanced database durability in the event of a DB instance component failure or an Availability Zone outage.
    - Creates a primary DB Instance and synchronously replicates the data to a standby instance in a different Availability Zone (AZ) in a different region.
    - Increased database availability in the case of system upgrades like OS patching or DB Instance scaling.
    - Provides SQL optimization.
    - Significantly increases the database performance.

    

    **Correct**

    

    **Amazon RDS Multi-AZ deployments** provide enhanced availability and durability for Database (DB) Instances, making them a natural fit for production database workloads. When you provision a Multi-AZ DB Instance, Amazon RDS automatically creates a primary DB Instance and synchronously replicates the data to a standby instance in a different Availability Zone (AZ). Each AZ runs on its own physically distinct, independent infrastructure, and is engineered to be highly reliable.

    In case of an infrastructure failure, Amazon RDS performs an automatic failover to the standby (or to a read replica in the case of Amazon Aurora), so that you can resume database operations as soon as the failover is complete. Since the endpoint for your DB Instance remains the same after a failover, your application can resume database operation without the need for manual administrative intervention.

    ![img](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/images/con-multi-AZ.png)

    The chief benefits of running your DB instance as a Multi-AZ deployment are enhanced database durability and availability. The increased availability and fault tolerance offered by Multi-AZ deployments make them a natural fit for production environments.

    Hence, the correct answers are the following options:

    ***\*– Increased database availability in the case of system upgrades like OS patching or DB Instance scaling.\****

    ***\*– Provides enhanced database durability in the event of a DB instance component failure or an Availability Zone outage.\****

    The option that says: ***\*Creates a primary DB Instance and synchronously replicates the data to a standby instance in a different Availability Zone (AZ) in a different region\**** is almost correct. RDS synchronously replicates the data to a standby instance in a different Availability Zone (AZ) that is in the same region and not in a different one.

    The options that say: ***\*Significantly increases the database performance\**** and ***\*Provides SQL optimization\**** are incorrect as it does not affect the performance nor provide SQL optimization.

     

    **References:**

    https://aws.amazon.com/rds/details/multi-az/

    https://aws.amazon.com/rds/faqs/

     

    **Check out this Amazon RDS Cheat Sheet:**

    https://tutorialsdojo.com/amazon-relational-database-service-amazon-rds/

    

    

27. ##### 26. QUESTION

    An AI-powered Forex trading application consumes thousands of data sets to train its machine learning model. The application’s workload requires a high-performance, parallel hot storage to process the training datasets concurrently. It also needs cost-effective cold storage to archive those datasets that yield low profit.

    Which of the following Amazon storage services should the developer use?

    

    - Use Amazon FSx For Lustre and Amazon S3 for hot and cold storage respectively.
    - Use Amazon FSx For Windows File Server and Amazon S3 for hot and cold storage respectively.
    - Use Amazon Elastic File System and Amazon S3 for hot and cold storage respectively.
    - Use Amazon FSx For Lustre and Amazon EBS Provisioned IOPS SSD (io1) volumes for hot and cold storage respectively.

    

    **Correct**

    

    **Hot storage** refers to the storage that keeps frequently accessed data ( hot data ). **Warm storage** refers to the storage that keeps less frequently accessed data ( warm data ). **Cold storage** refers to the storage that keeps rarely accessed data ( cold data ). In terms of pricing, the colder the data, the cheaper it is to store, and the costlier it is to access when needed.

    ![img](https://media.tutorialsdojo.com/aws-storage-services.png)

    **Amazon FSx For Lustre** is a high-performance file system for fast processing of workloads. Lustre is a popular open-source **parallel file system** which stores data across multiple network file servers to maximize performance and reduce bottlenecks.

    **Amazon FSx for Windows File Server** is a fully managed Microsoft Windows file system with full support for the SMB protocol, Windows NTFS, Microsoft Active Directory ( AD ) Integration.

    **Amazon Elastic File System** is a fully-managed file storage service that makes it easy to set up and scale file storage in the Amazon Cloud. 

    **Amazon S3 is** an object storage service that offers industry-leading scalability, data availability, security, and performance. S3 offers different storage tiers for different use cases ( frequently accessed data, infrequently accessed data, and rarely accessed data ).

     The question has two requirements:

    1. High-performance, parallel hot storage to process the training datasets concurrently.
    2. Cost-effective cold storage to keep the archived datasets that are accessed infrequently

    In this case, we can use **Amazon FSx For Lustre** for the first requirement, as it provides a high-performance, parallel file system for hot data. On the second requirement, we can use Amazon S3 for storing the cold data. Amazon S3 supports a cold storage system via Amazon S3 Glacier / Glacier Deep Archive.

    Hence, the correct answer is ***\*Use Amazon FSx For Lustre and Amazon S3 for hot and cold storage respectively\****.

    ***\*Using Amazon FSx For Lustre and Amazon EBS Provisioned IOPS SSD (io1) volumes for hot and cold storage respectively\**** is incorrect because the Provisioned IOPS SSD ( io1 ) volumes are designed as a hot storage to meet the needs of I/O-intensive workloads. EBS has a storage option called Cold HDD but it is not used for storing cold data. In addition, EBS Cold HDD is a lot more expensive than using Amazon S3 Glacier / Glacier Deep Archive.

    ***\*Using Amazon Elastic File System and Amazon S3 for hot and cold storage respectively\**** is incorrect because although EFS supports concurrent access to data, it does not have the high-performance ability that is required for machine learning workloads.

    ***\*Using Amazon FSx For Windows File Server and Amazon S3 for hot and cold storage respectively\**** is incorrect because Amazon FSx For Windows File Server does not have a parallel file system, unlike Lustre.

     

    **References:**

    https://aws.amazon.com/fsx/

    https://docs.aws.amazon.com/whitepapers/latest/cost-optimization-storage-optimization/aws-storage-services.html

    https://aws.amazon.com/blogs/startups/picking-the-right-data-store-for-your-workload/

     

    **Check out this Amazon FSx Cheat Sheet:**

    https://tutorialsdojo.com/amazon-fsx/

    

    

28. ##### 27. QUESTION

    A company is using the AWS Directory Service to integrate their on-premises Microsoft Active Directory (AD) domain with their Amazon EC2 instances via an AD connector. The below identity-based policy is attached to the IAM Identities that use the AWS Directory service:

    ```
    {
       "Version":"2012-10-17",
       "Statement":[
          {
             "Sid":"DirectoryTutorialsDojo1234",
             "Effect":"Allow",
             "Action":[
                "ds:*"
             ],
             "Resource":"arn:aws:ds:us-east-1:987654321012:directory/d-1234567890"
          },
          {
             "Effect":"Allow",
             "Action":[
                "ec2:*"
             ],
             "Resource":"*"
          }
       ]
    }
    ```

    Which of the following BEST describes what the above resource policy does?

    

    - Allows all AWS Directory Service (`ds`) calls as long as the resource contains the directory name of: `DirectoryTutorialsDojo1234`
    - Allows all AWS Directory Service (`ds`) calls as long as the resource contains the directory ID: `d-1234567890`
    - Allows all AWS Directory Service (`ds`) calls as long as the resource contains the directory ID: `DirectoryTutorialsDojo1234`
    - Allows all AWS Directory Service (`ds`) calls as long as the resource contains the directory ID: `987654321012`

    

    **Correct**

    

    **AWS Directory Service** provides multiple ways to use Amazon Cloud Directory and Microsoft Active Directory (AD) with other AWS services. Directories store information about users, groups, and devices, and administrators use them to manage access to information and resources. AWS Directory Service provides multiple directory choices for customers who want to use existing Microsoft AD or Lightweight Directory Access Protocol (LDAP)–aware applications in the cloud. It also offers those same choices to developers who need a directory to manage users, groups, devices, and access.

    ![img](https://d1.awsstatic.com/Products/product-name/diagrams/directory_service_howitworks.80bfccbf2f5d1d63558ec3c086aff247147258f1.png)

    Every AWS resource is owned by an AWS account, and permissions to create or access the resources are governed by permissions policies. An account administrator can attach permissions policies to IAM identities (that is, users, groups, and roles), and some services (such as AWS Lambda) also support attaching permissions policies to resources.

    The following resource policy example allows all `ds` calls as long as the resource contains the directory ID “`d-1234567890`“.

    ```
    {
     "Version":"2012-10-17",
     "Statement":[
        {
            "Sid":"VisualEditor0",
            "Effect":"Allow",
            "Action":[
                "ds:*"
             ],
                     "Resource":"arn:aws:ds:us-east-1:123456789012:directory/d-1234567890"
        },
        {
        "Effect":"Allow",
        "Action":[
            "ec2:*"
        ],
        "Resource":"*"
        }
      ]
    }
    ```

    Hence, the correct answer is the option that says: ***\*Allows all AWS Directory Service `(ds)` calls as long as the resource contains the directory ID: `d-1234567890`\****.

    The option that says: ***\*Allows all AWS Directory Service `(ds)` calls as long as the resource contains the directory ID: `DirectoryTutorialsDojo1234`\**** is incorrect because `DirectoryTutorialsDojo1234` is the Statement ID (SID) and not the Directory ID.

    The option that says: ***\*Allows all AWS Directory Service `(ds)` calls as long as the resource contains the directory ID: `987654321012`\**** is incorrect because the numbers: `987654321012` is the Account ID and not the Directory ID.

    The option that says: ***\*Allows all AWS Directory Service `(ds)` calls as long as the resource contains the directory name of: `DirectoryTutorialsDojo1234`\**** is incorrect because `DirectoryTutorialsDojo1234` is the Statement ID (SID) and not the Directory name.

     

    **References:**

    https://docs.aws.amazon.com/directoryservice/latest/admin-guide/IAM_Auth_Access_IdentityBased.html

    https://docs.aws.amazon.com/directoryservice/latest/admin-guide/IAM_Auth_Access_Overview.html

     

    **Check out this AWS Identity & Access Management (IAM) Cheat Sheet:**

    https://tutorialsdojo.com/aws-identity-and-access-management-iam/

    

    

29. ##### 28. QUESTION

    A company has a running m5ad.large EC2 instance with a default attached 75 GB SSD instance-store backed volume. You shut it down and then start the instance. You noticed that the data which you have saved earlier on the attached volume is no longer available.

    What might be the cause of this?

    

    - The instance was hit by a virus that wipes out all data.
    - The EC2 instance was using instance store volumes, which are ephemeral and only live for the life of the instance.
    - The EC2 instance was using EBS backed root volumes, which are ephemeral and only live for the life of the instance.
    - The volume of the instance was not big enough to handle all of the processing data.

    

    **Correct**

    

    An **instance store** provides temporary block-level storage for your instance. This storage is located on disks that are physically attached to the host computer. Instance store is ideal for temporary storage of information that changes frequently, such as buffers, caches, scratch data, and other temporary content, or for data that is replicated across a fleet of instances, such as a load-balanced pool of web servers.

    ![img](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/images/architecture_storage_windows.png)

    An instance store consists of one or more instance store volumes exposed as block devices. The size of an instance store as well as the number of devices available varies by instance type. While an instance store is dedicated to a particular instance, the disk subsystem is shared among instances on a host computer.

    The data in an instance store persists only during the lifetime of its associated instance. If an instance reboots (intentionally or unintentionally), data in the instance store persists. However, data in the instance store is lost under the following circumstances:

    – The underlying disk drive fails

    – The instance stops

    – The instance terminates

     

    **Reference:**

    http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html

     

    ***\*Amazon EC2 Overview:\****

    

    <iframe title="YouTube video player" src="https://www.youtube.com/embed/7VsGIHT_jQE" frameborder="0" allowfullscreen="allowfullscreen" name="fitvid3" style="box-sizing: border-box; margin: 0px; position: absolute; top: 0px; left: 0px; width: 853.75px; height: 480.234px;"></iframe>

    

    **Check out this Amazon EC2 Cheat Sheet:**

    https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/

    

    

30. ##### 29. QUESTION

    A Solutions Architect is working for a large global media company with multiple office locations all around the world. The Architect is instructed to build a system to distribute training videos to all employees.

    Using CloudFront, what method would be used to serve content that is stored in S3, but not publicly accessible from S3 directly?

    

    - Create an Identity and Access Management (IAM) user for CloudFront and grant access to the objects in your S3 bucket to that IAM user.
    - Create an S3 bucket policy that lists the CloudFront distribution ID as the principal and the target bucket as the Amazon Resource Name (ARN).
    - Add the CloudFront account security group.
    - Create an Origin Access Identity (OAI) for CloudFront and grant access to the objects in your S3 bucket to that OAI.

    

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

    

    

31. ##### 30. QUESTION

    A company troubleshoots the operational issues of their cloud architecture by logging the AWS API call history of all AWS resources. The Solutions Architect must implement a solution to quickly identify the most recent changes made to resources in their environment, including creation, modification, and deletion of AWS resources. One of the requirements is that the generated log files should be encrypted to avoid any security issues.

    Which of the following is the most suitable approach to implement the encryption?

    

    - Use CloudTrail and configure the destination Amazon Glacier archive to use Server-Side Encryption (SSE).
    - Use CloudTrail and configure the destination S3 bucket to use Server-Side Encryption (SSE).
    - Use CloudTrail and configure the destination S3 bucket to use Server Side Encryption (SSE) with AES-128 encryption algorithm.
    - Use CloudTrail with its default settings.

    

    **Correct**

    

    By default, CloudTrail event log files are encrypted using Amazon S3 server-side encryption (SSE). You can also choose to encrypt your log files with an AWS Key Management Service (AWS KMS) key. You can store your log files in your bucket for as long as you want. You can also define Amazon S3 lifecycle rules to archive or delete log files automatically. If you want notifications about log file delivery and validation, you can set up Amazon SNS notifications.

    ![img](https://media.amazonwebservices.com/blog/2014/cloudtrail_flow_9.png)

    ***\*Using CloudTrail and configuring the destination Amazon Glacier archive to use Server-Side Encryption (SSE)\**** is incorrect because CloudTrail stores the log files to S3 and not in Glacier. Take note that by default, CloudTrail event log files are already encrypted using Amazon S3 server-side encryption (SSE).

    ***\*Using CloudTrail and configuring the destination S3 bucket to use Server-Side Encryption (SSE)\**** is incorrect because CloudTrail event log files are already encrypted using the Amazon S3 server-side encryption (SSE) which is why you do not have to do this anymore.

    ***\*Use CloudTrail and configure the destination S3 bucket to use Server Side Encryption (SSE) with AES-128 encryption algorithm\**** is incorrect because Cloudtrail event log files are already encrypted using the Amazon S3 server-side encryption (SSE) by default. Additionally, SSE-S3 only uses the AES-256 encryption algorithm and not the AES-128.

     

    **References:**

    https://docs.aws.amazon.com/awscloudtrail/latest/userguide/how-cloudtrail-works.html

    https://aws.amazon.com/blogs/aws/category/cloud-trail/

     

    **Check out this AWS CloudTrail Cheat Sheet:**

    https://tutorialsdojo.com/aws-cloudtrail/

    

    

32. ##### 31. QUESTION

    A company hosted a web application on a Linux Amazon EC2 instance in the public subnet that uses a default network ACL. The instance uses a default security group and has an attached Elastic IP address. The network ACL has been configured to block all traffic to the instance. The Solutions Architect must allow incoming traffic on port 443 to access the application from any source.

    Which combination of steps will accomplish this requirement? (Select TWO.)

    

    - In the Network ACL, update the rule to allow outbound TCP connection on port `32768 - 65535` to destination `0.0.0.0/0`
    - In the Security Group, add a new rule to allow TCP connection on port 443 from source `0.0.0.0/0`
    - In the Network ACL, update the rule to allow inbound TCP connection on port 443 from source `0.0.0.0/0` and outbound TCP connection on port `32768 - 65535` to destination `0.0.0.0/0`
    - In the Network ACL, update the rule to allow both inbound and outbound TCP connection on port 443 from source `0.0.0.0/0` and to destination `0.0.0.0/0`
    - In the Security Group, create a new rule to allow TCP connection on port 443 to destination `0.0.0.0/0`

    

    **Correct**

    

    To enable the connection to a service running on an instance, the associated network ACL must allow both inbound traffic on the port that the service is listening on as well as allow outbound traffic from ephemeral ports. When a client connects to a server, a random port from the ephemeral port range (1024-65535) becomes the client’s source port.

    The designated ephemeral port then becomes the destination port for return traffic from the service, so outbound traffic from the ephemeral port must be allowed in the network ACL. By default, network ACLs allow all inbound and outbound traffic. If your network ACL is more restrictive, then you need to explicitly allow traffic from the ephemeral port range.

    ![img](https://media.tutorialsdojo.com/Network_ACL_Ephemeral_Ports.png)

    The client that initiates the request chooses the ephemeral port range. The range varies depending on the client’s operating system.

    – Many Linux kernels (including the Amazon Linux kernel) use ports 32768-61000.

    – Requests originating from Elastic Load Balancing use ports 1024-65535.

    – Windows operating systems through Windows Server 2003 use ports 1025-5000.

    – Windows Server 2008 and later versions use ports 49152-65535.

    – A NAT gateway uses ports 1024-65535.

    – AWS Lambda functions use ports 1024-65535.

    For example, if a request comes into a web server in your VPC from a Windows 10 client on the Internet, your network ACL must have an outbound rule to enable traffic destined for ports 49152 – 65535. If an instance in your VPC is the client initiating a request, your network ACL must have an inbound rule to enable traffic destined for the ephemeral ports specific to the type of instance (Amazon Linux, Windows Server 2008, and so on).

    In this scenario, you only need to allow the incoming traffic on port 443. Since security groups are stateful, you can apply any changes to an incoming rule and it will be automatically applied to the outgoing rule.

    To enable the connection to a service running on an instance, the associated network ACL must allow both inbound traffic on the port that the service is listening on as well as allow outbound traffic from ephemeral ports. When a client connects to a server, a random port from the ephemeral port range (32768 – 65535) becomes the client’s source port.

    Hence, the correct answers are:

    ***\*– In the Security Group, add a new rule to allow TCP connection on port 443 from source `0.0.0.0/0`.\****

    ***\*– In the Network ACL, update the rule to allow inbound TCP connection on port 443 from source `0.0.0.0/0` and outbound TCP connection on port `32768 - 65535` to destination `0.0.0.0/0`.\****

    The option that says: ***\*In the Security Group, create a new rule to allow TCP connection on port 443 to destination `0.0.0.0/0`\**** is incorrect because this step just allows outbound connections from the EC2 instance out to the public Internet which is unnecessary. Remember that a default security group already includes an outbound rule that allows all outbound traffic.

    The option that says: ***\*In the Network ACL, update the rule to allow both inbound and outbound TCP connection on port 443 from source 0.0.0.0/0 and to destination `0.0.0.0/0`\**** is incorrect because your network ACL must have an outbound rule to allow ephemeral ports (`32768 - 65535`). These are the specific ports that will be used as the client’s source port for the traffic response.

    The option that says: ***\*In the Network ACL, update the rule to allow outbound TCP connection on port `32768 - 65535` to destination `0.0.0.0/0`\**** is incorrect because this step is just partially right. You still need to add an inbound rule from port 443 and not just the outbound rule for the ephemeral ports (`32768 - 65535`).

     

    **References:**

    https://aws.amazon.com/premiumsupport/knowledge-center/connect-http-https-ec2/

    https://docs.amazonaws.cn/en_us/vpc/latest/userguide/vpc-network-acls.html#nacl-ephemeral-ports

     

    **Check out this Amazon VPC Cheat Sheet:**

    https://tutorialsdojo.com/amazon-vpc/

    

    

33. ##### 32. QUESTION

    A tech company is running two production web servers hosted on Reserved EC2 instances with EBS-backed root volumes. These instances have a consistent CPU load of 90%. Traffic is being distributed to these instances by an Elastic Load Balancer. In addition, they also have Multi-AZ RDS MySQL databases for their production, test, and development environments.

    What recommendation would you make to reduce cost in this AWS environment without affecting availability and performance of mission-critical systems? Choose the best answer.

    

    - Consider using On-demand instances instead of Reserved EC2 instances
    - Consider not using a Multi-AZ RDS deployment for the development and test database
    - Consider removing the Elastic Load Balancer
    - Consider using Spot instances instead of reserved EC2 instances

    

    **Correct**

    

    One thing that you should notice here is that the company is using Multi-AZ databases in all of their environments, including their development and test environment. This is costly and unnecessary as these two environments are not critical. It is better to use Multi-AZ for production environments to reduce costs, which is why the option that says: ***\*Consider not using a Multi-AZ RDS deployment for the development and test database\**** is the correct answer.

    The option that says: ***\*Consider using On-demand instances instead of Reserved EC2 instances\**** is incorrect because selecting Reserved instances is cheaper than On-demand instances for long term usage due to the discounts offered when purchasing reserved instances.

    The option that says: ***\*Consider using Spot instances instead of reserved EC2 instances\**** is incorrect because the web servers are running in a production environment. Never use Spot instances for production level web servers unless you are sure that they are not that critical in your system. This is because your spot instances can be terminated once the maximum price goes over the maximum amount that you specified.

    The option that says: ***\*Consider removing the Elastic Load Balancer\**** is incorrect because the Elastic Load Balancer is crucial in maintaining the elasticity and reliability of your system.

     

    **References:**

    https://aws.amazon.com/rds/details/multi-az/

    https://aws.amazon.com/pricing/cost-optimization/

     

    ***\*Amazon RDS Overview:\****

    

    <iframe title="YouTube video player" src="https://www.youtube.com/embed/aZmpLl8K1UU" frameborder="0" allowfullscreen="allowfullscreen" data-mce-fragment="1" name="fitvid4" style="box-sizing: border-box; margin: 0px; position: absolute; top: 0px; left: 0px; width: 853.75px; height: 480.234px;"></iframe>

    

    **Check out this Amazon RDS Cheat Sheet:**

    https://tutorialsdojo.com/amazon-relational-database-service-amazon-rds/

    

    

34. ##### 33. QUESTION

    A company has a dynamic web app written in MEAN stack that is going to be launched in the next month. There is a probability that the traffic will be quite high in the first couple of weeks. In the event of a load failure, how can you set up DNS failover to a static website?

    

    - Use Route 53 with the failover option to a static S3 website bucket or CloudFront distribution.
    - Add more servers in case the application fails.
    - Enable failover to an application hosted in an on-premises data center.
    - Duplicate the exact application architecture in another region and configure DNS weight-based routing.

    

    **Correct**

    

    For this scenario, ***\*using Route 53 with the failover option to a static S3 website bucket or CloudFront distribution\**** is correct. You can create a new Route 53 with the failover option to a static S3 website bucket or CloudFront distribution as an alternative.

    ![img](https://udemy-images.s3.amazonaws.com/redactor/raw/2019-02-13_01-05-29-0096a577e991922c675f02801d48a8a4.png)

    ***\*Duplicating the exact application architecture in another region and configuring DNS weight-based routing\**** is incorrect because running a duplicate system is not a cost-effective solution. Remember that you are trying to build a failover mechanism for your web app, not a distributed setup.

    ***\*Enabling failover to an application hosted in an on-premises data center\**** is incorrect. Although you can set up failover to your on-premises data center, you are not maximizing the AWS environment such as using Route 53 failover.

    ***\*Adding more servers in case the application fails\**** is incorrect because this is not the best way to handle a failover event. If you add more servers only in case the application fails, then there would be a period of downtime in which your application is unavailable. Since there are no running servers on that period, your application will be unavailable for a certain period of time until your new server is up and running.

     

    **Reference:**

    https://aws.amazon.com/premiumsupport/knowledge-center/fail-over-s3-r53/

    http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover.html

     

    **Check out this Amazon Route 53 Cheat Sheet:**

    https://tutorialsdojo.com/amazon-route-53/

    

    

35. ##### 34. QUESTION

    A mobile application stores pictures in Amazon Simple Storage Service (S3) and allows application sign-in using an OpenID Connect-compatible identity provider.

    Which AWS Security Token Service approach to temporary access should you use for this scenario?

    

    - Cross-Account Access
    - AWS Identity and Access Management roles
    - Web Identity Federation
    - SAML-based Identity Federation

    

    **Correct**

    

    With web identity federation, you don’t need to create custom sign-in code or manage your own user identities. Instead, users of your app can sign in using a well-known identity provider (IdP) —such as Login with Amazon, Facebook, Google, or any other OpenID Connect (OIDC)-compatible IdP, receive an authentication token, and then exchange that token for temporary security credentials in AWS that map to an IAM role with permissions to use the resources in your AWS account. Using an IdP helps you keep your AWS account secure because you don’t have to embed and distribute long-term security credentials with your application.

     

    **Reference:**

    http://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html

     

    **Check out this AWS IAM Cheat Sheet:**

    https://tutorialsdojo.com/aws-identity-and-access-management-iam/

    

    

36. ##### 35. QUESTION

    A Solutions Architect of a multinational gaming company develops video games for PS4, Xbox One, and Nintendo Switch consoles, plus a number of mobile games for Android and iOS. Due to the wide range of their products and services, the architect proposed that they use API Gateway.

    What are the key features of API Gateway that the architect can tell to the client? (Select TWO.)

    

    - It automatically provides a query language for your APIs similar to GraphQL.
    - Enables you to run applications requiring high levels of inter-node communications at scale on AWS through its custom-built operating system (OS) bypass hardware interface.
    - Provides you with static anycast IP addresses that serve as a fixed entry point to your applications hosted in one or more AWS Regions.
    - Enables you to build RESTful APIs and WebSocket APIs that are optimized for serverless workloads.
    - You pay only for the API calls you receive and the amount of data transferred out.

    

    **Correct**

    

    **Amazon API Gateway** is a fully managed service that makes it easy for developers to create, publish, maintain, monitor, and secure APIs at any scale. With a few clicks in the AWS Management Console, you can create an API that acts as a “front door” for applications to access data, business logic, or functionality from your back-end services, such as workloads running on Amazon Elastic Compute Cloud (Amazon EC2), code running on AWS Lambda, or any web application. Since it can use AWS Lambda, you can run your APIs without servers.

    ![img](https://d1.awsstatic.com/serverless/Serverless%20Migration/Serverlesswebapp.45052e1feb8f1748d96a678311d73434599095b1.png)

    Amazon API Gateway handles all the tasks involved in accepting and processing up to hundreds of thousands of concurrent API calls, including traffic management, authorization and access control, monitoring, and API version management. Amazon API Gateway has no minimum fees or startup costs. You pay only for the API calls you receive and the amount of data transferred out.

    Hence, the correct answers are:

      ***\*– Enables you to build RESTful APIs and WebSocket APIs that are optimized for serverless workloads\****

      ***\*– You pay only for the API calls you receive and the amount of data transferred out.\****

    The option that says: ***\*It automatically provides a query language for your APIs similar to GraphQL\**** is incorrect because this is not provided by API Gateway.

    The option that says: ***\*Provides you with static anycast IP addresses that serve as a fixed entry point to your applications hosted in one or more AWS Regions\**** is incorrect because this is a capability of AWS Global Accelerator and not API Gateway.

    The option that says: ***\*Enables you to run applications requiring high levels of inter-node communications at scale on AWS through its custom-built operating system (OS) bypass hardware interface\**** is incorrect because this is a capability of Elastic Fabric Adapter and not API Gateway.

     

    **References:**

    https://aws.amazon.com/api-gateway/

    https://aws.amazon.com/api-gateway/features/

     

    **Check out this Amazon API Gateway Cheat Sheet:**

    https://tutorialsdojo.com/amazon-api-gateway/

     

    ***\*Tutorials Dojo’s AWS Certified Solutions Architect Associate Exam Study Guide:\****

    **https://tutorialsdojo.com/aws-certified-solutions-architect-associate/**

    

    

37. ##### 36. QUESTION

    A company has a decoupled application in AWS using EC2, Auto Scaling group, S3, and SQS. The Solutions Architect designed the architecture in such a way that the EC2 instances will consume the message from the SQS queue and will automatically scale up or down based on the number of messages in the queue.

    In this scenario, which of the following statements is false about SQS?

    

    - Standard queues preserve the order of messages.
    - Standard queues provide at-least-once delivery, which means that each message is delivered at least once.
    - FIFO queues provide exactly-once processing.
    - Amazon SQS can help you build a distributed application with decoupled components.

    

    **Correct**

    

    All of the answers are correct except for the option that says: ***\*Standard queues preserve the order of messages\****. Only FIFO queues can preserve the order of messages and not standard queues.

     

    **Reference:** 

    https://aws.amazon.com/sqs/faqs/

     

    **Check out this Amazon SQS Cheat Sheet:**

    https://tutorialsdojo.com/amazon-sqs/

    

    

38. ##### 37. QUESTION

    A company has a data analytics application that updates a real-time, foreign exchange dashboard and another separate application that archives data to Amazon Redshift. Both applications are configured to consume data from the same stream concurrently and independently by using Amazon Kinesis Data Streams. However, they noticed that there are a lot of occurrences where a shard iterator expires unexpectedly. Upon checking, they found out that the DynamoDB table used by Kinesis does not have enough capacity to store the lease data.

    Which of the following is the most suitable solution to rectify this issue?

    

    - Use Amazon Kinesis Data Analytics to properly support the data analytics application instead of Kinesis Data Stream.
    - Enable In-Memory Acceleration with DynamoDB Accelerator (DAX).
    - Upgrade the storage capacity of the DynamoDB table.
    - Increase the write capacity assigned to the shard table.

    

    **Incorrect**

    

    A new shard iterator is returned by every **GetRecords** request (as `NextShardIterator`), which you then use in the next **GetRecords** request (as `ShardIterator`). Typically, this shard iterator does not expire before you use it. However, you may find that shard iterators expire because you have not called **GetRecords** for more than 5 minutes, or because you’ve performed a restart of your consumer application.

    ![img](https://docs.aws.amazon.com/streams/latest/dev/images/architecture.png)

    If the shard iterator expires immediately before you can use it, this might indicate that the DynamoDB table used by Kinesis does not have enough capacity to store the lease data. This situation is more likely to happen if you have a large number of shards. To solve this problem, increase the write capacity assigned to the shard table.

    Hence, ***\*increasing the write capacity assigned to the shard table\**** is the correct answer.

    ***\*Upgrading the storage capacity of the DynamoDB table\**** is incorrect because DynamoDB is a fully managed service which automatically scales its storage, without setting it up manually. The scenario refers to the **write capacity** of the shard table as it says that the DynamoDB table used by Kinesis does not have enough *capacity* to store the lease data.

    ***\*Enabling In-Memory Acceleration with DynamoDB Accelerator (DAX)\**** is incorrect because the DAX feature is primarily used for read performance improvement of your DynamoDB table from *milliseconds* response time to *microseconds*. It does not have any relationship with Amazon Kinesis Data Stream in this scenario.

    ***\*Using Amazon Kinesis Data Analytics to properly support the data analytics application instead of Kinesis Data Stream\**** is incorrect. Although Amazon Kinesis Data Analytics can support a data analytics application, it is still not a suitable solution for this issue. You simply need to increase the write capacity assigned to the shard table in order to rectify the problem which is why switching to Amazon Kinesis Data Analytics is not necessary.

     

    **Reference:**

    https://docs.aws.amazon.com/streams/latest/dev/kinesis-record-processor-ddb.html

    https://docs.aws.amazon.com/streams/latest/dev/troubleshooting-consumers.html

     

    **Check out this Amazon Kinesis Cheat Sheet:**

    https://tutorialsdojo.com/amazon-kinesis/

    

    

39. ##### 38. QUESTION

    A commercial bank has a forex trading application. They created an Auto Scaling group of EC2 instances that allow the bank to cope with the current traffic and achieve cost-efficiency. They want the Auto Scaling group to behave in such a way that it will follow a predefined set of parameters before it scales down the number of EC2 instances, which protects the system from unintended slowdown or unavailability.

    Which of the following statements are true regarding the cooldown period? (Select TWO.)

    

    - It ensures that the Auto Scaling group launches or terminates additional EC2 instances without any downtime.
    - Its default value is 600 seconds.
    - It ensures that before the Auto Scaling group scales out, the EC2 instances have an ample time to cooldown.
    - Its default value is 300 seconds.
    - It ensures that the Auto Scaling group does not launch or terminate additional EC2 instances before the previous scaling activity takes effect.

    

    **Correct**

    

    In Auto Scaling, the following statements are correct regarding the cooldown period:

    1. It ensures that the Auto Scaling group does not launch or terminate additional EC2 instances before the previous scaling activity takes effect.
    2. Its default value is 300 seconds.
    3. It is a configurable setting for your Auto Scaling group.

    The following options are incorrect:

    ***\*– It ensures that before the Auto Scaling group scales out, the EC2 instances have ample time to cooldown.\****

    ***\*– It ensures that the Auto Scaling group launches or terminates additional EC2 instances without any downtime.\****

    ***\*– Its default value is 600 seconds.\****

    These statements are inaccurate and don’t depict what the word “cooldown” actually means for Auto Scaling. The cooldown period is a configurable setting for your Auto Scaling group that helps to ensure that it doesn’t launch or terminate additional instances before the previous scaling activity takes effect. After the Auto Scaling group dynamically scales using a simple scaling policy, it waits for the cooldown period to complete before resuming scaling activities.

    The figure below demonstrates the scaling cooldown:

    ![img](https://udemy-images.s3.amazonaws.com/redactor/raw/2018-10-23_05-13-47-8ff2ec72179862c346ba76ede3994182.png)

     

    **Reference:** 

    http://docs.aws.amazon.com/autoscaling/latest/userguide/as-instance-termination.html

     

    **Check out this AWS Auto Scaling Cheat Sheet:**

    https://tutorialsdojo.com/aws-auto-scaling/

     

    ***\*Tutorials Dojo’s AWS Certified Solutions Architect Associate Exam Study Guide:\****

    **https://tutorialsdojo.com/aws-certified-solutions-architect-associate/**

    

    

40. ##### 39. QUESTION

    A financial firm is designing an application architecture for its online trading platform that must have high availability and fault tolerance. Their Solutions Architect configured the application to use an Amazon S3 bucket located in the us-east-1 region to store large amounts of intraday financial data. The stored financial data in the bucket must not be affected even if there is an outage in one of the Availability Zones or if there's a regional service failure.

    What should the Architect do to avoid any costly service disruptions and ensure data durability?

    

    - Enable Cross-Region Replication.
    - Create a new S3 bucket in another region and configure Cross-Account Access to the bucket located in us-east-1.
    - Create a Lifecycle Policy to regularly backup the S3 bucket to Amazon Glacier.
    - Copy the S3 bucket to an EBS-backed EC2 instance.

    

    **Correct**

    

    In this scenario, you need to enable Cross-Region Replication to ensure that your S3 bucket would not be affected even if there is an outage in one of the Availability Zones or a regional service failure in us-east-1. When you upload your data in S3, your objects are redundantly stored on multiple devices across multiple facilities within the region only, where you created the bucket. Thus, if there is an outage on the entire region, your S3 bucket will be unavailable if you do not enable Cross-Region Replication, which should make your data available to another region.

     

    ![img](https://d1.awsstatic.com/product-marketing/S3/S3_Replication_Diagram.7860a04edc2ba93d290ffb9a21a9718574dc08e4.jpg)

     

    Note that an Availability Zone (AZ) is more related with Amazon EC2 instances rather than Amazon S3 so if there is any outage in the AZ, the S3 bucket is usually not affected but only the EC2 instances deployed on that zone.

    Hence, the correct answer is: ***\*Enable Cross-Region Replication.\****

    The option that says: ***\*Copy the S3 bucket to an EBS-backed EC2 instance\**** is incorrect because EBS is not as durable as Amazon S3. Moreover, if the Availability Zone where the volume is hosted goes down then the data will also be inaccessible.

    The option that says: ***\*Create a Lifecycle Policy to regularly backup the S3 bucket to Amazon Glacier\**** is incorrect because Glacier is primarily used for data archival. You also need to replicate your data to another region for better durability.

    The option that says: ***\*Create a new S3 bucket in another region and configure Cross-Account Access to the bucket located in us-east-1\**** is incorrect because Cross-Account Access in Amazon S3 is primarily used if you want to grant access to your objects to another AWS account, and not just to another AWS Region. For example, Account `MANILA` can grant another AWS account (Account `CEBU)` permission to access its resources such as buckets and objects. S3 Cross-Account Access does not replicate data from one region to another. A better solution is to enable Cross-Region Replication (CRR) instead.

     

    **References:** 

    https://aws.amazon.com/s3/faqs/

    https://aws.amazon.com/s3/features/replication/

     

    **Check out this Amazon S3 Cheat Sheet:**

    https://tutorialsdojo.com/amazon-s3/

    

    

41. ##### 40. QUESTION

    A loan processing application is hosted in a single On-Demand EC2 instance in your VPC. To improve the scalability of your application, you have to use Auto Scaling to automatically add new EC2 instances to handle a surge of incoming requests.

    Which of the following items should be done in order to add an existing EC2 instance to an Auto Scaling group? (Select TWO.)

    

    - You have to ensure that the AMI used to launch the instance still exists.
    - You have to ensure that the instance is launched in one of the Availability Zones defined in your Auto Scaling group.
    - You must stop the instance first.
    - You have to ensure that the instance is in a different Availability Zone as the Auto Scaling group.
    - You have to ensure that the AMI used to launch the instance no longer exists.

    

    **Correct**

    

    Amazon EC2 Auto Scaling provides you with an option to enable automatic scaling for one or more EC2 instances by attaching them to your existing Auto Scaling group. After the instances are attached, they become a part of the Auto Scaling group

    ![img](https://s3.amazonaws.com/chrisb/concept_diagram.jpg)

    The instance that you want to attach must meet the following criteria:

     – The instance is in the **`running`** state.

     – The AMI used to launch the instance must still exist.

     – The instance is not a member of another Auto Scaling group.

     – The instance is launched into one of the Availability Zones defined in your Auto Scaling group.

     – If the Auto Scaling group has an attached load balancer, the instance and the load balancer must both be in EC2-Classic or the same VPC. If the Auto Scaling group has an attached target group, the instance and the load balancer must both be in the same VPC.

    Based on the above criteria, the following are the correct answers among the given options:

    ***\*– You have to ensure that the AMI used to launch the instance still exists.\****

    ***\*– You have to ensure that the instance is launched in one of the Availability Zones defined in your Auto Scaling group.\****

    The option that says: ***\*You must stop the instance first\**** is incorrect because you can directly add a running EC2 instance to an Auto Scaling group without stopping it.

    The option that says: ***\*You have to ensure that the AMI used to launch the instance no longer exists\**** is incorrect because it should be the other way around. The AMI used to launch the instance should still exist.

    The option that says: ***\*You have to ensure that the instance is in a different Availability Zone as the Auto Scaling group\**** is incorrect because the instance should be launched in one of the Availability Zones defined in your Auto Scaling group.

     

    **References:** 

    http://docs.aws.amazon.com/autoscaling/latest/userguide/attach-instance-asg.html

    https://docs.aws.amazon.com/autoscaling/ec2/userguide/scaling_plan.html

     

    **Check out this AWS Auto Scaling Cheat Sheet:**

    https://tutorialsdojo.com/aws-auto-scaling/

    

    

42. ##### 41. QUESTION

    A company deployed a fleet of Windows-based EC2 instances with IPv4 addresses launched in a private subnet. Several software installed in the EC2 instances are required to be updated via the Internet.

    Which of the following services can provide the firm a highly available solution to safely allow the instances to fetch the software patches from the Internet but prevent outside network from initiating a connection?

    

    - Egress-Only Internet Gateway
    - VPC Endpoint
    - NAT Gateway
    - NAT Instance

    

    **Correct**

    

    AWS offers two kinds of NAT devices — a NAT gateway or a NAT instance. It is recommended to use NAT gateways, as they provide better availability and bandwidth over NAT instances. The NAT Gateway service is also a managed service that does not require your administration efforts. A NAT instance is launched from a NAT AMI.

    Just like a NAT instance, you can use a network address translation (NAT) gateway to enable instances in a private subnet to connect to the internet or other AWS services, but prevent the internet from initiating a connection with those instances.

    Here is a diagram showing the differences between NAT gateway and NAT instance:

    ![img](https://tutorialsdojo.com/wp-content/uploads/2018/12/Natcomparison.jpg)

    ***\*Egress-Only Internet Gateway\**** is incorrect because this is primarily used for VPCs that use IPv6 to enable instances in a private subnet to connect to the Internet or other AWS services, but prevent the Internet from initiating a connection with those instances, just like what NAT Instance and NAT Gateway do. The scenario explicitly says that the EC2 instances are using IPv4 addresses which is why Egress-only Internet gateway is invalid, even though it can provide the required high availability.

    ***\*VPC Endpoint\**** is incorrect because this simply enables you to privately connect your VPC to supported AWS services and VPC endpoint services powered by PrivateLink without requiring an Internet gateway, NAT device, VPN connection, or AWS Direct Connect connection.

    ***\*NAT Instance\**** is incorrect because although this can also enable instances in a private subnet to connect to the Internet or other AWS services and prevent the Internet from initiating a connection with those instances, it is not as highly available compared to a NAT Gateway.

     

    **References:**

    https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-nat-gateway.html

    https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-comparison.html

    https://docs.aws.amazon.com/vpc/latest/userguide/egress-only-internet-gateway.html

     

    **Check out this Amazon VPC Cheat Sheet:**

    https://tutorialsdojo.com/amazon-vpc/

    

    

43. ##### 42. QUESTION

    A company has a web application hosted on a fleet of EC2 instances located in two Availability Zones that are all placed behind an Application Load Balancer. As a Solutions Architect, you have to add a health check configuration to ensure your application is highly-available.

    Which health checks will you implement?

    

    - FTP health check
    - HTTP or HTTPS health check
    - TCP health check
    - ICMP health check

    

    **Correct**

    

    A load balancer takes requests from clients and distributes them across the EC2 instances that are registered with the load balancer. You can create a load balancer that listens to both the HTTP (80) and HTTPS (443) ports. If you specify that the HTTPS listener sends requests to the instances on port 80, the load balancer terminates the requests, and communication from the load balancer to the instances is not encrypted. If the HTTPS listener sends requests to the instances on port 443, communication from the load balancer to the instances is encrypted.

    ![img](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/images/DefineLB_Protocols_Backend_Auth.png)

    If your load balancer uses an encrypted connection to communicate with the instances, you can optionally enable authentication of the instances. This ensures that the load balancer communicates with an instance only if its public key matches the key that you specified to the load balancer for this purpose.

    The type of ELB that is mentioned in this scenario is an Application Elastic Load Balancer. This is used if you want a flexible feature set for your web applications with HTTP and HTTPS traffic. Conversely, it only allows 2 types of health check: HTTP and HTTPS.

    Hence, the correct answer is: ***\*HTTP or HTTPS health check.\****

    ***\*ICMP health check\**** and ***\*FTP health check\**** are incorrect as these are not supported.

    ***\*TCP health check\**** is incorrect. A TCP health check is only offered in Network Load Balancers and Classic Load Balancers.

     

    **References:**

    http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-healthchecks.html

    https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html

     

    **Check out this AWS Elastic Load Balancing (ELB) Cheat Sheet:**

    https://tutorialsdojo.com/aws-elastic-load-balancing-elb/

     

    **EC2 Instance Health Check vs ELB Health Check vs Auto Scaling and Custom Health Check:**

    https://tutorialsdojo.com/ec2-instance-health-check-vs-elb-health-check-vs-auto-scaling-and-custom-health-check/

     

    **Comparison of AWS Services Cheat Sheets:**

    https://tutorialsdojo.com/comparison-of-aws-services/

    

    

44. ##### 43. QUESTION

    You are automating the creation of EC2 instances in your VPC. Hence, you wrote a python script to trigger the Amazon EC2 API to request 50 EC2 instances in a single Availability Zone. However, you noticed that after 20 successful requests, subsequent requests failed.

    What could be a reason for this issue and how would you resolve it?

    

    - By default, AWS allows you to provision a maximum of 20 instances per region. Select a different region and retry the failed request.
    - There is a vCPU-based On-Demand Instance limit per region which is why subsequent requests failed. Just submit the limit increase form to AWS and retry the failed requests once approved.
    - By default, AWS allows you to provision a maximum of 20 instances per Availability Zone. Select a different Availability Zone and retry the failed request.
    - There was an issue with the Amazon EC2 API. Just resend the requests and these will be provisioned successfully.

    

    **Correct**

    

    You are limited to running On-Demand Instances per your vCPU-based On-Demand Instance limit, purchasing 20 Reserved Instances, and requesting Spot Instances per your dynamic Spot limit per region. New AWS accounts may start with limits that are lower than the limits described here.

    ![img](https://udemy-images.s3.amazonaws.com/redactor/raw/2020-03-15_09-51-18-76e919b00bf7a410f5577b967586a4b0.png)

    If you need more instances, complete the Amazon EC2 limit increase request form with your use case, and your limit increase will be considered. Limit increases are tied to the region they were requested for.

    Hence, the correct answer is: ***\*There is a vCPU-based On-Demand Instance limit per region which is why subsequent requests failed. Just submit the limit increase form to AWS and retry the failed requests once approved.\****

    The option that says: ***\*There was an issue with the Amazon EC2 API. Just resend the requests and these will be provisioned successfully\**** is incorrect because you are limited to running On-Demand Instances per your vCPU-based On-Demand Instance limit. There is also a limit of purchasing 20 Reserved Instances, and requesting Spot Instances per your dynamic Spot limit per region hence, there is no problem with the EC2 API.

    The option that says: ***\*By default, AWS allows you to provision a maximum of 20 instances per region. Select a different region and retry the failed request\**** is incorrect. There is no need to select a different region since this limit can be increased after submitting a request form to AWS.

    The option that says: ***\*By default, AWS allows you to provision a maximum of 20 instances per Availability Zone. Select a different Availability Zone and retry the failed request\**** is incorrect because the vCPU-based On-Demand Instance limit is set per region and not per Availability Zone. This can be increased after submitting a request form to AWS.

     

    **References:** 

    https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_ec2

    https://aws.amazon.com/ec2/faqs/#How_many_instances_can_I_run_in_Amazon_EC2

     

    ***\*Amazon EC2 Overview:\****

    

    <iframe title="YouTube video player" src="https://www.youtube.com/embed/7VsGIHT_jQE" frameborder="0" allowfullscreen="allowfullscreen" name="fitvid5" style="box-sizing: border-box; margin: 0px; position: absolute; top: 0px; left: 0px; width: 853.75px; height: 480.234px;"></iframe>

    

    **Check out this Amazon EC2 Cheat Sheet:**

    https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/

    

    

45. ##### 44. QUESTION

    A popular mobile game uses CloudFront, Lambda, and DynamoDB for its backend services. The player data is persisted on a DynamoDB table and the static assets are distributed by CloudFront. However, there are a lot of complaints that saving and retrieving player information is taking a lot of time.

    To improve the game's performance, which AWS service can you use to reduce DynamoDB response times from milliseconds to microseconds?

    

    - AWS Device Farm
    - Amazon ElastiCache
    - DynamoDB Auto Scaling
    - Amazon DynamoDB Accelerator (DAX)

    

    **Correct**

    

    Amazon DynamoDB Accelerator (DAX) is a fully managed, highly available, in-memory cache that can reduce Amazon DynamoDB response times from milliseconds to microseconds, even at millions of requests per second.

    ![img](https://d2908q01vomqb2.cloudfront.net/887309d048beef83ad3eabf2a79a64a389ab1c9f/2017/06/28/ReadThroughCache-1.png)

    ***\*Amazon ElastiCache\**** is incorrect because although you may use ElastiCache as your database cache, it will not reduce the DynamoDB response time from milliseconds to microseconds as compared with DynamoDB DAX.

    ***\*AWS Device Farm\**** is incorrect because this is an app testing service that lets you test and interact with your Android, iOS, and web apps on many devices at once, or reproduce issues on a device in real time.

    ***\*DynamoDB Auto Scaling\**** is incorrect because this is primarily used to automate capacity management for your tables and global secondary indexes.

     

    **References:**

    https://aws.amazon.com/dynamodb/dax

    https://aws.amazon.com/device-farm

     

    **Check out this Amazon DynamoDB Cheat Sheet:**

    https://tutorialsdojo.com/amazon-dynamodb/

    

    

46. ##### 45. QUESTION

    A Solutions Architect needs to deploy a mobile application that can collect votes for a popular singing competition. Millions of users from around the world will submit votes using their mobile phones. These votes must be collected and stored in a highly scalable and highly available data store which will be queried for real-time ranking.

    Which of the following combination of services should the architect use to meet this requirement?

    

    - Amazon Aurora and Amazon Cognito
    - Amazon Relational Database Service (RDS) and Amazon MQ
    - Amazon Redshift and AWS Mobile Hub
    - Amazon DynamoDB and AWS AppSync

    

    **Correct**

    

    When the word durability pops out, the first service that should come to your mind is Amazon S3. Since this service is not available in the answer options, we can look at the other data store available which is Amazon DynamoDB.

    ![img](https://d2908q01vomqb2.cloudfront.net/0a57cb53ba59c46fc4b692527a38a87c78d84028/2019/08/21/Untitled1-1024x467.png)

    ***\*DynamoDB\**** is durable, scalable, and highly available data store which can be used for real-time tabulation. You can also use ***\*AppSync\**** with DynamoDB to make it easy for you to build collaborative apps that keep shared data updated in real time. You just specify the data for your app with simple code statements and AWS AppSync manages everything needed to keep the app data updated in real time. This will allow your app to access data in Amazon DynamoDB, trigger AWS Lambda functions, or run Amazon Elasticsearch queries and combine data from these services to provide the exact data you need for your app.

    ***\*Amazon Redshift and AWS Mobile Hub\**** are incorrect as Amazon Redshift is mainly used as a data warehouse and for online analytic processing (*OLAP*). Although this service can be used for this scenario, DynamoDB is still the top choice given its better durability and scalability.

    ***\*Amazon Relational Database Service (RDS) and Amazon MQ\**** and ***\*Amazon Aurora and Amazon Cognito\**** are possible answers in this scenario, however, DynamoDB is much more suitable for simple mobile apps that do not have complicated data relationships compared with enterprise web applications. It is stated in the scenario that the mobile app will be used from around the world, which is why you need a data storage service which can be supported globally. It would be a management overhead to implement multi-region deployment for your RDS and Aurora database instances compared to using the Global table feature of DynamoDB.

     

    **References:** 

    https://aws.amazon.com/dynamodb/faqs/

    https://aws.amazon.com/appsync/

     

    ***\*Amazon DynamoDB Overview:\****

    

    <iframe title="YouTube video player" src="https://www.youtube.com/embed/3ZOyUNIeorU" frameborder="0" allowfullscreen="allowfullscreen" data-mce-fragment="1" name="fitvid6" style="box-sizing: border-box; margin: 0px; position: absolute; top: 0px; left: 0px; width: 853.75px; height: 480.234px;"></iframe>

    

    **Check out this Amazon DynamoDB Cheat Sheet:**

    https://tutorialsdojo.com/amazon-dynamodb/

     

    ***\*Tutorials Dojo’s AWS Certified Solutions Architect Associate Exam Study Guide:\****

    **https://tutorialsdojo.com/aws-certified-solutions-architect-associate/**

    

    

47. ##### 46. QUESTION

    A company is setting up a cloud architecture for an international money transfer service to be deployed in AWS which will have thousands of users around the globe. The service should be available 24/7 to avoid any business disruption and should be resilient enough to handle the outage of an entire AWS region. To meet this requirement, the Solutions Architect has deployed their AWS resources to multiple AWS Regions. He needs to use Route 53 and configure it to set all of the resources to be available all the time as much as possible. When a resource becomes unavailable, Route 53 should detect that it's unhealthy and stop including it when responding to queries.

    Which of the following is the most fault-tolerant routing configuration that the Solutions Architect should use in this scenario?

    

    - Configure an Active-Active Failover with Weighted routing policy.
    - Configure an Active-Passive Failover with Weighted Records.
    - Configure an Active-Active Failover with One Primary and One Secondary Resource.
    - Configure an Active-Passive Failover with Multiple Primary and Secondary Resources.

    

    **Incorrect**

    

    You can use **Route 53 health checking** to configure active-active and active-passive failover configurations. You configure active-active failover using any routing policy (or combination of routing policies) other than failover, and you configure active-passive failover using the failover routing policy.

    ![img](https://media.tutorialsdojo.com/AWS-Route53-Weighted.PNG)

    **Active-Active Failover**

    Use this failover configuration when you want all of your resources to be available the majority of the time. When a resource becomes unavailable, Route 53 can detect that it’s unhealthy and stop including it when responding to queries.

    In active-active failover, all the records that have the same name, the same type (such as A or AAAA), and the same routing policy (such as weighted or latency) are active unless Route 53 considers them unhealthy. Route 53 can respond to a DNS query using any healthy record.

    **Active-Passive Failover**

    Use an active-passive failover configuration when you want a primary resource or group of resources to be available the majority of the time and you want a secondary resource or group of resources to be on standby in case all the primary resources become unavailable. When responding to queries, Route 53 includes only the healthy primary resources. If all the primary resources are unhealthy, Route 53 begins to include only the healthy secondary resources in response to DNS queries.

    ***\*Configuring an Active-Passive Failover with Weighted Records\**** and ***\*configuring an Active-Passive Failover with Multiple Primary and Secondary Resources\**** are incorrect because an Active-Passive Failover is mainly used when you want a primary resource or group of resources to be available most of the time and you want a secondary resource or group of resources to be on standby in case all the primary resources become unavailable. In this scenario, all of your resources should be available all the time as much as possible which is why you have to use an Active-Active Failover instead.

    ***\*Configuring an Active-Active Failover with One Primary and One Secondary Resource\**** is incorrect because you cannot set up an Active-Active Failover with One Primary and One Secondary Resource. Remember that an Active-Active Failover uses all available resources all the time without a primary nor a secondary resource.

     

    **References:**

    https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-types.html

    https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html

    https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-configuring.html

     

    ***\*Amazon Route 53 Overview:\****

    

    <iframe title="YouTube video player" src="https://www.youtube.com/embed/Su308t19ubY" frameborder="0" allowfullscreen="allowfullscreen" data-mce-fragment="1" name="fitvid7" style="box-sizing: border-box; margin: 0px; position: absolute; top: 0px; left: 0px; width: 853.75px; height: 480.234px;"></iframe>

    

    **Check out this Amazon Route 53 Cheat Sheet:**

    https://tutorialsdojo.com/amazon-route-53/

    

    

48. ##### 47. QUESTION

    A company launched an online platform that allows people to easily buy, sell, spend, and manage their cryptocurrency. To meet the strict IT audit requirements, each of the API calls on all of the AWS resources should be properly captured and recorded. You used CloudTrail in the VPC to help you in the compliance, operational auditing, and risk auditing of your AWS account.

    In this scenario, where does CloudTrail store all of the logs that it creates?

    

    - Amazon S3
    - DynamoDB
    - Amazon Redshift
    - A RDS instance

    

    **Correct**

    

    CloudTrail is enabled on your AWS account when you create it. When activity occurs in your AWS account, that activity is recorded in a CloudTrail event. You can easily view events in the CloudTrail console by going to **Event history**.

    ![img](https://media.amazonwebservices.com/blog/2014/cloudtrail_flow_9.png)

    Event history allows you to view, search, and download the past 90 days of supported activity in your AWS account. In addition, you can create a CloudTrail trail to further archive, analyze, and respond to changes in your AWS resources. A trail is a configuration that enables delivery of events to an Amazon S3 bucket that you specify. You can also deliver and analyze events in a trail with Amazon CloudWatch Logs and Amazon CloudWatch Events. You can create a trail with the CloudTrail console, the AWS CLI, or the CloudTrail API.

    The rest of the answers are incorrect. ***\*DynamoDB\**** and ***\*an RDS instance\**** are for database; ***\*Amazon Redshift\**** is used for data warehouse that scales horizontally and allows you to store terabytes and petabytes of data.

     

    **References:**

    https://docs.aws.amazon.com/awscloudtrail/latest/userguide/how-cloudtrail-works.html

    https://aws.amazon.com/cloudtrail/

     

    **Check out this AWS CloudTrail Cheat Sheet:**

    https://tutorialsdojo.com/aws-cloudtrail/

    

    

49. ##### 48. QUESTION

    A financial application is composed of an Auto Scaling group of EC2 instances, an Application Load Balancer, and a MySQL RDS instance in a Multi-AZ Deployments configuration. To protect the confidential data of your customers, you have to ensure that your RDS database can only be accessed using the profile credentials specific to your EC2 instances via an authentication token.

    As the Solutions Architect of the company, which of the following should you do to meet the above requirement?

    

    - Use a combination of IAM and STS to restrict access to your RDS instance via a temporary token.
    - Enable the IAM DB Authentication.
    - Configure SSL in your application to encrypt the database connection to RDS.
    - Create an IAM Role and assign it to your EC2 instances which will grant exclusive access to your RDS instance.

    

    **Correct**

    

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

    

    

50. ##### 49. QUESTION

    A FinTech startup deployed an application on an Amazon EC2 instance with attached Instance Store volumes and an Elastic IP address. The server is only accessed from 8 AM to 6 PM and can be stopped from 6 PM to 8 AM for cost efficiency using Lambda with the script that automates this based on tags.

    Which of the following will occur when the EC2 instance is stopped and started? (Select TWO.)

    

    - The Elastic IP address is disassociated with the instance.
    - The ENI (Elastic Network Interface) is detached.
    - There will be no changes.
    - All data on the attached instance-store devices will be lost.
    - The underlying host for the instance is possibly changed.

    

    **Correct**

    

    This question did not mention the specific type of EC2 instance, however, it says that it will be stopped and started. Since only EBS-backed instances can be stopped and restarted, it is implied that the instance is EBS-backed. Remember that an instance store-backed instance can only be rebooted or terminated and its data will be erased if the EC2 instance is either stopped or terminated.

    If you stopped an EBS-backed EC2 instance, the volume is preserved but the data in any attached instance store volume will be erased. Keep in mind that an EC2 instance has an underlying physical host computer. If the instance is stopped, AWS usually moves the instance to a new host computer. Your instance may stay on the same host computer if there are no problems with the host computer. In addition, its Elastic IP address is disassociated from the instance if it is an EC2-Classic instance. Otherwise, if it is an EC2-VPC instance, the Elastic IP address remains associated.

    ![img](https://media.tutorialsdojo.com/instance-store.jpg)

    Take note that an EBS-backed EC2 instance can have attached Instance Store volumes. This is the reason why there is an option that mentions the Instance Store volume, which is placed to test your understanding of this specific storage type. You can launch an EBS-backed EC2 instance and attach several Instance Store volumes but remember that there are some EC2 Instance types that don’t support this kind of set up.

    ![img](https://i.udemycdn.com/redactor/raw/2019-10-16_01-35-42-f950780385f80190983945145e5d62b5.png)

    Hence, the correct answers are:

    ***\*– The underlying host for the instance is possibly changed.\****

    ***\*– All data on the attached instance-store devices will be lost.\****

    The option that says: ***\*The ENI (Elastic Network Interface) is detached\**** is incorrect because the ENI will stay attached even if you stopped your EC2 instance.

    The option that says: ***\*The Elastic IP address is disassociated with the instance\**** is incorrect because the EIP will actually remain associated with your instance even after stopping it.

    The option that says: ***\*There will be no changes\**** is incorrect because there will be a lot of possible changes in your EC2 instance once you stop and start it again. AWS may move the virtualized EC2 instance to another host computer; the instance may get a new public IP address, and the data in your attached instance store volumes will be deleted.

     

    **References:**

    http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html#storage-for-the-root-device

     

    **Check out this Amazon EC2 Cheat Sheet:**

    https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/

     

    **Tutorials Dojo’s AWS Certified Solutions Architect Associate Exam Study Guide:**

    https://tutorialsdojo.com/aws-certified-solutions-architect-associate-saa-c02/

    

    

51. ##### 50. QUESTION

    A data analytics startup is collecting clickstream data and stores them in an S3 bucket. You need to launch an AWS Lambda function to trigger the ETL jobs to run as soon as new data becomes available in Amazon S3.

    Which of the following services can you use as an extract, transform, and load (ETL) service in this scenario?

    

    - S3 Select
    - AWS Step Functions
    - AWS Glue
    - Redshift Spectrum

    

    **Correct**

    

    ***\*AWS Glue\**** is a fully managed extract, transform, and load (ETL) service that makes it easy for customers to prepare and load their data for analytics. You can create and run an ETL job with a few clicks in the AWS Management Console. You simply point AWS Glue to your data stored on AWS, and AWS Glue discovers your data and stores the associated metadata (e.g. table definition and schema) in the AWS Glue Data Catalog. Once cataloged, your data is immediately searchable, queryable, and available for ETL. AWS Glue generates the code to execute your data transformations and data loading processes.

    ![img](https://d1.awsstatic.com/Products/product-name/diagrams/product-page-diagram_Glue_Event-driven-ETL-Pipelines.e24d59bb79a9e24cdba7f43ffd234ec0482a60e2.png)

     

    **Reference:**

    https://aws.amazon.com/glue/

     

    **Check out this AWS Glue Cheat Sheet:**

    https://tutorialsdojo.com/aws-glue/

    

    

52. ##### 51. QUESTION

    A company plans to migrate a NoSQL database to an EC2 instance. The database is configured to replicate the data automatically to keep multiple copies of data for redundancy. The Solutions Architect needs to launch an instance that has a high IOPS and sequential read/write access.

    Which of the following options fulfills the requirement if I/O throughput is the highest priority?

    

    - Use Memory optimized instances with EBS volume.
    - Use Compute optimized instance with instance store volume.
    - Use General purpose instances with EBS volume.
    - Use Storage optimized instances with instance store volume.

    

    **Correct**

    

    **Amazon EC2** provides a wide selection of instance types optimized to fit different use cases. Instance types comprise varying combinations of CPU, memory, storage, and networking capacity and give you the flexibility to choose the appropriate mix of resources for your applications. Each instance type includes one or more instance sizes, allowing you to scale your resources to the requirements of your target workload.

    ![img](https://media.tutorialsdojo.com/AWS-Instance-Types.png)

    A storage optimized instance is designed for workloads that require high, sequential read and write access to very large data sets on local storage. They are optimized to deliver tens of thousands of low-latency, random I/O operations per second (IOPS) to applications. Some instance types can drive more I/O throughput than what you can provision for a single EBS volume. You can join multiple volumes together in a RAID 0 configuration to use the available bandwidth for these instances.

    Based on the given scenario, the NoSQL database will be migrated to an EC2 instance. The suitable instance type for NoSQL database is I3 and I3en instances. Also, the primary data storage for I3 and I3en instances is non-volatile memory express (NVMe) SSD instance store volumes. Since the data is replicated automatically, there will be no problem using an instance store volume.

    Hence, the correct answer is: ***\*Use Storage optimized instances with instance store volume.\****

    The option that says: ***\*Use Compute optimized instances with instance store volume\**** is incorrect because this type of instance is ideal for compute-bound applications that benefit from high-performance processors. It is not suitable for a NoSQL database.

    The option that says: ***\*Use General purpose instances with EBS volume\**** is incorrect because this instance only provides a balance of computing, memory, and networking resources. Take note that the requirement in the scenario is high sequential read and write access. Therefore, you must use a storage optimized instance.

    The option that says: ***\*Use Memory optimized instances with EBS volume\**** is incorrect. Although this type of instance is suitable for a NoSQL database, it is not designed for workloads that require high, sequential read and write access to very large data sets on local storage.

     

    **References:**

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/storage-optimized-instances.html

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html

     

    ***\*Amazon EC2 Overview:\****

    

    <iframe title="YouTube video player" src="https://www.youtube.com/embed/7VsGIHT_jQE" frameborder="0" allowfullscreen="allowfullscreen" name="fitvid8" style="box-sizing: border-box; margin: 0px; position: absolute; top: 0px; left: 0px; width: 853.75px; height: 480.234px;"></iframe>

    

    **Check out this Amazon EC2 Cheat Sheet:**

    https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/

    

    

53. ##### 52. QUESTION

    A company is receiving semi-structured and structured data from different sources every day. The Solutions Architect plans to use big data processing frameworks to analyze vast amounts of data and access it using various business intelligence tools and standard SQL queries.

    Which of the following provides the MOST high-performing solution that fulfills this requirement?

    

    - Create an Amazon EMR cluster and store the processed data in Amazon Redshift.
    - Use Amazon Kinesis Data Analytics and store the processed data in Amazon DynamoDB.
    - Use AWS Glue and store the processed data in Amazon S3.
    - Create an Amazon EC2 instance and store the processed data in Amazon EBS.

    

    **Correct**

    

    **Amazon EMR** is a managed cluster platform that simplifies running big data frameworks, such as Apache Hadoop and Apache Spark, on AWS to process and analyze vast amounts of data. By using these frameworks and related open-source projects, such as Apache Hive and Apache Pig, you can process data for analytics purposes and business intelligence workloads. Additionally, you can use Amazon EMR to transform and move large amounts of data into and out of other AWS data stores and databases.

    Amazon Redshift is the most widely used cloud data warehouse. It makes it fast, simple and cost-effective to analyze all your data using standard SQL and your existing Business Intelligence (BI) tools. It allows you to run complex analytic queries against terabytes to petabytes of structured and semi-structured data, using sophisticated query optimization, columnar storage on high-performance storage, and massively parallel query execution.

    ![img](https://media.tutorialsdojo.com/AWS-EMR-Redshift-Services.png)

    The key phrases in the scenario are “big data processing frameworks” and “various business intelligence tools and standard SQL queries” to analyze the data. To leverage big data processing frameworks, you need to use Amazon EMR. The cluster will perform data transformations (ETL) and load the processed data into Amazon Redshift for analytic and business intelligence applications.

    Hence, the correct answer is: ***\*Create an Amazon EMR cluster and store the processed data in Amazon Redshift.\****

    The option that says: ***\*Use AWS Glue and store the processed data in Amazon S3\**** is incorrect because AWS Glue is just a serverless ETL service that crawls your data, builds a data catalog, performs data preparation, data transformation, and data ingestion. It won’t allow you to utilize different big data frameworks effectively, unlike Amazon EMR. In addition, the S3 Select feature in Amazon S3 can only run simple SQL queries against a subset of data from a specific S3 object. To perform queries in the S3 bucket, you need to use Amazon Athena.

    The option that says: ***\*Use Amazon Kinesis Data Analytics and store the processed data in Amazon DynamoDB\**** is incorrect because Amazon DynamoDB doesn’t fully support the use of standard SQL and Business Intelligence (BI) tools, unlike Amazon Redshift. It also doesn’t allow you to run complex analytic queries against terabytes to petabytes of structured and semi-structured data.

    The option that says: ***\*Create an Amazon EC2 instance and store the processed data in Amazon EBS\**** is incorrect because a single EBS-backed EC2 instance is quite limited in its computing capability. Moreover, it also entails an administrative overhead since you have to manually install and maintain the big data frameworks for the EC2 instance yourself. The most suitable solution to leverage big data frameworks is to use EMR clusters.

     

    **References:** 

    https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-what-is-emr.html

    https://docs.aws.amazon.com/redshift/latest/dg/loading-data-from-emr.html

     

    **Check out this Amazon EMR Cheat Sheet:**

    https://tutorialsdojo.com/amazon-emr/

    

    

54. ##### 53. QUESTION

    A newly hired Solutions Architect is assigned to manage a set of CloudFormation templates that are used in the company's cloud architecture in AWS. The Architect accessed the templates and tried to analyze the configured IAM policy for an S3 bucket.

    ```
    { 
     "Version": "2012-10-17", 
     "Statement": [ 
      { 
       "Effect": "Allow", 
       "Action": [ 
        "s3:Get*", 
        "s3:List*" 
      ], 
      "Resource": "*" 
     }, 
     { 
       "Effect": "Allow", 
       "Action": "s3:PutObject", 
       "Resource": "arn:aws:s3:::boracay/*" 
      } 
     ] 
    }
    ```

    What does the above IAM policy allow? (Select THREE.)

    

    - An IAM user with this IAM policy is allowed to read objects from all S3 buckets owned by the account.
    - An IAM user with this IAM policy is allowed to read objects in the `boracay` S3 bucket but not allowed to list the objects in the bucket.
    - An IAM user with this IAM policy is allowed to read and delete objects from the `boracay` S3 bucket.
    - An IAM user with this IAM policy is allowed to write objects into the `boracay` S3 bucket.
    - An IAM user with this IAM policy is allowed to read objects from the `boracay` S3 bucket.
    - An IAM user with this IAM policy is allowed to change access rights for the `boracay` S3 bucket.

    

    **Correct**

    

    You manage access in AWS by creating policies and attaching them to IAM identities (users, groups of users, or roles) or AWS resources. A policy is an object in AWS that, when associated with an identity or resource, defines their permissions. AWS evaluates these policies when an IAM principal (user or role) makes a request. Permissions in the policies determine whether the request is allowed or denied. Most policies are stored in AWS as JSON documents. AWS supports six types of policies: identity-based policies, resource-based policies, permissions boundaries, AWS Organizations SCPs, ACLs, and session policies.

    IAM policies define permissions for action regardless of the method that you use to perform the operation. For example, if a policy allows the [GetUser](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetUser.html) action, then a user with that policy can get user information from the AWS Management Console, the AWS CLI, or the AWS API. When you create an IAM user, you can choose to allow console or programmatic access. If console access is allowed, the IAM user can sign in to the console using a user name and password. Or if programmatic access is allowed, the user can use access keys to work with the CLI or API.

    ![img](https://dmhnzl5mp9mj6.cloudfront.net/security_awsblog/images/CC_Diagram1_0717.png)

    Based on the provided IAM policy, the user is only allowed to get, write, and list all of the objects for the `boracay` s3 bucket. The `s3:PutObject` basically means that you can submit a PUT object request to the S3 bucket to store data.

    Hence, the correct answers are:

    ***\*– An IAM user with this IAM policy is allowed to read objects from all S3 buckets owned by the account.\****

    ***\*– An IAM user with this IAM policy is allowed to write objects into the `boracay` S3 bucket.\****

    ***\*– An IAM user with this IAM policy is allowed to read objects from the `boracay` S3 bucket.\****

    The option that says: ***\*An IAM user with this IAM policy is allowed to change access rights for the `boracay` S3 bucket\**** is incorrect because the template does not have any statements which allow the user to change access rights in the bucket.

    The option that says: ***\*An IAM user with this IAM policy is allowed to read objects in the `boracay` S3 bucket but not allowed to list the objects in the bucket\**** is incorrect because it can clearly be seen in the template that there is a `s3:List*` which permits the user to list objects.

    The option that says: ***\*An IAM user with this IAM policy is allowed to read and delete objects from the `boracay` S3 bucket\**** is incorrect. Although you can read objects from the bucket, you cannot delete any objects.

     

    **References:**

    https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectOps.html

    https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html

     

    **Check out this Amazon S3 Cheat Sheet:**

    https://tutorialsdojo.com/amazon-s3/

    

    

55. ##### 54. QUESTION

    A company deployed an online enrollment system database on a prestigious university, which is hosted in RDS. The Solutions Architect is required to monitor the database metrics in Amazon CloudWatch to ensure the availability of the enrollment system.

    What are the enhanced monitoring metrics that Amazon CloudWatch gathers from Amazon RDS DB instances which provide more accurate information? (Select TWO.)

    

    - CPU Utilization
    - Database Connections
    - Freeable Memory
    - OS processes
    - RDS child processes

    

    **Correct**

    

    **Amazon RDS** provides metrics in real time for the operating system (OS) that your DB instance runs on. You can view the metrics for your DB instance using the console, or consume the Enhanced Monitoring JSON output from CloudWatch Logs in a monitoring system of your choice.

    **CloudWatch** gathers metrics about CPU utilization from the hypervisor for a DB instance, and Enhanced Monitoring gathers its metrics from an agent on the instance. As a result, you might find differences between the measurements, because the hypervisor layer performs a small amount of work. The differences can be greater if your DB instances use smaller instance classes, because then there are likely more virtual machines (VMs) that are managed by the hypervisor layer on a single physical instance. Enhanced Monitoring metrics are useful when you want to see how different processes or threads on a DB instance use the CPU.

    ![img](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/images/metrics1.png)

    In RDS, the Enhanced Monitoring metrics shown in the Process List view are organized as follows:

    **RDS child processes** – Shows a summary of the RDS processes that support the DB instance, for example `aurora` for Amazon Aurora DB clusters and `mysqld` for MySQL DB instances. Process threads appear nested beneath the parent process. Process threads show CPU utilization only as other metrics are the same for all threads for the process. The console displays a maximum of 100 processes and threads. The results are a combination of the top CPU consuming and memory consuming processes and threads. If there are more than 50 processes and more than 50 threads, the console displays the top 50 consumers in each category. This display helps you identify which processes are having the greatest impact on performance.

    ***\*RDS processes\**** – Shows a summary of the resources used by the RDS management agent, diagnostics monitoring processes, and other AWS processes that are required to support RDS DB instances.

    ***\*OS processes\**** – Shows a summary of the kernel and system processes, which generally have minimal impact on performance.

    ***\*CPU Utilization, Database Connections,\**** and ***\*Freeable Memory\**** are incorrect because these are just the regular items provided by Amazon RDS Metrics in CloudWatch. Remember that the scenario is asking for the Enhanced Monitoring metrics.

     

    **References:** 

    https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/rds-metricscollected.html

    https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html#USER_Monitoring.OS.CloudWatchLogs

     

    **Check out this Amazon CloudWatch Cheat Sheet:**

    https://tutorialsdojo.com/amazon-cloudwatch/

     

    **Check out this Amazon RDS Cheat Sheet:**

    https://tutorialsdojo.com/amazon-relational-database-service-amazon-rds/

    

    

56. ##### 55. QUESTION

    A web application hosted in an Auto Scaling group of EC2 instances in AWS. The application receives a burst of traffic every morning, and a lot of users are complaining about request timeouts. The EC2 instance takes 1 minute to boot up before it can respond to user requests. The cloud architecture must be redesigned to better respond to the changing traffic of the application.

    How should the Solutions Architect redesign the architecture?

    

    - Create a Network Load Balancer with slow-start mode.
    - Create a new launch template and upgrade the size of the instance.
    - Create a step scaling policy and configure an instance warm-up time condition.
    - Create a CloudFront distribution and set the EC2 instance as the origin.

    

    **Correct**

    

    **Amazon EC2 Auto Scaling** helps you maintain application availability and allows you to automatically add or remove EC2 instances according to conditions you define. You can use the fleet management features of EC2 Auto Scaling to maintain the health and availability of your fleet. You can also use the dynamic and predictive scaling features of EC2 Auto Scaling to add or remove EC2 instances. Dynamic scaling responds to changing demand and predictive scaling automatically schedules the right number of EC2 instances based on predicted demand. Dynamic scaling and predictive scaling can be used together to scale faster.

    ![img](https://media.tutorialsdojo.com/autoscaling-instance-warmup-time.png)

    Step scaling applies “step adjustments” which means you can set multiple actions to vary the scaling depending on the size of the alarm breach. When you create a step scaling policy, you can also specify the number of seconds that it takes for a newly launched instance to warm up.

    Hence, the correct answer is: ***\*Create a step scaling policy and configure an instance warm-up time condition.\****

    The option that says: ***\*Create a Network Load Balancer with slow start mode\**** is incorrect because Network Load Balancer does not support slow start mode. If you need to enable slow start mode, you should use Application Load Balancer.

    The option that says: ***\*Create a new launch template and upgrade the size of the instance\**** is incorrect because a larger instance does not always improve the boot time. Instead of upgrading the instance, you should create a step scaling policy and add a warm-up time.

    The option that says: ***\*Create a CloudFront distribution and set the EC2 instance as the origin\**** is incorrect because this approach only resolves the traffic latency. Take note that the requirement in the scenario is to resolve the timeout issue and not the traffic latency.

     

    **References:**

    https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html

    https://aws.amazon.com/ec2/autoscaling/faqs/

     

    **Check out these AWS Cheat Sheets:**

    https://tutorialsdojo.com/aws-auto-scaling/

    https://tutorialsdojo.com/step-scaling-vs-simple-scaling-policies-in-amazon-ec2/

    

    

57. ##### 56. QUESTION

    A company is planning to deploy a High Performance Computing (HPC) cluster in its VPC that requires a scalable, high-performance file system. The storage service must be optimized for efficient workload processing, and the data must be accessible via a fast and scalable file system interface. It should also work natively with Amazon S3 that enables you to easily process your S3 data with a high-performance POSIX interface.

    Which of the following is the MOST suitable service that you should use for this scenario?

    

    - Amazon Elastic Block Storage (EBS)
    - Amazon FSx for Lustre
    - Amazon FSx for Windows File Server
    - Amazon Elastic File System (EFS)

    

    **Correct**

    

    **Amazon FSx for Lustre** provides a high-performance file system optimized for fast processing of workloads such as machine learning, high performance computing (HPC), video processing, financial modeling, and electronic design automation (EDA). These workloads commonly require data to be presented via a fast and scalable file system interface, and typically have data sets stored on long-term data stores like Amazon S3.

    Operating high-performance file systems typically require specialized expertise and administrative overhead, requiring you to provision storage servers and tune complex performance parameters. With Amazon FSx, you can launch and run a file system that provides sub-millisecond access to your data and allows you to read and write data at speeds of up to hundreds of gigabytes per second of throughput and millions of IOPS.

    Amazon FSx for Lustre works natively with Amazon S3, making it easy for you to process cloud data sets with high-performance file systems. When linked to an S3 bucket, an FSx for Lustre file system transparently presents S3 objects as files and allows you to write results back to S3. You can also use FSx for Lustre as a standalone high-performance file system to burst your workloads from on-premises to the cloud. By copying on-premises data to an FSx for Lustre file system, you can make that data available for fast processing by compute instances running on AWS. With Amazon FSx, you pay for only the resources you use. There are no minimum commitments, upfront hardware or software costs, or additional fees.

     

    ![img](https://d1.awsstatic.com/r2018/b/FSX-Lustre/FSx_Lustre_diagram.9f3f9ca4ea7827b296033b17f885543d4c3ca778.png)

     

    For Windows-based applications, Amazon FSx provides fully managed Windows file servers with features and performance optimized for “lift-and-shift” business-critical application workloads including home directories (user shares), media workflows, and ERP applications. It is accessible from Windows and Linux instances via the SMB protocol. If you have Linux-based applications, Amazon EFS is a cloud-native fully managed file system that provides simple, scalable, elastic file storage accessible from Linux instances via the NFS protocol.

    For compute-intensive and fast processing workloads, like high-performance computing (HPC), machine learning, EDA, and media processing, Amazon FSx for Lustre, provides a file system that’s optimized for performance, with input and output stored on Amazon S3.

    Hence, the correct answer is: ***\*Amazon FSx for Lustre\**\*.\***

    ***\*Amazon Elastic File System (EFS)\**** is incorrect because although the EFS service can be used for HPC applications, it doesn’t natively work with Amazon S3. It doesn’t have the capability to easily process your S3 data with a high-performance POSIX interface, unlike Amazon FSx for Lustre.

    ***\*Amazon FSx for Windows File Server\**** is incorrect because although this service is a type of Amazon FSx, it does not work natively with Amazon S3. This service is a fully managed native Microsoft Windows file system that is primarily used for your Windows-based applications that require shared file storage to AWS.

    ***\*Amazon Elastic Block Storage (EBS)\**** is incorrect because this service is not a scalable, high-performance file system.

     

    **References:**

    https://aws.amazon.com/fsx/lustre/

    https://aws.amazon.com/getting-started/use-cases/hpc/3/

     

    **Check out this Amazon FSx Cheat Sheet:**

    https://tutorialsdojo.com/amazon-fsx/

    

    

58. ##### 57. QUESTION

    A company has a web-based ticketing service that utilizes Amazon SQS and a fleet of EC2 instances. The EC2 instances that consume messages from the SQS queue are configured to poll the queue as often as possible to keep end-to-end throughput as high as possible. The Solutions Architect noticed that polling the queue in tight loops is using unnecessary CPU cycles, resulting in increased operational costs due to empty responses.

    In this scenario, what should the Solutions Architect do to make the system more cost-effective?

    

    - Configure Amazon SQS to use short polling by setting the ReceiveMessageWaitTimeSeconds to zero.
    - Configure Amazon SQS to use long polling by setting the ReceiveMessageWaitTimeSeconds to a number greater than zero.
    - Configure Amazon SQS to use long polling by setting the ReceiveMessageWaitTimeSeconds to zero.
    - Configure Amazon SQS to use short polling by setting the ReceiveMessageWaitTimeSeconds to a number greater than zero.

    

    **Correct**

    

    In this scenario, the application is deployed in a fleet of EC2 instances that are polling messages from a single SQS queue. Amazon SQS uses short polling by default, querying only a subset of the servers (based on a weighted random distribution) to determine whether any messages are available for inclusion in the response. Short polling works for scenarios that require higher throughput. However, you can also configure the queue to use Long polling instead, to reduce cost.

    The ReceiveMessageWaitTimeSeconds is the queue attribute that determines whether you are using Short or Long polling. By default, its value is zero which means it is using Short polling. If it is set to a value greater than zero, then it is Long polling.

    Hence, ***\*configuring Amazon SQS to use long polling by setting the ReceiveMessageWaitTimeSeconds to a number greater than zero is the correct answer.\****

    Quick facts about SQS Long Polling:

    – Long polling helps reduce your cost of using Amazon SQS by reducing the number of empty responses when there are no messages available to return in reply to a *ReceiveMessage* request sent to an Amazon SQS queue and eliminating false empty responses when messages are available in the queue but aren’t included in the response.

    – Long polling reduces the number of empty responses by allowing Amazon SQS to wait until a message is available in the queue before sending a response. Unless the connection times out, the response to the `ReceiveMessage` request contains at least one of the available messages, up to the maximum number of messages specified in the `ReceiveMessage` action.

    – Long polling eliminates false empty responses by querying all (rather than a limited number) of the servers. Long polling returns messages as soon any message becomes available.

     

    **Reference:**

    https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-long-polling.html

     

    **Check out this Amazon SQS Cheat Sheet:**

    https://tutorialsdojo.com/amazon-sqs/

    

    

59. ##### 58. QUESTION

    A company is planning to launch a High Performance Computing (HPC) cluster in AWS that does Computational Fluid Dynamics (CFD) simulations. The solution should scale-out their simulation jobs to experiment with more tunable parameters for faster and more accurate results. The cluster is composed of Windows servers hosted on t3a.medium EC2 instances. As the Solutions Architect, you should ensure that the architecture provides higher bandwidth, higher packet per second (PPS) performance, and consistently lower inter-instance latencies.

    Which is the MOST suitable and cost-effective solution that the Architect should implement to achieve the above requirements?

    

    - Enable Enhanced Networking with Elastic Network Adapter (ENA) on the Windows EC2 Instances.
    - Enable Enhanced Networking with Elastic Fabric Adapter (EFA) on the Windows EC2 Instances.
    - Enable Enhanced Networking with Intel 82599 Virtual Function (VF) interface on the Windows EC2 Instances.
    - Use AWS ParallelCluster to deploy and manage the HPC cluster to provide higher bandwidth, higher packet per second (PPS) performance, and lower inter-instance latencies.

    

    **Correct**

    

    Enhanced networking uses single root I/O virtualization (SR-IOV) to provide high-performance networking capabilities on supported instance types. SR-IOV is a method of device virtualization that provides higher I/O performance and lower CPU utilization when compared to traditional virtualized network interfaces. Enhanced networking provides higher bandwidth, higher packet per second (PPS) performance, and consistently lower inter-instance latencies. There is no additional charge for using enhanced networking.

    ![img](https://udemy-images.s3.amazonaws.com/redactor/raw/2020-01-10_11-44-29-f938be2240ccd0493d45bd80ca276619.png)

    Amazon EC2 provides enhanced networking capabilities through the Elastic Network Adapter (ENA). It supports network speeds of up to 100 Gbps for supported instance types. Elastic Network Adapters (ENAs) provide traditional IP networking features that are required to support VPC networking.

    An Elastic Fabric Adapter (EFA) is simply an Elastic Network Adapter (ENA) with added capabilities. It provides all of the functionality of an ENA, with additional OS-bypass functionality. OS-bypass is an access model that allows HPC and machine learning applications to communicate directly with the network interface hardware to provide low-latency, reliable transport functionality.

    The OS-bypass capabilities of EFAs are not supported on Windows instances. If you attach an EFA to a Windows instance, the instance functions as an Elastic Network Adapter, without the added EFA capabilities.

    Hence, the correct answer is to ***\*enable Enhanced Networking with Elastic Network Adapter (ENA) on the Windows EC2 Instances\****.

    ***\*Enabling Enhanced Networking with Elastic Fabric Adapter (EFA) on the Windows EC2 Instances\**** is incorrect because the OS-bypass capabilities of the Elastic Fabric Adapter (EFA) are not supported on Windows instances. Although you can attach EFA to your Windows instances, this will just act as a regular Elastic Network Adapter, without the added EFA capabilities. Moreover, it doesn’t support the t3a.medium instance type that is being used in the HPC cluster.

    ***\*Enabling Enhanced Networking with Intel 82599 Virtual Function (VF) interface on the Windows EC2 Instances\**** is incorrect because although you can attach an Intel 82599 Virtual Function (VF) interface on your Windows EC2 Instances to improve its networking capabilities, it doesn’t support the t3a.medium instance type that is being used in the HPC cluster.

    ***\*Using AWS ParallelCluster to deploy and manage the HPC cluster to provide higher bandwidth, higher packet per second (PPS) performance, and lower inter-instance latencies\**** is incorrect because an AWS ParallelCluster is just an AWS-supported open-source cluster management tool that makes it easy for you to deploy and manage High Performance Computing (HPC) clusters on AWS. It does not provide higher bandwidth, higher packet per second (PPS) performance, and lower inter-instance latencies, unlike ENA or EFA.

     

    **References:**

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking.html

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/efa.html

    

    

60. ##### 59. QUESTION

    An online medical system hosted in AWS stores sensitive Personally Identifiable Information (PII) of the users in an Amazon S3 bucket. Both the master keys and the unencrypted data should never be sent to AWS to comply with the strict compliance and regulatory requirements of the company.

    Which S3 encryption technique should the Architect use?

    

    - Use S3 client-side encryption with a client-side master key.
    - Use S3 server-side encryption with a KMS managed key.
    - Use S3 server-side encryption with customer provided key.
    - Use S3 client-side encryption with a KMS-managed customer master key.

    

    **Correct**

    

    **Client-side encryption** is the act of encrypting data before sending it to Amazon S3. To enable client-side encryption, you have the following options:

      – Use an AWS KMS-managed customer master key.

      – Use a client-side master key.

    When using an AWS KMS-managed customer master key to enable client-side data encryption, you provide an AWS KMS customer master key ID (CMK ID) to AWS. On the other hand, when you use client-side master key for client-side data encryption, **your client-side master keys and your unencrypted data are never sent to AWS**. It’s important that you safely manage your encryption keys because if you lose them, you can’t decrypt your data.

    ![img](https://media.amazonwebservices.com/blog/2014/s3_sse_customer_key_2.png)

    This is how client-side encryption using client-side master key works:

    **When uploading an object** – You provide a client-side master key to the Amazon S3 encryption client. The client uses the master key only to encrypt the data encryption key that it generates randomly. The process works like this:

      \1. The Amazon S3 encryption client generates a one-time-use symmetric key (also known as a data encryption key or data key) locally. It uses the data key to encrypt the data of a single Amazon S3 object. The client generates a separate data key for each object.

      \2. The client encrypts the data encryption key using the master key that you provide. The client uploads the encrypted data key and its material description as part of the object metadata. The client uses the material description to determine which client-side master key to use for decryption.

      \3. The client uploads the encrypted data to Amazon S3 and saves the encrypted data key as object metadata (`x-amz-meta-x-amz-key`) in Amazon S3.

    **When downloading an object –** The client downloads the encrypted object from Amazon S3. Using the material description from the object’s metadata, the client determines which master key to use to decrypt the data key. The client uses that master key to decrypt the data key and then uses the data key to decrypt the object.

    Hence, the correct answer is to ***\*use S3 client-side encryption with a client-side master key\****.

    ***\*Using S3 client-side encryption with a KMS-managed customer master key\**** is incorrect because in client-side encryption with a KMS-managed customer master key, you provide an AWS KMS customer master key ID (CMK ID) to AWS. The scenario clearly indicates that both the master keys and the unencrypted data should never be sent to AWS.

    ***\*Using S3 server-side encryption with a KMS managed key\**** is incorrect because the scenario mentioned that the unencrypted data should never be sent to AWS, which means that you have to use client-side encryption in order to encrypt the data first before sending to AWS. In this way, you can ensure that there is no unencrypted data being uploaded to AWS. In addition, the master key used by Server-Side Encryption with AWS KMS–Managed Keys (SSE-KMS) is uploaded and managed by AWS, which directly violates the requirement of not uploading the master key.

    ***\*Using S3 server-side encryption with customer provided key\**** is incorrect because just as mentioned above, you have to use client-side encryption in this scenario instead of server-side encryption. For the S3 server-side encryption with customer-provided key (SSE-C), you actually provide the encryption key as part of your request to upload the object to S3. Using this key, Amazon S3 manages both the encryption (as it writes to disks) and decryption (when you access your objects).

     

    **References:**

    https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingEncryption.html

    https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html

    

    

61. ##### 60. QUESTION

    A Solutions Architect is building a cloud infrastructure where EC2 instances require access to various AWS services such as S3 and Redshift. The Architect will also need to provide access to system administrators so they can deploy and test their changes.

    Which configuration should be used to ensure that the access to the resources is secured and not compromised? (Select TWO.)

    

    - Store the AWS Access Keys in the EC2 instance.
    - Store the AWS Access Keys in ACM.
    - Assign an IAM role to the Amazon EC2 instance.
    - Enable Multi-Factor Authentication.
    - Assign an IAM user for each Amazon EC2 Instance.

    

    **Correct**

    

    In this scenario, the correct answers are:

    ***\*– Enable Multi-Factor Authentication\****

    ***\*– Assign an IAM role to the Amazon EC2 instance\****

    Always remember that you should associate IAM roles to EC2 instances and not an IAM user, for the purpose of accessing other AWS services. IAM roles are designed so that your applications can securely make API requests from your instances, without requiring you to manage the security credentials that the applications use. Instead of creating and distributing your AWS credentials, you can delegate permission to make API requests using IAM roles.

    ![img](https://dmhnzl5mp9mj6.cloudfront.net/security_awsblog/images/MFAAPI4.png)

    **AWS Multi-Factor Authentication (MFA)** is a simple best practice that adds an extra layer of protection on top of your user name and password. With MFA enabled, when a user signs in to an AWS website, they will be prompted for their user name and password (the first factor—what they know), as well as for an authentication code from their AWS MFA device (the second factor—what they have). Taken together, these multiple factors provide increased security for your AWS account settings and resources. You can enable MFA for your AWS account and for individual IAM users you have created under your account. MFA can also be used to control access to AWS service APIs.

    ***\*Storing the AWS Access Keys in the EC2 instance\**** is incorrect. This is not recommended by AWS as it can be compromised. Instead of storing access keys on an EC2 instance for use by applications that run on the instance and make AWS API requests, you can use an IAM role to provide temporary access keys for these applications.

    ***\*Assigning an IAM user for each Amazon EC2 Instance\**** is incorrect because there is no need to create an IAM user for this scenario since IAM roles already provide greater flexibility and easier management.

    ***\*Storing the AWS Access Keys in ACM\**** is incorrect because ACM is just a service that lets you easily provision, manage, and deploy public and private SSL/TLS certificates for use with AWS services and your internal connected resources. It is not used as a secure storage for your access keys.

     

    **References:**

    https://aws.amazon.com/iam/details/mfa/

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html

     

    **Check out this AWS IAM Cheat Sheet:**

    https://tutorialsdojo.com/aws-identity-and-access-management-iam/

    

    

62. ##### 61. QUESTION

    A media company is setting up an ECS batch architecture for its image processing application. It will be hosted in an Amazon ECS Cluster with two ECS tasks that will handle image uploads from the users and image processing. The first ECS task will process the user requests, store the image in an S3 input bucket, and push a message to a queue. The second task reads from the queue, parses the message containing the object name, and then downloads the object. Once the image is processed and transformed, it will upload the objects to the S3 output bucket. To complete the architecture, the Solutions Architect must create a queue and the necessary IAM permissions for the ECS tasks.

    Which of the following should the Architect do next?

    

    - Launch a new Amazon AppStream 2.0 queue and configure the second ECS task to read from it. Create an IAM role that the ECS tasks can assume in order to get access to the S3 buckets and AppStream 2.0 queue. Declare the IAM Role (`taskRoleArn`) in the task definition.
    - Launch a new Amazon MQ queue and configure the second ECS task to read from it. Create an IAM role that the ECS tasks can assume in order to get access to the S3 buckets and Amazon MQ queue. Set the (`EnableTaskIAMRole`) option to true in the task definition.
    - Launch a new Amazon Kinesis Data Firehose and configure the second ECS task to read from it. Create an IAM role that the ECS tasks can assume in order to get access to the S3 buckets and Kinesis Data Firehose. Specify the ARN of the IAM Role in the (`taskDefinitionArn`) field of the task definition.
    - Launch a new Amazon SQS queue and configure the second ECS task to read from it. Create an IAM role that the ECS tasks can assume in order to get access to the S3 buckets and SQS queue. Declare the IAM Role (`taskRoleArn`) in the task definition.

    

    **Correct**

    

    Docker containers are particularly suited for batch job workloads. Batch jobs are often short-lived and embarrassingly parallel. You can package your batch processing application into a Docker image so that you can deploy it anywhere, such as in an Amazon ECS task.

    Amazon ECS supports batch jobs. You can use Amazon ECS *Run Task* action to run one or more tasks once. The Run Task action starts the ECS task on an instance that meets the task’s requirements including CPU, memory, and ports.![img](https://github.com/aws-samples/ecs-refarch-batch-processing/raw/master/images/ECSBatchRefArch.png)For example, you can set up an ECS Batch architecture for an image processing application. You can set up an AWS CloudFormation template that creates an Amazon S3 bucket, an Amazon SQS queue, an Amazon CloudWatch alarm, an ECS cluster, and an ECS task definition. Objects uploaded to the input S3 bucket trigger an event that sends object details to the SQS queue. The ECS task deploys a Docker container that reads from that queue, parses the message containing the object name and then downloads the object. Once transformed it will upload the objects to the S3 output bucket.

    By using the SQS queue as the location for all object details, you can take advantage of its scalability and reliability as the queue will automatically scale based on the incoming messages and message retention can be configured. The ECS Cluster will then be able to scale services up or down based on the number of messages in the queue.

    You have to create an IAM Role that the ECS task assumes in order to get access to the S3 buckets and SQS queue. Note that the permissions of the IAM role don’t specify the S3 bucket ARN for the incoming bucket. This is to avoid a circular dependency issue in the CloudFormation template. You should always make sure to assign the least amount of privileges needed to an IAM role.

    Hence, the correct answer is: ***\*Launch a new Amazon SQS queue and configure the second ECS task to read from it. Create an IAM role that the ECS tasks can assume in order to get access to the S3 buckets and SQS queue. Declare the IAM Role (`taskRoleArn`) in the task definition.\****

    The option that says: ***\*Launch a new Amazon AppStream 2.0 queue and configure the second ECS task to read from it. Create an IAM role that the ECS tasks can assume in order to get access to the S3 buckets and AppStream 2.0 queue. Declare the IAM Role (`taskRoleArn`) in the task definition\**** is incorrect because Amazon AppStream 2.0 is a fully managed application streaming service and can’t be used as a queue. You have to use Amazon SQS instead.

    The option that says: ***\*Launch a new Amazon Kinesis Data Firehose and configure the second ECS task to read from it. Create an IAM role that the ECS tasks can assume in order to get access to the S3 buckets and Kinesis Data Firehose. Specify the ARN of the IAM Role in the (`taskDefinitionArn`) field of the task definition\**** is incorrect because Amazon Kinesis Data Firehose is a fully managed service for delivering real-time streaming data. Although it can stream data to an S3 bucket, it is not suitable to be used as a queue for a batch application in this scenario. In addition, the ARN of the IAM Role should be declared in the `taskRoleArn` and not in the `taskDefinitionArn` field.

    The option that says: ***\*Launch a new Amazon MQ queue and configure the second ECS task to read from it. Create an IAM role that the ECS tasks can assume in order to get access to the S3 buckets and Amazon MQ queue. Set the (`EnableTaskIAMRole`) option to true in the task definition\**** is incorrect because Amazon MQ is primarily used as a managed message broker service and not a queue. The `EnableTaskIAMRole` option is only applicable for Windows-based ECS Tasks that require extra configuration.

     

    **References:**

    https://github.com/aws-samples/ecs-refarch-batch-processing

    https://docs.aws.amazon.com/AmazonECS/latest/developerguide/common_use_cases.html

    https://aws.amazon.com/ecs/faqs/

    

    

63. ##### 62. QUESTION

    A Solutions Architect is working for a large insurance firm. To maintain compliance with HIPAA laws, all data that is backed up or stored on Amazon S3 needs to be encrypted at rest.

    In this scenario, what is the best method of encryption for the data, assuming S3 is being used for storing financial-related data? (Select TWO.)

    

    - Enable SSE on an S3 bucket to make use of AES-256 encryption
    - Store the data in encrypted EBS snapshots
    - Use AWS Shield to protect your data at rest
    - Encrypt the data using your own encryption keys then copy the data to Amazon S3 over HTTPS endpoints.
    - Store the data on EBS volumes with encryption enabled instead of using Amazon S3

    

    **Correct**

    

    Data protection refers to protecting data while in-transit (as it travels to and from Amazon S3) and at rest (while it is stored on disks in Amazon S3 data centers). You can protect data in transit by using SSL or by using client-side encryption. You have the following options for protecting data at rest in Amazon S3.

    **Use Server-Side Encryption** – You request Amazon S3 to encrypt your object before saving it on disks in its data centers and decrypt it when you download the objects.

    **Use Client-Side Encryption** – You can encrypt data client-side and upload the encrypted data to Amazon S3. In this case, you manage the encryption process, the encryption keys, and related tools.

    ![img](https://media.amazonwebservices.com/blog/2014/s3_sse_customer_key_2.png)

    Hence, the following options are the correct answers:

    ***\*– Enable SSE on an S3 bucket to make use of AES-256 encryption\****

    ***\*– Encrypt the data using your own encryption keys then copy the data to Amazon S3 over HTTPS endpoints. This refers to using a Server-Side Encryption with Customer-Provided Keys (SSE-C).\**** 

    ***\*Storing the data in encrypted EBS snapshots\**** and ***\*storing the data on EBS volumes with encryption enabled instead of using Amazon S3\**** are both incorrect because all these options are for protecting your data in your EBS volumes. Note that an S3 bucket does not use EBS volumes to store your data.

    ***\*Using AWS Shield to protect your data at rest\**** is incorrect because AWS Shield is mainly used to protect your entire VPC against DDoS attacks.

     

    **References:**

    https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html

    https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html

     

    **Check out this Amazon S3 Cheat Sheet:**

    https://tutorialsdojo.com/amazon-s3/

    

    

64. ##### 63. QUESTION

    An organization needs a persistent block storage volume that will be used for mission-critical workloads. The backup data will be stored in an object storage service and after 30 days, the data will be stored in a data archiving storage service.

    What should you do to meet the above requirement?

    

    - Attach an EBS volume in your EC2 instance. Use Amazon S3 to store your backup data and configure a lifecycle policy to transition your objects to Amazon S3 One Zone-IA.
    - Attach an instance store volume in your existing EC2 instance. Use Amazon S3 to store your backup data and configure a lifecycle policy to transition your objects to Amazon S3 Glacier.
    - Attach an EBS volume in your EC2 instance. Use Amazon S3 to store your backup data and configure a lifecycle policy to transition your objects to Amazon S3 Glacier.
    - Attach an instance store volume in your EC2 instance. Use Amazon S3 to store your backup data and configure a lifecycle policy to transition your objects to Amazon S3 One Zone-IA.

    

    **Correct**

    

    **Amazon Elastic Block Store (EBS)** is an easy-to-use, high-performance block storage service designed for use with Amazon Elastic Compute Cloud (EC2) for both throughput and transaction-intensive workloads at any scale. A broad range of workloads, such as relational and non-relational databases, enterprise applications, containerized applications, big data analytics engines, file systems, and media workflows are widely deployed on Amazon EBS.

    **Amazon Simple Storage Service (Amazon S3)** is an object storage service that offers industry-leading scalability, data availability, security, and performance. This means customers of all sizes and industries can use it to store and protect any amount of data for a range of use cases, such as websites, mobile applications, backup and restore, archive, enterprise applications, IoT devices, and big data analytics.

    In an **S3 Lifecycle configuration**, you can define rules to transition objects from one storage class to another to save on storage costs. Amazon S3 supports a waterfall model for transitioning between storage classes, as shown in the diagram below:

    ![ Amazon S3 storage class waterfall graphic. ](https://docs.amazonaws.cn/en_us/AmazonS3/latest/userguide/images/lifecycle-transitions-v2.png)

    In this scenario, three services are required to implement this solution. The mission-critical workloads mean that you need to have a persistent block storage volume and the designed service for this is Amazon EBS volumes. The second workload needs to have an object storage service, such as Amazon S3, to store your backup data. Amazon S3 enables you to configure the lifecycle policy from S3 Standard to different storage classes. For the last one, it needs archive storage such as Amazon S3 Glacier.

    Hence, the correct answer in this scenario is: ***\*Attach an EBS volume in your EC2 instance. Use Amazon S3 to store your backup data and configure a lifecycle policy to transition your objects to Amazon S3 Glacier.\****

    The option that says: ***\*Attach an EBS volume in your EC2 instance. Use Amazon S3 to store your backup data and configure a lifecycle policy to transition your objects to Amazon S3 One Zone-IA\**** is incorrect because this lifecycle policy will transition your objects into an infrequently accessed storage class and not a storage class for data archiving.

    The option that says: ***\*Attach an instance store volume in your existing EC2 instance. Use Amazon S3 to store your backup data and configure a lifecycle policy to transition your objects to Amazon S3 Glacier\**** is incorrect because an Instance Store volume is simply a temporary block-level storage for EC2 instances. Also, you can’t attach instance store volumes to an instance after you’ve launched it. You can specify the instance store volumes for your instance only when you launch it.

    The option that says: ***\*Attach an instance store volume in your EC2 instance. Use Amazon S3 to store your backup data and configure a lifecycle policy to transition your objects to Amazon S3 One Zone-IA\**** is incorrect. Just like the previous option, the use of instance store volume is not suitable for mission-critical workloads because the data can be lost if the underlying disk drive fails, the instance stops, or if the instance is terminated. In addition, Amazon S3 Glacier is a more suitable option for data archival instead of Amazon S3 One Zone-IA.

     

    **References:**

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html

    https://aws.amazon.com/s3/storage-classes/

     

    **Check out this Amazon S3 Cheat Sheet:**

    https://tutorialsdojo.com/amazon-s3/

     

    **Tutorials Dojo’s AWS Storage Services Cheat Sheets:**

    https://tutorialsdojo.com/aws-cheat-sheets-storage-services/

    

    

65. ##### 64. QUESTION

    A company needs to set up a cost-effective architecture for a log processing application that has frequently accessed, throughput-intensive workloads with large, sequential I/O operations. The application should be hosted in an already existing On-Demand EC2 instance in the VPC. You have to attach a new EBS volume that will be used by the application.

    Which of the following is the most suitable EBS volume type that you should use in this scenario?

    

    - EBS Cold HDD (sc1)
    - EBS Provisioned IOPS SSD (io1)
    - EBS Throughput Optimized HDD (st1)
    - EBS General Purpose SSD (gp2)

    

    **Correct**

    

    In the exam, always consider the difference between SSD and HDD as shown on the table below. This will allow you to easily eliminate specific EBS-types in the options which are not SSD or not HDD, depending on whether the question asks for a storage type which has ***small, random\*** I/O operations or ***large, sequential\*** I/O operations.

    Since the scenario has workloads with large, sequential I/O operations, we can narrow down our options by selecting HDD volumes, instead of SDD volumes which are more suitable for small, random I/O operations.

    ![img](https://udemy-images.s3.amazonaws.com/redactor/raw/2019-01-19_22-34-15-d1fd30e8eaa8701ddd964e5878e78242.png)

    ***\*Throughput Optimized HDD (`st1`)\**** volumes provide low-cost magnetic storage that defines performance in terms of throughput rather than IOPS. This volume type is a good fit for large, sequential workloads such as Amazon EMR, ETL, data warehouses, and log processing. Bootable `st1` volumes are not supported.

    Throughput Optimized HDD (`st1`) volumes, though similar to Cold HDD (`sc1`) volumes, are designed to support *frequently* accessed data.

    ***\*EBS Provisioned IOPS SSD (io1)\**** is incorrect because Amazon EBS Provisioned IOPS SSD is not the most cost-effective EBS type and is primarily used for critical business applications that require sustained IOPS performance.

    ***\*EBS General Purpose SSD (gp2)\**** is incorrect. Although an Amazon EBS General Purpose SSD volume balances price and performance for a wide variety of workloads, it is not suitable for frequently accessed, throughput-intensive workloads. Throughput Optimized HDD is a more suitable option to use than General Purpose SSD.

    ***\*EBS Cold HDD (sc1)\**** is incorrect. Although this provides lower cost HDD volume compared to General Purpose SSD, it is much suitable for ***less\*** frequently accessed workloads.

     

    **Reference:**

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html#EBSVolumeTypes_st1

     

    **Amazon EBS Overview – SSD vs HDD:**

    

    <iframe title="YouTube video player" src="https://www.youtube.com/embed/LW7x8wyLFvw" frameborder="0" allowfullscreen="allowfullscreen" name="fitvid9" style="box-sizing: border-box; margin: 0px; position: absolute; top: 0px; left: 0px; width: 853.75px; height: 480.234px;"></iframe>

    

     

    **Check out this Amazon EBS Cheat Sheet:**

    https://tutorialsdojo.com/amazon-ebs/

    

    

66. ##### 65. QUESTION

    A company has several EC2 Reserved Instances in their account that need to be decommissioned and shut down since they are no longer used by the development team. However, the data is still required by the audit team for compliance purposes.

    Which of the following steps can be taken in this scenario? (Select TWO.)

    

    - Take snapshots of the EBS volumes and terminate the EC2 instances.
    - You can opt to sell these EC2 instances on the AWS Reserved Instance Marketplace
    - Stop all the running EC2 instances.
    - Convert the EC2 instance to On-Demand instances
    - Convert the EC2 instances to Spot instances with a persistent Spot request type.

    

    **Correct**

    

    **Amazon Elastic Compute Cloud (Amazon EC2)** is a web service that provides secure, resizable compute capacity in the cloud. It is designed to make web-scale cloud computing easier for developers. Amazon EC2’s simple web service interface allows you to obtain and configure capacity with minimal friction. It provides you with complete control of your computing resources and lets you run on Amazon’s proven computing environment.

    The first requirement as per the scenario is to decommission and shut down several EC2 Reserved Instances. However, it is also mentioned that the audit team still requires the data for compliance purposes. To fulfill the given requirements, you can first create a snapshot of the instance to save its data and then sell the instance to the Reserved Instance Marketplace.

    The Reserved Instance Marketplace is a platform that supports the sale of third-party and AWS customers’ unused Standard Reserved Instances, which vary in terms of length and pricing options. For example, you may want to sell Reserved Instances after moving instances to a new AWS region, changing to a new instance type, ending projects before the term expiration, when your business needs change, or if you have unneeded capacity.

    Hence, the correct answers are:

    ***\*– You can opt to sell these EC2 instances on the AWS Reserved Instance Marketplace.\****

    ***\*– Take snapshots of the EBS volumes and terminate the EC2 instances.\****

    The option that says: ***\*Convert the EC2 instance to On-Demand instances\**** is incorrect because it’s stated in the scenario that the development team no longer needs several EC2 Reserved Instances. By converting it to On-Demand instances, the company will still have instances running in their infrastructure and this will result in additional costs.

    The option that says: ***\*Convert the EC2 instances to Spot instances with a persistent Spot request type\**** is incorrect because the requirement in the scenario is to terminate or shut down several EC2 Reserved Instances. Converting the existing instances to Spot instances will not satisfy the given requirement.

    The option that says: ***\*Stop all the running EC2 instances\**** is incorrect because doing so will still incur storage cost. Take note that the requirement in the scenario is to decommission and shut down several EC2 Reserved Instances. Therefore, this approach won’t fulfill the given requirement.

     

    **References:**

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-market-general.html

    https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-snapshot.html

     

    **Check out this Amazon EC2 Cheat Sheet:**

    https://tutorialsdojo.com/amazon-elastic-compute-cloud-amazon-ec2/

     

    ***\*AWS Container Services Overview:\****

    