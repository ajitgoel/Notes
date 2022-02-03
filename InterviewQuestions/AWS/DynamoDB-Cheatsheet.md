## The Basics of DynamoDB

**DynamoDB** is a fully managed NoSQL key/value and document database.

DynamoDB is suited for workloads with any amount of data that **require predictable read and write performance** and automatic scaling from large to small and everywhere in between.

==DynamoDB scales up and down to support whatever **read and write capacity you specify** per second in provisioned capacity mode. Or you can set it to On-Demand mode and there is little to no capacity planning.==

- DynamoDB stores **3 copies of data** on SSD drives **across 3 AZs** in a region.
- DynamoDB's most common datatypes are **B** (Binary), **N** (Number), and **S** (String)
- Tables consist of **Items** (rows) and Items consist of **Attributes** (columns)

## Reads and Writes Consistency

DynamoDB can be set to support **Eventually Consistent Reads** (default) and **Strongly Consistent Reads** on a per-call basis.

==**Eventually consistent reads** data is returned immediately but data can be inconsistent.== Copies of data will be generally consistent in 1 second.

==**Strongly Consistent Reads** will always read from the leader partition since it always has an up-to-date copy.== Data will never be inconsistent but latency may be higher. Copies of data will be consistent with a guarantee of 1 second.

## Partitions

A **Partition** is when DynamoDB slices your table up into smaller chunks of data. This speeds up reads for very large tables.

DynamoDB automatically creates Partitions for:

- Every 10 GB of Data or
- When you exceed RCUs (3000) or WCUs (1000) limits for a single partition
- When DynamoDB sees a pattern of a hot partition, it will split that partition in an attempt to fix the issue.

DynamoDB will try to **evenly split** the RCUs and WCUs across Partitions

### Primary Key Design

Primary keys define **where and how** your data will be stored in partitions

The Key schema can be made up of two keys:

- Partition Key (PK) is also known as **HASH**
- The Sort Key (SK) is also known as **RANGE**

> When using the AWS DynamoDB API eg. CLI, SDK they refer to the PK and SK by their alternative names due to legacy reasons.

Primary key comes in two types:

- **Simple** Primary Key (Using only a Partition Key)
- **Composite** Primary Key (Using both a Partition and Sort Key)

Key Uniqueness is as follows:

- ==When creating a Simple Primary Key the PK **value may be unique**==
- ==When creating a Composite Primary Key **the combined PK and  SK must be unique**==

When using a Sort key, records on the partition are logically grouped together in Ascending order.

## Secondary Indexes

DynamoDB has two types of Indexes:

- **LSI** - Local Secondary index
- **GSI** -  Global Secondary Index

### LSI - Local Secondary index

-  ==A local secondary index lets you query over a single partition, as specified by the partition key value in the query.==
- ==Supports **strongly** or eventual consistency reads==
- ==Can only be created with initial table (cannot be modified or and cannot deleted unless also deleting the table)==
- Only Composite
- 10GB or less per partition
- ==Share capacity units with base table==
- ==Must share Partition Key (PK) with base table.==

### GSI -  Global Secondary Index

- ==A global secondary index lets **you query over the entire table**, across all partitions.==
- ==**Only eventual consistency** reads  (cannot provide strong consistency)==
- ==Can create, modify, or delete at anytime==
- Simple and Composite
- Can have whatever attributes as Primary Key (PK) or Secondary Key (SK)
- No size restriction per partition
- ==Has its own capacity settings (does not share with base table)==

## Scan

Your table(s) should be designed in such a way that your workload primary access patterns do not use Scans. Overall, scans should be needed sparingly, for example for an infrequent report.

- Scans through all items in a table and then returns one or more items through filters
- By default returns all attributes for every item (use **ProjectExpression** to limit)
- Scans are sequential, and you can speed up a scan through parallel scans using **Segments** and **Total Segments**
- Scans can be slow, especially with very large tables and can easily consume your provisioned throughput.
- Scans are one of the most expensive ways to access data in DynamoDB.

## Query

- Find items based on primary key values
- Table must have a composite key in order to be able to query
- By default queries are Eventually Consistent (use **ConsistentRead True** to change Strongly Consistent)
- By default returns all attributes for each item found by a query (use **ProjectExpression** to limit)
- By default is sorted ascending (use **ScanIndexForward** to False to reverse order to descending)

## Capacity Modes

DynamoDB has two capacity modes, **Provisioned** and **On-Demand**. You can switch between these modes **once every 24 hours**.

### Provisioned

**Provisioned Throughput Capacity** is the maximum amount of capacity your application is allowed **to read or write per second** from a table or index

- **Provisioned** is suited for predictable or steady state workloads
- **RCUs** is Read Capacity Unit
- **WCUs** is Write Capacity Unit

**You should enable Auto Scaling with Provisioned** capacity mode. In this mode, you set a floor and ceiling for the capacity you wish the table to support. DynamoDB will automatically add and remove capacity to between these values on your behalf and throttle calls that go above the ceiling for too long.

If you go beyond your provisioned capacity, you’ll get an Exception:  **ProvisionedThroughputExceededException** (throttling)

**Throttling** is when **requests are blocked** due to read or write frequency higher than set thresholds. E.g. exceeding set provisioned capacity, partitions splitting, table/index capacity mismatch.

### On-Demand


**On-Demand Capacity** is pay per request. So you pay only for what you use.

