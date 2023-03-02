#### 1. Explain what GraphQL is? Does it belong under database technology?

While this may seem like a fundamental GraphQL interview question, you can make the answer interesting by adding your personal experience with the language.

GraphQL is a query language invented by Facebook in 2012 that offers a standard interface for data retrieval and modification between the client and the server. The client uses queries to request data from the GraphQL server. Client-specified inquiries are those in which the answer format is described in the query and determined by the client rather than the server.

As opposed to standard REST APIs, the data structure is not hardcoded, making data retrieval from the server more efficient for the client.

GraphQL is frequently misunderstood as database technology; however, this is a widespread misunderstanding. GraphQL is an API query language. In that respect, it's database agnostic, meaning it can work with any database or perhaps none at all.

#### 2. How does GraphQL utilize the data loading process?

When users use GraphQL to request data, it merely retrieves the least amount of data necessary by the client. Even if the object model has a large number of fields, the client can only request the required fields.

#### 3. Where do you use GraphQL and why?

These types of GraphQL interview questions explicitly seek your working experience with the language. Dig into all your experience and share the best examples.

Where your customer requires a flexible answer style to prevent multiple queries and extensive data transformation with the burden of keeping them in sync, GraphQL comes in handy.

Using a GraphQL server, a client-side developer may easily alter the return format without affecting the backend.

You may describe the essential data more naturally with GraphQL. It can speed up development since the needed data is more comparable to your component structure in application architectures like top-down rendering in React.

#### 4. What are the key concepts of GraphQL?

GraphQL has some key concepts. They are:

-   Hierarchical
-   Product-centric
-   Strong-typing
-   Client-specific queries
-   Introspective

#### 5. List down the primary operations that GraphQL supports.

The three sorts of operations supported by GraphQL are ==query, mutation, and subscription. The request is made using the query, which is a read action; mutation is used for write operations, and subscription is used to listen for any data changes.== If the client is subscribed to that event, the server sends a notification message to the client whenever data changes.

#### 6. What is the main difference between REST and GraphQL?

The most significant distinction between REST and GraphQL is that GraphQL does not deal with specific resources. Everything, in GraphQL, is viewed as a graph, which is linked and may be searched to meet the demands of the app.

#### 7. How can you do server-side caching in GraphQL?

This is an example of a GraphQL interview question that assesses your detail orientation.

The difficulty of maintaining server-side caching is still an area of concern with GraphQL, especially when compared to REST. It's simple to cache data for each endpoint with REST because the data format is guaranteed not to change.

With GraphQL, on the other hand, it's impossible to predict what a client will want next; thus, a cache layer sitting behind the API makes little sense. Therefore, ==server-side caching in GraphQL remains a hurdle.==

#### 8. What do you understand by AST in GraphQL?

==A query to be processed by a GraphQL server usually comes in as a single String. Therefore, this string must be== tokenized ==(divided into meaningful substrings) and processed into a machine-readable form. An abstract syntax tree, or AST, is the name for this form.==

When GraphQL processes a query, it walks through the tree, executing each component against the schema. Every compiler, from C++ to Chrome's JavaScript VM to Babel, starts by converting raw strings to an AST.

#### 9. What is Fragment in GraphQL?

When the query in GraphQL is huge and contains reusable components, the fragment is utilized. You may utilize the reusable portion to construct a fragment, which you can then use in the query. The notion of the fragment was created to make it easy to organize code and reduce duplication.

#### 10. Can we use inheritance with GraphQL input types?

No, input types are not allowed to implement inheritance. In addition, the GraphQL type system does not support inheritance (the extends keyword adds fields to an existing type, not inheritance).

