==Question 1Correct==

**Domain:**

Which of the following are valid integration sources for API Gateway? (choose 3 options)

- ==A. Public facing HTTP-based endpoints outside AWS network.right==
- ==B. Lambda functions from another account.right==
- C. Database connections on internet outside AWS network.
- ==D. VPC Linkright==
- E. SFTP connection

###### Explanation:

**Answer:** **A,** **B,** **D**

Option A is correct. AWS API Gateway can integrate with any HTTP-based endpoints available over the internet.

 ![img](https://whizlabs.com/learn/media/2019/01/22/questions_pr6283.png) 

 **Q: With what backends can Amazon API Gateway communicate?**

Amazon API Gateway can execute AWS Lambda functions in your account, start AWS Step Functions state machines, or call HTTP endpoints hosted on AWS Elastic Beanstalk, Amazon EC2, and also **non-AWS hosted HTTP based operations that are accessible via the public Internet.** API Gateway also allows you to specify a mapping template to generate static content to be returned, helping you mock your APIs before the backend is ready. You can also integrate API Gateway with other AWS services directly. For example, you could expose an API method in API Gateway that sends data directly to Amazon Kinesis.

 Option B is correct. AWS can use Lambda function from another account as an integration type.

 ![img](https://whizlabs.com/learn/media/2019/01/22/questions_3ipvxu.png)

 Option C is incorrect. AWS API gateway can connect to AWS services, making proxy calls only to their respective AWS APIs. There is no integration type for database connections directly from API Gateway. You can use the Lambda function to connect with the database and make Lambda as an integration type for API Gateway.

 Option D is correct. AWS has introduced VPC Link, a way to connect to the resources within a private VPC.

 ![img](https://whizlabs.com/learn/media/2019/01/22/questions_uo30kg.png)

Refer to the documentation here for more information on VPC Links. https://aws.amazon.com/blogs/compute/introducing-amazon-api-gateway-private-endpoints/

==Question 2In Correct==

**Domain:**

A Company ABC has 100 REST APIs exposed to the Internet from their on-premise network. They have already integrated with AWS through DirectConnect. They have approached you asking for a cost-effective way of making these REST APIs available through AWS API Gateway because of the resiliency and cost reductions provided by it. What solution would you provide?

- A. API Gateway cannot integrate with on-premises backend APIs which are not over the public internet. Rebuild all the backend APIs using Lambda and integrate it with API Gateway.
- B. Use VPC Link to integrate on-premises backend solutions through DirectConnect and private VPC.right
- C. Build API Gateway using the existing on-premises public facing REST APIs as HTTPS endpoints integration type.wrong
- D. Build API Gateway with integration type as AWS Service and select Direct Connect service.

###### Explanation:

**Answer: B** 

 ![img](https://whizlabs.com/learn/media/2019/01/22/questions_kvur1c.png)

- For more information on VPC Link, refer to the documentation here. 
  - https://aws.amazon.com/blogs/compute/introducing-amazon-api-gateway-private-endpoints/
- Option A is INCORRECT because you can use API Gateway to integrate with on-premises backend APIs. Therefore this option is invalid.
- Option C is INCORRECT because you can choose the integration type as "HTTPS" if your API is integrated with an existing HTTPS endpoint. Since the question does not state any integration with any HTTPS endpoint, this option is invalid.
- Option D is INCORRECT because you can choose the integration type as "AWS Service" only if your API will be integrated with an AWS service. Since the question does not state any integration with any AWS service, this option is invalid.

- Please refer to page 605 on the below link:
  - https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-dg.pdf

==Question 3In Correct==

**Domain:**

You have built a REST API using API gateway and distributed to your customers. However, your API is receiving large number of requests and overloading your backend system causing performance bottlenecks and eventually causing delays and failures in serving the requests for your important customers. How would you improve the API performance? (Choose 2 options)

- A. Enable throttling and control the number of requests per second.right
- B. Create a resource policy to allow access for specific customers during specific time period.wrong
- C. Enable API caching to serve frequently requested data from API cache. right
- D. Enable load balancer on your backend systems.

###### Explanation:

**Answer:** **A,** **C**

Option A is correct. To prevent your API from being overwhelmed by too many requests, Amazon API Gateway throttles requests to your API. Specifically, API Gateway sets a limit on a steady-state rate and a burst of request submissions against all APIs in your account.

For more information on throttling, refer documentation here. 

- https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-request-throttling.html

Option B is not correct. This is not a viable solution. Resource policies cannot have a time range based condition.

Following documentation shows the conditions supported for API Gateway resource policies.

- https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-resource-policies-aws-condition-keys.html

Option C is correct. You can enable API caching in Amazon API Gateway to cache your endpoint’s responses. With caching, you can reduce the number of calls made to your endpoint and also improve the latency of requests to your API. When you enable caching for a stage, API Gateway caches responses from your endpoint for a specified time-to-live (TTL) period, in seconds. API Gateway then responds to the request by looking up the endpoint response from the cache instead of making a request to your endpoint. The default TTL value for API caching is 300 seconds. The maximum TTL value is 3600 seconds. TTL=0 means caching is disabled.

For details on enabling caching, refer documentation here. 

- https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-caching.html#enable-api-gateway-caching

Option D is not correct. We can improve performance by increasing the capacity of backend systems if above settings does not help. Simply adding a load balancer does not improve any performance.

Question 4In Correct

**Domain:**

You have created a public-facing REST API using AWS API Gateway with a default throttle setting of 10000 requests per second and a burst of 5000 requests. You are getting 8000 requests in the first millisecond. Which of the following statements is true?

- A. All 8000 requests would succeed as the default throttle limit is 8000 per second.wrong
- B. All 8000 requests would fail as it is higher than the burst limit of 5000.
- C. 5000 requests would succeed and rest 3000 would fail.
- D. 5000 requests would succeed and throttles the rest of 3000 in the one-second period.right

###### Explanation:

**Answer:** **D**

To prevent your API from being overwhelmed by too many requests, Amazon API Gateway throttles requests to your API using the token bucket algorithm, where a token count for a request. Specifically, API Gateway sets a limit on a steady-state rate and a burst of request submissions against all APIs in your account. In the token bucket algorithm, the burst is the maximum bucket size.

When request submissions exceed the steady-state request rate and burst limits, API Gateway fails the limit-exceeding requests and returns 429 Too Many Requests error responses to the client. Upon catching such exceptions, the client can resubmit the failed requests in a rate-limiting fashion, while complying with the API Gateway throttling limits.

By default, API Gateway limits the steady-state request rate to 10,000 requests per second (rps). It limits the burst (that is, the maximum bucket size) to 5,000 requests across all APIs within an AWS account. In API Gateway, the burst limit corresponds to the maximum number of concurrent request submissions that API Gateway can fulfill at any moment without returning

429 Too Many Requests error responses.

![img](https://whizlabs.com/learn/media/2019/01/22/questions_ebdgwb.png)

For more information on API Gateway throttling, refer to documentation here.

- https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-request-throttling.html#apig-request-throttling-account-level-limits 

**NOTE:**

The question says that "10000requests per **second** and burst of 5000 requests." However, "You are getting 8000 requests in one **millisecond**."

To help understand these throttling limits, here are a few examples, given the burst limit and the default account-level rate limit:

- If a caller submits 10,000 requests in a one-second period evenly (for example, 10 requests every millisecond), API Gateway processes all requests without dropping any.
- If the caller sends 10,000 requests in the first millisecond, API Gateway serves 5,000 of those requests and throttles the rest in the one-second period. 

- Please check the below link to know more about it. 
  - https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-request-throttling.html

Question 5In Correct

**Domain:**

Your organization had created a REST API using AWS API Gateway and exposed it over the internet.

They have noticed a consistently high number of requests per second on the GET **/users** method, approximately 9000 out of which 5000 requests are sent in 1st millisecond. This is putting more overload on backend systems. They have changed the stage’s number of requests per second to

6000 and burst to 3000 requests. Now the total number of requests sent per second is reduced to 6000. However, 5000 requests being sent in 1st millisecond. What could be causing this behavior?

- A. Stage’s GET /users method throttling settings might have overridden stage throttling settings with burst as 5000 requests.right
- B. Account-level throttle settings are 10000 requests per second and burst 5000 requests. You cannot overwrite account-level settings.
- C. Any changes made to Stage might take up to 2 hours to propagate.
- D. Requests per second are set to 6000. API can serve up to 6000 requests irrespective of how many requests sent in one millisecond.wrong

###### Explanation:

**Answer: A**

You can override stage settings on an individual method within a stage.

![img](https://whizlabs.com/learn/media/2019/01/22/questions_plvxuf.png)

![img](https://whizlabs.com/learn/media/2019/01/22/questions_17vvny.png)

- [https://aws.amazon.com/about-aws/whats-new/2018/07/api-gateway-usage-plans-support- method-level-throttling/](https://aws.amazon.com/about-aws/whats-new/2018/07/api-gateway-usage-plans-support-method-level-throttling/)

Question 6In Correct

**Domain:**

Which of the following are not access control mechanisms for AWS API Gateway? (Choose 2 options)

- A. Resource policies
- B. Lambda authorizers
- C. Server-side certificatesright
- D. VPC RouteTablesright
- E. Usage Planswrong

###### Explanation:

**Answer: C,** **D**

Following are different ways of controlling access to your AWS API Gateway.

![img](https://whizlabs.com/learn/media/2019/01/22/questions_o6lmnm.png) 

https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-controlling-access-to-apis.html

Option C is not an access control mechanism. API Gateway accepts the client-side certificates of your backend system.

https://docs.aws.amazon.com/apigateway/latest/developerguide/getting-started-client-side-ssl-authentication.html#configure-api

Option D is not an access control mechanism. RouteTables in VPCs are to control network traffic flow within a VPC.

For more information on VPC route tables, refer to documentation here: 

https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html

Question 7In Correct

**Domain:**

Your organization needs to expose certain services to your customers. You have created and deployed a REST API for your organization using AWS API Gateway over the public internet. Once deployed, you notice requests from hosts other than your customers. How would you control access in this scenario? (Choose 3 Options)

- A. Establish DirectConnect to each of your customer’s networks and enable API Gateway’s VPC Link through a private VPC.
- B. Enable CORS and add required hostnames under Access-Control-Allow-Origin.right
- C. Configure your customer’s IP address ranges in resource policy.right
- D. Create IAM users for your customers and enable user authentication.wrong
- E. Generate a Client Certificate to verify that HTTP requests to your backend system are from API Gateway.right

###### Explanation:

**Correct Answers: B,** **C, and E.**

![img](https://whizlabs.com/learn/media/2019/01/22/questions_vyz5pd.png) 

- Option A is not a feasible solution.
- Option B is correct. You can allow a domain other than the API Gateway’s domain name to access the APIs using Cross-Origin Resource Sharing.
  - For more information on CORS, refer documentation here:https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-cors.html
- Option C is correct.

 ![img](https://whizlabs.com/learn/media/2019/01/22/questions_bufnvc.png)

- Option D is incorrect. We can't exactly predict the number of users who would be using the API from the customer's side, which is why we have Option C as correct. Configuring the customer's IP range, and whoever wants to have access will be using the IP that's part of the configured range.
- Option E is correct. We can use API Gateway to generate an SSL certificate and use its public key in the backend to verify that HTTP requests to your backend system are from API Gateway.
  - **NOTE:** The client certificate is between API Gateway and the backend systems, not between API Gateway and the clients who make the requests. 
  - For more information on client certificates for API gateway, refer to documentation here:
    - [https://docs.aws.amazon.com/apigateway/latest/developerguide/getting-started-client-side-](https://docs.aws.amazon.com/apigateway/latest/developerguide/getting-started-client-side- ssl-authentication.html)[ssl-authentication.html](https://docs.aws.amazon.com/apigateway/latest/developerguide/getting-started-client-side- ssl-authentication.html)

Question 8Correct

**Domain:**

In AWS API Gateway, which of the following security measures is provided default by AWS to protect the backend systems?

- A. Default Cross-Origin Resource Sharing (CORS) configuration.
- B. Default Resource Policy.
- C. Protection from distributed denial-of-service (DDoS) attacks.right
- D. Security of backend systems falls under customer responsibility. AWS provides different mechanisms to protect backend systems which are not configured by default.

###### Explanation:

**Answer: C**

API Gateway supports throttling settings for each method or route in your APIs. You can set a standard rate limit and a burst rate limit per second for each method in your REST APIs and each route in WebSocket APIs. **Further, API Gateway automatically protects your backend systems from distributed denial-of-service (DDoS) attacks, whether attacked with counterfeit requests (Layer 7) or SYN floods (Layer 3).**

Options A and B are part of the above list and do not have any default configurations. Option C is correct.

![img](https://www.whizlabs.com/learn/media/2021/07/04/ckeditor_apiss_35_27.png) Option D's statement is incorrect as it is a distractor. The above screenshot shows AWS automatically protects from DDoS attacks.

https://aws.amazon.com/api-gateway/faqs/

https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-control-access-to-api.html

 









Question 9In Correct

**Domain:** Define Performant Architectures



With respect to API caching for API Gateway through the console, which of the following is not a cache setting?



- A. Cache capacitywrong
- B. Encrypt cache data
- C. Refresh cacheright
- D. Flush entire cache

###### Explanation:

**Answer: C**

Following are the settings when enabling/disabling API caching for API Gateway.

![img](https://whizlabs.com/learn/media/2019/01/22/questions_wcrr9c.png)

- Options A, B, D are highlighted in the above screenshots. There is no action to refresh the cache on API Gateway.

For more information on API caching, refer to documentation here.

- https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-caching.html









Question 10In Correct

**Domain:**



You have created a REST API using AWS API Gateway and deployed it to production. Your organization requested the details regarding who is accessing the API deployed to production. How would you get the required information?



- A. Enable Execution Logging in CloudWatch API logging.wrong
- B. Enable Access Logging in CloudWatch API logging.right
- C. CloudTrail contains the requester information for your API.
- D. Enable logging in your backend system to log the requests.

###### Explanation:

**Answer:** **B**

**Option A is incorrect** because, in execution logging, API Gateway manages the CloudWatch Logs. The process includes creating log groups and log streams and reporting to the log streams any caller's requests and responses.

**Option B is CORRECT** because**,** in access logging, you, as an API developer, want to log who has accessed your API and how the caller accessed the API. You can create your own log group or choose an existing log group that could be managed by API Gateway. 

- https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-logging.html

**Option C is incorrect.** CloudTrail logs the request information on AWS API Gateway, not the APIs created through the API gateway.

- https://docs.aws.amazon.com/apigateway/latest/developerguide/cloudtrail.html

**Option D is incorrect.** It is not effective in logging access logs as we have an option provided by AWS.