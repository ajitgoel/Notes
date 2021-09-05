Definitions:
**VPC endpoint**:
    a. enables you to privately connect your VPC to supported AWS services and VPC endpoint services powered by PrivateLink without requiring an Internet gateway, NAT device, VPN connection, or AWS Direct Connect connection. 
    b. Instances in your VPC do not require public IP addresses to communicate with resources in the service. 
	c. Traffic between your VPC and the other services does not leave the Amazon network.
	d. **gateway endpoint** is a gateway that you specify in your route table to access Amazon S3 from your VPC over the AWS network. There is no additional charge for using gateway endpoints. However, standard charges for data transfer and resource usage still apply.
	e. **Interface endpoints** extend the functionality of gateway endpoints by using private IP addresses to route requests to Amazon S3 from within your VPC, on-premises, or from a different AWS Region. 
	f. Interface endpoints are compatible with gateway endpoints. 
	g. If you have an existing gateway endpoint in the VPC, you can use both types of endpoints in the same VPC.

<img src="Definations.assets/image-20210902220825087.png" alt="image-20210902220825087"  />

**Endpoints** are virtual devices, that allow communication between instances in your VPC and services without imposing constraints on your network traffic.
==**VPC peering connection:**==
    a. ==networking connection between two VPCs that enables you to route traffic between them privately.== Instances in either VPC can communicate with each other as if they are within the same network. 
    b. You can create a VPC peering connection between your own VPCs, with a VPC in another AWS account, or with a VPC in a different AWS Region.
    c. AWS uses the existing infrastructure of a VPC to create a VPC peering connection; it is neither a gateway nor a VPN connection and does not rely on a separate piece of physical hardware. 
    b. There is no single point of failure for communication or a bandwidth bottleneck
**Transit Gateway:** used for interconnecting VPCs and onpremises networks through a central hub
**Direct Connect gateway** 
	By attaching a transit gateway to a Direct Connect gateway using a transit virtual interface, you can manage a single connection for multiple VPCs or VPNs that are in the same AWS Region.
	**link aggregation group (LAG)** is just a logical interface that uses the Link Aggregation Control Protocol (LACP) to aggregate multiple connections at a single AWS Direct Connect endpoint, allowing you to treat them as a single, managed connection. 
**Transit Gateway & Direct Connect gateway**	
	a. simplify the management of connections between an Amazon VPC and your networks over a private connection. 
	b. minimize network costs, 
	c. improve bandwidth throughput
	d. provide a more reliable network experience than Internet-based connections.
	e. ==**Transit Gateway** mainly used for connecting VPCs and on-premises networks through a central hub.==
	
<img src="Definations.assets/image-20210902211108581.png" alt="image-20210902211108581"  />
==**inter-region VPC peering**== 
	==allows peering relationships to be established between VPCs across different AWS regions.== 
	ensure that the traffic will always stay on the global AWS backbone and will never traverse the public Internet 
	==would require a lot of manual set up and management overhead to successfully build a functional, error-free inter-region VPC network compared with just using a Transit Gateway.== 
	cost-effective way to share resources between regions or replicate data for geographic redundancy, 
	==its connections are not dedicated and highly available.== 
	doesn't support the company's on-premises data centers in multiple AWS Regions.
**VPC Flow Logs** is a feature that enables you to capture information about the IP traffic going to and from network interfaces in your entire VPC. 

**AWS DataSync**
	does not work with Amazon EBS volumes. 
	can copy data between Network File System (NFS) shares, Server Message Block (SMB) shares, self-managed object storage, AWS Snowcone, Amazon Simple Storage Service (Amazon S3) buckets, Amazon Elastic File System (Amazon EFS) file systems, and Amazon FSx for Windows File Server file systems.

**VPN connection** 
	a. traverses the public Internet
	b. doesn't use a dedicated connection
	c. allows you to connect your AWS cloud resources to your on-premises data center using secure and private sessions with IP Security (IPSec) or Transport Layer Security (TLS) tunnels