- On-Demand is suited for **new** or **unpredictable** workloads
- The throughput is only limited by the default upper limits for a table (40K RCUs and 40K WCUs)
- **Throttling can occur** if you exceed double your previous peak capacity (high water mark) within 30 minutes. For example, if you previously peaked to a maximum of 30,000 ops/sec, you could not peak immediately to 90,000 ops/sec, but you could to 60,000 ops/sec.
- Since there is no hard limit, **On-Demand could become very expensive** based on emerging scenarios

## Calculating Reads and Writes

### Calculating Reads (RCU)

**A read capacity unit** represents:

- one strongly consistent read per second,
- or two eventually consistent reads per second,
- for an item up to 4 KB in size.

How to calculate RCUs for **strong**

1. Round data up to nearest 4.
2. Divide data by 4
3. Times by number of reads

Here's an example:

- 50 reads at 40KB per item. (40/4) x 50 = 500 RCUs
- 10 reads at 6KB per item. (8/4) x 10 = 20 RCUs
- 33 reads at 17KB per item. (20/4) x 33 = 132 RCUs

How to calculate RCUs for **eventual**

1. Round data up to nearest 4.
2. Divide data by 4
3. Times by number of reads
4. Divide final number by 2
5. Round up to the nearest whole number

Here's an example:

- 50 reads at 40KB per item. (40/4) x 50 / 2 = 250 RCUs
- 11 reads at 9KB per item. (12/4) x 11 / 2 = 17 RCUs
- 14 reads at 24KB per item. (24/4) x 14 / 2 = 35 RCUs

### Calculating Writes (Writes)

**A write capacity unit** represents:

- one write per second,
- for an item up to 1 KB

How to calculate **Writes**

1. Round data up to nearest 1.
2. Times by number of writes

Here's an example:

- 50 writes at 40KB per item. 40 x 50 = 2000 WCUs
- 11 writes at 1KB per item. 1 x 11 = 11 WCUs
- 18 writes at 500 BYTES per item. 1 x 18 = 18 WCUs

## DynamoDB Accelerator 

DynamoDB Accelerator **(DAX)** is a **fully managed in-memory write through cache** for DynamoDB that runs in a cluster

- Reads are eventually consistent
- Incoming requests are evenly distributed across all of the nodes in the cluster.
- DAX can reduce read response times to **microseconds**

### DAX is ideal for:

- fastest response times possible
- apps that read a small number of items more frequently
- apps that are **read intensive**

### DAX is not ideal for:

- Apps that require strongly consistent reads
- Apps that do not require microsecond read response times
- Apps that are **write intensive**, or that do not perform much read activity
- If you don’t need DAX **consider using ElastiCache**

## DynamoDB Transactions

DynamoDB supports transactions via the **TransactWriteItems** and **TransactGetItems** API calls.

**Transactions** let you query multiple tables at once and are an all-or-nothing approach (all API calls must succeed).

## Global tables

DynamoDB Global tables provide a fully managed solution for deploying **multi-region, multi-master databases**.

## Streams

**DynamoDB Streams** allows you to set up a Lambda function triggered every time data is modified in a table to react to changes. **Streams do not consume RCUs.**

## DynamoDB API

DynamoDB API's most notable commands via CLI:  **aws dynamodb <command>**

**aws dynamodb \*get-item\*** returns a set of attributes for the item with the given primary key. If no matching item, then it does not return any data and there will be no Item element in the response.

**aws dynamodb \*put-item\*** Creates a new item, or replaces an old item with a new item. If an item that has the same primary key as the new item already exists in the specified table, the new item completely replaces the existing item.

**aws dynamodb \*update-item\*** Edits an existing item's attributes, or adds a new item to the table if it does not already exist.

**aws dynamodb \*batch-get-item\*** returns the attributes of one or more items from one or more tables. You identify requested items by primary key. A single operation can retrieve up to **16 MB of data**, which can contain as many as **100 items**.

**aws dynamodb \*batch-write-item\*** puts or deletes multiple items in one or more tables. Can write up to **16 MB of data**, which can comprise as many as **25 put or delete requests**. Individual items to be written can be **as large as 400 KB**.

**aws dynamodb \*create-table\*** adds a new table to your account. Table names must be unique within each Region.

**aws dynamodb \*update-table\*** Modifies the provisioned throughput settings, global secondary indexes, or DynamoDB Streams settings for a given table.

**aws dynamodb \*delete-table\*** operation deletes a table and all of its items.

**aws dynamodb \*transact-get-items\*** is a synchronous operation that atomically retrieves multiple items from one or more tables (but not from indexes) in a single account and Region. Call can contain up to **25 objects**. The aggregate size of the items in the transaction **cannot exceed 4 MB**.

**aws dynamodb \*transact-write-items\*** a synchronous write operation that groups up to **25 action requests**. These actions can target items in different tables, but not in different AWS accounts or Regions, and no two actions can target the same item.

**aws dynamodb \*query\*** finds items based on primary key values. You can query table or secondary index that has a composite primary key.

**aws dynamodb \*scan\*** returns one or more items and item attributes by accessing every item in a table or a secondary index.

## ? #rocketsToMars

I want to help you enter the web and cloud industry. That is why I am releasing my **free** **AWS Developer Associate Certification 2020** course on the freeCodeCamp YouTube channel with 10+ hours of additional content I have never released previously.

This free course will be released in a few days as I apply the final touches.

I believe in making tech education accessible to the world because in-turn the more we upskill, the sooner we can lift people out of poverty, the sooner we can engineer sustainable solutions to keep our planet green and healthy, and the sooner we can launch rockets to Mars.