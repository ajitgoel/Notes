==Question 1==

**Domain:**

You are working as a Cloud Architect in a big IT Firm. To ensure high availability of both the web servers and your web application database, you deployed your auto-scaled EC2 instances in multiple Availability Zones with an Application Load Balancer in front. You configured Multi-Availability Zone to your RDS instance. There is a spike in incoming requests in the past few hours, and the performance of the primary database is starting to go down. What would happen to the database if the primary DB instance fails?

- A. The IP address of the primary DB instance is switched to the standby DB instance.
- B. The RDS DB instance will automatically reboot.
- C. A new DB instance will be created and immediately replace the primary database.
- ==D. The canonical name record is changed from the primary database to the standby database.==

###### Explanation:

**Answer: D**

- **Option A is incorrect** because IP Address is associated with A Records in DNS, but for Database, you need to change the CNAME record.
- **Option B is incorrect** because RDS Instance is pointed to standby RDS.
- **Option C is incorrect** because this option is not reliable in real-time.
- **Option D is correct** because ==the failover mechanism automatically changes the DNS CNAME record of the DB instance to point to the standby DB instance.==

**Refer:** 

- https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html

==Question 2==

**Domain:**

A company is planning to migrate an on-premise 15 TB MySQL database cluster onto AWS. The replication lag needs to be less than 100 ms for the cluster, and the size is expected to double in the next couple of months. Which of the following would be the ideal data store that should be chosen in AWS?

- A. AWS RDS MySQL
- ==B. AWS Aurora==
- C. AWS DynamoDB
- D. AWS Redshift

###### Explanation:

**Answer: B**

- **Option B is correct** because all Aurora Replicas returns query results with minimal replica lag—usually much less than 100 milliseconds after the primary instance has written an update. For Scaling, this is the best among all the options. The minimum storage is for AWS Aurora is 10GB. Based on your database usage, your Amazon Aurora storage will automatically grow, up to 64 TB, in 10GB increments with no impact on database performance. There is no need to provision storage in advance. Amazon Aurora is a compatible MySQL database that can take on tremendous growth in terms of the data size.

**Refer:**

- https://aws.amazon.com/rds/aurora/faqs/

==Question 3Correct==

**Domain:**

A complex enterprise application is hosted on an M5.XLarge on-demand EC2 instance with DynamoDB as its database. You created a table called "coursedetails" which has a hash key of "course_id”. You can query the data based on the "course_id" hash key without any issues. Your Supervisor then told you that the web application should also be able to query the "coursedetails" table by "student_name". What would you do to configure your DynamoDB to meet the above requirement properly? The table “coursedetails” consists of 3 columns i.e. course_id (hash key), course_name, student_name.

- A. Configure the DynamoDB instance to have a second table which contains all the information by “student_name”.
- B. Set up an In-Memory Acceleration with DAX in your DynamoDB instance.
- ==C. Configure the “coursedetails” table to use “student_name” as a Global secondary indexright==
- D. The requirement is beyond the capability of DynamoDB.

###### Explanation:

**Answer: C**

- **Option A is incorrect** because DynamoDB is not designed as a relational database and does not support join operations. You can think about DynamoDB as just being a set of key-value pairs. You can have the same keys across multiple tables, but DynamoDB doesn't automatically sync them or have any foreign-key features. The columns in one table, while named the same, are technically a different set than the ones in a different table. It's up to your application software to make sure that those keys are synced.
- **Option B is incorrect** because In-Memory Acceleration with DAX is used for caching the query.
- **Option C** **is correct** because we don't know the course_id of those “student_name”, that's what we want to get. So we find ourselves without knowing the items' hash key values. That’s where **GSI** is used. ==**Global Secondary Indexes** let you define a different hash key for your table.== **Note that it will not change the primary hash key – “**course_id” **will still be the table's hash key.** ==GSI only provides an additional hash key for you to be able to make more complex queries.==
- **Option D** **is incorrect** because it is under the capability of DynamoDB.

**Refer:**

- https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/bp-gsi-aggregation.html

==Question 4In Correct==

**Domain:**