**VPN connectivity options**
You can connect your Amazon VPC to remote networks and users using the following VPN connectivity options:
**AWS Site-to-Site VPN** - creates an IPsec VPN connection between your VPC and your remote network. On the AWS side of the Site-to-Site VPN connection, a virtual private gateway or transit gateway provides two VPN endpoints (tunnels) for automatic failover.
**AWS Client VPN -** a managed client-based VPN service that provides secure TLS VPN connections between your AWS resources and on-premises networks.
**AWS VPN CloudHub -** capable of wiring multiple AWS Site-to-Site VPN connections together on a virtual private gateway. This is useful if you want to enable communication between different remote networks that uses a Site-to-Site VPN connection.
**Third-party software VPN appliance -** You can create a VPN connection to your remote network by using an Amazon EC2 instance in your VPC that's running a third party software VPN appliance.

<img src="Definations.assets/image-20210902221907043.png" alt="image-20210902221907043"  />

**NAT Gateway:** 
	a. allows instances in the private subnet to gain access to the Internet
	b. are charged on an hourly basis even for idle time.
**RAID (Redundant Array of Independent Disks):** data storage virtualization technology that combines multiple storage devices to achieve higher performance or data durability. 
==**RAID 0:**==
	==enables you to improve your storage volumes' performance by distributing the I/O across the volumes in a stripe.==
==**RAID 1 configuration** can mirror two volumes together== to achieve on-instance redundancy.

**Private Virtual Interface** 
	allows you to connect to your VPC resources on your private IP address or endpoint.

==**Amazon EBS:**== 
    a. block-level ==storage device that you can attach to a single EC2 instance.== 
    b. Is not a concurrently accessible storage
	c. EBS volumes behave like raw, unformatted block devices. 
	d. EBS volumes that are attached to an instance are exposed as storage volumes that persist independently from the life of the instance.
	e. is the persistent block storage volume. 
	f. It is mainly used as the root volume to store the OS of an EC2 instance. 
	g. To encrypt an EBS volume at rest, you can use AWS KMS customer master keys for the encryption of both the boot and data volumes of an EC2 instance.
	h. for high IOPS performance, SSD volumes are more suitable to use instead of HDD volumes.
	i. SSD's are best for workloads with small, random I/O operations
	j. HDD's are best for large, sequential I/O operations.
	==k. provides lowest latency access compared to EFS==

 **EBS type of Provisioned IOPS SSD** 
 	provides sustained performance for mission-critical low-latency workloads.
**EBS Throughput Optimized HDD (st1)**
	these are HDD volumes which are more suitable for large streaming workloads rather than transactional database workloads.
**EBS Cold HDD (sc1)** 
	these are HDD volumes which are more suitable for large streaming workloads rather than transactional database workloads	
**EBS General Purpose SSD (gp2)** 
	it does not provide the high IOPS required by the application, unlike the Provisioned IOPS SSD volume.

**Amazon EFS:**
    file storage service for use with Amazon EC2. 
    provides a file system interface, file system access semantics (such as strong consistency and file locking), and concurrently-accessible storage for up to thousands of Amazon EC2 instances. 

==**Amazon VPC**:==
**Network Access Control List(NACL)**:
	a. Rules are evaluated starting with the lowest numbered rule. As soon as a rule matches traffic, it's applied immediately regardless of any higher-numbered rule that may contradict it.

