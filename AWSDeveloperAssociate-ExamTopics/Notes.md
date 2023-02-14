sam local invoke command
**AWS CloudWatch:**
- https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html#high-resolution-metrics
	- Standard resolution, with data having a one-minute granularity 
	- High resolution, with data at a granularity of one second
**Amazon ElastiCache for Memcached**
- designed for simplicity
**Amazon ElastiCache for Redis**
-  in cluster mode, provides high availability.
**AWS ECS:
Types of ECS deployment: https://d1.awsstatic.com/whitepapers/AWS_Blue_Green_Deployments.pdf
- Canary – Traffic is shifted in two increments.
- Linear – Traffic is shifted in equal increments. 
- All-at-once – All traffic is shifted to the updated tasks

**AWS Cognito:**
- User Pools are used for authentication. Identity Pools are used for User Authorization.
- user pool is more for scenarios with self created pools of user that register on our own site
**AWS API Gateway:**
- Can have stages
- Lambda proxy integration to return HTTP codes and headers
- https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-request-throttling.html
**AWS S3**:
- https://docs.aws.amazon.com/AmazonS3/latest/userguide/replication-config-for-kms-objects.html
Objects created with server-side encryption using customer-provided (SSE-C) encryption keys are not replicated.
- For cross account access, you need to set resource policy on the S3 bucket (to give access to the role in account A) as well as the IAM role in Account A having access to the bucket in B:
**AWS KMS:**
- has auditing capability
- **Client Side Encryption:** 
  https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html 
  When uploading an object—Using the customer master key (CMK) ID, the client first sends a request to AWS KMS for a CMK that it can use to encrypt your object data. AWS KMS returns two versions of a randomly generated data key: 
  - A plaintext version of the data key that the client uses to encrypt the object data 
  - A cipher blob of the same data key that the client uploads to Amazon S3 as object metadata
  Note: The client obtains a unique data key for each object that it uploads.
  
**AWS CodeDeploy:**
- appspec.yml file.
**AWS Application load balancer(ALB):**
- X-Forwarded-For header
**AWS IAM:**
- get-session-token CLI command
**AWS EC2:**
- An instance profile is a container for an IAM role that you can use to pass role information to an EC2 instance when the instance starts.
- instance metadata from http://169.254.169.254/latest/meta-data/
- Encrypted EBS volume
	- Uses AWS KMS 
**Amazon CloudFront**
	distribution origin
		ALB
			authentication provider
				Amazon Cognito
	real time logs
		stream
			Amazon Kinesis Data Streams
- field level encryption
- You can offload authorization by using CloudFront Function. https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/example-function-validate-token.html
- CloudFront Function supports URL redirects or rewrites - You can redirect viewers to other pages based on information in the request, or rewrite all requests from one path to another. Ref: https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/edge-functions.html
**AWS Lambda**
- can have alias
- Triggers
	Amazon Cognito post authentication Lambda trigger
- No of concurrent lambda instances
- event source mapping 
- **Lambda alias** is like a pointer to a specific function version. Users can access the function version using the alias Amazon Resource Name (ARN)
- lambda may time out for big S3 file, causing multiple lambda retries. https://docs.aws.amazon.com/lambda/latest/dg/invocation-retries.html
**AWS SQS:**
	- when we do multiple receive messages calls on an SQS FIFO queue with the same group id, only the first one returns a result.
	- **visibility timeout** configures how long after a message is received by one consumer will it be able to be received again by another. The default is 30 seconds.
	eg: The queue has a single message.
![Visibility timeout](https://lucid.app/publicSegments/view/d20a8dd2-db3c-4f11-acad-3db4607e5b58/image.png)
		an initial receive message request returns the message
		another receive message request within the visibility timeout returns no messages
		after waiting for the visibility timeout to expire, another receive message request returns the message again
	- ==When creating your FIFO queue, configure the **visibility timeout** based on the time it takes to process each queue message. If you have long-running queue message processing, configure the _visibility timeout_ to be greater than the maximum duration of this processing. The maximum value you can choose is 12 hours.==
   - maximum of 20,000 inflight messages. A message is considered to be _in flight_ after it is received from a queue by a consumer, but not yet deleted from the queue
**AWS DynamoDB:**
- The **partition key** for a DynamoDB table must be unique.
- ==Choose a **sort key** that compliments access patterns==
- The combination of the partition key and sort key must form a unique value.
-  You can have repeating partition keys with different sort keys.
-  **exponential backoff:** is to **use progressively longer waits between retries for consecutive error responses**.
- provisioned capacity mode
- on-demand capacity mode
- **Conditional writes** are helpful in cases where multiple users attempt to modify the same item. there are two ways to ensure that lost updates phenomenon does not happen in DynamoDB tables: using **Conditional Writes** in DyanmoDB using **Optimistic Locking** using @Version support
- **DynamoDB RCU calculation** 
  1 read capacity unit (RCU) = 1 strongly consistent read of up to 4 KB/s = 2 eventually consistent reads of up to 4 KB/s per read. 2 RCUs = 1 transactional read request (one read per second) for items up to 4 KB. For reads on items greater than 4 KB, total number of reads required = (total item size / 4 KB) rounded up. 
  DynamoDB charges one WCU for each write per second (up to 1 KB) and two WCUs for each transactional write per second. 
  This should help with calculations. Here we have strong read consistency. Its 1 RCU upto 4Kb. In our case its 7 Kb so we need 2 RCU. For write we need 7 WCU. Here as per the query its 3 reads/second so 3*2=6 and for writes 7*10=70
**AWS ElasticBean:**
- Dockerrun.aws.json file
- **deployment options:**
  - Disabled
  - Rolling based on Health
  - **Immutable**: Immutable environment updates ensure that configuration changes that require replacing instances are applied efficiently and safely.
  - All at once
  - Canary
**Amazon SNS** 
- stops retrying the delivery and discards the message—unless a dead-letter queue is attached to the subscription. A dead-letter queue is an Amazon SQS queue
**AWS Systems Manager** 
- **Parameter Store** to store large numbers of environment variables.
**AWS RDS:**
-SQL Server does not support IAM credentials
