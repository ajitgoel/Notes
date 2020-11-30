# Introduction

- 3 minutes

Your company has begun a large-scale, multi-departmental project that requires data to be globally accessible, and it requires guarantees on throughput and resilience.

The project consists of multiple components that include:

- Customer facing e-commerce web and mobile applications
- Back-office warehouse and operations systems
- Internal sales and marketing database with real-time reporting requirements

The architecture team has selected Azure Cosmos DB as the candidate data store for all of the scenarios that are listed above, and they've asked you to explore the different options that are available to store and access data. Your development teams have a wide range of experience with different database APIs, and you've been asked to provide guidance back the project team on which APIs to use for each area of the project.

Azure Cosmos DB was chosen because it is flexible. At the lowest level, Azure Cosmos DB stores data in atom-record-sequence (ARS) format. The data is then abstracted and projected as an API, which you specify when you are creating your database.

In this module, you'll learn how Azure Cosmos DB provides different APIs to access and interact with the data it stores. You'll see the benefits of having a globally distributed database that is built to scale, with guaranteed latencies and availability, and support for your development teams' existing database knowledge.

By the end of the module, you'll have learned about all the different APIs, and explored how data is accessed via each API or via the Azure portal. Using this knowledge, you can make an informed decision on which APIs are the right choice for your company.

## Learning objectives

At the end of this module, you will be able to:

- Explain the features of Core (SQL)
- Explain the features of MongoDB
- Explain the features of Cassandra
- Explain the features of Azure Table
- Explain the features of Gremlin (graph)
- Choose the appropriate API for your Azure Cosmos DB account

## Prerequisites

