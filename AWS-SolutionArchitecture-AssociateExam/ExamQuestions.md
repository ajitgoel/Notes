[**QUESTION: 1**](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=2#collapse_1)

A solutions architect is designing a solution where users will be directed to a backup static error page if the primary website is unavailable. The primary website’s DNS records are hosted in Amazon Route 53 where their domain is pointing to an Application Load Balancer (ALB).

Which configuration should the solutions architect use to meet the company’s needs while minimizing changes and infrastructure overhead?

1. Point a Route 53 alias record to an Amazon CloudFront distribution with the ALB as one of its origins. Then, create custom error pages for the distribution.
2. Set up a Route 53 active-passive failover configuration. Direct traffic to a static error page hosted within an Amazon S3 bucket when Route 53 health checks determine that the ALB endpoint is unhealthy.
3. Update the Route 53 record to use a latency-based routing policy. Add the backup static error page hosted within an Amazon S3 bucket to the record so the traffic is sent to the most responsive endpoints.
4. Set up a Route 53 active-active configuration with the ALB and an Amazon EC2 instance hosting a static error page as endpoints. Route 53 will only send requests to the instance if the health checks fail for the ALB.

[Display Answer](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=2#answerQ1) [Next Question](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=2#collapse_1)



[**QUESTION: 2**](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=2#collapse_2)

A solutions architect needs to design a network that will allow multiple Amazon EC2 instances to access a common data source used for mission-critical data that can be accessed by all the EC2 instances simultaneously. The solution must be highly scalable, easy to implement and support the NFS protocol.

Which solution meets these requirements?

1. Create an Amazon EFS file system. Configure a mount target in each Availability Zone. Attach each instance to the appropriate mount target.
2. Create an additional EC2 instance and configure it as a file server. Create a security group that allows communication between the Instances and apply that to the additional instance.
3. Create an Amazon S3 bucket with the appropriate permissions. Create a role in AWS IAM that grants the correct permissions to the S3 bucket. Attach the role to the EC2 Instances that need access to the data.
4. Create an Amazon EBS volume with the appropriate permissions. Create a role in AWS IAM that grants the correct permissions to the EBS volume. Attach the role to the EC2 instances that need access to the data.

[Display Answer](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=2#answerQ2) [Next Question](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=2#collapse_2)



[**QUESTION: 3**](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=2#collapse_3)

A company has an on-premises application that collects data and stores it to an on-premises NFS server. The company recently set up a 10 Gbps AWS Direct Connect connection. The company is running out of storage capacity on premises. The company needs to migrate the application data from on premises to the AWS Cloud while maintaining low-latency access to the data from the on-premises application.

What should a solutions architect do to meet these requirements?

1. Deploy AWS Storage Gateway for the application data, and use the file gateway to store the data in Amazon S3. Connect the on-premises application servers to the file gateway using NFS.
2. Attach an Amazon Elastic File System (Amazon EFS) file system to the NFS server, and copy the application data to the EFS file system. Then connect the on-premises application to Amazon EFS.
3. Configure AWS Storage Gateway as a volume gateway. Make the application data available to the on- premises application from the NFS server and with Amazon Elastic Block Store (Amazon EBS) snapshots.
4. Create an AWS DataSync agent with the NFS server as the source location and an Amazon Elastic File System (Amazon EFS) file system as the destination for application data transfer. Connect the on-premises application to the EFS file system.

[Display Answer](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=2#answerQ3) [Next Question](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=2#collapse_3)



[**QUESTION: 4**](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=2#collapse_4)

A company is planning on deploying a newly built application on AWS in a default VPC. The application will consist of a web layer and database layer. The web server was created in public subnets, and the MySQL database was created in private subnets. All subnets are created with the default network ACL settings, and the default security group in the VPC will be replaced with new custom security groups.

The following are the key requirements:
The web servers must be accessible only to users on an SSL connection.
The database should be accessible to the web layer, which is created in a public subnet only.
All traffic to and from the IP range 182.20.0.0/16 subnet should be blocked.

Which combination of steps meets these requirements? (Select two.)

1. Create a database server security group with inbound and outbound rules for MySQL port 3306 traffic to and from anywhere (0 0.0.0/0).
2. Create a database server security group with an inbound rule for MySQL port 3306 and specify the source as a web server security group.
3. Create a web server security group with an inbound allow rule for HTTPS port 443 traffic from anywhere (0.0.0.0/0) and an inbound deny rule for IP range 182.20.0.0/16.
4. Create a web server security group with an inbound rule for HTTPS port 443 traffic from anywhere (0.0.0.0/0). Create network ACL inbound and outbound deny rules for IP range 182.20.0.0/16.
5. Create a web server security group with inbound and outbound rules for HTTPS port 443 traffic to and from anywhere (0.0.0.0/0). Create a network ACL inbound deny rule for IP range 182.20.0.0/16.

[Display Answer](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=2#answerQ4) [Next Question](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=2#collapse_4)



[**QUESTION: 5**](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=2#collapse_5)

A company recently migrated a message processing system to AWS. The system receives messages into an ActiveMQ queue running on an Amazon EC2 instance. Messages are processed by a consumer application running on Amazon EC2. The consumer application processes the messages and writes results to a MySQL database running on Amazon EC2. The company wants this application to be highly available with low operational complexity.

Which architecture offers the HIGHEST availability?

1. Add a second ActiveMQ server to another Availability Zone. Add an additional consumer EC2 instance in another Availability Zone Replicate the MySQL database to another Availability Zone.
2. Use Amazon MQ with active/standby brokers configured across two Availability Zones. Add an additional consumer EC2 instance in another Availability Zone. Replicate the MySQL database to another Availability Zone.
3. Use Amazon MQ with active/standby brokers configured across two Availability Zones. Add an additional consumer EC2 instance in another Availability Zone. Use Amazon RDS for MySQL with Multi-AZ enabled.
4. Use Amazon MQ with active/standby brokers configured across two Availability Zones. Add an Auto Scaling group for the consumer EC2 instances across two Availability Zones. Use Amazon RDS for MySQL with Multi-AZ enabled.

[Display Answer](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=2#answerQ5) [Next Question](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=2#collapse_5)

[**QUESTION: 6**](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=3#collapse_6)

A company is moving its on-premises Oracle database to Amazon Aurora PostgreSQL. The database has several applications that write to the same tables. The applications need to be migrated one by one with a month in between each migration Management has expressed concerns that the database has a high number of reads and writes. The data must be kept in sync across both databases throughout tie migration.

What should a solutions architect recommend?

1. Use AWS DataSync for the initial migration. Use AWS Database Migration Service (AWS DMS) to create a change data capture (CDC) replication task and a table mapping to select all cables.
2. Use AWS DataSync for the initial migration. Use AWS Database Migration Service (AWS DMS) to create a full load plus change data capture (CDC) replication task and a table mapping to select all tables.
3. Use the AWS Schema Conversion Tool with AWS DataBase Migration Service (AWS DMS) using a memory optimized replication instance. Create a full load plus change data capture (CDC) replication task and a table mapping to select all tables.
4. Use the AWS Schema Conversion Tool with AWS Database Migration Service (AWS DMS) using a compute optimized replication instance. Create a full load plus change data capture (CDC) replication task and a table mapping to select the largest tables.

**Answer(s):** B



[Display Answer](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=3#answerQ6) [Next Question](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=3#collapse_6)



[**QUESTION: 7**](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=3#collapse_7)

A company has developed a new video game as a web application. The application is in a three-tier architecture in a VPC with Amazon RDS for MySQL. In the database layer several players will compete concurrently online. The game’s developers want to display a top-10 scoreboard in near-real time and offer the ability to stop and restore the game while preserving the current scores.

What should a solutions architect do to meet these requirements?

1. Set up an Amazon ElastiCache for Memcached cluster to cache the scores for the web application to display.
2. Set up an Amazon ElastiCache for Redis cluster to compute and cache the scores for the web application to display.
3. Place an Amazon CloudFront distribution in front of the web application to cache the scoreboard in a section of the application.
4. Create a read replica on Amazon RDS for MySQL to run queries to compute the scoreboard and serve the read traffic to the web application.

**Answer(s):** D



[Display Answer](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=3#answerQ7) [Next Question](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=3#collapse_7)



[**QUESTION: 8**](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=3#collapse_8)

A company hosts its multi-tier public web application in the AWS Cloud. The web application runs on Amazon EC2 instances and its database runs on Amazon RDS. The company is anticipating a large increase in sales during an upcoming holiday weekend. A solutions architect needs to build a solution to analyze the performance of the web application with a granularity of no more than 2 minutes.

What should the solutions architect do to meet this requirement?

1. Send Amazon CloudWatch logs to Amazon Redshift. Use Amazon QuickSight to perform further analysis.
2. Enable detailed monitoring on all EC2 instances. Use Amazon CloudWatch metrics to perform further analysis.
3. Create an AWS Lambda function to fetch EC2 logs from Amazon CloudWatch Logs. Use Amazon CloudWatch metrics to perform further analysis.
4. Send EC2 logs to Amazon S3. Use Amazon Redshift to fetch logs from the S3 bucket to process raw data for further analysis with Amazon QuickSight.

**Answer(s):** B



[Display Answer](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=3#answerQ8) [Next Question](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=3#collapse_8)



[**QUESTION: 9**](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=3#collapse_9)

A company’s website hosted on Amazon EC2 instances processes classified data stored in Amazon S3. Due to security concerns, the company requires a private and secure connection between its EC2 resources and Amazon S3.

Which solution meets these requirements?

1. Set up S3 bucket policies to allow access from a VPC endpoint.
2. Set up an IAM policy to grant read-write access to the S3 bucket.
3. Set up a NAT gateway to access resources outside the private subnet.
4. Set up an access key ID and a secret access key to access the S3 bucket.

**Answer(s):** A

##### **Reference:**

https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-overview.html



[Display Answer](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=3#answerQ9) [Next Question](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=3#collapse_9)



[**QUESTION: 10**](https://free-braindumps.com/amazon/free-saa-c02-braindumps.html?size=10&p=3#collapse_10)

A company has two applications: a sender application that sends messages with payloads to be processed and a processing application intended to receive messages with payloads. The company wants to implement an AWS service to handle messages between the two applications. The sender application can send about 1,000 messages each hour. The messages may take up to 2 days to be processed. If the messages fail to process, they must be retained so that they do not impact the processing of any remaining messages.

Which solution meets these requirements and is the MOST operationally efficient?

1. Set up an Amazon EC2 instance running a Redis database. Configure both applications to use the instance. Store, process, and delete the messages, respectively.
2. Use an Amazon Kinesis data stream to receive the messages from the sender application. Integrate the processing application with the Kinesis Client Library (KCL).
3. Integrate the sender and processor applications with an Amazon Simple Queue Service (Amazon SQS) queue. Configure a dead-letter queue to collect the messages that failed to process.
4. Subscribe the processing application to an Amazon Simple Notification Service (Amazon SNS) topic to receive notifications to process. Integrate the sender application to write to the SNS topic.

**Answer(s):** C