==**AWS S3:**== 
	a. an object storage service.
	b. supports SNS topic, SQS queue, AWS Lambda destinations where it can publish events.	
	c. `s3:ObjectRemoved:DeleteMarkerCreated` type is triggered when a delete marker is created for a versioned object and not when an object is deleted or a versioned object is permanently deleted.
	d. `s3:ObjectRemoved:Delete` type is triggered when an object is deleted or a versioned object is permanently deleted.
	e. All objects and buckets by default are private which means that only the AWS account holder (resource owner) that created it has access to the resource. The resource owner can optionally grant access permissions to others by writing an access policy. 
	f. you also set the permissions of the object during upload to make it public.
	g. Under ***Manage public permissions**,* you can grant read access to your objects to everyone in the world, for all of the files that you're uploading. eg: when buckets are used for websites. in this case, the S3 bucket policy is configured to set all objects to public read.
	h. You may choose to use resource-based policies, user policies, or some combination of these to manage permissions to your Amazon S3 resources.
	h.1.  **resource-based policies** and user policies. Access policies you attach to your resources (buckets and objects) are referred to as resource-based policies. eg: bucket policies and access control lists (ACLs) are resource-based policies. 
	h.2. **user policies:** You can also attach access policies to users in your account.
	i. Objects can be encrypted using Server-side encryption (SSE).
	j. ==**Server Access Logging feature of Amazon S3**: provides more detailed information about every access request sent to the S3 bucket including the referrer and turn-around time information compared to **CloudTrail Logging feature of Amazon S3.**==
	k. **CORS** will only allow objects from one domain (travel.cebu.com) to be loaded and accessible to a different domain (palawan.com). 

**Amazon S3 notification** feature enables you to receive notifications when certain events happen in your bucket.	
**S3 Batch Operations** runs multiple S3 operations in a single request. 

**Amazon S3 access points** are named network endpoints that are attached to buckets that you can use to perform S3 object operations, such as uploading and retrieving objects.
**To securely serve private content in S3 by using CloudFront**:
	a. Require that your users access your private content by using special CloudFront signed URLs or signed cookies.
	b. Require that your users access your Amazon S3 content by using CloudFront URLs, not Amazon S3 URLs. This prevents users from bypassing the restrictions that you specify in signed URLs or signed cookies. You can do this by setting up an origin access identity (OAI) for your Amazon S3 bucket. You can also configure the custom headers for a private HTTP server or an Amazon S3 bucket configured as a website endpoint.	
==**AWS S3 Transfer Acceleration**== ==enables fast,== & secure ==transfers of files== over long distances ==between your client and your Amazon S3 bucket.== 
**Pre-signed URLs**: 
	a. are useful if you want your user/customer to be able to upload a specific object to your bucket, but you don't require them to have AWS security credentials or permissions.
**S3 payments:** you dont pay for bandwidth into\out of S3 when 
\- Data transferred in from the Internet.
\- Data transferred out to an Amazon EC2 instance, when the instance is in the same AWS Region as the S3 bucket (including to a different account in the same AWS region).
\- Data transferred out to Amazon CloudFront.
==\- there is no data transfer cost between S3 and EC2 in the same AWS Region==
in all other cases you pay for all bandwidth into and out of Amazon S3.

**Multipart Upload** 
	allows you to upload a single object as a set of parts. 
	You can upload these object parts independently and in any order. 
	If transmission of any part fails, you can retransmit that part without affecting other parts. 
	After all parts of your object are uploaded, Amazon S3 assembles these parts and creates the object. 
	In general, when your object size reaches 100 MB, you should consider using multipart uploads instead of uploading the object in a single operation.

**Amazon S3 Select** help analyze and process data within an object in Amazon S3 buckets

==**Amazon Glacier**== 
**Amazon Glacier Select** 
	a. is not an archive retrieval option 
	b. is primarily used to perform filtering operations using simple Structured Query Language (SQL) statements directly on your data archive in Glacier.
**Expedited retrievals** 
	a. allow you to quickly access your data when occasional urgent requests for a subset of archives are required.
	b. For all but the largest archives (250 MB+), data accessed using Expedited retrievals are typically made available within 1–5 minutes
**Provisioned Capacity** 
	a. ensures that retrieval capacity for Expedited retrievals is available when you need it.
	b. You should purchase provisioned retrieval capacity if your workload requires highly reliable and predictable access to a subset of your data in minutes. 
**Bulk Retrieval** 
	a. typically complete within 5–12 hours
	b. The provisioned capacity option is also not compatible with Bulk retrievals.

==**Amazon EC2**== 	
**When EC2 instance is stopped and started**
	The underlying host for the instance is possibly changed.
	All data on the attached instance-store devices will be lost.
	Elastic IP address(EIP) will actually remain associated with your instance even after stopping it.
	if it is an EC2-Classic instance, its Elastic IP address is disassociated from the instance. 
	if it is an EC2-VPC instance, the Elastic IP address remains associated.

