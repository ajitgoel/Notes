# AZ-204 Study Guide: Developing Solutions for Microsoft Azure

Besides preparing for [AZ-104](https://www.thomasmaurer.ch/2020/03/az-104-study-guide-azure-administrator/), I am also preparing for the new[ AZ-204 Developing Solutions for Microsoft Azure exam](https://docs.microsoft.com/en-us/learn/certifications/exams/az-204?WT.mc_id=thomasmaurer-blog-thmaure), which was announced to replace the [AZ-203 Azure Developer exam](https://www.thomasmaurer.ch/2019/07/passed-az-203-microsoft-certified-azure-developer/). There are many great resources out there to prepare for the exam, that’s why I want to share my **AZ-204 Microsoft Developing Solutions for Microsoft Azure Certification Exam Study Guide** with you. To learn and prepare for the exam, I usually use a couple of online resources, mainly Microsoft Docs and Microsoft Learn, which I am going to share with you. You can find more information about how I prepare for a Microsoft Certification exam on my blog post: [How to prepare and pass Microsoft Certification Exam](https://www.thomasmaurer.ch/2019/09/how-to-prepare-and-pass-a-microsoft-azure-exam/).

Also, check out other Microsoft Azure Certification Exam Study Guides:

- [Exam AZ-900: Microsoft Azure Fundamentals Exam Study Guide](https://www.thomasmaurer.ch/2020/03/az-900-study-guide-microsoft-azure-fundamentals-2020/)
- [Exam AZ-104: Microsoft Azure Administrator Exam Study Guide](https://www.thomasmaurer.ch/2020/03/az-104-study-guide-azure-administrator/)
- [Exam AZ-303: Microsoft Azure Architect Technologies Exam Study Guide](https://www.thomasmaurer.ch/2020/03/az-303-study-guide-azure-architect-technologies/)
- [Exam AZ-304: Microsoft Azure Architect Design Certification Exam Study Guide](https://www.thomasmaurer.ch/2020/04/az-304-study-guide-microsoft-azure-architect-design/)
- [Exam AZ-500: Microsoft Azure Security Technologies Exam Study Guide](https://www.thomasmaurer.ch/2020/05/az-500-study-guide-microsoft-azure-security-technologies-2020/)

## Here is my AZ-204 Developing Solutions for Microsoft Azure Certification Exam Study Guide

It is essential to get familiar with the exam objectives and skills measured first. That is why I recommend reading the description of the exam and the skills measured.

> **Exam AZ-204: Developing Solutions for Microsoft Azure**
>
> Candidates for this exam are cloud developers who participate in all phases of development from requirements definition and design, to development and deployment, and maintenance. They partner with cloud DBAs, cloud administrators, and clients to implement solutions.
>
> Candidates should be proficient in Azure SDKs, Azure PowerShell, Azure CLI, data storage options, data connections, APIs, app authentication and authorization, compute and container deployment, debugging, performance tuning, and monitoring.Candidates must have 1-2 years professional development experience and experience with Microsoft Azure. They must be able to program in an Azure Supported Language.

The high-level view of the skills measured in the exam:

- Develop Azure compute solutions (25-30%)
- Develop for Azure storage (10-15%)
- Implement Azure security (15-20%)
- Monitor, troubleshoot, and optimize Azure solutions (10-15%)
- Connect to and consume Azure services and third-party services (25-30%)

You can find more information on the [exam website](https://docs.microsoft.com/en-us/learn/certifications/exams/az-204?WT.mc_id=thomasmaurer-blog-thmaure).

## Free Online Microsoft Learn AZ-204 Exam Study Guide resources

Microsoft Learn provides you with free online training and learning paths for different Microsoft technologies. They not just offer reading material, but also control questions and free online labs. Here are some relevant Microsoft Learn modules and learning paths for the AZ-204 Developing Solutions for Microsoft Azure Certification Exam. [Microsoft Learn](https://www.thomasmaurer.ch/2018/10/microsoft-learn/) is an important part of my AZ-204 exam study guide.

- [Create serverless applications](https://docs.microsoft.com/learn/paths/create-serverless-applications?WT.mc_id=thomasmaurer-blog-thmaure) (9 modules)
- [Connect your services together](https://docs.microsoft.com/learn/paths/connect-your-services-together?WT.mc_id=thomasmaurer-blog-thmaure) (4 modules)
- [Store data in Azure](https://docs.microsoft.com/en-us/learn/paths/store-data-in-azure?WT.mc_id=thomasmaurer-blog-thmaure) (5 modules)
- [Deploy a website with Azure virtual machines](https://docs.microsoft.com/learn/paths/deploy-a-website-with-azure-virtual-machines?WT.mc_id=thomasmaurer-blog-thmaure) (4 modules)
- [Manage resources in Azure](https://docs.microsoft.com/learn/paths/manage-resources-in-azure?WT.mc_id=thomasmaurer-blog-thmaure) (6 modules)
- [Deploy a website to Azure with Azure App Service](https://docs.microsoft.com/learn/paths/deploy-a-website-with-azure-app-service?WT.mc_id=thomasmaurer-blog-thmaure) (6 modules)
- [Secure your cloud data](https://docs.microsoft.com/learn/paths/secure-your-cloud-data?WT.mc_id=thomasmaurer-blog-thmaure) (7 modules)

## Microsoft Docs AZ-204 study guide resources

One thing I always used to prepare for my Microsoft exams is Microsoft Docs. Here are the relevant Microsoft Docs which I used to prepare and study for the AZ-204 exam.



### Develop Azure compute solutions (25-30%)

**Implement IaaS solutions**

- provision VMs
  - [Quickstart: Create a Windows virtual machine in the Azure portal](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-portal?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Tutorial: Create and Manage Windows VMs with Azure PowerShell](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/tutorial-manage-vm?WT.mc_id=thomasmaurer-blog-thmaure)
- configure VMs for remote access
  - [How to connect and sign on to an Azure virtual machine running Windows](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/connect-logon?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Quick steps: Create and use an SSH public-private key pair for Linux VMs in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/mac-create-ssh-keys?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Secure your management ports with just-in-time access](https://docs.microsoft.com/en-us/azure/security-center/security-center-just-in-time?WT.mc_id=thomasmaurer-blog-thmaure)
  - [How to open ports to a virtual machine with the Azure portal](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/nsg-quickstart-portal?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Network security groups](https://docs.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview?WT.mc_id=thomasmaurer-blog-thmaure)
- create ARM templates
  - [Extend Azure Resource Manager template functionality](https://docs.microsoft.com/en-us/azure/architecture/building-blocks/extending-templates?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Azure Resource Manager templates overview](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/overview?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Tutorial: Create and deploy your first Azure Resource Manager template](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-create-first-template?WT.mc_id=thomasmaurer-blog-thmaure)
- create container images for solutions by using Docker
  - [Tutorial: Build and deploy container images in the cloud with Azure Container Registry Tasks](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-tutorial-quick-task?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Tutorial: Create container images on a Linux Service Fabric cluster](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-tutorial-create-container-images?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Tutorial: Create a container image for deployment to Azure Container Instances](https://docs.microsoft.com/en-us/azure/container-instances/container-instances-tutorial-prepare-app?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Build and store container images with Azure Container Registry](https://docs.microsoft.com/en-us/learn/modules/build-and-store-container-images/?WT.mc_id=thomasmaurer-blog-thmaure) (Microsoft Learn Module)
- publish an image to the Azure Container Registry
  - [Push your first image to a private Docker container registry using the Docker CLI](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-get-started-docker-cli?WT.mc_id=thomasmaurer-blog-thmaure)
- run containers by using Azure Container Instance
  - [Run Docker containers with Azure Container Instances](https://docs.microsoft.com/en-us/learn/modules/run-docker-with-azure-container-instances?WT.mc_id=thomasmaurer-blog-thmaure) (Microsoft Learn Module)
  - [What is Azure Container Instances?](https://docs.microsoft.com/en-us/azure/container-instances/container-instances-overview?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Quickstart: Deploy a container instance in Azure using the Azure CLI](https://docs.microsoft.com/en-us/azure/container-instances/container-instances-quickstart?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Quickstart: Deploy a container instance in Azure using the Azure portal](https://docs.microsoft.com/en-us/azure/container-instances/container-instances-quickstart-portal?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Quickstart: Deploy a container instance in Azure using Azure PowerShell](https://docs.microsoft.com/en-us/azure/container-instances/container-instances-quickstart-powershell?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Tutorial: Deploy a container application to Azure Container Instances](https://docs.microsoft.com/en-us/azure/container-instances/container-instances-tutorial-deploy-app?WT.mc_id=thomasmaurer-blog-thmaure)

**Create Azure App Service Web Apps**

- create an Azure App Service Web App
  - [Create an ASP.NET Core web app in Azure](https://docs.microsoft.com/en-us/azure/app-service/app-service-web-get-started-dotnet?WT.mc_id=thomasmaurer-blog-thmaure)
- enable diagnostics logging
  - [Enable diagnostics logging for apps in Azure App Service](https://docs.microsoft.com/en-us/azure/app-service/troubleshoot-diagnostic-logs?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Capture Web Application Logs with App Service Diagnostics Logging](https://docs.microsoft.com/en-us/learn/modules/capture-application-logs-app-service?WT.mc_id=thomasmaurer-blog-thmaure) (Microsoft Learn Module)
- deploy code to a web app
  - [Deploy your app to Azure App Service with a ZIP or WAR file](https://docs.microsoft.com/en-us/azure/app-service/deploy-zip?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Deploy an Azure Web App](https://docs.microsoft.com/en-us/azure/devops/pipelines/targets/webapp?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Provision and deploy microservices predictably in Azure](https://docs.microsoft.com/en-us/azure/app-service/deploy-complex-application-predictably?WT.mc_id=thomasmaurer-blog-thmaure)
- configure web app settings including SSL, API, and connection strings
  - [Custom configuration and application settings in Azure Web Sites](https://azure.microsoft.com/en-us/resources/videos/configuration-and-app-settings-of-azure-web-sites?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Configure an App Service app in the Azure portal](https://docs.microsoft.com/en-us/azure/app-service/configure-common?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Buy a custom domain name for Azure App Service](https://docs.microsoft.com/en-us/azure/app-service/manage-custom-dns-buy-domain?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Add a TLS/SSL certificate in Azure App Service](https://docs.microsoft.com/en-us/azure/app-service/configure-ssl-certificate?WT.mc_id=thomasmaurer-blog-thmaure)
- implement autoscaling rules, including scheduled autoscaling, and scaling by operational or system metrics
  - [Scale up an app in Azure App Service](https://docs.microsoft.com/en-us/azure/app-service/manage-scale-up?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Get started with Autoscale in Azure](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/autoscale-get-started?WT.mc_id=thomasmaurer-blog-thmaure)

**Implement Azure functions**

- implement input and output bindings for a function
  - [Azure Functions triggers and bindings concepts](https://docs.microsoft.com/en-us/azure/azure-functions/functions-triggers-bindings?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Azure Functions trigger and binding example](https://docs.microsoft.com/en-us/azure/azure-functions/functions-bindings-example?WT.mc_id=thomasmaurer-blog-thmaure)
- implement function triggers by using data operations, timers, and webhooks
  - [Azure Functions triggers and bindings concepts](https://docs.microsoft.com/en-us/azure/azure-functions/functions-triggers-bindings?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Azure Functions trigger and binding example](https://docs.microsoft.com/en-us/azure/azure-functions/functions-bindings-example?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Azure Functions HTTP triggers and bindings overview](https://docs.microsoft.com/en-us/azure/azure-functions/functions-bindings-http-webhook?WT.mc_id=thomasmaurer-blog-thmaure)
- implement Azure Durable Functions
  - [What are Durable Functions?](https://docs.microsoft.com/en-us/azure/azure-functions/durable/durable-functions-overview?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Create your first durable function in C#](https://docs.microsoft.com/en-us/azure/azure-functions/durable/durable-functions-create-first-csharp?WT.mc_id=thomasmaurer-blog-thmaure)

### Develop for Azure storage (10-15%)

**Develop solutions that use Cosmos DB storage**

- select the appropriate API for your solution
  - [Choose the appropriate API for Azure Cosmos DB storage](https://docs.microsoft.com/en-us/learn/modules/choose-api-for-cosmos-db?WT.mc_id=thomasmaurer-blog-thmaure) (Microsoft Learn module)
  - [Welcome to Azure Cosmos DB](https://docs.microsoft.com/en-us/azure/cosmos-db/introduction?WT.mc_id=thomasmaurer-blog-thmaure)
- implement partitioning schemes
  - [Partitioning in Azure Cosmos DB](https://docs.microsoft.com/en-us/azure/cosmos-db/partitioning-overview?WT.mc_id=thomasmaurer-blog-thmaure)
- interact with data using the appropriate SDK
  - [Tutorial: Develop an ASP.NET Core MVC web application with Azure Cosmos DB by using .NET SDK](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-dotnet-application?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Tutorial: Build a .NET console app to manage data in Azure Cosmos DB SQL API account](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-get-started?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Tutorial: Query Azure Cosmos DB by using the SQL API](https://docs.microsoft.com/en-us/azure/cosmos-db/tutorial-query-sql-api?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Tutorial: Set up Azure Cosmos DB global distribution using the SQL API](https://docs.microsoft.com/en-us/azure/cosmos-db/tutorial-global-distribution-sql-api?WT.mc_id=thomasmaurer-blog-thmaure)
- set the appropriate consistency level for operations
  - [Choose the right consistency level](https://docs.microsoft.com/en-us/azure/cosmos-db/consistency-levels-choosing?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Consistency levels and Azure Cosmos DB APIs](https://docs.microsoft.com/en-us/azure/cosmos-db/consistency-levels-across-apis?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Consistency, availability, and performance tradeoffs](https://docs.microsoft.com/en-us/azure/cosmos-db/consistency-levels-tradeoffs?WT.mc_id=thomasmaurer-blog-thmaure)
- create Cosmos DB containers
  - [Create an Azure Cosmos container](https://docs.microsoft.com/en-us/azure/cosmos-db/how-to-create-container?WT.mc_id=thomasmaurer-blog-thmaure)
- implement scaling (partitions, containers)
  - [Partitioning and horizontal scaling in Azure Cosmos DB](https://docs.microsoft.com/en-us/azure/cosmos-db/partition-data?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Work with databases, containers, and items in Azure Cosmos DB](https://docs.microsoft.com/en-us/azure/cosmos-db/databases-containers-items?WT.mc_id=thomasmaurer-blog-thmaure)
- implement server-side programming including stored procedures, triggers, and change feed notifications
  - [Stored Procedures](https://docs.microsoft.com/en-us/rest/api/cosmos-db/stored-procedures?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Triggers](https://docs.microsoft.com/en-us/rest/api/cosmos-db/triggers?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Change feed in Azure Cosmos DB](https://docs.microsoft.com/en-us/azure/cosmos-db/change-feed?WT.mc_id=thomasmaurer-blog-thmaure)

**Develop solutions that use blob storage**

- move items in Blob storage between storage accounts or containers
  - [Copy and move blobs from one container or storage account to another from the command line and in code](https://docs.microsoft.com/en-us/learn/modules/copy-blobs-from-command-line-and-code?WT.mc_id=thomasmaurer-blog-thmaure) (Microsoft Learn module)
  - [Transfer data with AzCopy and Blob storage](https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-blobs?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Using the Azure CLI with Azure Storage](https://docs.microsoft.com/en-us/azure/storage/common/storage-azure-cli?WT.mc_id=thomasmaurer-blog-thmaure)
- set and retrieve properties and metadata
  - [Manage container properties and metadata with .NET](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-container-properties-metadata?WT.mc_id=thomasmaurer-blog-thmaure)
- interact with data using the appropriate SDK
  - [Quickstart: Azure Blob storage client library v12 for .NET](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-dotnet?WT.mc_id=thomasmaurer-blog-thmaure)
- implement data archiving and retention
  - [Store business-critical blob data with immutable storage](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-immutable-storage?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Azure Blob storage: hot, cool, and archive access tiers](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-storage-tiers?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Rehydrate blob data from the archive tier](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-rehydration?WT.mc_id=thomasmaurer-blog-thmaure)
- implement hot, cool, and archive storage
  - [Azure Blob storage: hot, cool, and archive access tiers](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-storage-tiers?WT.mc_id=thomasmaurer-blog-thmaure)

### Implement Azure security (15-20%)

**Implement user authentication and authorization**

- implement OAuth2 authentication
  - [Protect an API by using OAuth 2.0 with Azure Active Directory and API Management](https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-protect-backend-with-aad?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Authentication basics](https://docs.microsoft.com/en-us/azure/active-directory/develop/authentication-scenarios?WT.mc_id=thomasmaurer-blog-thmaure)
- create and implement shared access signatures
  - [Grant limited access to Azure Storage resources using shared access signatures (SAS)](https://docs.microsoft.com/en-us/azure/storage/common/storage-sas-overview?WT.mc_id=thomasmaurer-blog-thmaure)
- register apps and use Azure Active Directory to authenticate users
  - [Develop line-of-business apps for Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/manage-apps/developer-guidance-for-integrating-applications?WT.mc_id=thomasmaurer-blog-thmaure)
- control access to resources by using role-based access controls (RBAC)
  - [What is Azure role-based access control (Azure RBAC)?](https://docs.microsoft.com/en-us/azure/role-based-access-control/overview?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Classic subscription administrator roles, Azure roles, and Azure AD roles](https://docs.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles?WT.mc_id=thomasmaurer-blog-thmaure)

**Implement secure cloud solutions**

- secure app configuration data by using the App Configuration and KeyVault API
  - [Securely save secret application settings for a web application](https://docs.microsoft.com/en-us/azure/key-vault/vs-secure-secret-appsettings?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Use Key Vault references for App Service and Azure Functions](https://docs.microsoft.com/en-us/azure/app-service/app-service-key-vault-references?WT.mc_id=thomasmaurer-blog-thmaure)
  - [What is Azure App Configuration?](https://docs.microsoft.com/en-us/azure/azure-app-configuration/overview?WT.mc_id=thomasmaurer-blog-thmaure)
- manage keys, secrets, and certificates by using the Key Vault
  - [About keys, secrets, and certificates](https://docs.microsoft.com/en-us/azure/key-vault/about-keys-secrets-and-certificates?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Configure and manage secrets in Azure Key Vault](https://docs.microsoft.com/en-us/learn/modules/configure-and-manage-azure-key-vault?WT.mc_id=thomasmaurer-blog-thmaure) (Microsoft Learn module)
- implement Managed Identities for Azure resources
  - [What are managed identities for Azure resources?](https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Tutorial: Use a user-assigned managed identity on a Windows VM to access Azure Resource Manager](https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/tutorial-windows-vm-ua-arm?WT.mc_id=thomasmaurer-blog-thmaure)

### Monitor, troubleshoot, and optimize Azure solutions (10-15%)

**Integrate caching and content delivery within solutions**

- develop code to implement CDN’s in solutions
  - [Azure CDN Documentation](https://docs.microsoft.com/en-us/azure/cdn?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Best practices for using content delivery networks (CDNs)](https://docs.microsoft.com/en-us/azure/architecture/best-practices/cdn?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Create an Azure CDN endpoint](https://docs.microsoft.com/en-us/azure/cdn/cdn-create-endpoint-how-to?WT.mc_id=thomasmaurer-blog-thmaure)
  - [What is Azure Front Door?](https://docs.microsoft.com/en-us/azure/frontdoor/front-door-overview?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Azure Cache for Redis](https://docs.microsoft.com/en-us/azure/azure-cache-for-redis/cache-overview?WT.mc_id=thomasmaurer-blog-thmaure)
- configure cache and expiration policies for FrontDoor, CDNs, or Redis caches
  - [Control Azure CDN caching behavior with caching rules](https://docs.microsoft.com/en-us/azure/cdn/cdn-caching-rules?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Caching with Azure Front Door](https://docs.microsoft.com/en-us/azure/frontdoor/front-door-caching?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Quickstart: Create an Azure Cache for Redis instance](https://docs.microsoft.com/en-us/azure/azure-cache-for-redis/quickstart-create-redis?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Best practices for Azure Cache for Redis](https://docs.microsoft.com/en-us/azure/azure-cache-for-redis/cache-best-practices?WT.mc_id=thomasmaurer-blog-thmaure)
- store and retrieve data in Azure Redis cache
  - [Quickstart: Use Azure Cache for Redis with a .NET Framework application](https://docs.microsoft.com/en-us/azure/azure-cache-for-redis/cache-dotnet-how-to-use-azure-redis-cache?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Caching](https://docs.microsoft.com/en-us/azure/architecture/best-practices/caching?WT.mc_id=thomasmaurer-blog-thmaure)

**Instrument solutions to support monitoring and logging**

- configure instrumentation in an app or service by using Application Insights
  - [Application Insights for ASP.NET Core applications](https://docs.microsoft.com/en-us/azure/azure-monitor/app/asp-net-core?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Quickstart: Start monitoring your website with Azure Monitor Application Insights](https://docs.microsoft.com/en-us/azure/azure-monitor/app/website-monitoring?WT.mc_id=thomasmaurer-blog-thmaure)
- analyze log data and troubleshoot solutions by using Azure Monitor
  - [Monitoring solutions in Azure Monitor](https://docs.microsoft.com/en-us/azure/azure-monitor/insights/solutions?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Logs in Azure Monitor](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/data-platform-logs?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Find and diagnose run-time exceptions with Azure Application Insights](https://docs.microsoft.com/en-us/azure/azure-monitor/learn/tutorial-runtime-exceptions?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Find and diagnose performance issues with Azure Application Insights](https://docs.microsoft.com/en-us/azure/azure-monitor/learn/tutorial-performance?WT.mc_id=thomasmaurer-blog-thmaure)
- implement Application Insights Web Test and Alerts
  - [Creating an Application Insights Web Test and Alert Programmatically](https://azure.microsoft.com/en-us/blog/creating-a-web-test-alert-programmatically-with-application-insights?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Monitor the availability of any website](https://docs.microsoft.com/en-us/azure/azure-monitor/app/monitor-web-app-availability?WT.mc_id=thomasmaurer-blog-thmaure)
- implement code that handles transient faults
  - [Transient fault handling](https://docs.microsoft.com/en-us/azure/architecture/best-practices/transient-faults?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Retry guidance for Azure services](https://docs.microsoft.com/en-us/azure/architecture/best-practices/retry-service-specific?WT.mc_id=thomasmaurer-blog-thmaure)

### Connect to and consume Azure services and third-party services (25-30%)

**Develop an App Service Logic App**

- create a Logic App
  - [Quickstart: Create your first workflow by using Azure Logic Apps – Azure portal](https://docs.microsoft.com/en-us/azure/logic-apps/quickstart-create-first-logic-app-workflow?WT.mc_id=thomasmaurer-blog-thmaure)
  - ==[Quickstart: Create automated tasks, processes, and workflows with Azure Logic Apps – Visual Studio](https://docs.microsoft.com/en-us/azure/logic-apps/quickstart-create-logic-apps-with-visual-studio?WT.mc_id=thomasmaurer-blog-thmaure)==
  - [Quickstart: Create and manage logic app workflow definitions by using Visual Studio Code](https://docs.microsoft.com/en-us/azure/logic-apps/quickstart-create-logic-apps-visual-studio-code?WT.mc_id=thomasmaurer-blog-thmaure)
- create a custom connector for Logic Apps
  - [Create a custom connector in Azure Logic Apps](https://docs.microsoft.com/en-us/connectors/custom-connectors/create-logic-apps-connector?WT.mc_id=thomasmaurer-blog-thmaure)
  - [B2B enterprise integration solutions with Azure Logic Apps and Enterprise Integration Pack](https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-enterprise-integration-overview?WT.mc_id=thomasmaurer-blog-thmaure)
- create a custom template for Logic Apps
  - [Create Azure Resource Manager templates to automate deployment for Azure Logic Apps](https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-create-azure-resource-manager-templates?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Create logic app workflows from prebuilt templates](https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-create-logic-apps-from-templates?WT.mc_id=thomasmaurer-blog-thmaure)

**Implement API management**

- create an APIM instance
  - [Create a new Azure API Management service instance](https://docs.microsoft.com/en-us/azure/api-management/get-started-create-service-instance?WT.mc_id=thomasmaurer-blog-thmaure)
- configure authentication for APIs
  - [How to secure APIs using client certificate authentication in API Management](https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-mutual-certificates-for-clients?WT.mc_id=thomasmaurer-blog-thmaure)
- define policies for APIs
  - [Policies in Azure API Management](https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-policies?WT.mc_id=thomasmaurer-blog-thmaure)
  - [API Management policies](https://docs.microsoft.com/en-us/azure/api-management/api-management-policies?WT.mc_id=thomasmaurer-blog-thmaure)

**Develop event-based solutions**

[Choose between Azure messaging services – Event Grid, Event Hubs, and Service Bus](https://docs.microsoft.com/en-us/azure/event-grid/compare-messaging-services?WT.mc_id=thomasmaurer-blog-thmaure)

- implement solutions that use Azure Event Grid
  - [What is Azure Event Grid?](https://docs.microsoft.com/en-us/azure/event-grid/overview?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Event-Driven Architecture in the Cloud with Azure Event Grid](https://docs.microsoft.com/en-us/archive/msdn-magazine/2018/february/azure-event-driven-architecture-in-the-cloud-with-azure-event-grid?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Quickstart: Route custom events to web endpoint with the Azure portal and Event Grid](https://docs.microsoft.com/en-us/azure/event-grid/custom-event-quickstart-portal?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Tutorial: Monitor virtual machine changes by using Azure Event Grid and Logic Apps](https://docs.microsoft.com/en-us/azure/event-grid/monitor-virtual-machine-changes-event-grid-logic-app?WT.mc_id=thomasmaurer-blog-thmaure)
- implement solutions that use Azure Notification Hubs
  - [What is Azure Notification Hubs?](https://docs.microsoft.com/en-us/azure/notification-hubs/notification-hubs-push-notification-overview?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Integration with App Service Mobile Apps](https://docs.microsoft.com/en-us/azure/notification-hubs/notification-hubs-app-service?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Create an Azure notification hub in the Azure portal](https://docs.microsoft.com/en-us/azure/notification-hubs/create-notification-hub-portal?WT.mc_id=thomasmaurer-blog-thmaure)
- implement solutions that use Azure Event Hub
  - [Features and terminology in Azure Event Hubs](https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-features?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Quickstart: Create an event hub using Azure portal](https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-create?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Tutorial: Stream data into Azure Databricks using Event Hubs](https://docs.microsoft.com/en-us/azure/azure-databricks/databricks-stream-from-eventhubs?WT.mc_id=thomasmaurer-blog-thmaure)

**Develop message-based solutions**

- implement solutions that use Azure Service Bus
  - [What is Azure Service Bus?](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-messaging-overview?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Quickstart: Use Azure portal to create a Service Bus queue](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-quickstart-portal?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Get started with Service Bus queues](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-dotnet-get-started-with-queues?WT.mc_id=thomasmaurer-blog-thmaure)
- implement solutions that use Azure Queue Storage queues
  - [What are Azure queues?](https://docs.microsoft.com/en-us/azure/storage/queues/storage-queues-introduction?WT.mc_id=thomasmaurer-blog-thmaure)
  - [Get started with Azure Queue storage using .NET](https://docs.microsoft.com/en-us/azure/storage/queues/storage-dotnet-how-to-use-queues?WT.mc_id=thomasmaurer-blog-thmaure)

## Additional Tips and Resources

I hope this AZ-204 Developing Solutions for Microsoft Azure Certification Exam Study Guide helps you pass the exam and get the Azure Developer certification. I also recommend that you open a free Azure account if you don’t have one yet. You can [create your free Azure account here](https://azure.microsoft.com/free?WT.mc_id=thomasmaurer-blog-thmaure). Also, check out my blog posts about Microsoft Azure Certification:

- [Why you should become Microsoft Azure certified](https://www.thomasmaurer.ch/2019/08/why-you-should-become-microsoft-azure-certified/)
- [How to pick the right Azure exam certification path](https://www.thomasmaurer.ch/2019/08/how-to-pick-the-right-azure-exam-certification-path/)
- [How to prepare and pass a Microsoft Azure exam](https://www.thomasmaurer.ch/2019/09/how-to-prepare-and-pass-a-microsoft-azure-exam/)
- [Learn Microsoft Azure in 2020](https://www.thomasmaurer.ch/2019/12/how-to-learn-microsoft-azure-in-2020/)
- [AZ-104 Microsoft Azure Administrator Exam Study Guide](https://www.thomasmaurer.ch/2020/03/az-104-study-guide-azure-administrator/)

I hope you enjoyed my AZ-204 Study Guide. Did I miss any link, or do you have any recommended AZ-204 Developing Solutions for Microsoft Azure Certification Exam Study resources? Let me know in the comments.