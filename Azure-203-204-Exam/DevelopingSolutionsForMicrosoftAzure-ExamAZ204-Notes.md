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
**Archive** You use this tier for storing data that is rarely accessed and is stored for at least 180 days. 

**<u>Azure Storage redundancy:</u>**

## Redundancy in the primary region

Data in an Azure Storage account is always replicated three times in the primary region. Azure Storage offers two options for how your data is replicated in the primary region:

==**Locally redundant storage (LRS)** copies your data synchronously three times within a single physical location in the primary region.== LRS is the least expensive replication option, but is not recommended for applications requiring high availability.

==**Zone-redundant storage (ZRS)** copies your data synchronously across three Azure availability zones in the primary region.== For applications requiring high availability, Microsoft recommends using ZRS in the primary region, and also replicating to a secondary region.



**<u>Chapter 3. Implement Azure security</u>**

Authentication is the act of proving that a user is who he or she claims to be.

A user authenticates by providing some information that the user only knows.

There are several mechanisms of authentication that provide different levels of security.

Some of the authentication mechanisms are form-based, token-based, or certificate-based.

Using form-based authentication requires your application to store your users’ passwords.

Form-based authentication requires HTTPS to make the authentication process more secure.

Using token-based authentication, you can delegate the authorization to third-party authentication providers.

You can add social logins to your application by using token-based authentication.

Multifactor authentication is an authentication mechanism that requires the users to provide more than one piece of information that only the user knows.

You can easily implement multifactor authentication by using Azure Active Directory.

There are four main actors in OAuth authentication: client, resource server, resource owner, and authentication server.

The resource owner needs to authenticate the client before sending the authorization grant.

The access token grants access to the resource hosted on the resource server.

The authorization grant or authorization code grants the client the needed rights to request an access token to the authorization server.

The client uses the refresh token to get a new access token when it expires without needing to request a new authorization code.

The JSON web token is the most extended implementation of OAuth tokens.

Shared Access Signatures (SAS) is an authentication mechanism for granting access to Azure Storage Accounts without sharing account keys.

Shared Access Signatures (SAS) tokens must be signed.

There are three types of SAS token: user delegation, account, and service SAS.

User delegation SAS tokens are signed using a key assigned to an Azure Active Directory user.

Account and Service SAS are signed using the Azure Storage account key.

You can hide the details of the SAS tokens from the URL by using Stored Access Policies.

Shared access signature tokens provide fine-grained access control to your Azure storage accounts.

You can create an SAS token for service, container, and item levels.

You need to register applications in Azure Active Directory for being able to authenticate users using your tenant.

There are three account types supported for authentication: accounts only in the organizational directory, accounts in any organizational directory, and Microsoft accounts.

You need to provide a return URL for authenticating your application when requesting user authentication.

You need to configure a secret or a certificate when your application needs to access information in other APIs.

Role-Based Access Control (RBAC) authorization provides fine-grained access control to the resources.

A security principal is an entity to which you can grant privileges.

Security principals are users, groups, service principals, and managed identities.

A permission is an action that a security principal can make with a resource.

A role definition, or role, is a group of permissions.

A scope is a level where you can assign a role.

A role association is a relationship between a security principal, a role, and a scope.

There are four scopes: management groups, subscription, resource group, and resources.

You can centralize the configuration of your distributed application using Azure App Configuration.

Azure App Configuration stores the information using key-value pairs.

Values in the Azure App Configuration are encrypted.

Azure Key Vault provides better security than the Azure App Configuration service.

The limit of size for an Azure App Configuration is 10,000, including the key, label, and value.

You can create references from Azure App Configuration items to Azure Key Vault items.

Azure Key Vault allows you to store three types of objects: keys, secrets, and certificates.

You should use managed identities authentication for accessing the Azure Key Vault.

You need to define a certificate policy before creating a certificate in the Azure Key Vault.

If you import a certificate into the Azure Key Vault, a default certificate policy is automatically created for you.

**<u>Chapter 4. Monitor, troubleshoot, and optimize Azure solutions</u>**

Your application needs to be able to manage transient faults. You need to determine the type of fault before retrying the operation. You should not use immediate retry more than once. You should use random starting values for the retry periods. You should use the built-in SDK mechanism when available. You should test your retry count and interval strategy. You should log transient and nontransient faults.

You can improve the performance of your application by adding a cache to your application. ==**Azure Cache for Redis** allows the caching of dynamic content.== Using Azure Cache for Redis, you can create in-memory databases to cache the most-used values.

==**Azure Cache for Redis** allows you to use messaging queue patterns.==
==**Content Delivery Networks (CDNs)** store and distribute static content in servers distributed across the globe== CDNs reduce the latency by serving the content from the server nearest to the user. You can invalidate the content of the cache by setting a low TTL (Time-To-Live). You can invalidate the content of the cache by removing all or part of the content from the cache.

