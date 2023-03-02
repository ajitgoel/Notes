Here's an overview of Apache Kafka and its terminology:

-   An Apache Kafka Cluster consists of three or more compute instances called Brokers
-   Apache Kafka uses **Zookeeper** to store and share configuration data internally in the cluster
-   Kafka stores data records in Topics
-   A Data Producer writes records to topics, and a Data Consumer reads records from topics
-   A broker can have one or more topics
-   Topics can be divided into Partitions, and partitions are replicated across brokers
-   Amazon Managed Streaming for Apache Kafka is often shortened to Amazon MSK
-   Amazon MSK fully supports the native Apache Kafka producer and consumer APIs
-   When using Amazon MSK, sometimes brokers are referred to as Nodes

Use-cases for Apache Kafka include:

-   Messaging: Apache Kafka can be compared with messaging systems such as ActiveMQ or RabbitMQ
-   Activity Tracking: The original use-case for Kafka was to track the activities of users on a website
-   Metrics: Kafka can be used to aggregate statistics from distributed services or applications
-   Log Aggregation: Being distributed itself, Kafka can handle the high throughput that often comes with processing logs
-   Stream Processing: Kafka can be used as the backbone of a pipeline where data is processed between being stored in topics
-   Event Sourcing: Kafka can be used to store application state, particularly useful when the data may need to be re-played
-   Commit Log: A record of transactions, distributed systems with large transaction volumes may benefit from using Kafka for this purpose