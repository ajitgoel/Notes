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
**VPC peering connection:**
    a. networking connection between two VPCs that enables you to route traffic between them privately. Instances in either VPC can communicate with each other as if they are within the same network. 
    b. You can create a VPC peering connection between your own VPCs, with a VPC in another AWS account, or with a VPC in a different AWS Region.
    c. AWS uses the existing infrastructure of a VPC to create a VPC peering connection; it is neither a gateway nor a VPN connection and does not rely on a separate piece of physical hardware. 
    b. There is no single point of failure for communication or a bandwidth bottleneck
**Transit Gateway:** used for interconnecting VPCs and onpremises networks through a central hub
**Direct Connect gateway** By attaching a transit gateway to a Direct Connect gateway using a transit virtual interface, you can manage a single connection for multiple VPCs or VPNs that are in the same AWS Region. 
**Transit Gateway & Direct Connect gateway**	
	a. simplify the management of connections between an Amazon VPC and your networks over a private connection. 
	b. minimize network costs, 
	c. improve bandwidth throughput
	d. provide a more reliable network experience than Internet-based connections.
	e. **Transit Gateway** mainly used for connecting VPCs and on-premises networks through a central hub.
	
<img src="Definations.assets/image-20210902211108581.png" alt="image-20210902211108581" style="zoom:67%;" />

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
	h. for high IOPS performance, SSD volumes are more suitable to use instead of HDD volumes.
	i. SSD's are best for workloads with small, random I/O operations
	j. HDD's are best for large, sequential I/O operations.

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
**Amazon S3 Transfer Acceleration** enables fast, & secure transfers of files over long distances between your client and your Amazon S3 bucket. 

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

**EC2** 	
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
	- Applications with steady state usage
	- Applications that may require reserved capacity
	- Customers that can commit to using EC2 over a 1 or 3 year term to reduce their total computing costs
**Reserved Instance Marketplace** is a platform that supports the sale of third-party and AWS customers' unused Standard Reserved Instances, which vary in terms of lengths and pricing options
**Spot instances** are spare compute capacity in the AWS cloud available to you at steep discounts compared to On-Demand prices. It can be interrupted by AWS EC2 with two minutes of notification when the EC2 needs the capacity back.
**EC2 Billing**:
	You will be billed when your On-Demand instance is preparing to hibernate with a `stopping` state
	You will be billed when your Reserved instance is in `terminated` state

**placement strategies**
**Cluster** – packs instances close together inside an Availability Zone. This strategy enables workloads to achieve the low-latency network performance necessary for tightly-coupled node-to-node communication that is typical of HPC applications.
**Partition** – spreads your instances across logical partitions such that groups of instances in one partition do not share the underlying hardware with groups of instances in different partitions. This strategy is typically used by large distributed and replicated workloads, such as Hadoop, Cassandra, and Kafka.
**Spread** – strictly places a small group of instances across distinct underlying hardware to reduce correlated failures.

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


**Databases**
**Amazon RDS** 
	a. is a "managed" service and not "fully managed"
	b. one still have to manually scale up your resources and create Read Replicas to improve scalability
**DynamoDB** 
	a. is a "fully managed" service.
**AppSync** use appsync with DynamoDB to make it easy for you to build collaborative apps that keep shared data updated in real time.
**Amazon DynamoDB Accelerator (DAX)** 
	a. fully managed, highly available, in-memory cache for DynamoDB. 
	b. add in-memory acceleration to your DynamoDB tables, without requiring developers to manage cache invalidation, data population, or cluster management.
**Amazon API Gateway** 
	lets you create an API that acts as a "front door" for applications to access data, business logic, or functionality from your back-end services, such as code running on AWS Lambda. 
	handles all of the tasks involved in accepting and processing API calls, including traffic management, authorization and access control, monitoring, and API version management. 
	has no minimum fees or startup costs.

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
**AWS DataSync**
	does not work with Amazon EBS volumes. 
	can copy data between Network File System (NFS) shares, Server Message Block (SMB) shares, self-managed object storage, AWS Snowcone, Amazon Simple Storage Service (Amazon S3) buckets, Amazon Elastic File System (Amazon EFS) file systems, and Amazon FSx for Windows File Server file systems.
**To protect your system from DDoS attack, you can:**
	a. Use an Amazon CloudFront service for distributing both static and dynamic content.
	b. Use an Application Load Balancer with Auto Scaling groups for your EC2 instances. 
	c. Prevent direct Internet traffic to your Amazon RDS database by deploying it to a new private subnet.
	d. Set up alerts in Amazon CloudWatch to look for high **`Network In`** and CPU utilization metrics.	
	e. use AWS Shield and AWS WAF to fortify your cloud network. 
	f. Services that are available in AWS edge locations(CloudFront, AWS WAF, Amazon Route53, and Amazon API Gateway) allow you to take advantage of a global network of edge locations that can provide your application with greater fault tolerance and increased scale for managing larger volumes of traffic.
**AWS Shield** 
	a. is a managed DDoS protection service that is available in two tiers: Standard and Advanced. 
	b. AWS Shield Standard applies always-on detection and inline mitigation techniques, such as deterministic packet filtering and priority-based traffic shaping, to minimize application downtime and latency.
**AWS Web application firewall(WAF)** 
	a. web application firewall that helps protect web applications from common web exploits
	b. You can use AWS WAF to define customizable web security rules that control which traffic accesses your web applications. 
	c. If you use AWS Shield Advanced, you can use AWS WAF at no extra cost for those protected resources.	
 **Elastic Fabric Adapter (EFA)** 
 	a. network device that you can attach to your Amazon EC2 instance to accelerate High-Performance Computing (HPC) and machine learning applications.
	b. you can attach only one EFA per EC2 instance.
**AWS Single Sign-On (SSO)** is a cloud SSO service that just makes it easy to centrally manage SSO access to multiple AWS accounts and business applications. 	