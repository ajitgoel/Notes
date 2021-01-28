## Topic 1 - Question Set 1

Question #1*Topic 1*

You are developing an application that uses Azure Blob storage.
The application must read the transaction logs of all the changes that occur to the blobs and the blob metadata in the storage account for auditing purposes. The changes must be in the order in which they occurred, include only create, update, delete, and copy operations and be retained for compliance reasons.
You need to process the transaction logs asynchronously.
What should you do?

- A. Process all Azure Blob storage events by using Azure Event Grid with a subscriber Azure Function app.
- B. Enable the change feed on the storage account and process all changes for available events.
- C. Process all Azure Storage Analytics logs for successful blob events.
- D. Use the Azure Monitor HTTP Data Collector API and scan the request body for successful blob events.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-204/view/#)

**Correct Answer:** *B*
Change feed support in Azure Blob Storage
The purpose of the change feed is to provide transaction logs of all the changes that occur to the blobs and the blob metadata in your storage account. The change feed provides ordered, guaranteed, durable, immutable, read-only log of these changes. Client applications can read these logs at any time, either in streaming or in batch mode. The change feed enables you to build efficient and scalable solutions that process change events that occur in your Blob Storage account at a low cost.
Reference:
https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-change-feed

Question #2*Topic 1*

DRAG DROP -
You are developing an application to use Azure Blob storage. You have configured Azure Blob storage to include change feeds.
A copy of your storage account must be created in another region. Data must be copied from the current storage account to the new storage account directly between the storage servers.
You need to create a copy of the storage account in another region and copy the data.
In which order should you perform the actions? To answer, move all actions from the list of actions to the answer area and arrange them in the correct order.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0001800001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/#) [  Discussion  **8**](https://www.examtopics.com/exams/microsoft/az-204/view/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0001900001.jpg)*
To move a storage account, create a copy of your storage account in another region. Then, move your data to that account by using AzCopy, or another tool of your choice.
The steps are:
✑ Export a template.
✑ Modify the template by adding the target region and storage account name.
✑ Deploy the template to create the new storage account.
✑ Configure the new storage account.
✑ Move data to the new storage account.
✑ Delete the resources in the source region.
Note: You must enable the change feed on your storage account to begin capturing and recording changes. You can enable and disable changes by using Azure
Resource Manager templates on Portal or Powershell.
Reference:
https://docs.microsoft.com/en-us/azure/storage/common/storage-account-move https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-change-feed

Question #3*Topic 1*

HOTSPOT -
You are developing an ASP.NET Core web application. You plan to deploy the application to Azure Web App for Containers.
The application needs to store runtime diagnostic data that must be persisted across application restarts. You have the following code:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0002000001.jpg)
You need to configure the application settings so that diagnostic data is stored as required.
How should you configure the web app's settings? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0002000002.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-204/view/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0002100001.jpg)*
Box 1: If WEBSITES_ENABLE_APP_SERVICE_STORAGE
If WEBSITES_ENABLE_APP_SERVICE_STORAGE setting is unspecified or set to true, the /home/ directory will be shared across scale instances, and files written will persist across restarts

Box 2: /home -
Reference:
https://docs.microsoft.com/en-us/azure/app-service/containers/app-service-linux-faq

Question #4*Topic 1*

You are developing a web app that is protected by Azure Web Application Firewall (WAF). All traffic to the web app is routed through an Azure Application
Gateway instance that is used by multiple web apps. The web app address is contoso.azurewebsites.net.
All traffic must be secured with SSL. The Azure Application Gateway instance is used by multiple web apps.
You need to configure the Azure Application Gateway for the web app.
Which two actions should you perform? Each correct answer presents part of the solution.
NOTE: Each correct selection is worth one point.

- A. In the Azure Application Gateway's HTTP setting, enable the Use for App service setting.
- B. Convert the web app to run in an Azure App service environment (ASE).
- C. Add an authentication certificate for contoso.azurewebsites.net to the Azure Application Gateway.
- D. In the Azure Application Gateway's HTTP setting, set the value of the Override backend path option to contoso22.azurewebsites.net.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/#) [  Discussion  **8**](https://www.examtopics.com/exams/microsoft/az-204/view/#)

**Correct Answer:** *AD*
D: The ability to specify a host override is defined in the HTTP settings and can be applied to any back-end pool during rule creation.
The ability to derive the host name from the IP or FQDN of the back-end pool members. HTTP settings also provide an option to dynamically pick the host name from a back-end pool member's FQDN if configured with the option to derive host name from an individual back-end pool member.
A (not C): SSL termination and end to end SSL with multi-tenant services.
In case of end to end SSL, trusted Azure services such as Azure App service web apps do not require whitelisting the backends in the application gateway.
Therefore, there is no need to add any authentication certificates.
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0002300001.jpg)
Reference:
https://docs.microsoft.com/en-us/azure/application-gateway/application-gateway-web-app-overview

Question #5*Topic 1*

