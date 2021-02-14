**<u>Chapter 1. Develop Azure Infrastructure as a service compute solution</u>**

Azure provides computing services for deploying your own virtualized infrastructure directly in the cloud. You can also deploy hybrid architectures to connect your on-premises infrastructure with your IaaS resources.
==**Azure Resource Manager** is the service in Azure that manages the different resources that you can deploy in the cloud. You can define the resources and their dependencies by using a JSON-based file called an ARM template.==
==A **container image** is a package of software in which you store your code and any library or dependencies for running your application in a highly portable environment.
When you create a new instance of a container image, each of these instances is named a “**container**.”
You can store your container images in a centralized store called a registry.
**Azure Container Registry** is a managed registry, which is based on the open-source specification of Docker Registry 2.0.==
You can run your containers in several Azure services, such as Azure Managed Kubernetes Service, Azure Container Instance, Azure Batch, Azure App Service, or Azure Container Service.
Azure provides you with needed services for deploying serverless solutions, allowing you to center on the code and forget about the infrastructure.
Azure App Services is the base of the serverless offering. On top of App Services, you can deploy web apps, mobile back-end apps, REST APIs, or Azure Functions and Azure Durable Functions.
When you work with App Services, you are charged only by the time that your code is running.
App Services runs on top of App Services Plans.
==An **App Service Plan** provides the resources and virtual machines needed for running your App Services code.==
You can run more than one App Service on top of a single App Service Plan.
When troubleshooting your App Service application, you can use several types for diagnostics logging: webserver logging and diagnostics, detailed error, failed requests, application diagnostics, and deployment diagnostics.
Diagnostics logging is stored locally on the VM, where the instance of your application is running.
==**Horizontal scaling** or in-out scaling is the process of adding or removing instances of an application.
**Vertical scaling** or up-down scaling is the process of adding or removing resources to the same virtual machine that hosts your application.==
Scale In/Out doesn’t have an effect on the availability of the application.
Vertical scaling affects the availability of the application because the application needs to be deployed in a virtual machine with the new resources assignment.
You can add and remove resources to your applications by using autoscale rules.
You can apply autoscale only to some Azure Resource types.
Autoscale depends on Azure virtual machine scale sets.
Your application needs to be aware of the changes in the resources assignment.
Azure Functions is the evolution of WebJobs.
Azure Functions use triggers and bindings for creating instances of Azure functions and sending or receiving data to or from external services, like Queue storage or Event Hub.
There are three versions of Azure Functions. Version 1.0 only supports .NET Framework and Windows environments. Version 2.0 and later support .NET Core and Windows and Linux environments.
When you work with triggers and bindings, you need to install the appropriate NuGet package for function extension that contains that trigger or binding.
Azure Function runtime already includes extensions for Timers and HTTP triggers. You don’t need to install specific packages for using these trigger bindings.
Triggers that create function instances can be based on data operations, timers, or webhooks.
==**Azure Durable Functions**== is the evolution of Azure Functions that ==allow you to create workflows where the state of the instances is preserved in case of VM restart or function host process respawn.==
Orchestration functions define the activity and the order of execution of the functions that do the job.
Activity functions contain the code that makes the action that you need for a step in the workflow, like sending an email, saving a document, or inserting information in a database.
Client functions create the instance of the orchestration function using an orchestration client.
Azure Function Apps provides the resources needed for running Azure Functions and Durable Functions.

**<u>Chapter 2. Develop for Azure storage</u>**

Cosmos DB is a premium storage service that provides low-latency access to data distributed across the globe.
==The PartitionKey system property defines the partition where the entity is stored.==
Choosing the correct PartitionKey is critical for achieving the right performance level.
You can access Cosmos DB using different APIs: SQL, Table, Gremlin (Graph), MongoDB, and Cassandra.
You can create your custom indexes in Cosmos DB.
You can choose the property that is used as the partition key.
You should avoid selecting partition keys that create too many or too few logical partitions.
A logical partition has a limit of 20 GB of storage.
==**Consistency levels** define how the data is replicated between the different regions in a Cosmos DB account.==
==There are five consistency levels: strong, bounded staleness, session, consistent prefix, and eventual.==
==**Strong consistency** level provides a higher level of consistency but also has a higher latency.==
==**Eventual consistency** level provides lower latency and lower data consistency.==
You can move blob items between containers in the same Storage Account or containers in different Storage Accounts.
Azure Blob Storage service offers three different access tiers with different prices for storage and accessing data.
You can move less frequently accessed data to cool or archive access tiers to save money.
You can automatically manage the movement between access tiers by implementing lifecycle management policies.

<u>**Consistency levels**</u> 
==**Strong**== The read operations are guaranteed to return the most recently committed version of an element; that is, ==the user always reads the latest committed write.== This consistency level is the only one that offers a linearizability guarantee. This guarantee comes at a price. It has higher latency because of the time needed to write operation confirmations, and the availability can be affected during failures.

==**Bounded Staleness**== The reads are guaranteed to be consistent within a preconfigured lag. This lag can consist of a number of the most recent (K) versions or a time interval (T). This means that if ==you make write operations, the read of these operations happens in the same order but with a maximum delay of K versions of the written data or T seconds since you wrote the data in the database.== For reading operations that happen within a region that accepts writes, the consistency level is identical to the Strong consistency level. This level is also known as “time-delayed linearizability guarantee.”

==**Session** Scoped to a client session==, this consistency level offers the best balance between a strong consistency level and the performance provided by the eventual consistency level. It best fits applications in which ==write operations occur in the context of a user session.==

==**Consistent Prefix** This level guarantees that you always read data in the same order that you wrote the data, but there’s no guarantee that you can read all the data. This means that if you write “A, B, C” you can read “A”, “A, B” or “A, B, C” but never “A, C” or “B, A, C.”==

==**Eventual** There is no guarantee for the order in which you read the data.== In the absence of a write operation, the replicas eventually converge. This consistency level offers better performance at the cost of the complexity of the programming. ==Use this consistency level if the order of the data is not essential for your application.==

<u>**Move items in Blob Storage between Storage Accounts or containers:**</u>
**Azure Storage Explorer** Is a graphical tool that allows you to manage the different operations with the storage services like Azure Storage, Azure Data Lake Storage, Azure Cosmos DB, and virtual disks.
**AzCopy** Is a command-line tool for performing bulk copy operations between different sources and Azure Storage accounts.
**Python** Using the azure-storage-blob package, you can manage your Azure Storage Account using Python.
**SSIS** The SQL Server Integration Service Feature Pack for Azure allows you to transfer data between your on-premises data sources and your Azure Storage Account.

**<u>access tiers:</u>**
*Hot** You use this tier for data that you need to access more frequently. This is the default tier that you use when you create a new Storage Account.
**Cool** You can use this tier for data that is less frequently accessed and is stored for at least 30 days.
**Archive** You use this tier for storing data that is rarely accessed and is stored for at least 180 days. T