- Familiarity with database conceptsIntroduction

  - 3 minutes

  Your company has begun a large-scale, multi-departmental project that requires data to be globally accessible, and it requires guarantees on throughput and resilience.

  The project consists of multiple components that include:

  - Customer facing e-commerce web and mobile applications
  - Back-office warehouse and operations systems
  - Internal sales and marketing database with real-time reporting requirements

  The architecture team has selected Azure Cosmos DB as the candidate data store for all of the scenarios that are listed above, and they've asked you to explore the different options that are available to store and access data. Your development teams have a wide range of experience with different database APIs, and you've been asked to provide guidance back the project team on which APIs to use for each area of the project.

  Azure Cosmos DB was chosen because it is flexible. At the lowest level, ==Azure Cosmos DB stores data in atom-record-sequence (ARS) format. The data is then abstracted and projected as an API, which you specify when you are creating your database.==

  In this module, you'll learn how Azure Cosmos DB provides different APIs to access and interact with the data it stores. You'll see the benefits of having a globally distributed database that is built to scale, with guaranteed latencies and availability, and support for your development teams' existing database knowledge.

  By the end of the module, you'll have learned about all the different APIs, and explored how data is accessed via each API or via the Azure portal. Using this knowledge, you can make an informed decision on which APIs are the right choice for your company.

  ## Learning objectives

  At the end of this module, you will be able to:

  - Explain the features of Core (SQL)
  - Explain the features of MongoDB
  - Explain the features of Cassandra
  - Explain the features of Azure Table
  - Explain the features of Gremlin (graph)
  - Choose the appropriate API for your Azure Cosmos DB account

  ## Prerequisites

  - Familiarity with database concepts

  # Identify the technology options

  - 6 minutes

  <img src="Choose the appropriate API for Azure Cosmos DB storage.assets/azure-cosmos-db.png" alt="Diagram showing how Azure Cosmos DB is globally distributed, supports five principles, four models, and five APIs." style="zoom: 50%;" />

  Azure Cosmos DB is a globally distributed and elastically scalable database. It has a guaranteed low latency that is backed by a comprehensive set of Service Level Agreements (SLAs). Consistency can sometimes be an issue when you are working with distributed systems, but Azure Cosmos DB alleviates this situation by offering you five different consistency levels: *strong*, *bounded staleness*, *session*, *consistent prefix*, and *eventual*.

  All of the above is supported by a multi-model Azure Cosmos DB's approach, which provides you with the ability to use document, key-value, wide-column, or graph-based data.

  The final choice you have is how to access and manipulate your data. Azure Cosmos DB was built to support multiple different models, and you can continue to use industry standard APIs if they are already part of your application or database design.

  This flexibility means that Azure Cosmos DB can be used as the database in all of the components that are being designed for your project.

  In this unit you'll discover, at a High Level, what each of the API choices are, and how they might be used. In the following units, you'll see scenarios where each of the API choices will be applicable.

  ## Core (SQL) API

  Core (SQL) is the default API for Azure Cosmos DB, which provides you with a view of your data that resembles a traditional NoSQL document store. You can query the hierarchical JSON documents with a SQL-like language. Core (SQL) uses JavaScript's type system, expression evaluation, and function invocation.

  ![img](Choose the appropriate API for Azure Cosmos DB storage.assets/core-api.png)

  For your company's e-commerce website, you could choose to use Core (SQL) to store your product catalog. For example, a sample data entry could look like this:

  JSONCopy

  ```json
  {
      "id": "cc410485-e177-4cbf-95e1-708f7d5e9297",
      "productName": "Industrial Saw",
      "description": "Cuts through anything",
      "supplier": "Hammer & Nail Inc",
      "quantity": 261,
      "unitCost": "$10.47",
      "retailPrice": "$29.99",
      "categories" : [
          {"name": "hammers"},
          {"name": "hand tools"}
      ]
  }
  ```

  To retrieve a product's name, you could use this SQL command:

  SQLCopy

  ```sql
  SELECT c.productName FROM Items c
  ```

  For developers who have experience with the SQL query language, Core (SQL) provides several familiar SQL statements and clauses; for example:

  - SELECT
  - FROM
  - WHERE
  - BETWEEN
  - COUNT
  - SUM
  - MIN
  - MAX
  - ORDER BY

  ## MongoDB API

  Azure Cosmos DB's API for MongoDB supports the MongoDB wire protocol. This API allows existing MongoDB client SDKs, drivers, and tools to interact with the data transparently, as if they are running against an actual MongoDB database. The data is stored in document format, which is the same as using Core (SQL). ==Azure Cosmos DB's API for MongoDB is currently compatible with 3.2 version of the MongoDB wire protocol.==

  ![img](Choose the appropriate API for Azure Cosmos DB storage.assets/mongo-api.png)

  Using the same JSON document example from earlier, your MongoDB query could look like this:

  JavaScriptCopy

  ```javascript
  db.Items.find({},{productName:1,_id:0})
  ```

  ## Cassandra API

  Azure Cosmos DB's support for the Cassandra API makes it possible to query data by using the Cassandra Query Language (CQL), and your data will appear to be a partitioned row store. Just like the MongoDB API, any clients or tools should be able to connect transparently to Azure Cosmos DB; only your connection settings should need to be updated. ==Cosmos DB's Cassandra API currently supports version 4 of the CQL wire protocol.==

  ![img](Choose the appropriate API for Azure Cosmos DB storage.assets/cassandra-api.png)

  For developers who have experience with the CQL query language, Azure Cosmos DB provides several familiar CQL statements and clauses; for example:

  - CREATE KEYSPACE
  - CREATE TABLE
  - ALTER TABLE
  - USE
  - INSERT
  - SELECT
  - UPDATE
  - BATCH (Only unlogged commands are supported)
  - DELETE

  To create a table that would store the JSON information listed earlier, you might use the following syntax:

  SQLCopy

  ```sql
  CREATE TABLE Catalog.Items(id text, productName text, description text, supplier text, quantity int, unitCost float, retailPrice float, categories map<text,text>, primary key (id));
  ```

  To retrieve a product's name, you could use this CQL command:

  SQLCopy

  ```sql
  SELECT id, productName FROM catalog.items
  ```

  ## Azure Table API

  Azure Cosmos DB's Azure Table API provides support for applications that are written for Azure Table Storage that need premium capabilities like global distribution, high availability, scalable throughput. ==The original Table API only allows for indexing on the Partition and Row keys; there are no secondary indexes. Storing table data in Cosmos DB automatically indexes all the properties, and requires no index management.==

  ![img](Choose the appropriate API for Azure Cosmos DB storage.assets/table-api.png)

  Querying is accomplished by using OData and LINQ queries in code, and the original REST API for GET operations.

  To retrieve a product's name, you could use this SQL command within a stored procedure or user-defined function:

  SQLCopy

  ```sql
  SELECT i.productName FROM Items i
  ```

  ## Gremlin (graph) API

  Choosing Gremlin as the API provides a graph-based view over the data. Remember that at the lowest level, all data in any Azure Cosmos DB is stored in an ARS format. A graph-based view on the database means data is either a ==vertex (which is an individual item in the database), or an edge (which is a relationship between items in the database).==

  ![img](Choose the appropriate API for Azure Cosmos DB storage.assets/graph-api.png)

  You typically use a traversal language to query a graph database, and Azure Cosmos DB supports Apache Tinkerpop's Gremlin language. For example, you could use the following commands to add three vertices for product and two edges for related-purchases to a graph:

  Copy

  ```
  g.addV('product').property('productName', 'Industrial Saw').property('description', 'Cuts through anything').property('quantity', 261)
  g.addV('product').property('productName', 'Belt Sander').property('description', 'Smoothes rough edges').property('quantity', 312)
  g.addV('product').property('productName', 'Cordless Drill').property('description', 'Bores holes').property('quantity', 647)
  
  g.V().hasLabel('product').has('productName', 'Industrial Saw').addE('boughtWith').to(g.V().hasLabel('product').has('productName', 'Belt Sander'))
  g.V().hasLabel('product').has('productName', 'Industrial Saw').addE('boughtWith').to(g.V().hasLabel('product').has('productName', 'Cordless Drill'))
  ```

  Once your data has been stored in your graph, you can query based on vertices or edges. For example, the following query will display the additional products that were purchased along with the industrial saw:

  Copy

  ```
  g.V().hasLabel('product').has('productName', 'Industrial Saw').outE('boughtWith')
  ```

  Results will be returned in GraphSON format, which looks like this:

  JSONCopy

  ```json
  [
    {
      "id": "6c69fba7-2f76-421f-a24e-92d4b8295d67",
      "label": "boughtWith",
      "type": "edge",
      "inVLabel": "product",
      "outVLabel": "product",
      "inV": "faaf0997-f5d8-4d01-a527-ae29534ac234",
      "outV": "a9b13b8f-258f-4148-99c0-f71b30918146"
    },
    {
      "id": "946e81a9-8cfa-4303-a999-9be3d67176d5",
      "label": "boughtWith",
      "type": "edge",
      "inVLabel": "product",
      "outVLabel": "product",
      "inV": "82e1556e-f038-4d7a-a02a-f780a2b7215c",
      "outV": "a9b13b8f-258f-4148-99c0-f71b30918146"
    }
  ]
  ```

  This kind of graph might be useful when you are creating a product recommendation application for an e-commerce website, or you could return detailed information for each of the related purchases by using the following query:

  Copy

  ```
  g.V().hasLabel('product').has('productName', 'Industrial Saw').outE('boughtWith').inV().hasLabel('product')
  ```

  ------