HOTSPOT -
You are implementing a software as a service (SaaS) ASP.NET Core web service that will run as an Azure Web App. The web service will use an on-premises
SQL Server database for storage. The web service also includes a WebJob that processes data updates. Four customers will use the web service.
✑ Each instance of the WebJob processes data for a single customer and must run as a singleton instance.
✑ Each deployment must be tested by using deployment slots prior to serving production data.
✑ Azure costs must be minimized.
✑ Azure resources must be located in an isolated network.
You need to configure the App Service plan for the Web App.
How should you configure the App Service plan? To answer, select the appropriate settings in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0002500001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/2/#) [  Discussion  **5**](https://www.examtopics.com/exams/microsoft/az-204/view/2/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0002600001.jpg)*
Number of VM instances: 4 -
You are not charged extra for deployment slots.

Pricing tier: Isolated -
The App Service Environment (ASE) is a powerful feature offering of the Azure App Service that gives network isolation and improved scale capabilities. It is essentially a deployment of the Azure App Service into a subnet of a customer's Azure Virtual Network (VNet).
Reference:
https://azure.microsoft.com/sv-se/blog/announcing-app-service-isolated-more-power-scale-and-ease-of-use/

Question #6*Topic 1*

DRAG DROP -
You are a developer for a software as a service (SaaS) company that uses an Azure Function to process orders. The Azure Function currently runs on an Azure
Function app that is triggered by an Azure Storage queue.
You are preparing to migrate the Azure Function to Kubernetes using Kubernetes-based Event Driven Autoscaling (KEDA).
You need to configure Kubernetes Custom Resource Definitions (CRD) for the Azure Function.
Which CRDs should you configure? To answer, drag the appropriate CRD types to the correct locations. Each CRD type may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0002700001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/2/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-204/view/2/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0002800001.jpg)*
Box 1: Deployment -
To deploy Azure Functions to Kubernetes use the func kubernetes deploy command has several attributes that directly control how our app scales, once it is deployed to Kubernetes.

Box 2: ScaledObject -
With --polling-interval, we can control the interval used by KEDA to check Azure Service Bus Queue for messages.
Example of ScaledObject with polling interval
apiVersion: keda.k8s.io/v1alpha1
kind: ScaledObject
metadata:
name: transformer-fn
namespace: tt
labels:
deploymentName: transformer-fn
spec:
scaleTargetRef:
deploymentName: transformer-fn
pollingInterval: 5
minReplicaCount: 0
maxReplicaCount: 100

Box 3: Secret -
Store connection strings in Kubernetes Secrets.
Example: to create the Secret in our demo Namespace:
\# create the k8s demo namespace
kubectl create namespace tt
\# grab connection string from Azure Service Bus
KEDA_SCALER_CONNECTION_STRING=$(az servicebus queue authorization-rule keys list \
-g $RG_NAME \
--namespace-name $SBN_NAME \
--queue-name inbound \
-n keda-scaler \
--query "primaryConnectionString" \
-o tsv)
\# create the kubernetes secret
kubectl create secret generic tt-keda-auth \
--from-literal KedaScaler=$KEDA_SCALER_CONNECTION_STRING \
--namespace tt
Reference:
https://www.thinktecture.com/en/kubernetes/serverless-workloads-with-keda/

Question #7*Topic 1*

HOTSPOT -
You are creating a CLI script that creates an Azure web app and related services in Azure App Service. The web app uses the following variables:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0002900001.png)
You need to automatically deploy code from GitHub to the newly created web app.
How should you complete the script? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0003000001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/2/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-204/view/2/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0003100001.jpg)*
Box 1: az appservice plan create
The azure group creates command successfully returns JSON result. Now we can use resource group to create a azure app service plan

Box 2: az webapp create -
Create a new web app..

Box 3: --plan $webappname -
..with the serviceplan we created in step 1.

Box 4: az webapp deployment -
Continuous Delivery with GitHub. Example:
az webapp deployment source config --name firstsamplewebsite1 --resource-group websites--repo-url $gitrepo --branch master --git-token $token
Box 5: --repo-url $gitrepo --branch master --manual-integration
Reference:
https://medium.com/@satish1v/devops-your-way-to-azure-web-apps-with-azure-cli-206ed4b3e9b1

Question #8*Topic 1*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop a software as a service (SaaS) offering to manage photographs. Users upload photos to a web service which then stores the photos in Azure
Storage Blob storage. The storage account type is General-purpose V2.
When photos are uploaded, they must be processed to produce and save a mobile-friendly version of the image. The process to produce a mobile-friendly version of the image must start in less than one minute.
You need to design the process that starts the photo processing.
Solution: Trigger the photo processing from Blob storage events.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/2/#) [  Discussion  **19**](https://www.examtopics.com/exams/microsoft/az-204/view/2/#)

**Correct Answer:** *B*
You need to catch the triggered event, so move the photo processing to an Azure Function triggered from the blob upload
Note: Azure Storage events allow applications to react to events. Common Blob storage event scenarios include image or video processing, search indexing, or any file-oriented workflow.
Events are pushed using Azure Event Grid to subscribers such as Azure Functions, Azure Logic Apps, or even to your own http listener.
Note: Only storage accounts of kind StorageV2 (general purpose v2) and BlobStorage support event integration. Storage (general purpose v1) does not support integration with Event Grid.
Reference:
https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-event-overview

