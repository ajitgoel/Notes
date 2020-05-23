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

@key: DynamoDB query operations may use at most two attributes to efficiently query data. The first query argument passed to a query (the hash key) must use strict equality and the second attribute (the sort key) may use gt, ge, lt, le, eq, beginsWith, and between. 
Definition directive @key(fields: [String!]!, name: String, queryField: String) on OBJECT

fields=>	A list of fields that should comprise the @key, used in conjunction with an @model type. The first field in the list will always be the HASH key. If two fields are provided the second field will be the SORT key. If more than two fields are provided, a single composite SORT key will be created from a combination of fields[1...n]. All generated GraphQL queries & mutations will be updated to work with custom @key directives.
name=> When provided, specifies the name of the secondary index. When omitted, specifies that the @key is defining the primary index. You may have at most one primary key per table and therefore you may have at most one @key that does not specify a name per @model type.
queryField=>	When defining a secondary index (by specifying the name argument), this specifies that a new top level query field that queries the secondary index should be generated with the given name.