# Analyze the decision criteria

- 3 minutes

You have been given more details about a large project's technology and functionality. To help your colleagues, and future projects, you have decided to create a matrix that can be used in the decision-making process.

|                                                           | Core (SQL) | MongoDB | Cassandra | Azure Table | Gremlin |
| :-------------------------------------------------------- | :--------- | :------ | :-------- | :---------- | :------ |
| New projects being created from scratch                   | ✔          |         |           |             |         |
| Existing MongoDB, Cassandra, Azure Table, or Gremlin data |            | ✔       | ✔         | ✔           | ✔       |
| Analysis of the relationships between data                |            |         |           |             | ✔       |
| All other scenarios                                       | ✔          |         |           |             |         |

The above matrix tries to encapsulate the criteria that you can use to help choose between each API, and it is based on asking the following questions about project environment.

Are there existing databases or applications that use any of the supported APIs?

- If there is, then you might want to consider using the current API with Azure Cosmos DB, as that choice will reduce your migration tasks, and make the best use of previous experience in your team.

- If there isn't, then there are a few questions that you can ask in order to help you define the scenario where the database is going to be used:

  1. Does the schema change a lot?

     - A traditional document database is a good fit in these scenarios, making Core (SQL) a good choice.

  2. Is there important data about the relationships between items in the database?

     - Relationships that require metadata to be stored for them are best represented in a graph database.

  3. Does the data consist of simple key-value pairs?

     - Before Azure Cosmos DB existed, Redis or the Table API might have been a good fit for this kind of data; however, Core (SQL) API is now the better choice, as it offers a richer query experience, with improved indexing over the Table API.Analyze the decision criteria

       - 3 minutes

       You have been given more details about a large project's technology and functionality. To help your colleagues, and future projects, you have decided to create a matrix that can be used in the decision-making process.

       |                                                           | Core (SQL) | MongoDB | Cassandra | Azure Table | Gremlin |
       | :-------------------------------------------------------- | :--------- | :------ | :-------- | :---------- | :------ |
       | New projects being created from scratch                   | ✔          |         |           |             |         |
       | Existing MongoDB, Cassandra, Azure Table, or Gremlin data |            | ✔       | ✔         | ✔           | ✔       |
       | Analysis of the relationships between data                |            |         |           |             | ✔       |
       | All other scenarios                                       | ✔          |         |           |             |         |

       The above matrix tries to encapsulate the criteria that you can use to help choose between each API, and it is based on asking the following questions about project environment.

       ==Are there existing databases or applications that use any of the supported APIs? If there is, then you might want to consider using the current API with Azure Cosmos DB, as that choice will reduce your migration tasks, and make the best use of previous experience in your team.==

       - If there isn't, then there are a few questions that you can ask in order to help you define the scenario where the database is going to be used:
         1. ==Does the schema change a lot? A traditional document database is a good fit in these scenarios, making Core (SQL) a good choice.==
         2. ==Is there important data about the relationships between items in the database? Relationships that require metadata to be stored for them are best represented in a graph database.==
         3. ==Does the data consist of simple key-value pairs?==Before Azure Cosmos DB existed, Redis or the Table API might have been a good fit for this kind of data; however, ==Core (SQL) API is now the better choice, as it offers a richer query experience, with improved indexing over the Table API.==
       
       # Use Core (SQL) to store a product catalog
       
       - 4 minutes

       You've decided to look at how the new project is going to store the catalog for your customer facing e-commerce site. The sales team is likely to need support for adding new product categories quickly. The team had issues in the past as the old system that was using a relational database was too structured. Any necessary changes to add properties to products required downtime to update the table schemas, queries, and databases.

       A flat, denormalized table was being used, which also lead to many columns being empty. The database needs to store products in a way that will enable filtering data based on the category where the products are located.

       For example:

       - A clothing product needs to be searchable by sex, size, color, and style.