**EC2 Instance Types** 	
**Reserved Instance:** 
	a. when a Reserved Instance expires, any instances that were covered by the Reserved Instance are billed at the on-demand price
	b. provide you with a significant discount (up to 75%) compared to On-Demand instance pricing.
	c. are recommended for:
	Applications with steady state usage
	Applications that may require reserved capacity
	need to commit to using EC2 over a 1 or 3 year term
**Reserved Instance Marketplace** is a platform that supports the sale of third-party and AWS customers' unused Standard Reserved Instances, which vary in terms of lengths and pricing options
**Spot instances** are spare compute capacity in the AWS cloud available to you at steep discounts compared to On-Demand prices. It can be interrupted by AWS EC2 with two minutes of notification when the EC2 needs the capacity back.

**EC2 Billing**:
	when your On-Demand instance is preparing to hibernate with a `stopping` state
	when your Reserved instance is in `terminated` state
	a running EC2 Instance
	EBS Volumes attached to stopped EC2 Instances
	no charge for using Amazon VPC

==**Import SSL\TLS certificate of application:**==
	**Amazon Certificate manager**: lets you import third-party certificates. 
	If ACM is not available in your region, use AWS CLI to upload your third-party certificate to the **IAM certificate store**.

**placement strategies**
**Cluster** – packs instances close together inside an Availability Zone. This strategy enables workloads to achieve the low-latency network performance necessary for tightly-coupled node-to-node communication that is typical of HPC applications.
**Partition** – spreads your instances across logical partitions such that groups of instances in one partition do not share the underlying hardware with groups of instances in different partitions. This strategy is typically used by large distributed and replicated workloads, such as Hadoop, Cassandra, and Kafka.
**Spread** – strictly places a small group of instances across distinct underlying hardware to reduce correlated failures.

**Amazon Data Lifecycle Manager (Amazon DLM)** to automate the creation, retention, and deletion of snapshots taken to back up your Amazon EBS volumes. 
**==Amazon Storage Gateway==** 
	==a. connects an on-premises software appliance with cloud-based storage== to provide seamless integration with data security features between your on-premises IT environment and the AWS storage infrastructure. ==You can use the service to store data in the AWS Cloud for scalable and cost-effective storage that helps maintain data security.==
	b. ==is used only for creating a backup of data from your on-premises server==

<img src="Definations.assets/aws-storage-gateway-stored-diagram.png" alt="img"  />
**NAT Gateway** is a highly available, managed Network Address Translation (NAT) service for your resources in a private subnet to access the Internet. 
**AWS Security Token Service (AWS STS)** is the service that you can use to create and provide trusted users with temporary security credentials that can control access to your AWS resources. 
**AWS Single Sign-On (SSO)** is a cloud SSO service that makes it easy to centrally manage SSO access to multiple AWS accounts and business applications.
Amazon Cognito service is primarily used for user authentication and not for providing access to your AWS resources. 
**JSON Web Token (JWT)** is meant to be used for user authentication and session management.
**Amazon WorkDocs** is a fully managed, secure content creation, storage, and collaboration service.
**Bastion host** is a special purpose computer on a network specifically designed and configured to withstand attacks. If you have a bastion host in AWS, it is basically just an EC2 instance. It should be in a public subnet with either a public or Elastic IP address with sufficient RDP or SSH access defined in the security group. Users log on to the bastion host via SSH or RDP and then use that session to manage other hosts in the private subnets
**Amazon Kinesis** is the streaming data platform of AWS and has four distinct services under it: Kinesis Data Firehose, Kinesis Data Streams, Kinesis Video Streams, and Amazon Kinesis Data Analytics.
**Amazon Kinesis Data Firehose** allows you to load streaming data into data stores and analytics tools. It can capture, transform, and load streaming data, enabling near real-time analytics with existing business intelligence tools and dashboards you are already using today. It is a fully managed service that automatically scales to match the throughput of your data and requires no ongoing administration. It can also batch, compress, and encrypt the data before loading it, minimizing the amount of storage used at the destination and increasing security. You can use Amazon Kinesis Data Firehose in conjunction with Amazon Kinesis Data Streams if you need to implement real-time processing of streaming big data. 
**Kinesis Data Streams** 
	a. provides an ordering of records, as well as the ability to read and/or replay records in the same order to multiple Amazon Kinesis Applications.
	b. is used to collect and process large streams of data records in real-time. 
	c. can be used for rapid and continuous data intake and aggregation.
	d. has a built-in enhanced fan-out feature