You are working as an AWS Architect for a multinational bank with hybrid cloud architecture. The bank is running a currency exchange website that uses a MySQL Server RDS instance as its database. As part of the company's business continuity plan, there is a need to keep a read replica of the production RDS instance to the bank's on-premise data center. In this scenario, what is the most secure and effective way to meet this requirement?

- A. Change the MySQL Server RDS instance as the master node and then enable replication over the public Internet using a secure SSL endpoint to a server on the on-premise data center.wrong
- B. Configure the MySQL Server RDS instance to replicate to an EC2 instance with core MySQL and then enable Replication over a secure VPN connection.
- C. Use native backup and restore for MySQL Server databases using full backup files by storing it on Amazon S3, and then restore the backup file onto an on-premises server.
- ==D. Create an IPsec VPN connection through the Virtual Private Cloud service and configure replication in MySQL Server.==

###### Explanation:

**Answer: D**

- **Option A** **is incorrect** as it is feasible. You could put your RDS DB in a public subnet and configure SSL for it. But you have been asked for the most secure way.
- **Option B** **is incorrect** because Even EC2 is external to RDS, and it won’t be a secure option.
- **Option C is incorrect** because it describes a backup-restore solution.
- **Option D is correct** because it provides the most secure direct connection from the RDS MySQL Server instance to the On-Premise data center, and replication can be configured within the MySQL Server service since it can't be done from the RDS service to the On-Premise data center.

**Refer:**

- https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html#USER_ReadRepl.Create

==Question 5==

**Domain:**

Your team has developed an online feedback application for the best image competition in AWS using CloudFormation. The application accepts high-quality images of each participant and stores them in S3. Then it records the information about the image as well as the participant’s profile in RDS. After the competition, the CloudFormation stack is not used anymore and should be terminated to save the cost. Your manager instructed you to back up the RDS database and the S3 bucket so the data can still be used even after the CloudFormation template is deleted. Which of the following options will fulfill this requirement?

- A. Set the DeletionPolicy for the RDS instance to snapshot and then enable S3 bucket replication on the source bucket to a destination bucket to maintain a copy of all the S3 objects.
- B. Set the DeletionPolicy to retain on both the RDS and S3 resource types on the CloudFormation template.
- C. Set the DeletionPolicy on the S3 bucket to snapshot
- ==D. Set the DeletionPolicy on the RDS resource to snapshot and set the S3 bucket to retain.==

###### Explanation:

**Answer: D**

- **Option A is incorrect** because a replica of the S3 bucket is not required. We can directly retain it.
- **Option B** **is incorrect** because we can retain a snapshot of RDS, not S3.
- **Option C** **is incorrect** because RDS also needs to be backed up.
- **Option D is correct** because The Retain option keeps the resource in the event of a stack deletion. The Snapshot option creates a snapshot of the resource before that resource is deleted. The Delete option deletes the resource along with the stack.

**Refer:**

- https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-deletionpolicy.html

==Question 6==

**Domain:**

You are working as a Cloud Engineer for a startup company that is planning to develop a web application with a ReactJS frontend and DynamoDB with provisioned throughput (1000 Writes/Sec) as its database. They are expecting a high number of writes on the database during peak hours (3000 Writes/Sec). How could you ensure the scalability and cost-effectiveness of the application to reduce the load on the DynamoDB database? (Choose 3 options)

- A. Add more DynamoDB databases to handle the load.
- ==B. Use DynamoDB Auto Scaling.==
- C. Increase write capacity of DynamoDB to meet the peak loads.wrong
- ==D. Use SQS to assist and let the application pull messages and then perform the relevant operation In DynamoDB.==
- ==E. Use Kinesis to assist and let the application pull messages and then perform the relevant operation in  DynamoDB.==

###### Explanation:

**Answer: B, D and E**

- **Option A is incorrect** because this option is neither Cost-effective nor reliable.
- **Option B** **is correct** because if your application can handle some throttling from DynamoDB when there’s a sudden increase in traffic, you should use DynamoDB Auto Scaling.
- **Option C** **is incorrect** because you have to do the same thing manually again and again in the future.
- **Option D is correct** because you could either put all the messages into SQS first or use SQS as an overflow buffer when you exceed the design throughput on your DynamoDB database.
- **Option E is correct** because if the order of the messages coming in is extremely important, Kinesis is another option for you to ingest the incoming messages and then insert them into DynamoDB, in the same order they arrived, at a pace you define.