- A TV needs to be searchable on LCD or OLED, screen resolution, screen ratio, and HDR support.
       - A DVD needs to have a region, the languages supported, and any extras.

       ## Problem analysis
       
       The sales team's primary requirement is to support semi-structured data. The schema needs to be flexible in order to store an ever-increasing number of product categories. The system needs to support searching and sorting across many different properties. There is a structured relational database that can be used to import data.

       ## Recommended API: Core (SQL)

       The existing app uses a traditional relational database, which means that none of the other APIs are currently being used. However, Core (SQL) won't allow for any code reuse, but your team should quickly get up-to-speed with the SQL-like query language that is supported by Core (SQL).

       Supporting new product categories is an important requirement for your project, and the Core (SQL) schema is flexible and requires a schemaless data store. As a result of this architecture, bringing a new product category online is as simple as adding a document for the new product. Changes to the schema or taking the database offline are not required.

       ## Why not any of the other APIs?

       Using the decision matrix from the previous unit, you can see why the other APIs are not a good solution for this scenario:

       | API             | Description                                                  |
| :-------------- | :----------------------------------------------------------- |
       | **Azure Table** | ==This API should only be used to allow existing apps that are based on the Table API access to Azure Cosmos DB. However, new projects should always choose Core (SQL).== |
| **Cassandra**   | ==This API isn't a good choice in this particular scenario, because the schema is unknown and will change over time.== |
       | **Gremlin**     | ==This API isn't a good choice since the scenario doesn't need to process graph-based data.== |
       | **MongoDB**     | ==MongoDB's lack of support for SQL-like queries give Core (SQL) an advantage for your existing relational database users.== |

# Use the Gremlin (graph) API as a recommendation engine

- 4 minutes

The marketing team wants to be able to offer additional product recommendations while customers are browsing products on your e-commerce site. For example, the team would like to provide suggestions like, "people who bought this product also bought that product", and "people who viewed this product also are viewing that product." The products that are recommended first should be your most popular products, therefore a method needs to be provided that will enable ranking the relationships between products.

## Problem analysis

The data store needs to be able to assign weight values to the relationships between products. For example, you might store a count of the number of times that a relationship occurs. With that in mind, each time that a person buys "Product A" and "Product B", the relationship link between these two products needs to be incremented. This relationship counter is meta-data that needs to be stored in a database.