**Amazon Kinesis Client Library (KCL)** delivers all records for a given partition key to the same record processor, making it easier to build multiple applications reading from the same Amazon Kinesis data stream
**Amazon Redshift** 
	a. data warehouse that makes it simple and cost-effective to analyze all your data across your data warehouse and data lake. 
	b. delivers ten times faster performance than other data warehouses by using machine learning, massively parallel query execution, and columnar storage on high-performance disk.
	c. **Cross-Region snapshots:** You can configure Amazon Redshift to copy snapshots for a cluster to another region. 
	To configure cross-region snapshot copy, you need to enable this copy feature for each cluster and configure where to copy snapshots and how long to keep copied automated snapshots in the destination region. 

**Amazon Redshift with AWS Cloud Development Kit (AWS CDK)** 
	a. is mainly used for data warehousing making it simple and cost-effective to analyze your data across your data warehouse and data lake. 
	b. cannot collect and process large streams of data in real-time. 
**Amazon Managed Streaming for Apache Kafka (Amazon MSK)** 
	a. can process streaming data in real-time with Amazon MSK, 
	b. still entails a lot of administrative overhead, unlike Amazon Kinesis. 
	c. doesn't have a built-in enhanced fan-out feature
**Amazon Redshift Spectrum**, 
	allowing you to directly run SQL queries against exabytes of unstructured data in Amazon S3. 
	No loading or transformation is required, and you can use open data formats. 	
	automatically scales query compute capacity based on the data being retrieved, so queries against Amazon S3 run fast, regardless of data set size.

==**AWS Key Management Service (AWS KMS)**== 

**Server-side encryption** is the encryption of data at its destination by the application or service that receives it. 
**customer master key (CMK)** 
	is a logical representation of a master key. 
	includes metadata, such as the key ID, creation date, description, and key state. 
	contains the key material used to encrypt and decrypt data. 
	You can use a CMK to encrypt and decrypt up to 4 KB (4096 bytes) of data. 
**Envelope encryption.**: Typically, you use CMKs to generate, encrypt, and decrypt the data keys that you use outside of AWS KMS to encrypt your data. 

**AWS Key Management Service (AWS KMS)** 
	a. is a service that provide a key management system scaled for the cloud. 
	b. Amazon S3 uses AWS KMS customer master keys (CMKs) to encrypt your Amazon S3 objects. 
	c. SSE-KMS encrypts only the object data. Any object metadata is not encrypted.
	d. ==provides an audit trail that shows when your CMK was used and by whom==
	e. ==provides envelope encryption== where we use CMKs to generate, encrypt, and decrypt the data keys that you use outside of AWS KMS to encrypt your data.  
	==f.  can configure automatic key rotation==

**options depending on how you choose to manage the encryption keys:**
==**Use Server-Side Encryption with Amazon S3-Managed Keys (SSE-S3)** –== 
	a. Each object is encrypted with a unique key. 
	b. ==it encrypts the key itself with a master key that it regularly rotates.== 
	c. uses 256-bit Advanced Encryption Standard (AES-256)-one of the strongest block ciphers available, to encrypt your data.
	d. ==do not provide you with an audit trail that shows when your CMK was used and by whom==
	e. can configure automatic key rotation