Application Insights gets information from your application and sends it to Azure. You can use Application Insights with different platforms and languages. **Application Insights** is part of the **Azure Monitor** service. Application Insights generates two types of information: **metrics** and **logs**. Application Insights allows you to create web tests to monitor the availability of your application. You can configure alerts and trigger different actions associated with web tests.

**<u>Chapter 5. Connect to and consume Azure services and third-party services</u>**

Azure App Service Logic Apps allows you to interconnect different services without needing to create specific code for the interconnection.

Logic App Workflows define the steps needed to exchange information between applications.

Microsoft provides connectors for getting and sending information to and from different services.

Triggers are events fired on the source systems.

Actions are each of the steps performed in a workflow.

Azure Logic Apps provides a graphical editor that eases the process of creating workflows.

You can create your custom connectors for connecting your application with Azure Logic Apps.

A Custom Connector is a wrapper for a REST or SOAP API.

You can create custom connectors for Azure Logic Apps, Microsoft Flow, and Microsoft PowerApps.

You cannot reuse custom connectors created for Microsoft Flow or Microsoft PowerApps with Azure Logic Apps.

You can export your Logic Apps as Azure Resource Manager templates.

You can edit and modify the Logic Apps templates in Visual Studio.

The API Management service allows you to publish your back-end REST or SOAP APIs using a common and secure front end.

You need to create subscriptions in the APIM service for authenticating the access to the API.

You need to create a product for publishing a back-end API.

You can publish only some operations of your back-end APIs.

APIM Policies allow you to modify the behavior of the APIM gateway.

An event is a change in the state of an entity.

In an event-driven architecture, the publisher doesn’t have the expectation that the event is processed or stored by a subscriber.

Azure Event Grid is a service for implementing event-driven architectures.

An Event Grid Topic is an endpoint where a publisher service can send events.

Subscribers are services that read events from an Event Grid Topic.

You can configure several types of services as event sources or event subscribers in Azure Event Grid.

You can create custom events for sending them to the Event Grid.

You can subscribe to your custom application with an Event Grid Topic by using WebHooks.

The Azure Notification Hub is a service that unifies the push notifications on mobile platforms.

You can connect the push notification services from the different manufacturers to the Azure Notification Hub.

The Azure Event Hub is the entry point for Big Data event pipelines.

Azure Event Hub is specialized in ingesting millions of events per second with low latency.

You can use Azure Event Hub as an event source for the Event Grid service.

You can use AMQP, Kafka, and HTTPS for connecting to Azure Event Hub.

In a message-driven architecture, the publisher application has the expectation that the message is processed or stored by the subscriber.

The subscriber needs to change the state once the message is processed.

A message is raw data sent by a publisher that needs to be processed by a subscriber.

Azure Service Bus and Azure Queue message are message broker services.Azure App Service Logic Apps allows you to interconnect different services without needing to create specific code for the interconnection.

Logic App Workflows define the steps needed to exchange information between applications.

Microsoft provides connectors for getting and sending information to and from different services.

Triggers are events fired on the source systems.

Actions are each of the steps performed in a workflow.

Azure Logic Apps provides a graphical editor that eases the process of creating workflows.

You can create your custom connectors for connecting your application with Azure Logic Apps.

A Custom Connector is a wrapper for a REST or SOAP API.

You can create custom connectors for Azure Logic Apps, Microsoft Flow, and Microsoft PowerApps.

You cannot reuse custom connectors created for Microsoft Flow or Microsoft PowerApps with Azure Logic Apps.

You can export your Logic Apps as Azure Resource Manager templates.

You can edit and modify the Logic Apps templates in Visual Studio.

The API Management service allows you to publish your back-end REST or SOAP APIs using a common and secure front end.

You need to create subscriptions in the APIM service for authenticating the access to the API.

You need to create a product for publishing a back-end API.

You can publish only some operations of your back-end APIs.

APIM Policies allow you to modify the behavior of the APIM gateway.

An event is a change in the state of an entity.

In an event-driven architecture, the publisher doesn’t have the expectation that the event is processed or stored by a subscriber.

Azure Event Grid is a service for implementing event-driven architectures.

An Event Grid Topic is an endpoint where a publisher service can send events.

Subscribers are services that read events from an Event Grid Topic.

You can configure several types of services as event sources or event subscribers in Azure Event Grid.

You can create custom events for sending them to the Event Grid.

You can subscribe to your custom application with an Event Grid Topic by using WebHooks.

The Azure Notification Hub is a service that unifies the push notifications on mobile platforms.

You can connect the push notification services from the different manufacturers to the Azure Notification Hub.

The Azure Event Hub is the entry point for Big Data event pipelines.

Azure Event Hub is specialized in ingesting millions of events per second with low latency.

You can use Azure Event Hub as an event source for the Event Grid service.

You can use AMQP, Kafka, and HTTPS for connecting to Azure Event Hub.

In a message-driven architecture, the publisher application has the expectation that the message is processed or stored by the subscriber.

The subscriber needs to change the state once the message is processed.

A message is raw data sent by a publisher that needs to be processed by a subscriber.

Azure Service Bus and Azure Queue message are message broker services.