----------------------------
1. What is GraphQL?
GraphQL is a query language created by [Facebook](http://facebook.github.io/) in 2012 which provides a **common interface between the client and the server for data fetching and manipulations**.
The client asks for various data from the GraphQL server via queries. The response format is described in the query and defined by the client instead of the server: they are called **client‐specified queries**.  
The structure of the data is not hardcoded as in traditional REST APIs - this makes retrieving data from the server more efficient for the client.

2. Is GraphQL a Database Technology?
No. GraphQL is often confused with being a database technology. This is a misconception, GraphQL is a _query language_ for APIs - not databases. In that sense it’s database agnostic and can be used with any kind of database or even no database at all.

3. What is an exclamation point in GraphQL?
That means that the field is non-nullable. By default, all types in GraphQL are nullable. When non-null is applied to the type of a field, it means that if the server resolves that field to `null`, the response will _fail validation_.

4. Is GraphQL only for React / Javascript Developers?
No. GraphQL is an API technology so it can be used in any context where an API is required.
On the _backend_, a GraphQL server can be implemented in any programming language that can be used to build a web server. Next to Javascript, there are popular reference implementations for Ruby, Python, Scala, Java, Clojure, Go and .NET.
Since a GraphQL API is usually operated over HTTP, any client that can speak HTTP is able to query data from a GraphQL server.
_Note_: GraphQL is actually transport layer agnostic, so you could choose other protocols than HTTP to implement your server.

5. What is difference between Mutation and Query?
Technically any GraphQL _query_ could be implemented to cause a data write. But there is a convention that any operations that cause writes should be sent explicitly via a _mutation_.
Besides the difference in the semantic, there is one important technical difference:
==**Query** fields can be executed in parallel by the GraphQL engine while **Mutation** top-level fields MUST execute serially according to the spec.==

6. What is GraphQL schema?
Every GraphQL server has two core parts that determine how it works: a schema and resolve functions.
The _schema_ is a model of the data that can be fetched through the GraphQL server. It defines what queries clients are allowed to make, what types of data can be fetched from the server, and what the relationships between these types are.

Consider:

```
type Author {
  id: Int
  name: String
  posts: [Post]
}
type Post {
  id: Int
  title: String
  text: String
  author: Author
}
type Query {
  getAuthor(id: Int): Author
  getPostsByTitle(titleContains: String): [Post]
}
schema {
  query: Query
}
```

7. Where is GraphQL useful?
GraphQL helps where your **client needs a flexible response** format to avoid extra queries and/or massive data transformation with the overhead of keeping them in sync.

Using a GraphQL server makes it very easy for a client side developer to change the response format without any change on the backend.

With GraphQL, you can describe the required data in a more natural way. It can speed up development, because in application structures like **top-down rendering** in React, the required data is more similar to your component structure.
8. How to do Error Handling?
A successful GraphQL query is supposed to return a JSON object with a root field called `"data"`. If the request fails or partially fails (e.g. because the user requesting the data doesn’t have the right access permissions), a second root field called `"errors"` is added to the response:

```
    {
      "data": { ... },
      "errors": [ ... ]
    }
```

9. How to query all the GraphQL type fields without writing a long query?
GraphQL requires you to be explicit about specifying which fields you would like returned from your query.
1. List the key concepts of the GraphQL query language
3. How to do Authentication and Authorization?
4. What kind of operations could GraphQL schema have?
5. Does GraphQL Support Offline Usage?
GraphQL is a query language for (web) APIs, and in that sense by definition only works online.
8. Whether do you find GraphQL the right fit for designing microservice architecture?
9. How to implement a set of GraphQL mutations in single transaction?
https://stackoverflow.com/questions/41238205/graphql-mutation-operation-in-single-transaction
==GraphQL is just an interface to your data stored behind the scene using your choice of storage (persistent or non-persistent). Transaction has to be dealt past GraphQL layer.==
11. Are there any disadvantages to GraphQL?
https://www.javatpoint.com/graphql-advantages-and-disadvantages
**Disadvantages:** Caching,  Query Complexity, Rate Limiting
**Advantages:**
==GraphQL is faster, No over-fetching and under-fetching problems==
==Best for complex systems and microservices==
	We can integrate multiple systems behind GraphQL's API. It unifies them and hides their complexity. The GraphQL server is also used to fetch data from the existing systems and package it up in the GraphQL response format. This is most beneficial for legacy infrastructures or third-party APIs that are enormous in size and difficult to maintain and handle. When we have to migrate from a monolithic backend application to a microservice architecture, the GraphQL API can help us to handle communication between multiple microservices by merging them into one GraphQL schema.
Hierarchical Structure
Defines a data shape
Code-sharing
==Strongly typed==
==Protocol, not a storage==
Introspective
Latest version not required
13. Can you make a GraphQL type both an input and output type?
14. How do you prevent nested attack on GraphQL server?
15. What is AST in GraphQL?
16. Is it possible to use inheritance with GraphQL input types?
17. How to respond with different status code in GraphQL?
18. What the criteria set is for deciding when to use GraphQL vs. HATEOAS?
19. How would you model recursive data structures in GraphQL?

-------------------

https://www.javatpoint.com/graphql-resolvers
# GraphQL Architecture

GraphQL was released as a specification. The specification describes the behavior of the GraphQL server. It provides some guidelines to handle requests from the clients and responses from the server, such as supported protocols, the format of the data that the server accepts, the format of the server's response, etc. The client makes a request to the GraphQL server. This request is called a query. ==When a client requests a query to communicate with the server, the transport layer of [GraphQL](https://www.javatpoint.com/graphql) can be connected with any available network protocol such as TCP, WebSocket, or any other transport layer protocol.== ==The GraphQL server== doesn't care about the database you use. It ==is neutral to databases.== You can use a relational or a NoSQL database.

## Client-Server flow in GraphQL

==The GraphQL query is not written in JSON. When a client makes a 'POST' request to send a GraphQL query to the server, this query is sent as a string.==
==The server receives and extracts the query string. After that, the server processes and validates the GraphQL query according to the GraphQL syntax and the graph data model (GraphQL schema).==
==Like the other API servers, the GraphQL API server also makes calls to a database or other services and retrieves the data requested by the client.==
==After that, the server takes the data and returns it to the client in a JSON object.==

# GraphQL Resolvers

==GraphQL resolvers are the collection of functions that are used to populate the data for a single field in your schema. Resolvers specify a way how Apollo Server processes GraphQL operations. When we use the Apollo server for communication, it needs to know how to populate data for every field in your schema because it has to respond to the request for that specific data.== Here, we use resolver to make this communication possible. In simple words, we can say that ==resolvers are used to handle GraphQL queries. Apollo Server automatically defines a default resolver if the user doesn't define a resolver for a particular field.==