Question #9*Topic 1*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop and deploy an Azure App Service API app to a Windows-hosted deployment slot named Development. You create additional deployment slots named Testing and Production. You enable auto swap on the Production deployment slot.
You need to ensure that scripts run and resources are available before a swap operation occurs.
Solution: Update the web.config file to include the applicationInitialization configuration element. Specify custom initialization actions to run the scripts.
Does the solution meet the goal?

- A. No
- B. Yes

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/3/#) [  Discussion  **10**](https://www.examtopics.com/exams/microsoft/az-204/view/3/#)

**Correct Answer:** *A*
Specify custom warm-up.
Some apps might require custom warm-up actions before the swap. The applicationInitialization configuration element in web.config lets you specify custom initialization actions. The swap operation waits for this custom warm-up to finish before swapping with the target slot. Here's a sample web.config fragment.
<system.webServer>
<applicationInitialization>
<add initializationPage="/" hostName="[app hostname]" />
<add initializationPage="/Home/About" hostName="[app hostname]" />
</applicationInitialization>
</system.webServer>
Reference:
https://docs.microsoft.com/en-us/azure/app-service/deploy-staging-slots#troubleshoot-swaps

Question #10*Topic 1*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop and deploy an Azure App Service API app to a Windows-hosted deployment slot named Development. You create additional deployment slots named Testing and Production. You enable auto swap on the Production deployment slot.
You need to ensure that scripts run and resources are available before a swap operation occurs.
Solution: Enable auto swap for the Testing slot. Deploy the app to the Testing slot.
Does the solution meet the goal?

- A. No
- B. Yes

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/3/#) [  Discussion  **7**](https://www.examtopics.com/exams/microsoft/az-204/view/3/#)

**Correct Answer:** *B*
Instead update the web.config file to include the applicationInitialization configuration element. Specify custom initialization actions to run the scripts.
Note: Some apps might require custom warm-up actions before the swap. The applicationInitialization configuration element in web.config lets you specify custom initialization actions. The swap operation waits for this custom warm-up to finish before swapping with the target slot. Here's a sample web.config fragment.
<system.webServer>
<applicationInitialization>
<add initializationPage="/" hostName="[app hostname]" />
<add initializationPage="/Home/About" hostName="[app hostname]" />
</applicationInitialization>
</system.webServer>
Reference:
https://docs.microsoft.com/en-us/azure/app-service/deploy-staging-slots#troubleshoot-swaps

Question #11*Topic 1*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop and deploy an Azure App Service API app to a Windows-hosted deployment slot named Development. You create additional deployment slots named Testing and Production. You enable auto swap on the Production deployment slot.
You need to ensure that scripts run and resources are available before a swap operation occurs.
Solution: Disable auto swap. Update the app with a method named statuscheck to run the scripts. Re-enable auto swap and deploy the app to the Production slot.
Does the solution meet the goal?

- A. No
- B. Yes

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/3/#) [  Discussion  **7**](https://www.examtopics.com/exams/microsoft/az-204/view/3/#)

**Correct Answer:** *B*
Instead update the web.config file to include the applicationInitialization configuration element. Specify custom initialization actions to run the scripts.
Note: Some apps might require custom warm-up actions before the swap. The applicationInitialization configuration element in web.config lets you specify custom initialization actions. The swap operation waits for this custom warm-up to finish before swapping with the target slot. Here's a sample web.config fragment.
<system.webServer>
<applicationInitialization>
<add initializationPage="/" hostName="[app hostname]" />
<add initializationPage="/Home/About" hostName="[app hostname]" />
</applicationInitialization>
</system.webServer>
Reference:
https://docs.microsoft.com/en-us/azure/app-service/deploy-staging-slots#troubleshoot-swaps

Question #12*Topic 1*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop a software as a service (SaaS) offering to manage photographs. Users upload photos to a web service which then stores the photos in Azure
Storage Blob storage. The storage account type is General-purpose V2.
When photos are uploaded, they must be processed to produce and save a mobile-friendly version of the image. The process to produce a mobile-friendly version of the image must start in less than one minute.
You need to design the process that starts the photo processing.
Solution: Convert the Azure Storage account to a BlockBlobStorage storage account.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/3/#) [  Discussion  **5**](https://www.examtopics.com/exams/microsoft/az-204/view/3/#)

**Correct Answer:** *B*
Not necessary to convert the account, instead move photo processing to an Azure Function triggered from the blob upload..
Azure Storage events allow applications to react to events. Common Blob storage event scenarios include image or video processing, search indexing, or any file- oriented workflow.
Note: Only storage accounts of kind StorageV2 (general purpose v2) and BlobStorage support event integration. Storage (general purpose v1) does not support integration with Event Grid.
Reference:
https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-event-overview



