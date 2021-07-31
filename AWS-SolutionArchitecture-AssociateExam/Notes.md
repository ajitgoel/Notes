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