==**Use Server-Side Encryption with Customer Master Keys (CMKs) Stored in AWS Key Management Service (SSE-KMS)**== – Similar to SSE-S3, but with some additional benefits and charges for using this service. There are separate permissions for the use of a CMK that provides added protection against unauthorized access of your objects in Amazon S3. SSE-KMS also provides you with an audit trail that shows when your CMK was used and by whom. Additionally, you can create and manage customer-managed CMKs or use AWS managed CMKs that are unique to you, your service, and your Region.
==**Use Server-Side Encryption with Customer-Provided Keys (SSE-C)** –== 
	a. ==You manage the encryption keys== 
	b. ==Amazon S3 manages the encryption, as it writes to disks, and decryption when you access your objects.==
	 c. ==do not provide you with an audit trail that shows when your CMK was used and by whom==
	d. can configure automatic key rotation

==**AWS SQS**:==
	**Standard Queue:**
		supports unlimited no of tx's per second per API action
		==a message is delivered at least once. occasionally more than one copy of message is delivered==
		==occasionally messages might be delivered in an order different from which they were send==

​	**FIFO Queue:**
​		by default FIFO queues support  upto 3000 messages per second per API action through batching
​		==a mesage is delivered once and remains available until a consumer processses and deletes it. duplicates are not introduced into the queue.==
​		==the order in which messages are send and received is strickly preserved.== 

==**AWS SWF**== 
	is a fully-managed state tracker and task coordinator service. 
	does not provide serverless orchestration to multiple AWS resources.
	==ensures that a task is never duplicated and is assigned only once.== 

**Databases**
==**AWS RDS**== 
	a. is a "managed" service and not "fully managed"
	b. one still have to manually scale up your resources and create Read Replicas to improve scalability
	c. provides metrics in real time for the OS that your DB instance runs on. You can view the metrics for your DB instance using the console, or consume the Enhanced Monitoring JSON output from CloudWatch Logs in a monitoring system of your choice.
	d. **CloudWatch** gathers metrics about CPU utilization from the hypervisor for a DB instance, and Enhanced Monitoring gathers its metrics from an agent on the instance.  ==**Enhanced Monitoring** metrics are useful when you want to see how different processes or threads on a DB instance use the CPU.==
	e. ==**Regular items provided by Amazon RDS Metrics in CloudWatch:** CPU Utilization, Database Connections, and Freeable Memory== 
	f. **==Enhanced Monitoring metrics:==**
	==**RDS child processes**== – Shows a summary of the RDS processes that support the DB instance, for example `aurora` for Amazon Aurora DB clusters and `mysqld` for MySQL DB instances. Process threads appear nested beneath the parent process. Process threads show CPU utilization only as other metrics are the same for all threads for the process. The console displays a maximum of 100 processes and threads. The results are a combination of the top CPU consuming and memory consuming processes and threads. If there are more than 50 processes and more than 50 threads, the console displays the top 50 consumers in each category. This display helps you identify which processes are having the greatest impact on performance.
	==**RDS processes**== – Shows a summary of the resources used by the RDS management agent, diagnostics monitoring processes, and other AWS processes that are required to support RDS DB instances.
	==**OS processes**== – Shows a summary of the kernel and system processes, which generally have minimal impact on performance.

==**DynamoDB**== 
	a. is a "fully managed" service.
	b. cannot be added to auto scaling group.
**DynamoDB auto scaling** uses the AWS Application Auto Scaling service to dynamically adjust provisioned throughput capacity on your behalf, in response to actual traffic patterns. This enables a table or a global secondary index to increase its provisioned read and write capacity to handle sudden increases in traffic, without throttling. When the workload decreases, Application Auto Scaling decreases the throughput so that you don’t pay for unused provisioned capacity.
**AppSync** use appsync with DynamoDB to make it easy for you to build collaborative apps that keep shared data updated in real time.
**Amazon DynamoDB Accelerator (DAX)** 
	a. fully managed, highly available, in-memory cache for DynamoDB. 
	b. add in-memory acceleration to your DynamoDB tables, without requiring developers to manage cache invalidation, data population, or cluster management.

==**Amazon API Gateway**== 
	lets you create an API that acts as a "front door" for applications to access data, business logic, or functionality from your back-end services, such as code running on AWS Lambda. 
	handles all of the tasks involved in accepting and processing API calls, including traffic management, authorization and access control, monitoring, and API version management. 
	has no minimum fees or startup costs.

