Question #1 Topic 1

A gaming website gives users the ability to trade game items with each other on the platform. The platform requires both users' records to be updated and persisted in one transaction. If any update fails, the transaction must roll back.  
Which AWS solution can provide the transactional capability that is required for this feature?  

-   A. Amazon DynamoDB with operations made with the Consistent Read parameter set to true
-   B. Amazon ElastiCache for Memcached with operations made within a transaction block
-   ==C. Amazon DynamoDB with reads and writes made by using Transact* operations Most Voted==
-   D. Amazon Aurora MySQL with operations made within a transaction block
-   E. Amazon Athena with operations made within a transaction block

**Correct Answer:** D [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/#)  

_Community vote distribution_

C (71%)

D (29%)

Question #2 Topic 1

A developer has created a Java application that makes HTTP requests directly to AWS services. Application logging shows 5xx HTTP response codes that occur at irregular intervals. The errors are affecting users.  
How should the developer update the application to improve the application's resiliency?  

-   A. Revise the request content in the application code.
-   ==B. Use the AWS SDK for Java to interact with AWS APIs. Most Voted==
-   C. Scale out the application so that more instances of the application are running.
-   D. Add additional logging to the application code.

**Correct Answer:** C [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/#)  

_Community vote distribution_

B (93%)

7%

==Question #3 Topic 1==

A global company has a mobile app with static data stored in an Amazon S3 bucket in the us-east-1 Region. The company serves the content through an Amazon CloudFront distribution. The company is launching the mobile app in South Africa. The data must reside in the af-south-1 Region. The company does not want to deploy a specific mobile client for South Africa.  What should the company do to meet these requirements?  

-   A. Use the CloudFront geographic restriction feature to block access to users in South Africa.
-   B. Create a Lambda@Edge function. Associate the Lambda@Edge function as an origin request trigger with the CloudFront distribution to change the S3 origin Region. Most Voted
-   C. Create a Lambda@Edge function. Associate the Lambda@Edge function as a viewer response trigger with the CloudFront distribution to change the S3 origin Region.
-   D. Include af-south-1 in the alternate domain name (CNAME) of the CloudFront distribution.

**Correct Answer:** A [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/#)  

_Community vote distribution_

B (100%)

Question #4 Topic 1

A developer is testing an AWS Lambda function by using the AWS Serverless Application Model (AWS SAM) local CLI. The application that is implemented by the  Lambda function makes several AWS API calls by using the AWS software development kit (SDK). The developer wants to allow the function to make AWS API calls in a test AWS account from the developer's laptop.  What should the developer do to meet these requirements?  

-   A. Edit the template.yml file. Add the AWS_ACCESS_KEY_ID property and the AWS_SECRET_ACCESS_KEY property in the Globals section.
==-   B. Add a test profile by using the aws configure command with the --profile option. Run AWS SAM by using the sam local invoke command with the -profile option. Most Voted==
-   C. Edit the template.yml tile. For the AWS::Serverless::Function resource, set the role to an IAM role in the AWS account.
-   D. Run the function by using the sam local invoke command. Override the AWS_ACCESS_KEY_ID parameter and the AWS_SECRET_ACCESS_KEY parameter by specifying the --parameter-overrides option.

**Correct Answer:** B [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/#)  

_Community vote distribution_

B (100%)

Question #5 Topic 1

A developer designed an application on an Amazon EC2 instance. The application makes API requests to objects in an Amazon S3 bucket.  Which combination of steps will ensure that the application makes the API requests in the MOST secure manner? (Choose two.)  

-   A. Create an IAM user that has permissions to the S3 bucket. Add the user to an IAM group.
==-   B. Create an IAM role that has permissions to the S3 bucket. Most Voted==
-   ==C. Add the IAM role to an instance profile. Attach the instance profile to the EC2 instance. Most Voted==
	  ==An instance profile is a container for an IAM role that you can use to pass role information to an EC2 instance when the instance starts.==
-   D. Create an IAM role that has permissions to the S3 bucket. Assign the role to an 1AM group.
-   E. Store the credentials of the IAM user in the environment variables on the EC2 instance.

**Correct Answer:** BC [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/#)  

_Community vote distribution_

BC (100%)

==Question #6 Topic 1==

A developer is configuring an Amazon CloudFront distribution for a new application to provide encryption in transit. The application is running in the eu-west-1 Region. The developer creates a new certificate in AWS Certificate Manager (ACM) in eu-west-1, but the certificate is not visible in the CloudFront distribution settings.  What should the developer do to fix this problem?  

-   A. Create the certificate for the domain in the same Region as the application. Ensure that the alternate domain name (CNAME) in the distribution settings matches the domain name in the certificate.
-   B. Create the certificate in the eu-west-1 Region. Ensure that the alternate domain name (CNAME) in the distribution settings matches the domain name in the certificate. Most Voted
-   C. Recreate the CloudFront distribution in the same Region as the certificate.
-   D. Specify the ACM certificate name as the default root object of the CloudFront distribution.

**Correct Answer:** B [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/#)  

_Community vote distribution_

B (80%)

C (20%)

Question #7 Topic 1

A developer is building an application that runs behind an Application Load Balancer (ALB). The ALB is configured as the origin for an Amazon CloudFront distribution. Users will log in to the application by using their social media accounts.  
How can the developer authenticate users?  

-   A. Validate the users by inspecting the tokens in an AWS Lambda authorizer on the ALB.
==-   B. Configure the ALB to use Amazon Cognito as one of the authentication providers.==
-   C. Configure CloudFront to use Amazon Cognito as one of the authentication providers.
-   D. Validate the users by calling the Amazon Cognito API in an AWS Lambda authorizer on the ALB.

**Correct Answer:** B [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/#)  

_Community vote distribution_

B (75%)

D (25%)

Question #8 Topic 1

A company has an application that analyzes photographs. A developer is preparing the application for deployment to Amazon EC2 instances. The application's image analysis functions require a mix of GPU instances and CPU instances that run on Amazon Linux. The developer needs to add code to the application so that the functions can determine whether they are running on a GPU instance.  What should the functions do to obtain this information?  

-   A. Call the DescribeInstances API operation and filter on the current instance ID. Examine the ElasticGpuAssociations property.
-   B. Evaluate the GPU AVAILABLE environment variable.
-   C. Call the DescribeElasticGpus API operation.
==-   D. Retrieve the instance type from the instance metadata. Most Voted==

Question #9 Topic 1

A company has an application that uses Amazon Cognito user pools as an identity provider. The company must secure access to user records. The company has set up multi-factor authentication (MFA). The company also wants to send a login activity notification by email every time a user logs in.  What is the MOST operationally efficient solution that meets this requirement?  

-   A. Create an AWS Lambda function that uses Amazon Simple Email Service (Amazon SES) to send the email notification. Add an Amazon API Gateway API to invoke the function. Call the API from the client side when login confirmation is received.
==-   B. Create an AWS Lambda function that uses Amazon Simple Email Service (Amazon SES) to send the email notification. Add an **Amazon Cognito post authentication Lambda trigger** for the function. Most Voted==
-   C. Create an AWS Lambda function that uses Amazon Simple Email Service (Amazon SES) to send the email notification. Create an Amazon CloudWatch Logs log subscription filter to invoke the function based on the login status.
-   D. Configure Amazon Cognito to stream all logs to Amazon Kinesis Data Firehose. Create an AWS Lambda function to process the streamed logs and to send the email notification based on the login status of each user.

Question #10 Topic 1

A company hosts a three-tier web application on AWS behind an Amazon CloudFront distribution. A developer wants a dashboard to monitor error rates and anomalies of the CloudFront distribution with the shortest possible refresh interval.  
Which combination of slops should the developer take to meet these requirements? (Choose two.)  

==-   A. Activate real-time logs on the CloudFront distribution. Create a stream in Amazon Kinesis Data Streams. Most Voted==
-   B. Export the CloudFront logs to an Amazon S3 bucket. Detect anomalies and error rates with Amazon QuickSight.
==-   C. Configure Amazon Kinesis Data Streams to deliver logs to Amazon OpenSearch Service (Amazon Elasticsearch Service). Create a dashboard in OpenSearch Dashboards (Kibana). Most Voted==
-   D. Create Amazon CloudWatch alarms based on expected values of selected CloudWatch metrics to detect anomalies and errors.
-   E. Design an Amazon CloudWatch dashboard of the selected CloudFront distribution metrics.

Question #11 Topic 1

A developer creates a customer managed key for multiple AWS users to encrypt data in Amazon S3. The developer configures Amazon Simple Notification  Service (Amazon SNS) to publish a message if key deletion is scheduled. The developer needs to preserve any SNS messages that cannot be delivered so that those messages can be reprocessed.  
Which AWS service or feature should the developer use to meet this requirement?  

-   A. Amazon Simple Email Service (Amazon SES)
-   B. AWS Lambda
==-   C. Amazon Simple Queue Service (Amazon SQS) Most Voted==
-   D. Amazon CloudWatch alarm

**Correct Answer:** C [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/2/#)  

_Community vote distribution_

C (100%)

Question #12 Topic 1

A developer needs to deploy an application to AWS Elastic Beanstalk for a company. The application consists of a single Docker image. The company's automated continuous integration and continuous delivery (CI/CD) process builds the Docker image and pushes the image to a public Docker registry.  How should the developer deploy the application to Elastic Beanstalk?  

-   ==A. Create a Dockerfile. Configure Elastic Beanstalk to build the application as a Docker image.
	docker-compose is only for building multi-container environments. For deploying a single container build, you either need to provide a `Dockerrun.aws.json` file that specifies where the already built Docker image is stored, OR build and run from a custom Dockerfile. Since the first option wasn't provided, the only other way to build a single-container environment is option A. (and providing a .zip file is only for non-dockerized EB configurations)==
-   B. Create a docker-compose.yml file. Use the Elastic Beanstalk CLI to deploy the application. Most Voted
-   C. Create a .zip file that contains the Docker image. Upload the .zip file to Elastic Beanstalk.
-   D. Create a Dockerfile. Run the Elastic Beanstalk CLI eb local run command in the same directory.

Question #13 Topic 1

A company is using AWS CodeDeploy for all production deployments. A developer has an Amazon Elastic Container Service (Amazon ECS) application that uses the CodeDeployDefault.ECSAIIAtOnce configuration. The developer needs to update the production environment in increments of 10% until the entire production environment is updated.  
Which CodeDeploy configuration should the developer use to meet these requirements?  

-   A. CodeDeployDefault.ECSCanary10Percent5Minutes
==-   B. CodeDeployDefault.ECSLinear10PercentEvery3Minutes Most Voted==
-   C. CodeDeployDefault.OneAtATime
-   D. CodeDeployDefault.LambdaCanary10Percent5Minutes

Question #14 Topic 1

A company is using AWS Elastic Beanstalk to deploy a three-tier application. The application uses an Amazon RDS DB instance as the database tier. The company wants to decouple the DB instance from the Elastic Beanstalk environment.  
Which combination of steps should a developer lake to meet this requirement? (Choose two.)  

==-   A. Create a new Elastic Beanstalk environment that connects to the DB instance.==
-   ==B. Create a new DB instance from a snapshot of the previous DB instance. Use the Elastic Beanstalk CLI to decouple the DB instance.==
-   D. Use the AWS CLI to decouple the DB instance.
-   E. Modify the current Elastic Beanstalk environment to connect to the DB instance.

Question #15 Topic 1

A company has point-of-sale devices across thousands of retail shops that synchronize sales transactions with a centralized system. The system includes an Amazon API Gateway API that exposes an AWS Lambda function. The Lambda function processes the transactions and stores the transactions in Amazon RDS for MySQL. The number of transactions increases rapidly during the day and is near zero at night. How can a developer increase the elasticity of the system MOST cost-effectively?  

-   A. Migrate from Amazon RDS to Amazon Aurora MySQL. Use an Aurora Auto Scaling policy to scale road replicas based on CPU consumption.
-   B. Migrate from Amazon RDS to Amazon Aurora MySQL. Use an Aurora Auto Scaling policy to scale read replicas based on the number of database connections.
-   C. Create an Amazon Simple Queue Service (Amazon SQS) queue. Publish transactions to the queue. Set the queue to invoke the Lambda function. Turn on enhanced fanout for the Lambda function.
==-   D. Create an Amazon Simple Queue Service (Amazon SQS) queue. Publish transactions to the queue. Set the queue to invoke the Lambda function. Set the reserved concurrency of the Lambda function to be less than the number of database connections. Most Voted==

Question #16 Topic 1

A developer is writing an AWS Lambda function. The Lambda function needs to access items that are stored in an Amazon DynamoDB table.  What is the MOST secure way to configure this access for the Lambda function?  

-   A. Create an IAM user that has permissions to access the DynamoDB table. Create an access key for this user. Store the access key ID and secret access key in the Lambda function environment variables.
-   B. Add a resource-based policy to the DynamoDB table to allow access from the Lambda function's IAM role.
==-   C. Create an IAM policy that allows access to the DynamoDB table. Attach this policy to the Lambda function's IAM role.==
-   D. Create a DynamoDB Accelerator (DAX) cluster. Configure the Lambda function to use the DAX duster to access the DynamoDB table.

Question #17 Topic 1

A developer is implementing user authentication and authorization for a web application that is hosted on an Amazon EC2 instance. The developer needs to ensure that the user credentials are encrypted and secure when they are stored and transmitted.  Which solution will meet these requirements?  
-   A. Activate web server modules for authentication and authorization on the instance. Use HTTP basic authentication for the user login.
-   B. Deploy a custom authentication and authorization API over HTTP. Store the user credentials on Amazon ElastiCache for Redis.
==-   C. Use Amazon Cognito to configure a user pool. Use the Amazon Cognito API to authenticate and authorize the users. Most Voted==
-   D. Create IAM users. Assign the users to different IAM groups. Use AWS Single Sign-On to authenticate and authorize each user.

Question #18 Topic 1

A company that has multiple offices uses an Amazon DynamoDB table to store employee payroll information. Item attributes consist of employee names, office identifiers, and cumulative daily hours worked The most frequently used query extracts a report of an alphabetical subset of employees for a specific office.  Which design of the DynamoDB table primary key will have the MINIMUM performance impact?  

-   A. Partition key on the office identifier and sort key on the employee name Most Voted
-   ==B. Partition key on the employee name and sort key on the office identifier==
-   C. Partition key on the employee name
-   D. Partition key on the office identifier

Question #19 Topic 1

A company hosts a microservices application that uses Amazon API Gateway. AWS Lambda, Amazon Simple Queue Service (Amazon SQS), and Amazon DynamoDB. One of the Lambda functions adds messages to an SQS FIFO queue.  
When a developer checks the application logs, the developer finds a few duplicated items in a DynamoDB table. The items were inserted by another polling function that processes messages from the queue. What is the MOST likely cause of this issue?  

-   A. Write operations on the DynamoDB table are being throttled.
-   B. The SQS queue delivered the message to the function more than once.
-   C. API Gateway duplicated the message in the SQS queue.
==-   D. The polling function timeout is greater than the queue visibility timeout. Most Voted==
	https://tomgregory.com/3-surprising-facts-about-aws-sqs-fifo-queues/

Question #20 Topic 1

A development team has been using a builder server that is hosted on an Amazon EC2 instance to perform builds and deployments for the last 3 months. The  EC2 instance's instance profile uses an IAM role that contains the Administrator Access managed policy. The development team must replace that policy with a policy that provides only the required permissions.  What is the FASTEST way to create a custom 1AM policy for the EC2 instance to meet this requirement?  

-   A. Create a new IAM policy based on services that the build server deployed or updated in the last 3 months.
-   ==B. Create a new IAM policy that includes all actions that AWS CloudTrail recorded for the IAM role in the last 3 months. Most Voted==
-   C. Create a new permissions boundary policy that denies all access. Associate the permissions boundaries with the IAM role.
-   D. Create a new IAM policy by using Amazon Athena to query an Amazon S3 bucket that contains AWS CloudTrail events that the IAM role performed in the last 3 months.

Question #21 Topic 1

A developer needs to write an AWS CloudFormation template on a local machine and deploy a CloudFormation stack to AWS.  
What must the developer do to complete these tasks?  

-   A. Install the AWS CLI. Configure the AWS CLI by using an IAM user name and password.
-   B. Install the AWS CLI. Configure the AWS CLI by using an SSH key.
==-   C. Install the AWS CLI. Configure the AWS CLI by using an IAM user access key and secret key. Most Voted==
-   D. Install an AWS software development kit (SDK). Configure the SDK by using an X.509 certificate.

Question #22 Topic 1

A developer is working on a web application that runs on Amazon Elastic Container Service (Amazon ECS) and uses an Amazon DynamoDB table to store data.  The application performs a large number of read requests against a small set of the table data.  How can the developer improve the performance of these requests? (Choose two.)  

==-   A. Create an Amazon ElastiCache cluster. Configure the application to cache data in the cluster.==
==-   B. Create a DynamoDB Accelerator (DAX) cluster. Configure the application to use the DAX cluster for DynamoDB requests. Most Voted==
-   C. Configure the application to make strongly consistent read requests against the DynamoDB table.
-   D. Increase the read capacity of the DynamoDB table.
-   E. Enable DynamoDB adaptive capacity.

Question #23 Topic 1

A developer needs to use Amazon DynamoDB to store customer orders. The developer's company requires all customer data to be encrypted at rest with a key that the company generates.  What should the developer do to meet these requirements?  

-   A. Create the DynamoDB table with encryption set to None. Code the application to use the key to decrypt the data when the application reads from the table. Code the application to use the key to encrypt the data when the application writes to the table.
==-   B. Store the key by using AWS Key Management Service (AWS KMS). Choose an AWS KMS customer managed key during creation of the DynamoDB table. Provide the Amazon Resource Name (ARN) of the AWS KMS key. Most Voted==
-   C. Store the key by using AWS Key Management Service (AWS KMS). Create the DynamoDB table with default encryption. Include the kms:Encrypt parameter with the Amazon Resource Name (ARN) of the AWS KMS key when using the DynamoDB software development kit (SDK).
-   D. Store the key by using AWS Key Management Service (AWS KMS). Choose an AWS KMS AWS managed key during creation of the DynamoDB table. Provide the Amazon Resource Name (ARN) of the AWS KMS key.

Question #24 Topic 1

A developer is creating a solution to track an account's Amazon S3 buckets over time. The developer has created an AWS Lambda function that will run on a schedule. The function will list the account's S3 buckets and will store the list in an Amazon DynamoDB table. The developer receives a permissions error when the developer runs the function with the AWSLambdaBasicExecutionRole AWS managed policy.  Which combination of permissions should the developer use to resolve this error? (Choose two.)  

-   A. Cross-account IAM role
==-   B. Permission for the Lambda function to list buckets in Amazon S3
-   C. Permission for the Lambda function to write in DynamoDB==
-   D. Permission for Amazon S3 to invoke the Lambda function
-   E. Permission for DynamoDB to invoke the Lambda function

Question #25 Topic 1

A company is adding items to an Amazon DynamoDB table from an AWS Lambda function that is written in Python. A developer needs to implement a solution that inserts records in the DynamoDB table and performs automatic retry when the insert fails. Which solution meets these requirements with MINIMUM code changes?  

-   A. Configure the Python code to run the AWS CLI through shell to call the PutItem operation
-   B. Call the PutItem operation from Python by using the DynamoDB HTTP API
-   C. Queue the items in AWS Glue, which will put them into the DynamoDB table
==-   D. Use the AWS software development kit (SDK) for Python (boto3) to call the PutItem operation Most Voted==

Question #26 Topic 1

A developer is writing an AWS Lambda function. The developer wants to log key events that occur during the Lambda function and include a unique identifier to associate the events with a specific function invocation. Which of the following will help the developer accomplish this objective?  

-   A. Obtain the request identifier from the Lambda context object. Architect the application to write logs to the console. Most Voted
-   B. Obtain the request identifier from the Lambda event object. Architect the application to write logs to a file.
-   C. Obtain the request identifier from the Lambda event object. Architect the application to write logs to the console.
==-   D. Obtain the request identifier from the Lambda context object. Architect the application to write logs to a file. Most Voted==
	==needs to log key events into file, since CloudWatch logs will contains too much noise.==

**Correct Answer:** A [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/3/#)  

_Community vote distribution_

A (55%)

D (45%)

==Question #27 Topic 1==

A company experienced partial downtime during the last deployment of a new application. AWS Elastic Beanstalk split the environment's Amazon EC2 instances into batches and deployed a new version one batch at a time after taking them out of service. Therefore, full capacity was not maintained during deployment.  The developer plans to release a new version of the application, and is looking for a policy that will maintain full capacity and minimize the impact of the failed deployment.  
Which deployment policy should the developer use?  

-   A. Immutable Most Voted
-   B. All at Once
-   C. Rolling
-   D. Rolling with an Additional Batch

**Correct Answer:** D [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/3/#)  
Reference:  
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.rolling-version-deploy.html

_Community vote distribution_

A (100%)

Question #28 Topic 1

A company is providing services to many downstream consumers. Each consumer may connect to one or more services. This has resulted in a complex architecture that is difficult to manage and does not scale well. The company needs a single interface to manage these services to consumers. Which AWS service should be used to refactor this architecture?  

-   A. AWS Lambda
-   B. AWS X-Ray
-   C. Amazon SQS
==-   D. Amazon API Gateway==

Question #29 Topic 1

When a Developer tries to run an AWS CodeBuild project, it raises an error because the length of all environment variables exceeds the limit for the combined maximum of characters.  What is the recommended solution?  

-   A. Add the export LC_ALL=ג€en_US.utf8ג€ command to the pre_build section to ensure POSIX localization.
-   B. Use Amazon Cognito to store key-value pairs for large numbers of environment variables.
-   C. Update the settings for the build project to use an Amazon S3 bucket for large numbers of environment variables.
==-   D. Use AWS Systems Manager Parameter Store to store large numbers of environment variables.==

Reference:  
https://docs.aws.amazon.com/codebuild/latest/userguide/troubleshooting.html

Question #30 Topic 1

A Development team decides to adopt a continuous integration/continuous delivery (CI/CD) process using AWS CodePipeline and AWS CodeCommit for a new application. However, management wants a person to review and approve the code before it is deployed to production.  How can the Development team add a manual approver to the CI/CD pipeline?  

-   A. Use AWS SES to send an email to approvers when their action is required. Develop a simple application that allows approvers to accept or reject a build. Invoke an AWS Lambda function to advance the pipeline when a build is accepted.
-   B. If approved, add an approved tag when pushing changes to the CodeCommit repository. CodePipeline will proceed to build and deploy approved commits without interruption.
-   C. Add an approval step to CodeCommit. Commits will not be saved until approved.
==-   D. Add an approval action to the pipeline. Configure the approval action to publish to an Amazon SNS topic when approval is required. The pipeline execution will stop and wait for an approval.==

Reference:  
https://docs.aws.amazon.com/codepipeline/latest/userguide/approvals-action-add.html

Question #31 Topic 1

A Developer is migrating an on-premises application to AWS. The application currently takes user uploads and saves them to a local directory on the server. All uploads must be saved and made immediately available to all instances in an Auto Scaling group.  Which approach will meet these requirements?  

-   A. Use Amazon EBS and configure the application AMI to use a snapshot of the same EBS instance on boot.
==-   B. Use Amazon S3 and rearchitect the application so all uploads are placed in S3. Most Voted==
-   C. Use instance storage and share it between instances launched from the same Amazon Machine Image (AMI).
-   D. Use Amazon EBS and file synchronization software to achieve eventual consistency among the Auto Scaling group.

==Question #32 Topic 1==

A developer is creating a script to automate the deployment process for a serverless application. The developer wants to use an existing AWS Serverless Application Model (AWS SAM) template for the application.  What should the developer use for the project? (Choose two.)  

-   A. Call aws cloudformation package to create the deployment package. Call aws cloudformation deploy to deploy the package afterward.
-   B. Call sam package to create the deployment package. Call sam deploy to deploy the package afterward.
-   C. Call aws s3 cp to upload the AWS SAM template to Amazon S3. Call aws lambda update-function-code to create the application.
-   D. Create a ZIP package locally and call aws serverlessrepo create-application to create the application.
-   E. Create a ZIP package and upload it to Amazon S3. Call aws cloudformation create-stack to create the application.

**Correct Answer:** CE [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/4/#)  
Reference:  
https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-getting-started-hello-world.html https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-cli-package.html

_Community vote distribution_

AB (67%)

BE (33%)

Question #33 Topic 1

A developer has built a market application that stores pricing data in Amazon DynamoDB with Amazon ElastiCache in front. The prices of items in the market change frequently. Sellers have begun complaining that, after they update the price of an item, the price does not actually change in the product listing.  
What could be causing this issue?  

==-   A. The cache is not being invalidated when the price of the item is changed==
-   B. The price of the item is being retrieved using a write-through ElastiCache cluster
-   C. The DynamoDB table was provisioned with insufficient read capacity
-   D. The DynamoDB table was provisioned with insufficient write capacity

Question #34 Topic 1

The developer is creating a web application that collects highly regulated and confidential user data through a POST request. The web application is served through Amazon CloudFront. User names and phone numbers must be encrypted at the edge and must remain encrypted throughout the entire application stack. What is the MOST secure way to meet these requirements?  

-   A. Enforce Match Viewer with HTTPS Only on CloudFront.
-   B. Use only the newest TLS security policy on CloudFront.
-   C. Enforce a signed URL on CloudFront on the front end.
==-   D. Use field-level encryption on CloudFront. Most Voted==

**Correct Answer:** D [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/4/#)  
Reference:  
https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/data-protection-summary.html  
![](https://www.examtopics.com/assets/media/exam-media/04238/0001900001.png)

Question #35 Topic 1

A Developer has been asked to create an AWS Lambda function that is triggered any time updates are made to items in an Amazon DynamoDB table. The function has been created, and appropriate permissions have been added to the Lambda execution role. Amazon DynamoDB streams have been enabled for the table, but the function is still not being triggered.  
Which option would enable DynamoDB table updates to trigger the Lambda function?  

-   A. Change the StreamViewType parameter value to NEW_AND_OLD_IMAGES for the DynamoDB table
==-   B. Configure event source mapping for the Lambda function Most Voted==
-   C. Map an Amazon SNS topic to the DynamoDB streams
-   D. Increase the maximum execution time (timeout) setting of the Lambda function

**Correct Answer:** A [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/4/#)  
Reference:  
https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html

==Question #36 Topic 1==

A company maintains a REST service using Amazon API Gateway and the API Gateway native API key validation. The company recently launched a new registration page, which allows users to sign up for the service. The registration page creates a new API key using CreateApiKey and sends the new key to the user. When the user attempts to call the API using this key, the user receives a 403 Forbidden error. Existing users are unaffected and can still call the API.  
What code updates will grant these new users access to the API?  

-   A. The createDeployment method must be called so the API can be redeployed to include the newly created API key.
-   B. The updateAuthorizer method must be called to update the API's authorizer to include the newly created API key.
-   C. The importApiKeys method must be called to import all newly created API keys into the current stage of the API.
-   D. The createUsagePlanKey method must be called to associate the newly created API key with the correct usage plan.

**Correct Answer:** C [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/4/#)  

_Community vote distribution_

D (100%)

Question #37 Topic 1

An application uploads photos to an Amazon S3 bucket. Each photo that is uploaded to the S3 bucket must be resized to a thumbnail image by the application.  
Each thumbnail image is uploaded with a new name in the same S3 bucket.  
Which AWS service can a developer configure to directly process each single S3 event for each S3 object upload?  

-   A. Amazon EC2
-   B. Amazon Elastic Container Service (Amazon ECS)
-   C. AWS Elastic Beanstalk
==-   D. AWS Lambda Most Voted==

Question #38 Topic 1

A company is running a Docker application on Amazon ECS. The application must scale based on user load in the last 15 seconds.  How should a Developer instrument the code so that the requirement can be met?  

-   A. Create a high-resolution custom Amazon CloudWatch metric for user activity data, then publish data every 30 seconds
==-   B. Create a high-resolution custom Amazon CloudWatch metric for user activity data, then publish data every 5 seconds==
-   C. Create a standard-resolution custom Amazon CloudWatch metric for user activity data, then publish data every 30 seconds
-   D. Create a standard-resolution custom Amazon CloudWatch metric for user activity data, then publish data every 5 seconds

Question #39 Topic 1

Where should the appspec.yml file be placed in order for AWS CodeDeploy to work?  

==-   A. In the root of the application source code directory structure Most Voted==
-   B. In the bin folder along with all the complied code
-   C. In an S3 bucket
-   D. In the same folder as the application configuration files

**Correct Answer:** A [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/4/#)  
Reference:  
https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file.html  
![](https://www.examtopics.com/assets/media/exam-media/04238/0002100001.png)

Question #40 Topic 1

A Developer is working on an application that handles 10MB documents that contain highly-sensitive data. The application will use AWS KMS to perform client- side encryption.  What steps must be followed?  

-   A. Invoke the Encrypt API passing the plaintext data that must be encrypted, then reference the customer managed key ARN in the KeyId parameter
-   B. Invoke the GenerateRandom API to get a data encryption key, then use the data encryption key to encrypt the data
-   C. Invoke the GenerateDataKey API to retrieve the encrypted version of the data encryption key to encrypt the data
==-   D. Invoke the GenerateDataKey API to retrieve the plaintext version of the data encryption key to encrypt the data Most Voted==

==Question #41 Topic 1==

An application uses Amazon Kinesis Data Streams to ingest and process large streams of data records in real time. Amazon EC2 instances consume and process the data from the shards of the Kinesis data stream by using Amazon Kinesis Client Library (KCL). The application handles the failure scenarios and does not require standby workers. The application reports that a specific shard is receiving more data than expected. To adapt to the changes in the rate of data flow, the  
`hot` shard is resharded.  
Assuming that the initial number of shards in the Kinesis data stream is 4, and after resharding the number of shards increased to 6, what is the maximum number of EC2 instances that can be deployed to process data from all the shards?  

-   A. 12
-   B. 6 Most Voted
-   C. 4
-   D. 1

**Correct Answer:** B [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/5/#)  

_Community vote distribution_

B (100%)

==Question #42 Topic 1==

A Company runs continuous integration/continuous delivery (CI/CD) pipelines for its application on AWS CodePipeline. A Developer must write unit tests and run them as part of the pipelines before staging the artifacts for testing.  
How should the Developer incorporate unit tests as part of CI/CD pipelines?  

-   A. Create a separate CodePipeline pipeline to run unit tests
-   B. Update the AWS CodeBuild specification to include a phase for running unit tests
-   C. Install the AWS CodeDeploy agent on an Amazon EC2 instance to run unit tests
-   D. Create a testing branch in AWS CodeCommit to run unit tests

**Correct Answer:** D [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/5/#)  

_Community vote distribution_

B (100%)

Question #43 Topic 1

A Developer has written an application that runs on Amazon EC2 instances and generates a value every minute. The Developer wants to monitor and graph the values generated over time without logging in to the instance each time.  
Which approach should the Developer use to achieve this goal?  

-   A. Use the Amazon CloudWatch metrics reported by default for all EC2 instances. View each value from the CloudWatch console.
-   B. Develop the application to store each value in a file on Amazon S3 every minute with the timestamp as the name.
==-   C. Publish each generated value as a custom metric to Amazon CloudWatch using available AWS SDKs.==
-   D. Store each value as a variable and add the variable to the list of EC2 metrics that should be reported to the Amazon CloudWatch console.

Question #44 Topic 1

A developer is trying to get data from an Amazon DynamoDB table called demoman-table. The developer configured the AWS CLI to use a specific IAM user's credentials and executed the following command:  
![](https://www.examtopics.com/assets/media/exam-media/04238/0002400001.png)  
The command returned errors and no rows were returned.  What is the MOST likely cause of these issues?  

-   A. The command is incorrect; it should be rewritten to use put-item with a string argument.
-   B. The developer needs to log a ticket with AWS Support to enable access to the demoman-table.
-   C. Amazon DynamoDB cannot be accessed from the AWS CLI and needs to be called via the REST API.
==-   D. The IAM user needs an associated policy with read access to demoman-table.==

Question #45 Topic 1

A Development team is working on a case management solution that allows medical claims to be processed and reviewed. Users log in to provide information related to their medical and financial situations.  
As part of the application, sensitive documents such as medical records, medical imaging, bank statements, and receipts are uploaded to Amazon S3. All documents must be securely transmitted and stored. All access to the documents must be recorded for auditing.  
What is the MOST secure approach?  

-   A. Use S3 default encryption using Advanced Encryption Standard-256 (AES-256) on the destination bucket.
-   B. Use Amazon Cognito for authorization and authentication to ensure the security of the application and documents.
-   C. Use AWS Lambda to encrypt and decrypt objects as they are placed into the S3 bucket.
==-   D. Use client-side encryption/decryption with Amazon S3 and AWS KMS. Most Voted==

Question #46 Topic 1

A developer is planning to use an Amazon API Gateway and AWS Lambda to provide a REST API. The developer will have three distinct environments to manage: development, test, and production.  
How should the application be deployed while minimizing the number of resources to manage?  

-   A. Create a separate API Gateway and separate Lambda function for each environment in the same Region.
-   B. Assign a Region for each environment and deploy API Gateway and Lambda to each Region.
==-   C. Create one API Gateway with multiple stages with one Lambda function with multiple aliases.==
-   D. Create one API Gateway and one Lambda function, and use a REST parameter to identify the environment.

Question #47 Topic 1

An application needs to use the IP address of the client in its processing. The application has been moved into AWS and has been placed behind an Application  Load Balancer (ALB). However, all the client IP addresses now appear to be the same. The application must maintain the ability to scale horizontally.  Based on this scenario, what is the MOST cost-effective solution to this problem?  

-   A. Remove the application from the ALB. Delete the ALB and change Amazon Route 53 to direct traffic to the instance running the application.
-   B. Remove the application from the ALB. Create a Classic Load Balancer in its place. Direct traffic to the application using the HTTP protocol.
==-   C. Alter the application code to inspect the X-Forwarded-For header. Ensure that the code can work properly if a list of IP addresses is passed in the header. Most Voted==
-   D. Alter the application code to inspect a custom header. Alter the client code to pass the IP address in the custom header.

Question #48 Topic 1

A developer tested an application locally and then deployed it to AWS Lambda. While testing the application remotely, the Lambda function fails with an access denied message.  How can this issue be addressed?  

==-   A. Update the Lambda function's execution role to include the missing permissions.==
-   B. Update the Lambda function's resource policy to include the missing permissions.
-   C. Include an IAM policy document at the root of the deployment package and redeploy the Lambda function.
-   D. Redeploy the Lambda function using an account with access to the AdministratorAccess policy.

Question #49 Topic 1

A Developer must analyze performance issues with production-distributed applications written as AWS Lambda functions. These distributed Lambda applications invoke other components that make up the applications.  How should the Developer identify and troubleshoot the root cause of the performance issues in production?  

-   A. Add logging statements to the Lambda functions, then use Amazon CloudWatch to view the logs.
-   B. Use AWS CloudTrail and then examine the logs.
==-   C. Use AWS X-Ray, then examine the segments and errors.==
-   D. Run Amazon Inspector agents and then analyze performance.

Question #50 Topic 1

A company is building a compute-intensive application that will run on a fleet of Amazon EC2 instances. The application uses attached Amazon EBS disks for storing data. The application will process sensitive information and all the data must be encrypted.  What should a Developer do to ensure the data is encrypted on disk without impacting performance?  

==-   A. Configure the Amazon EC2 instance fleet to use encrypted EBS volumes for storing data. Most Voted==
-   B. Add logic to write all data to an encrypted Amazon S3 bucket.
-   C. Add a custom encryption algorithm to the application that will encrypt and decrypt all data.
-   D. Create a new Amazon Machine Image (AMI) with an encrypted root volume and store the data to ephemeral disks.

**Correct Answer:** A [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/5/#)  
Reference:  
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html  
![](https://www.examtopics.com/assets/media/exam-media/04238/0002700001.png)
Question #51 Topic 1

A Developer is working on a serverless project based in Java. Initial testing shows a cold start takes about 8 seconds on average for AWS Lambda functions.  What should the Developer do to reduce the cold start time? (Choose two.)  

-   A. Add the Spring Framework to the project and enable dependency injection.
==-   B. Reduce the deployment package by including only needed modules from the AWS SDK for Java. Most Voted==
==-   C. Increase the memory allocation setting for the Lambda function. Most Voted==
-   D. Increase the timeout setting for the Lambda function.
-   E. Change the Lambda invocation mode from synchronous to asynchronous.

Question #52 Topic 1

A company runs an e-commerce website that uses Amazon DynamoDB where pricing for items is dynamically updated in real time. At any given time, multiple updates may occur simultaneously for pricing information on a particular product. This is causing the original editor's changes to be overwritten without a proper review process.  
Which DynamoDB write option should be selected to prevent this overwriting?  

-   A. Concurrent writes
==-   B. Conditional writes==
-   C. Atomic writes
-   D. Batch writes

Question #53 Topic 1

A developer is storing JSON files in an Amazon S3 bucket. The developer wants to securely share an object with a specific group of people.  How can the developer securely provide temporary access to the objects that are stored in the S3 bucket?  

-   A. Set object retention on the files. Use the AWS software development kit (SDK) to restore the object before subsequent requests. Provide the bucket's S3 URL.
==-   B. Use the AWS software development kit (SDK) to generate a presigned URL. Provide the presigned URL.==
-   C. Set a bucket policy that restricts access after a period of time. Provide the bucket's S3 URL.
-   D. Configure static web hosting on the S3 bucket. Provide the bucket's web URL.

Question #54 Topic 1

A front-end web application is using Amazon Cognito user pools to handle the user authentication flow. A developer is integrating Amazon DynamoDB into the application using the AWS SDK for JavaScript.  How would the developer securely call the API without exposing the access or secret keys?  

==-   A. Configure Amazon Cognito identity pools and exchange the JSON Web Token (JWT) for temporary credentials.==
-   B. Run the web application in an Amazon EC2 instance with the instance profile configured.
-   C. Hardcore the credentials, use Amazon S3 to host the web application, and enable server-side encryption.
-   D. Use Amazon Cognito user pool JSON Web Tokens (JWITs) to access the DynamoDB APIs.

Question #55 Topic 1

A Developer must build an application that uses Amazon DynamoDB. The requirements state that the items being stored in the DynamoDB table will be 7KB in size and that reads must be strongly consistent. The maximum read rate is 3 items per second, and the maximum write rate is 10 items per second.  
How should the Developer size the DynamoDB table to meet these requirements?  

-   A. Read: 3 read capacity units Write: 70 write capacity units
==-   B. Read: 6 read capacity units Write: 70 write capacity units==
	==One RCU takes 4KB/s and One WCU takes 1KB/s, so for this question 3 req * 2RCU = 6; 10 req* 7WCU = 70WCU. In case, if 512 bytes/sec is mentioned (like how many WCU's are needed for 10 items with 512bytes?), "round off" results to 1KB and 1WCU is needed for it (answer: 10WCU and not 5WCU).==
-   C. Read: 6 read capacity units Write: 10 write capacity units
-   D. Read: 3 read capacity units Write: 10 write capacity units

Question #56 Topic 1

A company needs to ingest terabytes of data each hour from thousands of sources that are delivered almost continually throughout the day. The volume of messages generated varies over the course of the day. Messages must be delivered in real time for fraud detection and live operational dashboards.  Which approach will meet these requirements?  

-   A. Send the messages to an Amazon SQS queue, then process the messages by using a fleet of Amazon EC2 instances
-   B. Use the Amazon S3 API to write messages to an S3 bucket, then process the messages by using Amazon Redshift
-   C. Use AWS Data Pipeline to automate the movement and transformation of data
==-   D. Use Amazon Kinesis Data Streams with Kinesis Client Library to ingest and deliver messages==

Question #57 Topic 1

A developer is debugging an AWS Lambda function behind an Amazon API Gateway. Whenever the API Gateway endpoint is called, HTTP status code 200 is returned even though AWS Lambda is recording a 4xx error.  
What change needs to be made to return a proper error code through the API Gateway?  

-   A. Enable CORS in the API Gateway method settings
==-   B. Use a Lambda proxy integration to return HTTP codes and headers Most Voted==
-   C. Enable API Gateway error pass-through.
-   D. Return the value in the header x-Amzn-ErrorType.

Question #58 Topic 1

For a deployment using AWS CodeDeploy, what is the run order of the hooks for in-place deployments?  

-   A. Before Install -> Application Stop -> Application Start -> After Install
==-   B. Application Stop -> Before Install -> After Install -> Application Start Most Voted==
-   C. Before Install -> Application Stop -> Validate Service -> Application Start
-   D. Application Stop -> Before Install -> Validate Service -> Application Start

Question #59 Topic 1

A developer is using Amazon S3 as the event source that invokes a Lambda function when new objects are created in the bucket. The event source mapping information is stored in the bucket notification configuration. The developer is working with different versions of the Lambda function, and has a constant need to update notification configuration so that Amazon S3 invokes the correct version.  
What is the MOST efficient and effective way to achieve mapping between the S3 event and Lambda?  

-   A. Use a different Lambda trigger.
-   B. Use Lambda environment variables.
==-   C. Use a Lambda alias. Most Voted==
-   D. Use Lambda tags.

Question #60 Topic 1

A company has a multi-tier application that uses Amazon API Gateway, AWS Lambda, and Amazon RDS. The company wants to investigate a slow response time to calls that come from the API Gateway API.  
What is the MOST operationally efficient way for the company to determine which internal call is causing the slow response times?  

-   A. Use Amazon CloudWatch.
==-   B. Use AWS X-Ray. Most Voted==
-   C. Use AWS CloudTrail.
-   D. Use VPC Flow Logs.

Question #61 Topic 1

A developer is deploying an application that will store files in an Amazon S3 bucket. The files must be encrypted at rest. The developer wants to automatically replicate the files to an S3 bucket in a different AWS Region for disaster recovery.  
How can the developer accomplish this task with the LEAST amount of configuration?  

==-   A. Encrypt the files by using server-side encryption with S3 managed encryption keys (SSE-S3). Enable S3 bucket replication. Most Voted==
-   B. Encrypt the files by using server-side encryption (SSE) with an AWS Key Management Service (AWS KMS) customer master key (CMK). Enable S3 bucket replication.
-   C. Use the s3 sync command to sync the files to the S3 bucket in the other Region.
-   D. Configure an S3 Lifecycle configuration to automatically transfer files to the S3 bucket in the other Region.

==Question #62 Topic 1==

A serverless application is using AWS Step Functions to process data and save it to a database. The application needs to validate some data with an external service before saving the data. The application will call the external service from an AWS Lambda function, and the external service will take a few hours to validate the data. The external service will respond to a webhook when the validation is complete.  A developer needs to pause the Step Functions workflow and wait for the response from the external service.  What should the developer do to meet this requirement?  

==-   A. Use the .wait ForTaskToken option in the Lambda function task state. Pass the token in the body. Most Voted==
	https://instil.co/blog/step-functions-and-task-tokens/
-   B. Use the .waitForTaskToken option in the Lambda function task state. Pass the invocation request.
-   C. Call the Lambda function in synchronous mode. Wait for the external service to complete the processing.
-   D. Call the Lambda function in asynchronous mode. Use the Wait state until the external service completes the processing.

Question #63 Topic 1

A developer must use AWS X-Ray to monitor an application that is running on an Amazon EC2 instance. The developer has prepared the application by using the  X-Ray SDK.  What should the developer do to perform the monitoring?  

-   A. Configure the X-Ray SDK sampling rule and target. Activate the X-Ray daemon from the EC2 console or the AWS CLI with the modify-instance-attribute command to set the XRayEnabled flag.
==-   B. Install the X-Ray daemon. Assign an IAM role to the EC2 instance with a policy that allows writes to X-Ray. Most Voted==
-   C. Install the X-Ray daemon. Configure it to forward data to Amazon EventBridge (Amazon CloudWatch Events). Grant the EC2 instance permission to write to Event Bridge (CloudWatch Events).
-   D. Deploy the X-Ray SDK with the application, and instrument the application code. Use the SDK logger to capture and send the events.

Question #64 Topic 1

A developer is designing a full-stack serverless application. Files for the website are stored in an Amazon S3 bucket. AWS Lambda functions that use Amazon API Gateway endpoints return results from an Amazon DynamoDB table.  The developer must create a solution that securely provides registration and authentication for the application while minimizing the amount of configuration.  Which solution meets these requirements?  

==-   A. Create an Amazon Cognito user pool and an app client. Configure the app client to use the user pool and provide the hosted web UI provided for sign-up and sign-in. Most Voted==
-   B. Configure an Amazon Cognito identity pool. Map the users with IAM roles that are configured to access the S3 bucket that stores the website.
-   C. Configure and launch an Amazon EC2 instance to set up an identity provider with an Amazon Cognito user pool. Configure the user pool to provide the hosted web UI for sign-up and sign-in.
-   D. Create an IAM policy that allows access to the website that is stored in the S3 bucket. Attach the policy to an IAM group. Add IAM users to the group.

Question #65 Topic 1

A company has an application that writes files to an Amazon S3 bucket. Whenever there is a new file, an S3 notification event invokes an AWS Lambda function to process the file. The Lambda function code works as expected. However, when a developer checks the Lambda function logs, the developer finds that multiple invocations occur for every file.  enecccdejculrvlijvjdivehibvubhviehbetckhbgrt
What is causing the duplicate entries?  

-   A. The S3 bucket name is incorrectly specified in the application and is targeting another S3 bucket.
==-   B. The Lambda function did not run correctly, and Lambda retried the invocation with a delay. Most Voted==
-   C. Amazon S3 is delivering the same event multiple times.
-   D. The application stopped intermittently and then resumed, splitting the logs into multiple smaller files.

Question #66 Topic 1

A developer needs to use the AWS CLI on an on-premises development server temporarily to access AWS services while performing maintenance. The developer needs to authenticate to AWS with their identity for several hours.  
What is the MOST secure way to call AWS CLI commands with the developer's IAM identity?  

-   A. Specify the developer's IAM access key ID and secret access key as parameters for each CLI command
-   B. Run the aws configure CLI command. Provide the developer's IAM access key ID and secret access key.
-   C. Specify the developer's IAM profile as a parameter for each CLI command.
==-   D. Run the get-session-token CLI command with the developer's IAM user. Use the returned credentials to call the CLI Most Voted==

**Correct Answer:** D [🗳️](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/view/7/#)  

_Community vote distribution_

D (100%)

Question #67 Topic 1

An AWS Lambda function accesses two Amazon DynamoDB tables. A developer wants to improve the performance of the Lambda function by identifying bottlenecks in the function.  
How can the developer inspect the timing of the DynamoDB API calls?  

-   A. Add DynamoDB as an event source to the Lambda function. View the performance with Amazon CloudWatch metrics
-   B. Place an Application Load Balancer (ALB) in front of the two DynamoDB tables. Inspect the ALB logs
-   C. Limit Lambda to no more than five concurrent invocations. Monitor from the Lambda console.
==-   D. Enable AWS X-Ray tracing for the function. View the traces from the X-Ray service.==

Question #68 Topic 1

A developer deployed an application to an Amazon EC2 instance. The application needs to know the public IPv4 address of the instance.  How can the application find this information?  

==-   A. Query the instance metadata from http://169.254.169.254/latest/meta-data/. Most Voted==
-   B. Query the instance user data from http://169.254.169.254/latest/user-data/.
-   C. Query the Amazon Machine Image (AMI) information from http://169.254 169.254/latest/meta-data/ami/.
-   D. Check the hosts file of the operating system.

Question #69 Topic 1

A developer is designing an AWS Lambda function to perform a maintenance activity. The developer will use Amazon EventBridge (Amazon CloudWatch Events) to invoke the function on an hourly schedule. The developer wants the function to log information at different levels of detail according to the value of a log level variable. The developer must design the function so that the log level can be set without requiring a change to the function code.  
Which solution will meet these requirements?  

-   A. Add a custom log level parameter for the Lambda function. Set the parameter by using the Lambda console
==-   B. Set the log level in a Lambda environment variable Most Voted==
-   C. Set the log level in the Amazon CloudWatch Logs console.
-   D. Add a custom log level parameter for the Lambda function. Set the parameter by using the AWS CLI.

Question #70 Topic 1

A developer is creating a serverless application that uses an AWS Lambda function The developer will use AWS CloudFormation to deploy the application The application will write logs to Amazon CloudWatch Logs. The developer has created a log group in a CloudFormation template for the application to use. The developer needs to modify the CloudFormation template to make the name of the log group available to the application at runtime.  
Which solution will meet this requirement?  

-   A. Use the AWS::Include transform in CloudFormation to provide the log group's name to the application.
-   B. Pass the log group's name to the application in the user data section of the CloudFormation template
-   C. Use the CloudFormation template's Mappings section to specify the log group's name for the application.
==-   D. Pass the log group's Amazon Resource Name (ARN) as an environment variable to the Lambda function. Most Voted==

Question #71 Topic 1
A company is running an application on Amazon Elastic Container Service (Amazon ECS). When the company deploys a new version of the application, the company initially needs to expose 10% of live traffic to the new version. After a period of time, the company needs to immediately route all the remaining live traffic to the new version. Which ECS deployment should the company use to meet these requirements?  
-   A. Rolling update
==-   B. Blue/green with canary==
-   C. Blue/green with all at once
-   D. Blue/green with linear

Question #72 Topic 1
A microservices application is deployed across multiple containers in Amazon Elastic Container Service (Amazon ECS). To improve performance, a developer wants to capture trace information between the microservices and visualize the microservices architecture.  Which solution will meet these requirements?  
==-   A. Build the container from the amazon/aws-xray-daemon base image. Use the AWS X-Ray SDK to instrument the application.==
	https://docs.aws.amazon.com/xray/latest/devguide/xray-daemon-ecs.html#xray-daemon-ecs-build
-   B. Install the Amazon CloudWatch agent on the container image. Use the CloudWatch SDK to publish custom metrics from each of the microservices.
-   C. Install the AWS X-Ray daemon on each of the ECS instances.
-   D. Configure AWS CloudTrail data events to capture the traffic between the microservices.

Question #73 Topic 1
A company is planning to use AWS CodeDeploy to deploy an application to Amazon Elastic Container Service (Amazon ECS). During the deployment of a new version of the application, the company initially must expose only 10% of live traffic to the new version of the deployed application. Then, after 15 minutes elapse, the company must route all the remaining live traffic to the new version of the deployed application.  Which CodeDeploy predefined configuration will meet these requirements?  
==-   A. CodeDeployDefault.ECSCanary10Percent15Minutes==
-   B. CodeDeployDefault.LambdaCanary10Percent5Minutes
-   C. CodeDeployDefault.LambdaCanary10Percent15Minutes
-   D. CodeDeployDefault.ECSLinear10PercentEvery1 Minutes

Question #74 Topic 1
A developer notices timeouts from the AWS CLI when the developer runs list commands.  What should the developer do to avoid these timeouts?  
==-   A. Use the --page-size parameter to request a smaller number of items.==
-   B. Use shorthand syntax to separate the list by a single space.
-   C. Use the yaml-stream output for faster viewing of large datasets.
-   D. Use quotation marks around strings to enclose data structure.

Question #75 Topic 1
A company has moved a legacy on-premises application to AWS by performing a lift and shift. The application exposes a REST API that can be used to retrieve billing information. The application is running on a single Amazon EC2 instance. The application code cannot support concurrent invocations. Many clients access the API, and the company adds new clients all the time.  A developer is concerned that the application might become overwhelmed by too many requests. The developer needs to limit the number of requests to the API for all current and future clients. The developer must not change the API, the application, or the client code.  What should the developer do to meet these requirements?  
-   A. Place the API behind an Amazon API Gateway API. Set the server-side throttling limits.
-   B. Place the API behind a Network Load Balancer. Set the target group throttling limits.
-   C. Place the API behind an Application Load Balancer. Set the target group throttling limits.
==-   D. Place the API behind an Amazon API Gateway API. Set the per-client throttling limits.==

Question #76 Topic 1
An ecommerce company wants to redirect users to a country-specific website when they enter the example.com website. For example, the company wants to redirect United States users to example.com/us/ and wants to redirect French users to example.com/fr/. The web application is using Amazon CloudFront and an Application Load Balancer with an Amazon Elastic Container Service (Amazon ECS) cluster. The application's domain name resolution is configured in an  Amazon Route 53 public hosted zone.  Which solution will meet these requirements with the LEAST operational effort?  
-   A. Update the routing policy for the application's Route 53 record to specify geolocation routing. Configure listener rules based on a unique alias location to redirect requests to the correct URLs by country.
==-   B. Create a CloudFront function to inspect the CloudFront-Viewer-Country header and return redirect responses to different URLs based on user location.==
-   C. On the ECS web server configuration, use a GeoIP database to look up the requested IP address and redirect requests to the correct URLs by country.
-   D. Use AWS WAF to determine the country of origin. Create an AWS WAF custom rule with a geographic match condition to redirect traffic from each country to the correct URL.

Question #77 Topic 1
A developer deploys an AWS Lambda function that runs each time a new Amazon S3 bucket is created. The Lambda function is supposed to attach an S3  Lifecycle policy to each new S3 bucket. The developer discovers that newly created S3 buckets have no S3 Lifecycle policy attached.  Which AWS service should the developer use to find a possible error in the Lambda function?  
-   A. AWS CloudTrail
-   B. Amazon S3
-   C. AWS CloudFormation
==-   D. Amazon CloudWatch==

Question #78 Topic 1
A developer has created a web API that uses Amazon Elastic Container Service (Amazon ECS) and an Application Load Balancer (ALB). An Amazon CloudFront distribution uses the API as an origin for web clients. The application has received millions of requests with a JSON Web Token (JWT) that is not valid in the authorization header. The developer has scaled out the application to handle the unauthenticated requests. What should the developer do to reduce the number of unauthenticated requests to the API?  
-   A. Add a request routing rule to the ALB to return a 401 status code if the authorization header is missing.
-   B. Add a container to the ECS task definition to validate JWTs Set the new container as a dependency of the application container.
==-   C. Create a CloudFront function for the distribution Use the crypto module in the function to validate the JWT.==
-   D. Add a custom authorizer for AWS Lambda to the CloudFront distribution to validate the JWT.

Question #79 Topic 1
A developer is creating a mobile application that will not require users to log in. What is the MOST efficient method to grant users access to AWS resources?  
-   A. Use an identity provider to securely authenticate with the application.
-   B. Create an AWS Lambda function to create an IAM user when a user accesses the application.
-   C. Create credentials using AWS KMS and apply these credentials to users when using the application.
==-   D. Use Amazon Cognito to associate unauthenticated users with an IAM role that has limited access to resources.==

Question #80 Topic 1
A developer has created on AWS Lambda function tool uses 15 MB of memory. When the developer runs the code natively on a laptop that has 4 cores, the function runs within 100 ms. When the developer deploys the code as a Lambda function with 128 MB of memory, the first run takes 3 seconds. Subsequent runs take more than 500 ms to finish. The developer needs to improve the performance of the Lambda function so that the function runs consistently in less than 100 ms, ==excluding the initial startup time.==  Which solution will meet this requirement?  
-   A. Increase the reserved concurrency of the Lambda function.
-   B. Increase the provisioned concurrency of the Lambda function.
==-   C. Increase the memory of the Lambda function.==
-   D. Repackage the Lambda function as a container. Redeploy the function.

Question #81 Topic 1
A company is planning to use AWS CodeDeploy to deploy an application to AWS Lambda. During the deployment of a new version of the application, the company initially must expose only 10% of live traffic to the new version of the deployed application. Then, every 10 minutes, the company must route another  10% of live traffic to the new version of the deployed application until all live traffic is routed to the new version.  Which CodeDeploy predefined configuration will meet these requirements?  
-   A. CodeDeployDefault.OnceAtATime
-   B. CodeDeployDefault.LambdaCanary10Percent10Minutes
==-   C. CodeDeployDefault.LambdaLinear10PercentEvery10Minutes==
-   D. CodeDeployDefault.ECSLinear10PercentEvery3Minutes

Question #82 Topic 1
A developer wants to use AWS Elastic Beanstalk to test a new version of on application in a test environment.  
Which deployment method offers the FASTEST deployment?  
-   A. Immutable
-   B. Rolling
-   C. Rolling with additional batch
==-   D. All at once==

Question #83 Topic 1
A developer has built an application that inserts data into an Amazon DynamoDB table. The table is configured to use provisioned capacity. The application is deployed on a burstable nano Amazon EC2 Instance. The application logs show that the application has been failing because of a  ProvisionedThroughputExceedException error.  Which actions should the developer take to resolve this issue? (Choose two.)  
-   A. Move The application to a larger EC instance.
-   B. Increase the number or read capacity units (RCUs) that are provisioned for the DynamoDB table.
==-   C. Reduce the frequency of requests to DynamoDB by implementing exponential backoff.==
-   D. Increase the frequency of requests to DynamoDB by decreasing the retry delay.
==-   E. Change the capacity mode of the DynamoDB table from provisioned to on-demand.==

Question #84 Topic 1
A developer is deploying on application on Amazon EC2 instances that run in Account A. In certain cases, this application needs to read data from a private Amazon S3 bucket in Account B. The developer must provide the application access to the S3 bucket without exposing the S3 bucket to anyone else.  Which combination of actions should the developer take to meet these requirements? (Choose two.)  
-   A. Create an IAM role with S3 read permissions in Account B.
==-   B. Update the instance profile IAM role in Account A with S3 read permissions.==
-   C. Make the S3 bucket public with limited access for Account A.
==-   D. Configure the bucket policy in S3 bucket in Account B to grant permissions to the instance profile role.==
-   E. Add a trust policy that allows s3:Get* permissions to the IAM rote in Account B.

==Question #85 Topic 1==
A developer at a company recently created a serverless application to process and show data from business reports. The application's user interface (UI) allows users to select and start processing the flies. The UI displays a message when the result is available to view. The application uses AWS Step Functions with AWS Lambda functions to process the files. The developer used Amazon API Gateway and Lambda functions to create an API to support the UI.  The company's UI team reports that the request to process a file s often returning timeout errors because of the size or complexity of the files. The UI team wants the API to provide an immediate response so that the UI can display a message while the files are being processed. The backend process that is invoked by the API needs to send an email message when the report processing is complete.  What should the developer do to configure the API to meet these requirements?  
-   A. Change the API Gateway route to add an X-Amz-Invocation-Type header with a static value of 'Event' in the integration request. Deploy the API Gateway stage to apply the changes.
-   B. Change the configuration of the Lambda function that implements the request to process a file. Configure the maximum age of the event so that the Lambda function will run asynchronously.
-   C. Change the API Gateway timeout value to match the Lambda function timeout value. Deploy the API Gateway stage to apply the changes.
-   D. Change the API Gateway route to add an X-Amz-Target header with a static value of 'Async' in the integration request. Deploy the API Gateway stage to apply the changes.

Question #86 Topic 1
An ecommerce application is running behind an Application Load Balancer. A developer observes some unexpected load on the application during non-peak hours. The developer wants to analyze patterns for the client IP addresses that use the application. Which HTTP header should the developer use for this analysis?  
-   A. The X-Forwarded-Proto header
-   B. The X-Forwarded-Host header
==-   C. The X-Forwarded-For header==
-   D. The X-Forwarded-Port header

Question #87 Topic 1
A developer needs to create an application that supports Security Assertion Markup Language (SAML) and authentication with social media providers. It must also allow access to AWS services, such as Amazon DynamoDB.  Which AWS service or feature will meet these requirements with the LEAST amount of additional coding?  
-   A. AWS AppSync
==-   B. Amazon Cognito identity pools==
-   C. Amazon Cognito user pools
-   D. Amazon Lambda@Edge

Question #88 Topic 1
A developer is designing a serverless application for an ecommerce website. An Amazon API Gateway API exposes AWS Lambda functions for billing, payment, and user operations. The website features shopping carts for the users. The shopping carts must be stored for extended periods of time and will be retrieved frequently by the front-end application.  
The load on the application will vary significantly based on the time of day and the promotional sales that are offered on the website. The application must be able to scale automatically to meet these changing demands.  Which solution will meet these requirements?  
-   A. Store the data objects on an Amazon RDS DB instance. Cache the data objects in memory by using Amazon ElastiCache.
-   B. Store the data objects on Amazon EC2 instances behind an Application Load Balancer. Use session affinity (sticky sessions) for each user's shopping cart.
-   C. Store the data objects in Amazon S3 buckets. Cache the data objects by using Amazon CloudFront with the maximum TTL.
==-   D. Store the data objects in Amazon DynamoDB tables. Cache the data objects by using DynamoDB Accelerator (DAX).==

Question #89 Topic 1
A company is migrating its on-premises database to Amazon RDS for MySQL. The company has read-heavy workloads, and wants to make sure it re-factors its code to achieve optimum read performance for its queries.  How can this objective be met?  
-   A. Add database retries to effectively use RDS with vertical scaling.
-   B. Use RDS with multi-AZ deployment.
==-   C. Add a connection string to use an RDS read replica for read queries.==
-   D. Add a connection string to use a read replica on an EC2 instance.

Question #90 Topic 1
An application running on Amazon EC2 opens connections to an Amazon RDS SQL Server database. The developer does not want to store the user name and password for the database in the code. The developer would also like to automatically rotate the credentials.  What is the MOST secure way to store and access the database credentials?  
-   A. Create an IAM role that has permissions to access the database. Attach the role to the EC2 instance.
	SQL Server does not support IAM credentials
==-   B. Use AWS Secrets Manager to store the credentials. Retrieve the credentials from Secrets Manager as needed.==
-   C. Store the credentials in an encrypted text file in an Amazon S3 bucket. Configure the EC2 instance's user data to download the credentials from Amazon S3 as the instance boots.
-   D. Store the user name and password credentials directly in the source code. No further action is needed because the source code is stored in a private repository.

Question #91 Topic 1
A developer received the following error message during an AWS CloudFormation deployment: DELETE_FAILED (The following resource(s) failed to delete: [ASGInstanceRolel2345678].)  Which action should the developer take to resolve this error?  
-   A. Contact AWS Support to report an issue with the Auto Scaling Groups (ASG) service.
-   B. Add a DependsOn attribute to the ASGInstanceRole12345678 resource in the CloudFormation template. Then delete the stack.
==-   C. Modify the CloudFormation template to retain the ASGInstanceRolel2345678 resource. Then manually delete the resource after deployment.==
	==CloudFormation cannot delete S3 buckets or ECR repositories if they are not empty. In this case only manual deletion helps.==
-   D. Add a force parameter when calling CloudFormation with the role-arn of ASGInstanceRolel2345678.

Question #92 Topic 1
An application runs on multiple EC2 instances behind an ELB.  Where is the session data best written so that it can be served reliably across multiple requests?  
==-   A. Write data to Amazon ElastiCache.==
	==https://aws.amazon.com/caching/session-management/==
-   B. Write data to Amazon Elastic Block Store.
-   C. Write data to Amazon EC2 Instance Store.
-   D. Write data to the root filesystem.

Question #93 Topic 1
A company is using continuous integration/continuous delivery (CI/CD) systems. A developer must automate the deployment of an application software package to Amazon EC2 instances and virtual servers that run on premises. Which AWS service should the developer use to meet these requirements?  
-   A. AWS Cloud9
-   B. AWS CodeBuild
-   C. AWS Elastic Beanstalk
==-   D. AWS CodeDeploy==

Question #94 Topic 1
A software company is using AWS CodeBuild to build an application. The buildspec runs the application build and creates a Docker image that contains the application. The company needs to push the Docker image to Amazon Elastic Container Registry (Amazon ECR) only upon the completion of each successful build.  Which solution meets these requirements?  
==-   A. Change the buildspec by adding a post_build phase that uses the commands block to push the Docker image.==
-   B. Change the buildspec by adding a post_build phase that uses the finally block to push the Docker image.
-   C. Specify the Docker image in the buildspec's artifacts sequence with an action to push the image.
-   D. Use a batch build to define a build matrix. Use the batch build to push the Docker image.

Question #95 Topic 1
A company is using Amazon RDS as the backend database for its application. After a recent marketing campaign, a surge of read requests to the database increased the latency of data retrieval from the database.  The company has decided to implement a caching layer in front of the database. The cached content must be encrypted and must be highly available.  Which solution will meet these requirements?  
-   A. Amazon CloudFront
-   B. Amazon ElastiCache for Memcached
==-   C. Amazon ElastiCache for Redis in cluster mode==
-   D. Amazon DynamoDB Accelerator (DAX)

Question #96 Topic 1
A company has an application that runs on AWS Elastic Beanstalk in a load-balanced environment. The company needs to update the instance types in the environment to a more recent generation of instance types. The company must minimize downtime during the deployment of this configuration change. Which deployment options will meet these requirements? (Choose two.)  
-   A. Disabled
-   B. Rolling based on Health
==-   C. Immutable==
-   D. All at once
==-   E. **Canary**: Traffic-splitting deployments let you perform canary testing as part of your application deployment.==

Question #97 Topic 1
Given the source code for an AWS Lambda function in the local file store.py containing a handler function called get_store and the following AWS CloudFormation template:  
![](https://www.examtopics.com/assets/media/exam-media/04238/0005000001.png)  
What should be done to prepare the template so that it can be deployed using the AWS CLI command aws cloudformation deploy?  
-   A. Use aws cloudformation compile to base64 encode and embed the source file into a modified CloudFormation template.
==-   B. Use aws cloudformation package to upload the source code to an Amazon S3 bucket and produce a modified CloudFormation template.==
-   C. Use aws lambda zip to package the source file together with the CloudFormation template and deploy the resulting zip archive.
-   D. Use aws serverless create-package to embed the source file directly into the existing CloudFormation template.

Question #98 Topic 1
A company is developing a report implemented using AWS Step Functions. Amazon CloudWatch shows errors in the Step Functions task state machine. To troubleshoot each task, the state input needs to be included along with the error message in the state output.  Which coding practice can preserve both the original input and the error for the state?  
==-   A. Use ResultPath in a Catch statement to include the error with the original input.==
-   B. Use InputPath in a Catch statement and set the value to null.
-   C. Use ErrorEquals in a Retry statement to include the error with the original input.
-   D. Use OutputPath in a Retry statement and set the value to $.

Question #99 Topic 1
A developer is receiving HTTP 400: ThrottlingException errors intermittently when calling the Amazon CloudWatch API. When a call fails, no data is retrieved.  What best practice should first be applied to address this issue?  
-   A. Contact AWS Support for a limit increase.
-   B. Use the AWS CLI to get the metrics.
-   C. Analyze the applications and remove the API call.
==-   D. Retry the call with exponential backoff.==

Question #100 Topic 1
A company has an online order website that uses Amazon DynamoDB to store item inventory. A sample of the inventory object is as follows:  
![](https://www.examtopics.com/assets/media/exam-media/04238/0005200001.png)  
A developer needs to reduce all inventory prices by 100 as long as the resulting price would not be less than 500.  What should the developer do to make this change with the LEAST number of calls to DynamoDB?  
-   A. Perform a DynamoDB Query operation with the Id. If the price is >= 600, perform an UpdateItem operation to update the price.
==-   B. Perform a DynamoDB UpdateItem operation with a condition expression of "Price >= 600".==
-   C. Perform a DynamoDB UpdateItem operation with a condition expression of "ProductCategory IN ({"S": "Sporting Goods"}) and Price 600".
-   D. Perform a DynamoDB UpdateItem operation with a condition expression of "MIN Price = 500".

Question #101 Topic 1
A company is using an AWS Lambda function to process records from an Amazon Kinesis data stream. The company recently observed slow processing of the records. A developer notices that the iterator age metric for the function is increasing and that the Lambda run duration is constantly above normal.  Which actions should the developer take to increase the processing speed? (Choose two.)  
==-   A. Increase the number of shards of the Kinesis data stream.==
-   B. Decrease the timeout of the Lambda function.
==-   C. Increase the memory that is allocated to the Lambda function.==
-   D. Decrease the number of shards of the Kinesis data stream.
-   E. Increase the timeout of the Lambda function.

Question #102 Topic 1
A developer is making changes to a custom application that uses AWS Elastic Beanstalk. Which solutions will update the Elastic Beanstalk environment with the new application version after the developer completes the changes? (Choose two.)  
==-   A. Package the application code into a .zip file. Use the AWS Management Console to upload the zip file and deploy the packaged application.==
-   B. Package the application code into a .tar file. Use the AWS Management Console to create a new application version from the .tar file. Update the environment by using the AWS CLI.
-   C. Package the application code into a .tar file. Use the AWS Management Console to upload the .tar file and deploy the packaged application.
==-   D. Package the application code into a .zip file. Use the AWS CLI to create a new application version from the .zip file and to update the environment.==
-   E. Package the application code into a .zip file. Use the AWS Management Console to create a new application version from the .zip file. Rebuild the environment by using the AWS CLI.

Question #103 Topic 1
A company has an application where reading objects from Amazon S3 is based on the type of user. The user types are registered user and guest user. The company has 25,000 users and is growing. Information is pulled from an S3 bucket depending on the user type. Which approaches are recommended to provide access to both user types? (Choose two.)  
-   A. Provide a different access key and secret access key in the application code for registered users and guest users to provide read access to the objects.
-   B. Use S3 bucket policies to restrict read access to specific IAM users.
==-   C. Use Amazon Cognito to provide access using authenticated and unauthenticated roles.==
-   D. Create a new IAM user for each user and grant read access.
==-   E. Use the AWS IAM service and let the application assume the different roles using the AWS Security Token Service (AWS STS) AssumeRole action depending on the type of user and provide read access to Amazon S3 using the assumed role.==

==Question #104 Topic 1==
A developer is writing an application to analyze the traffic to a fleet of Amazon EC2 instances. The EC2 instances run behind a public Application Load Balancer  
(ALB). An HTTP server runs on each of the EC2 instances, logging all requests to a log file.  
The developer wants to capture the client public IP addresses. The developer analyzes the log files and notices only the IP address of the ALB.  
What must the developer do to capture the client public IP addresses in the log file?  

-   A. Add a Host header to the HTTP server log configuration file.
-   B. Install the Amazon CloudWatch Logs agent on each EC2 instance. Configure the agent to write to the log file.
-   C. Install the AWS X-Ray daemon on each EC2 instance. Configure the daemon to write to the log file.
-   D. Add an X-Forwarded-For header to the HTTP server log configuration file.

Question #105 Topic 1
A developer is writing a new AWS Serverless Application Model (AWS SAM) template with a new AWS Lambda function. The Lambda function runs complex code. The developer wants to test the Lambda function with more CPU power.  
What should the developer do to meet this requirement?  
-   A. Increase the runtime engine version.
-   B. Increase the timeout.
-   C. Increase the number of Lambda layers.
==-   D. Increase the memory.==

==Question #106 Topic 1==
A developer uses a single AWS CloudFormation template to configure the test environment and the production environment for an application. The developer handles environment-specific requirements in the CloudFormation template.  
The developer decides to update the Amazon EC2 Auto Scaling launch template with new Amazon Machine Images (AMIs) for each environment. The  
CloudFormation update for the new AMIs is successful in the test environment, but the update fails in the production environment.  
What are the possible causes of the CloudFormation update failure in the production environment? (Choose two.)  
-   A. The new AMIs do not fulfill the specified conditions in the CloudFormation template.
-   B. The service quota for the number of EC2 vCPUs in the AWS Region has been exceeded.
-   C. The security group that is specified in the CloudFormation template does not exist.
-   D. CloudFormation does not recognize the template change as an update.
-   E. CloudFormation does not have sufficient IAM permissions to make the changes.

Question #107 Topic 1
A developer is creating a serverless web application and maintains different branches of code. The developer wants to avoid updating the Amazon API Gateway target endpoint each time a new code push is performed.  What solution would allow the developer to perform a code push efficiently, without the need to update the API Gateway?  
-   A. Associate different AWS Lambda functions to an API Gateway target endpoint.
-   B. Create different stages in API Gateway. then associate API Gateway with AWS Lambda.
==-   C. Create aliases and versions in AWS Lambda.==
-   D. Tag the AWS Lambda functions with different names.

Question #108 Topic 1
A developer needs to deploy an application running on AWS Fargate using Amazon ECS. The application has environment variables that must be passed to a container for the application to initialize.  How should the environment variables be passed to the container?  
-   A. Define an array that includes the environment variables under the environment parameter within the service definition.
==-   B. Define an array that includes the environment variables under the environment parameter within the task definition.==
-   C. Define an array that includes the environment variables under the entryPoint parameter within the task definition.
-   D. Define an array that includes the environment variables under the entryPoint parameter within the service definition.

Question #109 Topic 1
A developer must extend an existing application that is based on the AWS Serverless Application Model (AWS SAM). The developer has used the AWS SAM CLI to create the project. The project contains different AWS Lambda functions.  Which combination of commands must the developer use to redeploy the AWS SAM application? (Choose two.)  
-   A. sam init
-   B. sam validate
==-   C. sam build==
==-   D. sam deploy==
-   E. sam publish

Question #110 Topic 1
A developer manages an application that interacts with Amazon RDS. After observing slow performance with read queries, the developer implements Amazon ElastiCache to update the cache immediately following the primary database update. What will be the result of this approach to caching?  
-   A. Caching will increase the load on the database instance because the cache is updated for every database update.
-   B. Caching will slow performance of the read queries because the cache is updated when the cache cannot find the requested data.
==-   C. The cache will become large and expensive because the infrequently requested data is also written to the cache.==
-   D. Overhead will be added to the initial response time because the cache is updated only after a cache miss.











