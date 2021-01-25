Cosmos DB is a pretty amazing database service. It used to be called DocumentDB, but Microsoft added so much new functionality to it that they had to rename it. Cosmos DB is such an unusual database service that it can take a while to understand it. I’ll try to sum it up as briefly as I can.

Cosmos DB’s two most important features are that it’s global and it’s multi-model. Not only is it extremely easy to replicate a Cosmos DB database to multiple regions around the world, but Microsoft even provides service level agreements for latency, which isn’t something you can get with normal database services.

The multi-model feature may be even more innovative. Cosmos DB supports many different types of data models, including document, key-value, graph, and wide column. It isn’t the only database system that supports multiple models, but it’s the first to be offered as a global cloud service.

As I mentioned in the NoSQL lesson, Azure Table storage now has a premium offering as part of Cosmos DB. It’s accessed using the Table API. It’s still a key/attribute store, but it offers these additional features:

- Global distribution
- Dedicated throughput worldwide
- Single-digit millisecond latencies at the 99th percentile
- Guaranteed high availability, and
- Automatic secondary indexing

These features are not unique to the Table API. They are inherent capabilities of all Cosmos DB data models.

Next, let’s look at the document data model. It’s very similar to the key/value model, but it provides richer querying capabilities. At the moment, Cosmos DB supports two different options for document databases, the MongoDB API and  the SQL API.

MongoDB is currently the most popular document database and it’s open source. It stores data in a JSON-like format, without a schema. With the MongoDB API, you can take applications that were written to work with a MongoDB database and point them to a Cosmos DB database instead. In many cases, you only need to change a connection string to make this work.

Cosmos DB’s second document database offering is the SQL API. This used to be called the DocumentDB API. The new name is actually kind of confusing because a document database is technically a NoSQL database. So isn’t it a contradiction to call it the SQL API? Well, it’s called that because it lets you use a SQL-like language to query JSON documents (which is how Cosmos DB stores the data).

Since SQL was designed to work with relational database tables, Microsoft couldn’t just use SQL as-is to query JSON documents, so it’s not standard SQL. Furthermore, Microsoft incorporated JavaScript's programming model in their query language, so it’s even more different from SQL than you would expect. Despite all of this, the SQL API still looks very similar to standard SQL, which makes it easier for people with SQL experience to use than the MongoDB API.

Graph databases are more complex than document databases because they also store information about relationships between entities. For example, two people may be connected to each other on LinkedIn or Facebook. A graph database stores this relationship data separately from the user entities.

Graphs are a great way to model many real-world relationships, but you can still find ways to model them using other types of databases. Where graph databases really shine is with applications that need to traverse a graph from one entity to another, with other entities in between, such as a friend of a friend. Graph databases can perform these operations orders of magnitude faster than other types of databases. Some examples of application types that can benefit from graph databases are social networking, content management, geospatial, and product recommendations.

The last data model supported by Cosmos DB is the wide column model. This is the model used by the Apache Cassandra database system. Cosmos DB provides the Cassandra API for applications that are written to use a Cassandra database.

Yet another unusual feature of Cosmos DB is that you can choose from five different consistency levels. When you build a database system that’s distributed across different locations (as is the case with Cosmos DB), you face the problem of how to keep all of the locations in sync.

If data is written in one location, it has to be replicated to all of the other locations as well. But what if a read request comes in at one of the other locations immediately after the data was written at the first location? Since the replication wouldn’t have happened yet, the read request wouldn’t return the new data. But a read request against the first location would return the new data, so that would be inconsistent.

This consistency problem is why relational databases usually have only one location. This makes it hard to scale relational databases and is the biggest reason why NoSQL databases became popular. There are many different ways to handle the consistency problem and Cosmos DB supports five of them.

Strong consistency guarantees that a read operation will return the most recent version of an item. This is the type of consistency that relational databases have. For a distributed database to achieve strong consistency, it has to ensure that each write operation has been propagated to all of the replicas before the operation is considered complete. There’s an obvious problem with this approach. It’s very slow, especially if the database is distributed over a wide geographic region. So how can Cosmos DB provide strong consistency for a global database? Well, it can’t. If you choose strong consistency, then the database can only be in one region.

At the other end of the spectrum is eventual consistency. The only guarantee made by this approach is that if no new writes are made to an item, then eventually all of the replicas will have the same value for that item. This is a very weak guarantee because not only could a request return an old value, but it could return a value older than the one that you retrieved previously. This could happen if your second request connected to a replica that hadn’t been updated yet. This is the level of consistency typically offered by NoSQL databases. It has the lowest latency, but the worst consistency.

Cosmos DB offers three other consistency levels that are in between these two extremes. As you add more consistency, both the latency and the cost generally go up.

Consistent Prefix is the same as eventual consistency except that it guarantees that read operations will never see out-of-order writes. That is, reads can still return older values, but never out of order.