==**AWS Config**== 
	is a service that enables you to assess, audit, and evaluate the configurations of your AWS resources. 
	continuously monitors and records your AWS resource configurations and allows you to automate the evaluation of recorded configurations against desired configurations. 

**==AWS Lambda:==**
**Lambda@Edge** 
	a. is a feature of Amazon CloudFront that lets you run code closer to users of your application, which improves performance and reduces latency.
	b. runs your code in response to events generated by the Amazon CloudFront content delivery network (CDN).
	c. You pay only for the compute time you consume – there is no charge when your code is not running.
	d. By using Lambda@Edge and Kinesis together, you can process real-time streaming data 

**AWS Inspector** is simply a security assessments service which only helps you in checking for unintended network accessibility of your EC2 instances and for vulnerabilities on those EC2 instances.

**==Amazon CloudWatch==**
==**CloudWatch agent** enables you to collect both system metrics and log files from Amazon EC2 instances== and on-premises servers. 
==By default, CloudWatch doesn't monitor memory usage but only the CPU utilization, Network utilization, Disk performance, and Disk Reads/Writes.==
To collect logs from your Amazon EC2 instances and on-premises servers into **CloudWatch Logs**, AWS offers both a new unified **CloudWatch agent**, and an **older CloudWatch Logs agent**.

**CloudWatch Logs Insights** enables you to interactively search and analyze your log data in Amazon CloudWatch Logs. You can perform queries to help you quickly and effectively respond to operational issues. If an issue occurs, you can use CloudWatch Logs Insights to identify potential causes and validate deployed fixes.
**AWS Systems Manager Agent (SSM Agent):** can be installed on each EC2 instance. This will automatically collect and push data to CloudWatch Logs. Less efficient than using Cloudwatch agent. 

==**AWS CloudFront**==
	a. improves performance for both cacheable content (such as images and videos) and dynamic content (such as API acceleration and dynamic site delivery). 
	b. use the AWS global network and its edge locations around the world.	
	c. integrate with AWS Shield for DDoS protection.
**AWS CloudTrail** 
	is primarily used for IT audits and API logging of all of your AWS resources. 
	It does not have the capability to trace and analyze user requests as they travel through your Amazon API Gateway APIs, unlike AWS X-Ray.
**AWS X-Ray** 
	used to trace and analyze user requests as they travel through your Amazon API Gateway APIs to the underlying services. 
	gives you an end-to-end view of an entire request, so you can analyze latencies in your APIs and their backend services. 
	you can configure sampling rules to tell X-Ray which requests to record, at what sampling rates, according to criteria that you specif

==**AWS Global Accelerator**== 
	a. provides static IP addresses that act as a fixed entry point to your application endpoints in a single or multiple AWS Regions, such as your Application Load Balancers, Network Load Balancers or Amazon EC2 instances.
	b. uses the AWS global network to optimize the path from your users to your applications, improving the performance of your TCP and UDP traffic. 
	c. continually monitors the health of your application endpoints and will detect an unhealthy endpoint and redirect traffic to healthy endpoints in less than 1 minute.
	d. use the AWS global network and its edge locations around the world.
	e. is a good fit for non-HTTP use cases, such as gaming (UDP), IoT (MQTT), or Voice over IP, as well as for HTTP use cases that specifically require static IP addresses or deterministic, fast regional failover. 
	f. integrate with AWS Shield for DDoS protection.

**Elastic Load Balancer(ELB)** 
	is designed to only run in one region and not across multiple regions.	

**AWS Backup** 
	a. is a centralized backup service to backup your application data across AWS services in the AWS Cloud.
	b. provides a central place where you can configure and audit the AWS resources you want to backup, automate backup scheduling, set retention policies, and monitor all recent backup and restore activity.
	c. **Backup plan** is a policy expression that defines when and how you want to back up your AWS resources.	
