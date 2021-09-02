Definitions:
**VPC endpoint**:
    enables you to privately connect your VPC to supported AWS services and VPC endpoint services powered by PrivateLink without requiring an Internet gateway, NAT device, VPN connection, or
    AWS Direct Connect connection. 
    Instances in your VPC do not require public IP addresses to communicate with resources in the service. Traffic between your VPC and the other services does not leave the Amazon network.
**Endpoints** are virtual devices, that allow communication between instances in your VPC and services without imposing constraints on your network traffic.
**VPC peering connection:**
    a. networking connection between two VPCs that enables you to route traffic between them privately. Instances in either VPC can communicate with each other as if they are within the same network. 
    b. You can create a VPC peering connection between your own VPCs, with a VPC in another AWS account, or with a VPC in a different AWS Region.
    c. AWS uses the existing infrastructure of a VPC to create a VPC peering connection; it is neither a gateway nor a VPN connection and does not rely on a separate piece of physical hardware. 
    b. There is no single point of failure for communication or a bandwidth bottleneck
**Transit Gateway:** used for interconnecting VPCs and onpremises networks through a central hub
**NAT Gateway:** allows instances in the private subnet to gain access to the Internet
**RAID (Redundant Array of Independent Disks):** data storage virtualization technology that combines multiple storage devices to achieve higher performance or data durability. 
**RAID 0:** can stripe multiple volumes together for greater I/O performance than you can achieve with a single volume. 
**RAID 1** can mirror two volumes together to achieve on-instance redundancy.
**Amazon EBS:** 
    a. block-level storage device that you can attach to a single EC2 instance. 
    b. Is not a concurrently accessible storage
	c. EBS volumes behave like raw, unformatted block devices. 
	d. EBS volumes that are attached to an instance are exposed as storage volumes that persist independently from the life of the instance.
	e. is the persistent block storage volume. 
	f. It is mainly used as the root volume to store the OS of an EC2 instance. 
	g. To encrypt an EBS volume at rest, you can use AWS KMS customer master keys for the encryption of both the boot and data volumes of an EC2 instance.
**Amazon EFS:**
    file storage service for use with Amazon EC2. 
    provides a file system interface, file system access semantics (such as strong consistency and file locking), and concurrently-accessible storage for up to thousands of Amazon EC2 instances. 

**Amazon VPC**:
**Network Access Control List(NACL)**:
	a. Rules are evaluated starting with the lowest numbered rule. As soon as a rule matches traffic, it's applied immediately regardless of any higher-numbered rule that may contradict it.

**Amazon S3:** 
	a. an object storage service.
	b. supports SNS topic, SQS queue, AWS Lambda destinations where it can publish events.	
	c. `s3:ObjectRemoved:DeleteMarkerCreated` type is triggered when a delete marker is created for a versioned object and not when an object is deleted or a versioned object is permanently deleted.
	d. `s3:ObjectRemoved:Delete` type is triggered when an object is deleted or a versioned object is permanently deleted.
	e. All objects and buckets by default are private. 
	f. Objects can be encrypted using Server-side encryption (SSE).
**Amazon S3 notification** feature enables you to receive notifications when certain events happen in your bucket.	
**Amazon S3 access points** are named network endpoints that are attached to buckets that you can use to perform S3 object operations, such as uploading and retrieving objects.
**To securely serve private content in S3 by using CloudFront**:
	a. Require that your users access your private content by using special CloudFront signed URLs or signed cookies.
	b. Require that your users access your Amazon S3 content by using CloudFront URLs, not Amazon S3 URLs. This prevents users from bypassing the restrictions that you specify in signed URLs or signed cookies. You can do this by setting up an origin access identity (OAI) for your Amazon S3 bucket. You can also configure the custom headers for a private HTTP server or an Amazon S3 bucket configured as a website endpoint.

**Pre-signed URLs**: 
	a. are useful if you want your user/customer to be able to upload a specific object to your bucket, but you don't require them to have AWS security credentials or permissions.

**Amazon Glacier** 
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

**Amazon Data Lifecycle Manager (Amazon DLM)** to automate the creation, retention, and deletion of snapshots taken to back up your Amazon EBS volumes. 
**Amazon Storage Gateway** is used only for creating a backup of data from your on-premises server
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
**Amazon Redshift with AWS Cloud Development Kit (AWS CDK)** 
	a. is mainly used for data warehousing making it simple and cost-effective to analyze your data across your data warehouse and data lake. 
	b. cannot collect and process large streams of data in real-time. 
**Amazon Managed Streaming for Apache Kafka (Amazon MSK)** 
	a. can process streaming data in real-time with Amazon MSK, 
	b. still entails a lot of administrative overhead, unlike Amazon Kinesis. 
	c. doesn't have a built-in enhanced fan-out feature
**Reserved Instance Marketplace** is a platform that supports the sale of third-party and AWS customers' unused Standard Reserved Instances, which vary in terms of lengths and pricing options
**Reserved Instance:** when a Reserved Instance expires, any instances that were covered by the Reserved Instance are billed at the on-demand price

**Databases**
**Amazon RDS** 
	a. is a "managed" service and not "fully managed"
	b. one still have to manually scale up your resources and create Read Replicas to improve scalability
**DynamoDB** 
	a. is a "fully managed" service.

**Elastic Load Balancer(ELB)** 
	is designed to only run in one region and not across multiple regions.	

**AWS Backup** 
	a. is a centralized backup service to backup your application data across AWS services in the AWS Cloud.
	b. provides a central place where you can configure and audit the AWS resources you want to backup, automate backup scheduling, set retention policies, and monitor all recent backup and restore activity.
	c. **Backup plan** is a policy expression that defines when and how you want to back up your AWS resources.	
**AWS App Mesh** is a service mesh that provides application-level networking to make it easy for your services to communicate with each other across multiple types of compute infrastructure.	
**AWS Cloud Map** is a cloud resource discovery service that enables you to name your application resources with custom names and automatically update the locations of your dynamically changing resources.