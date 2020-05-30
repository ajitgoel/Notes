###### Commands:
npm install -g @aws-amplify/cli
npm install -g @aws-amplify/cli --unsafe-perm=true
amplify configure
npm install -g @vue/cli
npm install aws-amplify @aws-amplify/ui-vue

amplify init
amplify add auth
amplify add api
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
