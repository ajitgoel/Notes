https://adrianhall.github.io/cloud/2018/08/29/build-a-graphql-service-the-easy-way/

//1. Object types that are annotated with @model are top-level entities in the generated API. 
//When pushed, they will create DynamoDB tables as well as additional Schema & resolvers to hook everything together.
//2. @searchable directive allows AWS Amplify to deploys a DynamoDB table and an ElasticSearch Service instance 
//with an AWS Lambda function that streams data from DynamoDB to ElasticSearch. 
//All the queries will hit the ElasticSearch Service and all the mutations will be sent to DynamoDB.
//3. the current version is stored in a field called version. 
//When you send an update or delete from the client, send an expectedVersion field as well to handle conflict resolution.
//4. The @auth directive provides rules to say who can access the specific type operations. 
//Eg: The @auth rule below allows owner to create, update, and delete their own blogs.
//It also allows owner and a group of people called “managers” to read the blogs
type Blog @model @searchable @versioned
@auth(rules: [
    { allow: owner },
    { allow: groups, groups: ["managers"], queries: ["get","list"] }
  ])
{
  id: ID!
  name: String!
  //The @connection annotation enables you to specify relationships between @model object types. 
  //@connection supports one-to-one, one-to-many, and many-to-one relationships.
  posts: [Post] @connection(name: "BlogPosts")
}
type Post @model {
  id: ID!
  title: String!
  content: String!
  blog: Blog @connection(name: "BlogPosts")
  //Use the same name in both sides of the connection(one in the Post type and one in the Comment type), 
  //allow you to provide functionality like “give me all the comments for a particular Post”
  comments: [Comment] @connection(name: "PostComments")
}
type Comment @model {
  id: ID!
  content: String
  post: Post @connection(name: "PostComments")
}