**Refer:**

-  https://aws.amazon.com/blogs/database/amazon-dynamodb-auto-scaling-performance-and-cost-optimization-at-any-scale/
- [ https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/AutoScaling.html](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/AutoScaling.html)

==Question 7==

**Domain:**

Your company has got a client whose data is stored in AWS for a 3-tier application. The relational database should be highly durable and support schema changes. Changes to the database should not result in downtime. As a Cloud Architect of the Company, Which of the following would be the best data storage option for the Client?

- A. AWS S3
- B. AWS Redshift
- C. AWS DynamoDB
- ==D. AWS Aurora==

###### Explanation:

**Answer: D**

- **Option D is correct** because Amazon Aurora is a relational database and supports working with schema changes.
- **Option A, B, C** are incorrect none of these are have these features together.

**Refer:**

- https://aws.amazon.com/blogs/database/amazon-aurora-under-the-hood-fast-ddl/
- https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Managing.FastDDL.html

==Question 8==

**Domain:**

An online eCommerce WordPress Website is currently storing its records in a Single MySQL RDS database in AWS. After few days, there are severe performance issues on the database. They tried to Scale up the DB Instance. Right now, they are using SQS to pull up the queries in Queue. Which of the following can be added to the architecture to rectify the performance issue and the solution must be cost-effective?

- A. Enable Multi-AZ for the database.
- ==B. Use Elasticache Service.==
- C. Place a Load Balance in front of database.
- D. Use Cloudfront in front of the database.

###### Explanation:

**Answer: B**

- **Option A is incorrect because** ==Multi-AZ is used for standby purposes and not for performance issues.==
- **Option B is correct because** the Elasticache service can be used to cache all the common queries. Hence if the same queries are causing the problem, the data sets will be fetched from Elasticache, instead of the database. This will reduce the load on the database server.
- **Option C is incorrect** because Load Balance can’t be used on a single database server.
- **Option D is incorrect** because Cloudfront is caching the data on a remote edge location which means that the request is not even going to the origin server.

**Refer:**

- https://aws.amazon.com/elasticache/

==Question 9==

**Domain:**

You are working in a Research and Development Department in IT Company where you as a Cloud Architect, trying to check the impact on real-time transactions. You created a multi-AZ RDS setup consisting of a Primary instance and a Read-replica. What is the impact of the read-replica on the transactions in the primary instance?

- A. Transaction are impacted only if you configured it for Synchronous Replication.
- B. Transaction are impacted only if you configured it for Asynchronous Replication.
- ==C. Transactions are not impacted.right==
- D. Transactions are impacted.

###### Explanation:

**Answer: C**

- **Option C** is correct because, for multi-AZ high availability, RDS uses synchronous replication between primary and standby systems. On the other hand, ==RDS Read Replica uses asynchronous replication, and any slowness in the Read Replica instance would simply cause data lag only in the read - replica. Transactions in primary are not impacted.==

**Refer:**

- https://aws.amazon.com/rds/faqs/

==Question 10Correct==

**Domain:**

A company is planning to migrate its existing on-premise application to the AWS Cloud. The application currently runs on .Net and uses Microsoft SQL Server as the backend database. Your Company has some limitations as they don’t have the developers currently to make recent changes to the code. Also, they don’t have the Infrastructure team currently to manage the infrastructure on AWS. Which of the following data service would your Company choose on AWS for the best use?

- ==A. AWS RDS==
- B. AWS DynamoDB
- C. AWS Aurora
- D. AWS Redshift

###### Explanation:

**Answer: A**

- **Option A is correct** because one can use the AWS RDS service and choose the Microsoft SQL Server platform. Since the company does not have the developers available to make large code changes, they can migrate the data and change the connection strings in the code. Also, in the absence of the Infrastructure team, the AWS RDS service takes care of the Infrastructure.
- **Option B, C, D** **are incorrect** because managing code and Infrastructure can’t be done.

**Refer to Easy to administer Section:**

- https://aws.amazon.com/rds/