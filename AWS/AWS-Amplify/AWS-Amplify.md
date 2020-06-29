###### Commands:
npm install -g @aws-amplify/cli
npm install -g @aws-amplify/cli --unsafe-perm=true
amplify configure
npm install -g @vue/cli
npm install aws-amplify @aws-amplify/ui-vue

amplify init
amplify add auth
amplify add api
amplify mock api //allows you to mock graphql api and test it locally
amplify mock function <FunctionName> //will allow you to unit test the lambda function.
"amplify add <category>" will allow you to add features like user login or a backend API
"amplify status" will show you what you've added already and if it's locally configured or deployed
"amplify console" to open the Amplify Console and view your project status
amplify add storage
amplify add hosting
amplify add analytics
amplify push=> When prompted about code generation, select ‘Yes’, then choose Typescript, and accept the defaults for the remaining prompts.
amplify publish
amplify delete

###### Scalar types in AWS AppSync
https://docs.aws.amazon.com/appsync/latest/devguide/scalars.html
ID, String, Int, Float, Boolean
AWSDate, AWSTime, AWSDateTime, AWSTimestamp, AWSEmail, AWSJSON, AWSURL, AWSPhone, AWSIPAddress

###### Multiple Serverless Environments with AWS Amplify:
https://read.acloud.guru/multiple-serverless-environments-with-aws-amplify-344759e1be08

###### New – Local Mocking and Testing with the Amplify CLI
https://aws.amazon.com/blogs/aws/new-local-mocking-and-testing-with-the-amplify-cli/

###### File created by aws amplify, after "Initializing Amplify Project":
amplify/.config/local-aws-info.json (gitignored): Tells Amplify which AWS profile to use.
amplify/.config/local-env-info.json (gitignored): Contains user and system preferences, such as default code editor
amplify/.config/project-config.json: Project specific information, such as where the src directory is located.
amplify/#current-cloud-backend/amplify-meta.json: Contains metadata of all resources pushed to the Cloud via Amplify. More on this later.
amplify/backend/amplify-meta.json: The same as the previous file, except this reflects the local state of your amplify resources. More on this later.
amplify/backend/backend-config.json: Contains a description of all the resources you have created with Amplify. It will be an empty object when starting off.
amplify/team-provider-info.json: This file has information about the environments tied to this project and should be checked into git so that other team members can also make use of these configured environments. More on this later.
src/aws-exports: A file used to configure the Amplify frontend libraries, which we will be using later on in this article.

###### File created by aws amplify, after "Adding Storage":
amplify/backend/backend-config.json: An entry has been added that represents the hosting functionality.
amplify/backend/hosting/S3AndCloudFront/parameters.json: This file is created and contains the name of the S3 bucket that Amplify will publish the app to.
amplify/backend/hosting/S3AndCloudFront/template.json: Not sure what this does, looks complicated to me.

###### File created by aws amplify, after "Adding Authentication":
amplify/team-provider-info.json modified: A cognito pool is added to this configuration. This is part of the environment “dev” we created.
amplify/backend-config.json modified: “auth” has been added next to our “hosting” configuration
amplify/backend/auth/<<cognitoPoolId>>/<<templatename.yml created: A YAML file describing the Cognito Pool, which will be used by Amplify to actually create the Cognito Identity Pool on AWS
amplify/backend/auth/<<cognitoPoolId>>/parameters.json created: Also used for the creation of the Identity Pool on AWS.