**AWS App Mesh** is a service mesh that provides application-level networking to make it easy for your services to communicate with each other across multiple types of compute infrastructure.	
**AWS Cloud Map** is a cloud resource discovery service that enables you to name your application resources with custom names and automatically update the locations of your dynamically changing resources.
**CloudEndure Migration** is highly automated lift-and-shift (rehost) solution that simplifies, expedites, and reduces the cost of migrating applications to AWS. 
**AWS Snowball** 
	is a migration tool that lets you transfer large amounts of data from your on-premises data center to AWS S3 and vice versa. 
	when you provision Snowball, you bear the responsibility of securing the device.
**AWS Import/Export** 
	is similar to AWS Snowball.
	is used as a migration tool.

**To protect your system from DDoS attack, you can:**
	a. Use an Amazon CloudFront service for distributing both static and dynamic content.
	b. Use an Application Load Balancer with Auto Scaling groups for your EC2 instances. 
	c. Prevent direct Internet traffic to your Amazon RDS database by deploying it to a new private subnet.
	d. Set up alerts in Amazon CloudWatch to look for high **`Network In`** and CPU utilization metrics.	
	e. use AWS Shield and AWS WAF to fortify your cloud network. 
	f. Services that are available in AWS edge locations(CloudFront, AWS WAF, Amazon Route53, and Amazon API Gateway) allow you to take advantage of a global network of edge locations that can provide your application with greater fault tolerance and increased scale for managing larger volumes of traffic.
**AWS Shield** 
	a. is a managed DDoS protection service that is available in two tiers: Standard and Advanced. 
	b. **AWS Shield Standard** applies always-on detection and inline mitigation techniques, such as deterministic packet filtering and priority-based traffic shaping, to minimize application downtime and latency.
**AWS Web application firewall(WAF)** 
	a. web application firewall that helps protect web applications from common web exploits
	b. You can use AWS WAF to define customizable web security rules that control which traffic accesses your web applications. 
	c. If you use **AWS Shield Advanced**, you can use AWS WAF at no extra cost for those protected resources.
**AWS GuardDuty** is an intelligent threat detection service to protect your AWS accounts and workloads. 	
 **Elastic Fabric Adapter (EFA)** 
 	a. network device that you can attach to your Amazon EC2 instance to accelerate High-Performance Computing (HPC) and machine learning applications.
	b. you can attach only one EFA per EC2 instance.
	c. It has OS-bypass capabilities that allow the HPC to communicate directly with the network interface hardware to provide low-latency, reliable transport functionality.

**Elastic Network Interface (ENI)** 
	is a logical networking component in a VPC that represents a virtual network card. 
	It doesn’t have OS-bypass capabilities that allow the HPC to communicate directly with the network interface hardware to provide low-latency, reliable transport functionality.
**Elastic Network Adapter (ENA)** 	
	It doesn’t have OS-bypass capabilities that allow the HPC to communicate directly with the network interface hardware to provide low-latency, reliable transport functionality.

**AWS Single Sign-On (SSO)** is a cloud SSO service that just makes it easy to centrally manage SSO access to multiple AWS accounts and business applications. 	
**AWS Firewall Manager** simplifies your AWS WAF administration and maintenance tasks across multiple accounts and resources.
**AWS Global Accelerator** is primarily used to optimize the path from your users to your applications which improves the performance of your TCP and UDP traffic.
**Cross-Region Replication** enables you to automatically copy S3 objects from one bucket to another bucket that is placed in a different AWS Region or within the same Region.

**AWS Batch** is primarily used to efficiently run hundreds of thousands of batch computing jobs in AWS.

**AWS Step Functions** provides serverless orchestration for modern applications.



**AWS PrivateLink** provides private connectivity between VPCs, AWS services, and on-premises applications, securely on the Amazon network.
**Amazon Athena** 
	is an interactive query service that makes it easy to analyze data in Amazon S3 using standard SQL expressions. 
	Athena is serverless. 

**<u>==Questions to review:==</u>**

Review Mode-4: Incorrect questions=> Question 18(EC2), 24(EBS), **CSAA - Design Resilient Architectures**=>9, 15