Session consistency guarantees consistency for each client session. So a client will never see data older than what it has written during a session. This is relatively easy to provide because the system doesn’t have to worry about conflicts between multiple clients. It just needs to keeps things consistent for an individual client. This approach offers the lowest latency reads and writes. It’s also by far the most popular consistency level chosen by Cosmos DB customers.

Bounded staleness guarantees that reads may lag behind writes by a limited amount of time. This costs as much as strong consistency, but it allows you to distribute your database across regions and has lower latency. This is the second most popular consistency level chosen by customers.

Believe it or not, Cosmos DB allows you to specify a different consistency level on each request, although most customers don’t do that. It also provides an SLA on both consistency and latency.

Cosmos DB’s pricing model is based on Request Units, or RUs. All API requests have a number of RUs assigned to them, based on the resources required to fulfill that request. For example, a complex SQL query would require more RUs than reading a single key/value pair. Writes take more resources to execute than reads do, so they’re five times more expensive.

You need to tell Cosmos DB how many RUs per second to provision. This throughput capacity is applied to each region associated with your database account. You have to pay for this amount of capacity regardless of how much you actually use, but you can increase or decrease the RUs per second at any time.

The number of RUs required to fulfill  a request depends on many factors, including:

- Item size
- Number of properties in an item
- Consistency level
- Number of properties indexed
- Document indexing
- Query complexity, and
- Script usage (i.e. stored procedures and triggers)

To estimate the number of RUs per second you’ll need, you can use the request unit calculator. But it would probably be easier to run a few typical operations and see how many RUs they required. You can get that number from either the header in the response to your request or from the Cosmos DB Data Explorer in the Azure portal. Then multiply that by the number of operations you expect to run per second.

If your application exceeds the number of RUs per second that you reserved, then your requests will be rate-limited until the rate drops below the amount you reserved. On the plus side, Microsoft provides an SLA on the throughput level you reserve.

Cosmos DB also provides an SLA on availability. It guarantees 99.99% availability for both single-region and multi-region databases. It also provides a 99.999% read availability SLA on multi-region databases.

It can provide such strong HA guarantees because of its highly redundant architecture. Not only is the database replicated across regions, but it’s also replicated within each region.

In the unlikely event of a regional failure, Azure will automatically failover your Cosmos DB databases to another region. You can make this process more efficient if you set a preferred regions list for each region. For example, if the West US region goes down, and your preferred regions list for that region has North Europe as the next region on the list, then that’s where Azure will failover to. When the region comes back online, Azure will automatically perform a recovery and bring the database back online in that region.

You can also test how your application will respond to an outage by performing a manual failover.

Cosmos DB automatically backs up your databases too. It takes snapshots every four hours and stores them in geo-redundant Blob storage. Only the last two snapshots are retained. If you delete a database or a container within that database, then the snapshot will be retained for 30 days. If this backup schedule isn’t sufficient for your needs, then you can schedule additional backups using the Cosmos DB Data Migration tool.

If you accidentally delete a database or a container, then you have to submit a ticket with Azure Support to restore it from the latest backup. If you have a data corruption issue, then you should delete the corrupted container as soon as possible. Otherwise your backups will be overwritten with corrupted data. Then you can submit a support ticket to get it restored.

Now I’m going to go over a few specific capabilities of the SQL API. Since it used to be the only supported API back when the service was called DocumentDB, it’s the most mature.

As I mentioned earlier, one of the great features of Cosmos DB is automatic indexing. However, there may be times when you’ll want to customize the indexing. For example, you could reduce your costs by eliminating some of the indexes, or you could make document updates faster by not indexing them immediately.

You can make these changes by setting an indexing policy on a collection. A collection is a group of documents. When you override the default indexing policy, you can do things like exclude specific documents or JSON properties. You can also configure the index update mode.

There are three options for that: Consistent, Lazy, and None. The update mode is usually set to Consistent, which means that the index gets updated when a document gets updated. If the update mode is set to Lazy, then the index gets updated when the collection’s throughput capacity isn’t being maxed out by user requests. In other words, the index is often out-of-date and has eventual consistency regardless of the consistency level for the document updates. The final update mode is None, which just means that the collection won’t have an index.

You can also make some of your queries more efficient by customizing the data type of an index. For example, suppose you’re storing time-stamped IoT data and you often need to run queries on things like the average temperature reading for the previous day. To do this, you need to do a range query, and to make the query efficient, you need to create a range index. This is easy to do by setting a custom indexing policy.

Another type of data that needs special indexing is geospatial data. The SQL API supports the GeoJSON specification. You can use GeoJSON Point to represent the longitude and latitude of a location, such as a building, or GeoJSON LineString to represent two or more points connected by line segments, such as a river, or GeoJSON Polygon to represent a closed area, such as a lake.

If you have geospatial data and you want to, for example, search for all of the houses within a 10-mile radius of a city’s center, then you’ll need to set a custom indexing policy for geospatial data.

And that’s it for Cosmos DB.