## Recommended API: Gremlin

<img src="Choose the appropriate API for Azure Cosmos DB storage.assets/graph-example.png" alt="Illustration of two nodes represented as circles with the text Product A and Product B.  A line points from A to B." style="zoom: 25%;" />

A graph database is the perfect fit to model this kind of data. Gremlin, the graph query language, will support the marketing department's requirements.

## Why not any of the other APIs?

Using the decision matrix from earlier in this learning module, you can see why the other APIs are not a good solution for this scenario:

| API             | Description                                                  |
| :-------------- | :----------------------------------------------------------- |
| **Core (SQL)**  | It would be possible to model the relationship data in a NoSQL database; however, the lack of native queries that can answer the question, "How is this item related to that item?" means that this API isn't the best choice. |
| **MongoDB**     | This API would not be a good choice; Graph API is the best choice due to the nature of this scenario. |
| **Cassandra**   | This API would not be a good choice; Graph API is the best choice due to the nature of this scenario. |
| **Azure Table** | This API would not be a good choice; Graph API is the best choice due to the nature of this scenario. |

# Use MongoDB to import historical order data

- 4 minutes

The operations team has been using an app that uses an existing MongoDB database to process purchase orders. The database captures data throughout the order process, including failed and partial orders, fulfillment data, and shipping status. MongoDB was chosen because each supplier wanted their orders in different formats. In addition, each supplier returns different meta-data. The volume of these suppliers has increased exponentially as your company has rolled out drop shipping. The operations team wants to keep access to this data, and continue to use their current purchase order system with as few code changes and as little downtime as possible.

## Problem analysis

The operations team has semi-structured data that needs the flexibility to store many different supplier order formats. Based on your research, you have determined that both Core (SQL) and MongoDB are good options. However, your operations team wants to reduce downtime during their app migration, so your best bet would be to find a way to allow your operations team to continue to use the MongoDB wire protocol.

## Recommended API: MongoDB

To allow the operations team to continue to use their existing app that uses MongoDB queries, your best option is to use the MongoDB API. Choosing this API means that MongoDB tools like `mongodump` and `mongorestore` are available to natively move the data into Azure Cosmos DB.

## Why not any of the other APIs?

Using the decision matrix from earlier in this learning module, you can see why the other APIs are not a good solution for this scenario:

| API             | Description                                                  |
| :-------------- | :----------------------------------------------------------- |
| **Azure Table** | This API isn't a good choice for this scenario, and should only be used to allow existing apps that are based on the Table API access to Azure Cosmos DB. |
| **Cassandra**   | This API isn't a good choice due to the existing MongoDB database, and the requirement to import and reuse application code. |
| **Core (SQL)**  | This API would be a good choice if there wasn't a requirement to reuse existing code and import an existing MongoDB database. |
| **Gremlin**     | This API isn't a good choice because the data isn't graph based. |

# Use Cassandra for web analytics

- 4 minutes

Your web analytics team is using a third-party web analytics application that uses a Cassandra database, and the team has experience writing Cassandra Query Language (CQL) queries to produce their own reports.

## Problem analysis

Your web analytics application is based on Cassandra, and your web analytics team has valuable experience with CQL.

## Recommended API: Cassandra

Based on the existing design of your third-party web analytics application, and the subject expertise that your web analytics team already has with CQL, your easiest path for migration would be to continue to use the Cassandra API for the immediate future.

## Why not any of the other APIs?

Using the decision matrix from earlier in this learning module, you can see why the other APIs are not a good solution for this scenario:

| API             | Description                                                  |
| :-------------- | :----------------------------------------------------------- |
| **Azure Table** | This API should only be used to allow existing apps that are based on the Table API access to Azure Cosmos DB. |
| **Core (SQL)**  | All of the requirements for your web analytics application can be satisfied by Core (SQL), which makes your decision difficult when choosing between Core (SQL) and Cassandra. Since the web team is already using their Cassandra-based application, and because of their prior experience using the Cassandra Query Language (CQL) for some of their reporting, Cassandra is the right choice for this scenario, although Core (SQL) is still a close second choice. |
| **Gremlin**     | This API isn't a good choice because the data isn't graph based. |
| **MongoDB**     | The flexibility of a document-based data store is not enough of a reason to use MongoDB. |



# Use the Azure Table API to store IoT data

