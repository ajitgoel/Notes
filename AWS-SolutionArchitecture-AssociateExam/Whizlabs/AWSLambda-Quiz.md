==Question 1Incorrect==

**Domain:** Other

You are uploading large files to AWS S3 bucket, ranging from 1GB – 3GB. Your organization has a requirement to calculate the hash checksum of the file by reading entire file so the users can validate the checksum to identify any potential corruptions during downloads. For this, you created a Lambda function and getting it triggered through S3 notifications. However, the request is getting timed out. What could be the reason?

- A. Lambda function is configured with minimal memory of 128 MB.wrong
- ==B. Lambda function is set to run in a private VPC without NAT Gateway or VPC Endpoint.right==
- C. You have not setup S3 bucket name in the environment variable.
- D. Lambda function is created in a different region than S3 bucket.

###### Explanation:

**Answer:** **B**

==Option A is not correct. If the function reaches the maximum configured memory, in this case==

==128 MB, the function gets terminated with an error message as below,== not as **request** **timed** **out**.

REPORT RequestId: xxxxxxxx  Duration: xxxxx ms  Billed Duration: xxxxx ms

Memory Size: 128 MB Max Memory Used: 129 MB RequestId: xxxxxxx ==Process exited before completing request==

 ![img](https://whizlabs.com/learn/media/2019/01/22/questions_qxczdi.png)

 Option B is correct. AWS Lambda functions can run within a private VPC with the resources allocated inside the subnet provided during configuration.

==For the lambda function to access S3 service endpoint from within private VPC, there should be a NAT Gateway or S3 VPC Endpoint configured in the route table associated with the subnet which was chosen during Lambda function setup. If not, the request would get timed out.==

- https://aws.amazon.com/premiumsupport/knowledge-center/internet-access-lambda-function/

Option C is not correct. Bucket need not be configured as environment variable.

Lambda function environment variables are used to configure additional parameters that can be passed to lambda function.

- https://docs.aws.amazon.com/lambda/latest/dg/env_variables.html
  Option D is not correct. As long as Lambda function has internet access, it can access S3 service endpoints irrespective of S3 bucket region.

==Question 2Incorrect==

**Domain:** Other

Which of the following services does not asynchronously invoke the AWS Lambda function? (choose 2 options)

- A. AWS S3
- B. AWS SNS
- ==C. AWS Step Functionsright==
- D. AWS CodeCommitwrong
- ==E. AWS API Gatewayright==

###### Explanation:

**Answer:** **C,** **E**

The following are the functions that invoke synchronously and asynchronously the AWS Lambda function.

![img](https://www.whizlabs.com/learn/media/2020/03/04/ckeditor_29198.png)

- https://docs.aws.amazon.com/lambda/latest/dg/lambda-dg.pdf

==Question 3Incorrect==

**Domain:** Other

Your organization must perform big data analysis to transform data and store the result in the AWS S3 bucket. They have implemented the solution using AWS Lambda due to its zero-administrative maintenance and cost-effective nature. However, in very few cases, the execution is getting abruptly terminated after 15 minutes. They would like to get a notification in such scenarios. What would you do?

- A. Setup timer in the code and send a notification when the timer reaches 900 seconds.
- B. Configure SES for failures under the Configuration option in the lambda function.wrong
- C. Setup the ERROR_NOTIFY environment variable with an email address. Lambda function has an inbuilt feature to send an email during max memory and time out terminations using this environment variable.
- ==D. Configure Dead-letter Queue and send a notification to SNS topicright==

###### Explanation:

**Answer:** **D**

Option A is not correct. Although you can set the timers in the code, it may not be an accurate measure to determine if the lambda function is terminated after 900 seconds or just finished executing on the 900th second.

Option B is not correct. There is no option to configure AWS SES within the Lambda setup.

Option C is not a valid statement.

Option D is correct. You can forward non-processed payloads to Dead Letter Queue (DLQ) using AWS SQS, AWS SNS.

![img](https://whizlabs.com/learn/media/2019/01/22/questions_jvodle.png). 

Refer:

https://aws.amazon.com/about-aws/whats-new/2018/10/aws-lambda-supports-functions-that-can-run-up-to-15-minutes/

https://aws.amazon.com/blogs/compute/robust-serverless-application-design-with-aws-lambda-dlq/

 ==Question 4Incorrect==

**Domain:** Other

Your organization uploads relatively large compressed files ranging between 100MB – 200MB in size to AWS S3 bucket. Once uploaded, they are looking to calculate the total number objects in the compressed file and add the total count as a metadata to the compressed file in AWS S3. They approached you for a cost-effective solution. You have recommended using AWS Lambda through S3 event notifications to perform this operation. However, they were concerned about failures as S3 event notification is an asynchronous one-time trigger and Lambda can fail due to operation time outs, max memory limits, max execution time limits etc. What is the best retry approach you recommend?

- A. All the failed events will be logged to CloudWatch. You can manually retrigger failed events.
- ==B. Configure Dead-letter queue with SQS. Configure SQS to trigger Lambda function again. right==
- C. All failures will be caught during exception inside Lambda function. Trigger lambda function inside lambda function code to process failed event.wrong
- D. Enable Active tracing using AWS X-Ray. It will automatically retrigger failed events.

###### Explanation:

**Answer:** **B**

Option A is not recommended approach. Although you can configure logging to CloudWatch, it is difficult to find the specific failure logs. Manual retries are not a best practice in an enterprise level solution designs.

Option B is correct. You can forward non-processed or failed payloads to Dead Letter Queue

(DLQ) using AWS SQS, AWS SNS.

![img](https://whizlabs.com/learn/media/2019/01/22/questions_fvblkh.png) 

- https://aws.amazon.com/blogs/compute/robust-serverless-application-design-with-aws-lambda-dlq/

Option C is not correct. ==Max memory limit and max execution time limit gets terminated without being caught in the handler exception.==

![img](https://whizlabs.com/learn/media/2019/01/22/questions_puoajy.png) 

Option D is not correct. Active tracing option can be used for detailed logging. It will not retry failed events.

- https://docs.aws.amazon.com/lambda/latest/dg/lambda-x-ray.html

==Question 5Incorrect==

**Domain:** Other

You must create a REST API using AWS API Gateway with Lambda as backend system and Oracle RDS instance as database. You have created API methods, Lambda function code and spun up Oracle RDS instance in a private VPC with no Internet Gateway. When you are trying to connect to the RDS instance from your Lambda, the connection getting failed. What could be the reason? (choose 2 options)

- A. Lambda execution role does not have policy to access RDS instance.wrong
- B. Lambda function is running in “no VPC” network mode.right
- C. RDS instance security group is not allowing connections from Lambda subnet range.right
- D. RDS instance is not configured as destination in Lambda setup.

###### Explanation:

**Answer: B,** **C**

- Option A is not correct. A policy on the role can only define access to which API actions can be made on RDS instance such as rds:CreateDBInstance, rds:CreateDBSecurityGroup, rds:CreateDBSnapshot etc. The policy will not define whether a resource can connect to an RDS instance or not.
- Option B is correct. When the Lambda function runs in “no VPC” network mode, it will not have access to resources running in a private VPC.

![img](https://whizlabs.com/learn/media/2019/01/22/questions_jhe56k.png)

- https://docs.aws.amazon.com/lambda/latest/dg/vpc.html
- Option C is correct. Security groups act as a firewall for any resources (such as RDS instance and Lambda in this case) they are connected with. If there is no inbound rule defined to allow connections from the Lambda subnet IP range or the Lambda security group, connections will fail.
  - https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html
- Option D is not correct. There is no such configuration for the destination in the Lambda setup.

==Question 6Correct==

**Domain:** Other

Which of the following is the customer’s responsibility concerning the AWS Lambda service? (choose 2 options)

- A. Lambda function code.right
- B. Monitoring and logging lambda functions.
- C. Security patches.
- D. Installing required libraries in underlying compute instances for Lambda execution.
- E. Providing access to AWS resources that triggers a Lambda function.right

###### Explanation:

**Answer:** **A,** **E**

Option A is correct.

Options B, C are not correct. Refer below screenshot

![img](https://whizlabs.com/learn/media/2019/01/22/questions_m10kxd.png)

Option D is not correct. You cannot log in to underlying compute instances of lambda execution. So, we cannot install any required libraries. However, you can package all the required dependent libraries along with your code.

Refer to the below documentation for more information on creating a deployment package for Lambda functions.

- https://docs.aws.amazon.com/lambda/latest/dg/with-s3-example-deployment-pkg.html

Option E is correct. AWS Lambda assumes the role assigned during setup to access any AWS resources it performs any action on. Policy on the role must grant access to any such resources for Lambda to perform operations, for example, S3 gets object, Dynamodb GetItem etc.

- https://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html#lambda-intro- execution-role

 Question 7Correct

**Domain:** Other

Which of the following is NOT a potential use case for using AWS Lambda?

- A. Periodically check the log files for errors in CloudWatch or CloudTrail and send out notifications through SNS.
- B. Download S3 bucket objects of size varying between 500 MB-2 GB to a Lambda Ephemeral disk or temp location, read and analyze them for keywords and add the keywords to the metadata of file object for search purposes.right
- C. Schedule a job and invoke a Lambda function to generate AWS resource usage reports based on certain tags.
- D. A website with highly scalable backend layer that will persist data into RDS or DynamoDB.wrong

###### Explanation:

**Answer:** **B**

Option A is a potential use case for AWS Lambda. You can use Lambda as a scheduled event and read log files from AWS CloudWatch or CloudTrail and report any errors through SNS notifications.

Option C is a potential use case.

For more information on scheduling Lambda functions, refer to documentation here. 

- https://docs.aws.amazon.com/lambda/latest/dg/with-scheduled-events.html?shortFooter=true

Option D is a potential use case.

You can host the web frontend on S3 and accelerate content delivery with Cloudfront caching. The web frontend can send requests to Lambda functions via API Gateway HTTPS endpoints. Lambda can handle the application logic and persist data to a fully managed database service.

(RDS for relational, or DynamoDB for non-relational database). You can host your Lambda functions and databases within a VPC to isolate them from other networks.

 

Here is the documentation for building a serverless website.

- https://aws.amazon.com/getting-started/projects/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/

Option B looks like a potential use case. But the scenario will fail due to the /tmp directory space limitation.![img](https://whizlabs.com/learn/media/2019/01/22/questions_atll9q.png)

 

 

 

![img](https://whizlabs.com/learn/media/2019/01/22/questions_tn0l9b.png)

 ==Question 8Correct==

**Domain:** Other

You have created a Lambda function for reading data from the Kinesis stream of transactions. In the code, you were using a context logger to log to CloudWatch, and you can monitor them at a later point of time. Lambda function started running along with Kinesis stream. However, you do not see any log entries for the new Lambda function. What could be the reason?

- A. Lambda functions with Kinesis stream as event source do not write logs to CloudWatch.
- ==B. Lambda execution role policy does not have access to create CloudWatch logs.right==
- C. Lambda function execution logs will be written to CloudTrail, not to CloudWatch.
- D. Active tracing is not enabled on the Lambda function setup configuration.

###### Explanation: 

**Answer:** **B**

Option A is not a valid statement. Lambda function will write logs as long as the execution role has access to create and write CloudWatch logs irrespective of the source that triggered it.

Option B is correct.

![img](https://whizlabs.com/learn/media/2019/01/22/questions_1yfoq2.png)

![img](https://whizlabs.com/learn/media/2019/01/22/questions_pzvzcc.png)

Option C is not correct. AWS CloudTrail is used for logging API calls made to services such as AWS Lambda, AWS S3 etc.

AWS CloudWatch for Lambda is used for execution logging. 

- https://docs.aws.amazon.com/lambda/latest/dg/with-cloudtrail.html

Option D is not correct. AWS X-Ray traces requests made to your serverless applications built using AWS Lambda. This will not be the reason for failing to write logs to CloudWatch.

- https://docs.aws.amazon.com/lambda/latest/dg/lambda-x-ray.html

 ==Question 9Incorrect==

**Domain:** Other

When configuring AWS SQS as event source for AWS Lambda function, what is the maximum batch size supported by AWS SQS for ReceiveMessage call?

- A. 20
- B. 40
- ==C. 10right==
- D. 100wrong

###### Explanation:

**Answer:** **C**

![img](https://whizlabs.com/learn/media/2019/01/22/questions_l2ay7c.png)

Here are other parameters apart from batch size.

![img](https://whizlabs.com/learn/media/2019/01/22/questions_xg2gyx.png) ![img](https://whizlabs.com/learn/media/2019/01/22/questions_ravng1.png)

- https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html

Question 10Incorrect

**Domain:** Other

You are planning to schedule a daily job with AWS CloudWatch scheduled event and AWS Lambda function triggered by the event that will perform a daily health check on your applications running on a fleet of EC2 instances. To achieve this, you need to provide the EC2 instances’ name tags to identify the right resources. What is the correct way of passing the inputs in this case?

- A. Configure the “Variables” option on the AWS CloudWatch scheduled event.
- B. You can modify the “Matched Event” option while selecting AWS Lambda as the trigger for CloudWatch scheduled event.wrong
- C. You can set the “Constant (JSON text)” option while selecting Lambda Function as a trigger for CloudWatch scheduled event.right
- D. “Details” object of “Matched Event” can be configured while creating an AWS CloudWatch scheduled event.

###### Explanation:

 **Answer:** **C**

When using an AWS Cloudwatch rule to trigger a Lambda event, one of the multiple options you have to pass data onto your Lamba function is “Constant (JSON Text)”. This handy feature allows you to send static content to your function instead of the matched event.

![img](https://whizlabs.com/learn/media/2019/01/22/questions_k0uchp.png)

- https://aws.amazon.com/blogs/compute/simply-serverless-use-constant-values-in-cloudwatch-event-triggered-lambda-functions/

Question 11Correct

**Domain:** Other

You have an existing AWS setup with DirectConnect. You have migrated certain on premise backend applications to AWS EC2 instances which are having certain processes run based on triggers from other applications. These processes are developed on JAVA programming language. Your organization is looking to migrate these processes to Lambda and reduce the cost incurred on EC2 instances. What would be your recommendation?

- A. AWS Lambda cannot be invoked from a custom application. They can only be triggered by AWS supported event sources.
- B. Replicate the JAVA code easily onto AWS Lambda function with few modifications and use Lambda Invoke API with input passed as custom event.right
- C. Trigger Lambda from AWS CloudWatch scheduled event and invoke CloudWatch API from your applications.
- D. AWS Lambda is not designed to run backend applications. Better to use EC2 for that purpose.

###### Explanation:



**Answer:** **B**

You can invoke a Lambda function using a custom event through AWS Lambda’s invoke API. Only the function’s owner or another AWS account that the owner has granted permission can invoke the function.

![img](https://whizlabs.com/learn/media/2019/01/22/questions_qv4pt8.png)



- https://docs.aws.amazon.com/lambda/latest/dg/API_Invoke.html
- https://docs.aws.amazon.com/lambda/latest/dg/with-userapp.html













Question 12Correct

**Domain:** Other



Which of the following are AWS CloudFront events that can trigger AWS Lambda@edge function? (choose 3 options)



- A. Viewer Requestright
- B. CloudFront Cache
- C. Sender Request
- D. Origin Requestright
- E. Origin Responseright

###### Explanation:



**Answer:** **A,** **D,** **E**

![img](https://whizlabs.com/learn/media/2019/01/22/questions_wmbge5.png)

![img](https://whizlabs.com/learn/media/2019/01/22/questions_nzcawz.png)

- https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/lambda-cloudfront-trigger-events.html











==Question 13Correct==

**Domain:** Other

You created an AWS Lambda function to process files uploaded to AWS S3 bucket. Lambda function started receiving requests and working properly. You have changed the code and uploaded new version of code to AWS Lambda function. What will happen to the requests sent right after the AWS lambda function update?

- A. Requests will queue until the changes are fully propagated. You could experience up to 5 minutes of wait during this period.
- B. Requests will be served by old version till you enable new version as latest.
- C. When you have multiple versions of Lambda function, in the code you need to define which version of function to be used. Otherwise, requests would fail.
- ==D. Requests might be served by old or new version for a brief period of less than one minute.right==

###### Explanation:

 **Answer:** **D**

![img](https://whizlabs.com/learn/media/2019/01/22/questions_9dxppt.png)

Option A is not a valid statement. It will not continually queue automatically or 5 minute wait time.

Option B is not correct. By default, whenever you update the code, it updates the LATEST version.

 ![img](https://whizlabs.com/learn/media/2019/01/22/questions_62tiz3.png)

 Option C is not correct. There is no need to define in code which version to be used. However, you can define which version to be used at the source which triggers Lambda function by providing version qualified ARN if you have published version.

![img](https://whizlabs.com/learn/media/2019/01/22/questions_cazpbg.png)

 Question 14Incorrect

**Domain:** Other

Which of the following are poll-based event sources for AWS Lambda function? (choose 3 options)

- A. AWS SNSwrong
- B. AWS Kinesisright
- C. AWS SQSright
- D. AWS DynamoDBright
- E. AWS CodePipelinewrong

###### Explanation:

 **Answer:** **B,** **C,** **D**

![img](https://whizlabs.com/learn/media/2019/01/22/questions_6negnn.png)

![img](https://whizlabs.com/learn/media/2019/01/22/questions_1ew9br.png)

- [https://docs.aws.amazon.com/lambda/latest/dg/invocation-options.html?shortFooter=true#streaming-event-source-mapping](https://docs.aws.amazon.com/lambda/latest/dg/invocation-options.html?shortFooter=true%23streaming-event-source-mapping)

 ==Question 15Correct==

**Domain:** Other

You work for a team which has 10s of applications running on AWS EC2 instances. All these applications would need a common backend processing job. You have created an AWS Lambda function with name “app-backend-job”and published PROD version with version “1” in order to make sure any changes to the function by anyone will not impact the PROD execution code. You have shared the version qualified ARN to all the applications assuming requests would be sent to the specific version. However, due to frequent changes in requirements, you had to change the code of Lambda function many times and keep publishing versions. This is causing a lot of overhead at the application level to update the Lambda function ARN each time you publish a new version. How can you overcome this situation?

- ==A. Create an alias, point it to PROD version and share the ARN with applications. When new version is published, change the alias to point to it.right==
- B. Do not publish versions for every code change. Instead, update the published version so that ARN to be invoked will not change.
- C. Delete the old published version “1” before publishing new version. This way when you publish, you will get the version ID as “1” and the lambda version ARN will remain unchanged.
- D. Do not use versioning in this case. Always use $LATEST version and share its ARN with applications.You can update the codes of $LATEST version any number of times.

###### Explanation:

**Answer:** **A**

By using aliases, you can access the Lambda function an alias is pointing to (for example, to invoke the function) without the caller having to know the specific version the alias is pointing to.

![img](https://whizlabs.com/learn/media/2019/01/22/questions_karzrb.png)

 ![img](https://whizlabs.com/learn/media/2019/01/22/questions_scmspn.png)

- https://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html?shortFooter=true

Option B is not correct.

![img](https://whizlabs.com/learn/media/2019/01/22/questions_d648v8.png)

- https://docs.aws.amazon.com/lambda/latest/dg/versioning-intro.html?shortFooter=true

Option C is not correct.

![img](https://whizlabs.com/learn/media/2019/01/22/questions_mvyagv.png)

Although Option D sounds correct, it is not a recommended approach since $LATEST version can be changed by anyone who has access to it. Any code running in PRODUCTION mode and using $LATEST version, there are chances that the configuration can be meddled and can cause unwanted issues.

- https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html?shortFooter=true

Question 16Incorrect

**Domain:** Other

Which of the following are correct ARNs for a Lambda function? (choose 3 options)

- A. arn:aws:lambda:aws-region:acct-id:function:helloworld:$LATESTright
- B. arn:aws:lambda:aws-region:acct-id:function:helloworldright
- C. arn:aws:lambda:aws-region:acct-id:function:helloworld/$LATESTwrong
- D. arn:aws:lambda:aws-region:acct-id:function:helloworld:PRODright
- E. arn:aws:lambda:aws-region:acct-id:function:helloworld/1wrong

###### Explanation:

**Answer:** **A,** **B,** **D**

![img](https://whizlabs.com/learn/media/2019/01/22/questions_0hzotf.png)

![img](https://whizlabs.com/learn/media/2019/01/22/questions_kzjhz2.png)

==Question 17Correct==

**Domain:** Other

Which of the following is a valid AWS Lambda configuration?

- A. 64 GB memory and 212 seconds timeout.
- B. 1376 GB memory and 120 seconds timeout.
- ==C. 2112 MB memory and 100 seconds timeout.right==
- D. 3072 MB memory and 1300 seconds timeout.

###### Explanation:

**Answer:** **C**

![img](https://www.whizlabs.com/learn/media/2020/12/13/ckeditor_59566.png)

- Options A and B are not correct because the units are in GB and NOT in MB.
- Option D is not correct. Maximum time can be 900 seconds only.
- Please refer to the below link to get further information:
  -  https://docs.aws.amazon.com/lambda/latest/dg/limits.html

 ==Question 18Correct==

**Domain:** Other

Your organization has two accounts, for DEV and TEST. You have certain user applications running on the TEST account would like to trigger AWS Lambda on the DEV account. What is the permission model which needs to be set to get this configuration working?

- ==A. Add permission for TEST account on DEV account’s lambda function policy through AWS CLI.right==
- B. Add permission for TEST account on DEV account’s lambda execution role policy through AWS Console.wrong
- C. Add permission for TEST account on DEV account’s lambda execution role policy through AWS CLI.
- D. Add permission for TEST account on DEV account’s lambda function policy through AWS Console.

###### Explanation:

**Answer: A**

 ![img](https://whizlabs.com/learn/media/2019/01/22/questions_fgkmh4.png)

![img](https://whizlabs.com/learn/media/2019/01/22/questions_d9wsy8.png)

 [https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html?shortFooter=true#access-control-resource-based-example-cross-account-scenario](https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html?shortFooter=true%23access-control-resource-based-example-cross-account-scenario)

 Options B, C are not correct. Permission needs to be added to the Lambda function policy to invoke the function, not on the execution role policy.

 Option D is not correct. ==Lambda function policy cannot be edited from the AWS console.==

 ![img](https://whizlabs.com/learn/media/2019/01/22/questions_2fa0sb.png)

 For more information, please fere to the below mentioned AWS docs:

- https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html

Question 19Incorrect

**Domain:** Other

You have a requirement to create an AWS Lambda function inside a private VPC which will be communicating with the RDS instance inside the same private VPC. You have set up the memory to be 1 GB for the Lambda function. You expect concurrent requests during peak to be 100 per sec, and the average Function execution time is 1 sec.

What should be the minimum subnet range you must choose to create a subnet to run the Lambda function without any issues successfully?

- A.  x.x.x.x/24wrong
- B.  x.x.x.x/25
- C. x.x.x.x/26right
- D. x.x.x.x/27

###### Explanation:

**Answer: \**C\****

 ![img](https://whizlabs.com/learn/media/2019/01/22/questions_1uyaue.png)

 

- https://docs.aws.amazon.com/lambda/latest/dg/vpc.html#vpc-setup-guidelines

 

Peak concurrent executions = 100 * 1 = 100
ENI Capacity = 100 * (1GB / 3GB) = 33.33  i.e. = 33

Hence we need /26 CIDR

 

- /24 CIDR range comes with 256 IP address with 251 available IP addresses
- /25 CIDR range comes with 128 IP address with 123 available IP addresses.
- /26 CIDR range comes with 64 IP addresses with 59 available IP addresses.
- /27 CIDR range comes with 32 IP addresses with 27 available IP addresses.

 

A step-by-step guide to ensure your function is optimally configured for scalability:

1. Calculate your `Peak Concurrent Executions` with this formula:
   `Peak Concurrent Executions = Peak Requests per Second * Average Function Duration (in seconds)`

2. Now calculate your `Required ENI Capacity`:
   `Required ENI Capacity = Projected peak concurrent executions * (Function Memory Allocation in GB / 3GB)`

3. If `Peak Concurrent Executions` > `Account Level Concurrent Execution Limit` (default=1,000), then you will need to [ask AWS to increase this limit](https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html#concurrent-execution-safety-limit).

4. Configure your function to use all the subnets available inside the VPC to access the resource that your function needs to connect to. This both maximizes `Actual ENI Capacity` and provides higher availability (assuming subnets are spread across 2+ availability zones).

5. Calculate your `Actual ENI Capacity` using [these steps](https://winterwindsoftware.com/scaling-lambdas-inside-vpc/#actual-eni-capacity).

6. If 

   ```
   Required ENI Capacity
   ```

    \> 

   ```
   Actual ENI Capacity
   ```

   , then you will need to do one or more of the following:

   - Decrease your function’s memory allocation to decrease your `Required ENI Capacity`.
   - Refactor any time-consuming code which doesn’t require VPC access into a separate Lambda function.
   - Implement throttle-handling logic in your app (e.g., by building retries into a client).

7. If `Required ENI Capacity` > your EC2 [`Network Interfaces per region`](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html) account limit, then you will need to [request that AWS increase this limit](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html#request-increase).

8. Consider [configuring a function-level concurrency limit](https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html#per-function-concurrency) to ensure your function doesn’t hit the ENI Capacity limit and if you wish to force throttling at a certain limit due to downstream architectural limitations.

9. [Monitor the concurrency levels](https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html#monitoring-concurrent-usage) of your functions in production using CloudWatch metrics, so you know if invocations are being throttled or erroring out due to insufficient ENI capacity.

10. If your Lambda function communicates with a connection-based backend service such as RDS, ensure that the maximum number of connections configured for your database is less than your functions will fail with connection errors. See [here](https://www.jeremydaly.com/manage-rds-connections-aws-lambda/) for more info on managing RDS connections from Lambda. (kudos to Joe Keilty for mentioning this in the comments)

==Question 20Correct==

**Domain:** Other

Which of the following services does the DLQ configured under lambda gets populated on error? (choose 2 options)

- ==A. AWS SQSright==
- B. AWS Kinesis
- ==C. AWS SNSright==
- D. AWS CloudWatch
- E. AWS X-Ray

###### Explanation:

**Answer: A,** **C**

 ![img](https://whizlabs.com/learn/media/2019/01/22/questions_rnqm7m.png)

![img](https://whizlabs.com/learn/media/2019/01/22/questions_5dba3r.png)

- https://docs.aws.amazon.com/lambda/latest/dg/dlq.html?shortFooter=true

Question 21Incorrect

**Domain:** Other

You are setting up AWS Lambda function to receive messages from SQS queue, process the message body and insert one record in MySQL RDS instance. You have setup SQS event trigger as AWS Lambda function. However, for connecting to RDS instance, you need MySQL details such as hostname, username and password. Where would you configure them?

- A. Use environment variables to pass configuration. They are automatically encrypted by AWS default KMS keys and decrypted when used in Lambda function.wrong
- B. Use environment variables to pass configuration. Use encryption helpers to encrypt sensitive information by your own KMS key. Decrypt the variable using decryption helper code provided in the console.right
- C. Use properties file in AWS Lambda function for any such configuration. Properties files are encrypted by AWS in transit and at rest.
- D. Store such configuration in AWS S3 bucket and enable encryption on S3 bucket. Perform S3 get object to get the configuration details in the Lambda function code.

###### Explanation:

**Answer:** **B**

![img](https://whizlabs.com/learn/media/2019/01/22/questions_zcsozz.png)

-  https://docs.aws.amazon.com/lambda/latest/dg/env_variables.html?shortFooter=true

 Option A is not correct. The statement is true, however the encryption only happens after deployment of lambda function.

![img](https://whizlabs.com/learn/media/2019/01/22/questions_3szfhh.png) 

Option C is not a valid statement.

Option D looks correct. However, out of given options, Option B is more valid and recommended.

==Question 22Incorrect==

**Domain:** Other

Which of the following actions is required by Lambda execution role to write the logs into AWS CloudWatch? (choose 3 options)

- ==A. logs:CreateLogGroupright==
- B. logs:GetLogEventswrong
- ==C. logs:CreateLogStreamright==
- D. logs:DescribeLogStreams
- ==E. logs:PutLogEventsright==

###### Explanation:

 **Answer:** **A,** **C,** **E**

 ![img](https://whizlabs.com/learn/media/2019/01/22/questions_mbkxax.png)

![img](https://whizlabs.com/learn/media/2019/01/22/questions_kvsivs.png)

- [https://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html?shortFooter=true#lambda-intro-execution-role](https://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html?shortFooter=true%23lambda-intro-execution-role)

 Question 23Incorrect

==**Domain:** Other==

Which of the following options is not AWS CloudWatch metric for AWS Lambda function?

- ==A. Memoryright==
- B. Dead Letter Errorwrong
- C. Duration
- D. Invocations

###### Explanation:

**Answer:** **A**

The AWS/Lambda namespace includes the following metrics.

![img](https://whizlabs.com/learn/media/2019/01/22/questions_ts4fy2.png)

![img](https://whizlabs.com/learn/media/2019/01/22/questions_5i5fwq.png)

- https://docs.aws.amazon.com/lambda/latest/dg/monitoring-functions-metrics.html

==Question 24Incorrect==

**Domain:** Other

You are creating a production mode Lambda function. Due to auditing compliance, your organization stated that production-grade code must not be modified during its execution unless the modification goes through a change process. For that, you decided to publish a version for PROD, create an alias, and use the alias ARN for invoking the Lambda function. However, your organization stated the code should not run if the version is $LATEST. How would you achieve this? (choose 2 options)

- ==A. getFunctionVersion from Context object.right==
- B. Get invokedLambdaARN from the event object and find out the version from it.wrong
- ==C. Use the AWS_LAMBDA_FUNCTION_VERSION environment variable.right==
- D. Use the AWS_LAMBDA_FUNCTION_ALIAS environment variable.

###### Explanation:

 **Answer:** **A,** **C**

 ![img](https://whizlabs.com/learn/media/2019/01/22/questions_an480s.png)

![img](https://whizlabs.com/learn/media/2019/01/22/questions_z3kgoe.png)

![img](https://whizlabs.com/learn/media/2019/01/22/questions_vglzzc.png)

For more information on environment variables available to Lambda functions, refer to documentation here.

https://docs.aws.amazon.com/lambda/latest/dg/env_variables.html

https://docs.aws.amazon.com/lambda/latest/dg/tutorial-env_cli.html

Option B is not correct. There is no parameter in any event source containing the ARN of the invoked Lambda function.

Option D is not correct. This is no environment variable for ALIAS.

 ==Question 25Incorrect==

**Domain:** Other

Which of the following statement is not true with respect to the default retry behavior of the AWS Lambda function?

- ==A. With synchronous invocation, the invoking application receives a 429 error and is responsible for retries.right==
- B. With asynchronous invocation, if AWS Lambda is unable to fully process the event and if you don't specify a Dead Letter Queue (DLQ), the event will be discarded.
- C. With Poll-based (or pull model) event sources that are stream-based, when a Lambda function invocation fails, AWS Lambda attempts to process the erring batch of records until the time the data expires, which can be up to seven days.
- D. With Poll-based event sources that are not stream-based, if the invocation fails or times out, the message will be returned to the queue and will be available for invocation once the Visibility Timeout period expires.wrong

###### Explanation:

**Answer: \**A\****

==**Synchronous invocation** – Lambda includes the `FunctionError` field in the response body, with details about the error in the `X-Amz-Function-Error` header. The status code is **200** for function errors.==

- **Event sources that aren't stream-based** – Some of these event sources are set up to invoke a Lambda function synchronously, and others invoke it asynchronously. Accordingly, exceptions are handled as follows:

  - **Synchronous invocation** – Lambda includes the `FunctionError` field in the response body, with details about the error in the `X-Amz-Function-Error` header. **The status code is 200 for function errors.** Lambda only returns error status codes if there is an issue with the request, function, or permissions that prevent the handler from processing the event. See [Invoke Errors](https://docs.aws.amazon.com/lambda/latest/dg/API_Invoke.html#API_Invoke_Errors) for details.

    [AWS service triggers](https://docs.aws.amazon.com/lambda/latest/dg/invoking-lambda-function.html) can retry depending on the service. If you invoke the Lambda function directly from your application, you can choose whether to retry or not.

  - **Asynchronous invocation** – Asynchronous events are queued before being used to invoke the Lambda function. If AWS Lambda cannot fully process the event, it will automatically retry the invocation twice, with delays between retries. If you have specified a Dead Letter Queue for your function, then the failed event is sent to the specified Amazon SQS queue or Amazon SNS topic. If you don't specify a Dead Letter Queue (DLQ), which is not required and is the default setting, the event will be discarded. For more information, see [Dead Letter Queues](https://docs.aws.amazon.com/lambda/latest/dg/dlq.html).

- https://docs.aws.amazon.com/lambda/latest/dg/retries-on-errors.html?shortFooter=true