- 4 minutes

The project architect has asked you to determine the advantages of moving data from an existing Azure Table Storage data set. The project architect found an existing 10 TB database that one of the project teams uses to store data from a legacy Internet of Things (IoT) application, and the data is seldom updated. Moving your database from Azure Table Storage into Azure Cosmos DB with a low throughput could have considerable cost savings, since Table Storage is charged on the size of data rather than how often it is accessed.

## Problem analysis

The IoT data consists of key-value pairs with no relationship information, and the existing dataset is currently deployed in Azure Table Storage.

## Recommended API: Azure Table

The best practice is to use Core (SQL) for new projects, as it has more features than the Azure Table API. However, to reduce downtime during your migration to Azure Cosmos DB, you might want to consider using the Table API for now, and switch to Core (SQL) sometime in the near future.

## Why not any of the other APIs?

Using the decision matrix from earlier in this learning module, you can see why the other APIs are not a good solution for this scenario:

| API            | Description                                                  |
| :------------- | :----------------------------------------------------------- |
| **Cassandra**  | This API isn't a good choice because of the existing Azure Table Storage database, and because of the requirements to import and reuse application code. |
| **Core (SQL)** | This API would be the best choice if you were designing a new system; however, since this scenario consists of a legacy application with a large existing Azure Table Storage dataset, the Azure Table API is the correct choice. |
| **Gremlin**    | This API isn't a good choice because this scenario doesn't need to process graph-based data, and because of the requirements to import and reuse application code. |
| **MongoDB**    | This API isn't a good choice because of the existing Azure Table Storage database, and because of the requirements to import and reuse application code. |

# Knowledge check

- 4 minutes

## Check your knowledge. For all of the scenarios listed below, choose the API that best supports the requirements.

\1. 

The e-commerce application has a requirement to support a shopping basket. Customers can add and remove products, and any discounts (like buy one get one free) need to be kept in the basket. The sales team wants the flexibility to offer different kinds of discounts, and to add or remove different product categories.

==Core (SQL) This type of data is modeled best by documents. Core (SQL) is the best choice for a new system.==

MongoDB

Cassandra

Azure Table Storage

Gremlin (graph)

\2. 

The risk department has asked if the new project could implement some form of fraud detection and prevention. The guidance is that the fraud system would need to be able to track the relationship between customers, payment types, billing and delivery addresses, IP address, geolocation, and past purchase history. Anything that doesn't fit into normal behavior should be flagged.

Core (SQL)

MongoDB

Cassandra

Azure Table Storage

==Gremlin (graph) Complex relationships, and needed to store metadata against them is best supported by a graph mode of data.==

\3. 

The sales team would like to offer a chat feature for customers. Messages will have a fixed number of characters and be simple. The schema is fixed, and the sales team has an existing chat app for which they have built up many CQL statements for creating reports. They would like to reuse them if possible.

Core (SQL)

MongoDB

==Cassandra The need to reuse existing CQL queries means that Cassandra is the best choice for in this scenario.==

Azure Table Storage

Gremlin (graph)

# Summary

- 2 minutes

In this module, you have explored the different APIs that Azure Cosmos DB supports, and you have seen that each API has benefits in different scenarios.

Your default choice for new Azure Cosmos DB accounts should be Core (SQL). However, you should also consider the following situations:

If your data is better represented in a graph, then the Gremlin (graph) API might be a good choice.

If you already have an existing application or database that is using one of the other APIs, then the current API might be a better choice for your specific scenario. Using the current API might make it easier to:

- Migrate your application or database to Azure Cosmos DB
- Reuse your existing code with minimal changes
- Leverage the existing knowledge and experience of your development team.

You should only use the Azure Table API if you are migrating from Azure Table Storage, as Core (SQL) offers far more features and flexibility.

## Learn more

Here are some resources where you can learn more about each of the APIs:

- [Azure Cosmos DB](https://docs.microsoft.com/en-us/azure/cosmos-db)
- [Modeling data](https://docs.microsoft.com/en-us/azure/cosmos-db/modeling-data)
- [MongoDB](https://docs.microsoft.com/en-us/azure/cosmos-db/mongodb-introduction)
- [Cassandra](https://docs.microsoft.com/en-us/azure/cosmos-db/cassandra-introduction)
- [Table API](https://docs.microsoft.com/en-us/azure/cosmos-db/table-introduction)