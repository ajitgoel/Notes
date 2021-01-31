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

Question #13*Topic 1*

HOTSPOT -
You are developing an Azure Web App. You configure TLS mutual authentication for the web app.
You need to validate the client certificate in the web app. To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0003700001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/4/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-204/view/4/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0003800001.jpg)*
Accessing the client certificate from App Service.
If you are using ASP.NET and configure your app to use client certificate authentication, the certificate will be available through the HttpRequest.ClientCertificate property. For other application stacks, the client cert will be available in your app through a base64 encoded value in the "X-ARR-ClientCert" request header. Your application can create a certificate from this value and then use it for authentication and authorization purposes in your application.
Reference:
https://docs.microsoft.com/en-us/azure/app-service/app-service-web-configure-tls-mutual-auth

Question #14*Topic 1*

DRAG DROP -
You are developing a Docker/Go using Azure App Service Web App for Containers. You plan to run the container in an App Service on Linux. You identify a
Docker container image to use.
None of your current resource groups reside in a location that supports Linux. You must minimize the number of resource groups required.
You need to create the application and perform an initial deployment.
Which three Azure CLI commands should you use to develop the solution? To answer, move the appropriate commands from the list of commands to the answer area and arrange them in the correct order.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0003900001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/4/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/4/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0004000001.png)*
You can host native Linux applications in the cloud by using Azure Web Apps. To create a Web App for Containers, you must run Azure CLI commands that create a group, then a service plan, and finally the web app itself.

Step 1: az group create -
In the Cloud Shell, create a resource group with the az group create command.
Step 2: az appservice plan create
In the Cloud Shell, create an App Service plan in the resource group with the az appservice plan create command.

Step 3: az webapp create -
In the Cloud Shell, create a web app in the myAppServicePlan App Service plan with the az webapp create command. Don't forget to replace with a unique app name, and <docker-ID> with your Docker ID.
Reference:
https://docs.microsoft.com/mt-mt/azure/app-service/containers/quickstart-docker-go?view=sql-server-ver15

Question #15*Topic 1*

DRAG DROP -
Fourth Coffee has an ASP.NET Core web app that runs in Docker. The app is mapped to the www.fourthcoffee.com domain.
Fourth Coffee is migrating this application to Azure.
You need to provision an App Service Web App to host this docker image and map the custom domain to the App Service web app.
A resource group named FourthCoffeePublicWebResourceGroup has been created in the WestUS region that contains an App Service Plan named
AppServiceLinuxDockerPlan.
Which order should the CLI commands be used to develop the solution? To answer, move all of the Azure CLI commands from the list of commands to the answer area and arrange them in the correct order.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0004200001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/4/#) [  Discussion  **10**](https://www.examtopics.com/exams/microsoft/az-204/view/4/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0004300001.jpg)*
Step 1: #bin/bash -
The appName is used when the webapp-name is created in step 2.
Step 2: az webapp config hostname add
The webapp-name is used when the webapp is created in step 3.

Step 3: az webapp create -
Create a web app. In the Cloud Shell, create a web app in the myAppServicePlan App Service plan with the az webapp create command.
Step : az webapp confing container set
In Create a web app, you specified an image on Docker Hub in the az webapp create command. This is good enough for a public image. To use a private image, you need to configure your Docker account ID and password in your Azure web app.
In the Cloud Shell, follow the az webapp create command with az webapp config container set.
Reference:
https://docs.microsoft.com/en-us/azure/app-service/containers/tutorial-custom-docker-image

Question #16*Topic 1*

DRAG DROP -
You are developing a serverless Java application on Azure. You create a new Azure Key Vault to work with secrets from a new Azure Functions application.
The application must meet the following requirements:
✑ Reference the Azure Key Vault without requiring any changes to the Java code.
✑ Dynamically add and remove instances of the Azure Functions host based on the number of incoming application events.
✑ Ensure that instances are perpetually warm to avoid any cold starts.
✑ Connect to a VNet.
✑ Authentication to the Azure Key Vault instance must be removed if the Azure Function application is deleted.
You need to grant the Azure Functions application access to the Azure Key Vault.
Which three actions should you perform in sequence? To answer, move the appropriate actions from the list of actions to the answer area and arrange them in the correct order.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0004500001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/4/#) [  Discussion  **11**](https://www.examtopics.com/exams/microsoft/az-204/view/4/#)

**Correct Answer:** *<img src="C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure204-ExamQuestionsDump.assets\0004600001.png" alt="img" style="zoom: 67%;" />*
Step 1: Create the Azure Functions app with a Consumption plan type.
Use the Consumption plan for serverless.
Step 2: Create a system-assigned managed identity for the application.
Create a system-assigned managed identity for your application.
Key Vault references currently only support system-assigned managed identities. User-assigned identities cannot be used.
Step 3: Create an access policy in Key Vault for the application identity.
Create an access policy in Key Vault for the application identity you created earlier. Enable the "Get" secret permission on this policy. Do not configure the
"authorized application" or applicationId settings, as this is not compatible with a managed identity.
Reference:
https://docs.microsoft.com/en-us/azure/app-service/app-service-key-vault-references

Question #17*Topic 1*

You develop a website. You plan to host the website in Azure. You expect the website to experience high traffic volumes after it is published.
You must ensure that the website remains available and responsive while minimizing cost.
You need to deploy the website.
What should you do?

- A. Deploy the website to a virtual machine. Configure the virtual machine to automatically scale when the CPU load is high.
- B. Deploy the website to an App Service that uses the Shared service tier. Configure the App Service plan to automatically scale when the CPU load is high.
- C. Deploy the website to a virtual machine. Configure a Scale Set to increase the virtual machine instance count when the CPU load is high.
- D. Deploy the website to an App Service that uses the Standard service tier. Configure the App Service plan to automatically scale when the CPU load is high.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/5/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-204/view/5/#)

**Correct Answer:** *D*
Windows Azure Web Sites (WAWS) offers 3 modes: Standard, Free, and Shared.
Standard mode carries an enterprise-grade SLA (Service Level Agreement) of 99.9% monthly, even for sites with just one instance.
Standard mode runs on dedicated instances, making it different from the other ways to buy Windows Azure Web Sites.
Incorrect Answers:
B: Shared and Free modes do not offer the scaling flexibility of Standard, and they have some important limits.
Shared mode, just as the name states, also uses shared Compute resources, and also has a CPU limit. So, while neither Free nor Shared is likely to be the best choice for your production environment due to these limits.

Question #18*Topic 1*

HOTSPOT -
A company is developing a Java web app. The web app code is hosted in a GitHub repository located at https://github.com/Contoso/webapp.
The web app must be evaluated before it is moved to production. You must deploy the initial code release to a deployment slot named staging.
You need to create the web app and deploy the code.
How should you complete the commands? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0004800001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/5/#) [  Discussion  **5**](https://www.examtopics.com/exams/microsoft/az-204/view/5/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0004900001.png)*
Box 1: group -
\# Create a resource group.
az group create --location westeurope --name myResourceGroup

Box 2: appservice plan -
\# Create an App Service plan in STANDARD tier (minimum required by deployment slots). az appservice plan create --name $webappname --resource-group myResourceGroup --sku S1

Box 3: webapp -
\# Create a web app.
az webapp create --name $webappname --resource-group myResourceGroup \
--plan $webappname

Box 4: webapp deployment slot -
\#Create a deployment slot with the name "staging".
az webapp deployment slot create --name $webappname --resource-group myResourceGroup \
--slot staging

Box 5: webapp deployment source -
\# Deploy sample code to "staging" slot from GitHub.
az webapp deployment source config --name $webappname --resource-group myResourceGroup \
--slot staging --repo-url $gitrepo --branch master --manual-integration
Reference:
https://docs.microsoft.com/en-us/azure/app-service/scripts/cli-deploy-staging-environment

Question #19*Topic 1*

HOTSPOT -
You have a web service that is used to pay for food deliveries. The web service uses Azure Cosmos DB as the data store.
You plan to add a new feature that allows users to set a tip amount. The new feature requires that a property named tip on the document in Cosmos DB must be present and contain a numeric value.
There are many existing websites and mobile apps that use the web service that will not be updated to set the tip property for some time.
How should you complete the trigger?
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0005100001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/5/#) [  Discussion  **8**](https://www.examtopics.com/exams/microsoft/az-204/view/5/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0005200001.png)*

Question #20*Topic 1*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop an HTTP triggered Azure Function app to process Azure Storage blob data. The app is triggered using an output binding on the blob.
The app continues to time out after four minutes. The app must process the blob data.
You need to ensure the app does not time out and processes the blob data.
Solution: Use the Durable Function async pattern to process the blob data.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/5/#) [  Discussion  **6**](https://www.examtopics.com/exams/microsoft/az-204/view/5/#)

**Correct Answer:** *B*
Instead pass the HTTP trigger payload into an Azure Service Bus queue to be processed by a queue trigger function and return an immediate HTTP success response.
Note: Large, long-running functions can cause unexpected timeout issues. General best practices include:
Whenever possible, refactor large functions into smaller function sets that work together and return responses fast. For example, a webhook or HTTP trigger function might require an acknowledgment response within a certain time limit; it's common for webhooks to require an immediate response. You can pass the
HTTP trigger payload into a queue to be processed by a queue trigger function. This approach lets you defer the actual work and return an immediate response.
Reference:
https://docs.microsoft.com/en-us/azure/azure-functions/functions-best-practices

Question #21*Topic 1*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop an HTTP triggered Azure Function app to process Azure Storage blob data. The app is triggered using an output binding on the blob.
The app continues to time out after four minutes. The app must process the blob data.
You need to ensure the app does not time out and processes the blob data.
Solution: Pass the HTTP trigger payload into an Azure Service Bus queue to be processed by a queue trigger function and return an immediate HTTP success response.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/6/#) [  Discussion  **6**](https://www.examtopics.com/exams/microsoft/az-204/view/6/#)

**Correct Answer:** *A*
Large, long-running functions can cause unexpected timeout issues. General best practices include:
Whenever possible, refactor large functions into smaller function sets that work together and return responses fast. For example, a webhook or HTTP trigger function might require an acknowledgment response within a certain time limit; it's common for webhooks to require an immediate response. You can pass the
HTTP trigger payload into a queue to be processed by a queue trigger function. This approach lets you defer the actual work and return an immediate response.
Reference:
https://docs.microsoft.com/en-us/azure/azure-functions/functions-best-practices

Question #22*Topic 1*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop an HTTP triggered Azure Function app to process Azure Storage blob data. The app is triggered using an output binding on the blob.
The app continues to time out after four minutes. The app must process the blob data.
You need to ensure the app does not time out and processes the blob data.
Solution: Configure the app to use an App Service hosting plan and enable the Always On setting.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/6/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/6/#)

**Correct Answer:** *B*
Instead pass the HTTP trigger payload into an Azure Service Bus queue to be processed by a queue trigger function and return an immediate HTTP success response.
Note: Large, long-running functions can cause unexpected timeout issues. General best practices include:
Whenever possible, refactor large functions into smaller function sets that work together and return responses fast. For example, a webhook or HTTP trigger function might require an acknowledgment response within a certain time limit; it's common for webhooks to require an immediate response. You can pass the
HTTP trigger payload into a queue to be processed by a queue trigger function. This approach lets you defer the actual work and return an immediate response.
Reference:
https://docs.microsoft.com/en-us/azure/azure-functions/functions-best-practices

Question #23*Topic 1*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop a software as a service (SaaS) offering to manage photographs. Users upload photos to a web service which then stores the photos in Azure
Storage Blob storage. The storage account type is General-purpose V2.
When photos are uploaded, they must be processed to produce and save a mobile-friendly version of the image. The process to produce a mobile-friendly version of the image must start in less than one minute.
You need to design the process that starts the photo processing.
Solution: Move photo processing to an Azure Function triggered from the blob upload.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/6/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/6/#)

**Correct Answer:** *A*
Azure Storage events allow applications to react to events. Common Blob storage event scenarios include image or video processing, search indexing, or any file- oriented workflow.
Events are pushed using Azure Event Grid to subscribers such as Azure Functions, Azure Logic Apps, or even to your own http listener.
Note: Only storage accounts of kind StorageV2 (general purpose v2) and BlobStorage support event integration. Storage (general purpose v1) does not support integration with Event Grid.
Reference:
https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-event-overview
Develop for Azure storage

## Topic 2 - Question Set 2

==Question #1*Topic 2*==

You develop Azure solutions.
You must connect to a No-SQL globally-distributed database by using the .NET API.
You need to create an object to configure and execute requests in the database.
Which code segment should you use?

- A. new Container(EndpointUri, PrimaryKey);
- B. new Database(EndpointUri, PrimaryKey);
- ==C. new CosmosClient(EndpointUri, PrimaryKey);==

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/6/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-204/view/6/#)

**Correct Answer:** *C*
Example:
// Create a new instance of the Cosmos Client
this.cosmosClient = new CosmosClient(EndpointUri, PrimaryKey)
//ADD THIS PART TO YOUR CODE
await this.CreateDatabaseAsync();
Reference:
https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-get-started

==Question #2*Topic 2*==

DRAG DROP -
You are developing a new page for a website that uses Azure Cosmos DB for data storage. The feature uses documents that have the following format:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0007600001.png)
You must display data for the new page in a specific order. You create the following query for the page:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0007600002.png)
You need to configure a Cosmos DB policy to the support the query.
How should you configure the policy? To answer, drag the appropriate JSON segments to the correct locations. Each JSON segment may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
<img src="C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0007700001.png" alt="img" style="zoom: 67%;" />

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/7/#) [  Discussion  **7**](https://www.examtopics.com/exams/microsoft/az-204/view/7/#)

**Correct Answer:** *<img src="C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0007800001.png" alt="img" style="zoom:67%;" />*
Box 1: compositeIndexes -
You can order by multiple properties. A query that orders by multiple properties requires a composite index.

Box 2: descending -
Example: Composite index defined for (name ASC, age ASC):
It is optional to specify the order. If not specified, the order is ascending.
{
"automatic":true,
"indexingMode":"Consistent",
"includedPaths":[
{
"path":"/*"
}
],
"excludedPaths":[],
"compositeIndexes":[
[
{
"path":"/name",
},
{
"path":"/age",
}
]
]
}

Question #3*Topic 2*

HOTSPOT -
You are building a traffic monitoring system that monitors traffic along six highways. The system produces time series analysis-based reports for each highway.
Data from traffic sensors are stored in Azure Event Hub.
Traffic data is consumed by four departments. Each department has an Azure Web App that displays the time series-based reports and contains a WebJob that processes the incoming data from Event Hub. All Web Apps run on App Service Plans with three instances.
Data throughput must be maximized. Latency must be minimized.
You need to implement the Azure Event Hub.
Which settings should you use? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008000001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/7/#) [  Discussion  **10**](https://www.examtopics.com/exams/microsoft/az-204/view/7/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008100001.png)*
Box 1: 6 -
The number of partitions is specified at creation and must be between 2 and 32.
There are 6 highways.

Box 2: Highway -
Reference:
https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-features

Question #4*Topic 2*

DRAG DROP -
You are developing a microservices solution. You plan to deploy the solution to a multinode Azure Kubernetes Service (AKS) cluster.
You need to deploy a solution that includes the following features:
✑ reverse proxy capabilities
✑ configurable traffic routing
✑ TLS termination with a custom certificate
Which components should you use? To answer, drag the appropriate components to the correct requirements. Each component may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008200004.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/7/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-204/view/7/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008300001.jpg)*
Box 1: Helm -
To create the ingress controller, use Helm to install nginx-ingress.

Box 2: kubectl -
To find the cluster IP address of a Kubernetes pod, use the kubectl get pod command on your local machine, with the option -o wide .

Box 3: Ingress Controller -
An ingress controller is a piece of software that provides reverse proxy, configurable traffic routing, and TLS termination for Kubernetes services. Kubernetes ingress resources are used to configure the ingress rules and routes for individual Kubernetes services.
Incorrect Answers:
Virtual Kubelet: Virtual Kubelet is an open-source Kubernetes kubelet implementation that masquerades as a kubelet. This allows Kubernetes nodes to be backed by Virtual Kubelet providers such as serverless cloud container platforms.
CoreDNS: CoreDNS is a flexible, extensible DNS server that can serve as the Kubernetes cluster DNS. Like Kubernetes, the CoreDNS project is hosted by the
CNCF.
Reference:
https://docs.microsoft.com/bs-cyrl-ba/azure/aks/ingress-basic https://www.digitalocean.com/community/tutorials/how-to-inspect-kubernetes-networking

Question #5*Topic 2*

DRAG DROP -
You are implementing an order processing system. A point of sale application publishes orders to topics in an Azure Service Bus queue. The Label property for the topic includes the following data:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008400001.png)
The system has the following requirements for subscriptions:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008400002.png)
You need to implement filtering and maximize throughput while evaluating filters.
Which filter types should you implement? To answer, drag the appropriate filter types to the correct subscriptions. Each filter type may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008500001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/7/#) [  Discussion  **14**](https://www.examtopics.com/exams/microsoft/az-204/view/7/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008600001.png)*
FutureOrders: SQLFilter -
HighPriortyOrders: CorrelationFilter

CorrelationID only -

InternationalOrders: SQLFilter -
Country NOT USA requires an SQL Filter

HighQuantityOrders: SQLFilter -
Need to use relational operators so an SQL Filter is needed.

AllOrders: No Filter -
SQL Filter: SQL Filters - A SqlFilter holds a SQL-like conditional expression that is evaluated in the broker against the arriving messages' user-defined properties and system properties. All system properties must be prefixed with sys. in the conditional expression. The SQL-language subset for filter conditions tests for the existence of properties (EXISTS), as well as for null-values (IS NULL), logical NOT/AND/OR, relational operators, simple numeric arithmetic, and simple text pattern matching with LIKE.
Correlation Filters - A CorrelationFilter holds a set of conditions that are matched against one or more of an arriving message's user and system properties. A common use is to match against the CorrelationId property, but the application can also choose to match against ContentType, Label, MessageId, ReplyTo,
ReplyToSessionId, SessionId, To, and any user-defined properties. A match exists when an arriving message's value for a property is equal to the value specified in the correlation filter. For string expressions, the comparison is case-sensitive. When specifying multiple match properties, the filter combines them as a logical
AND condition, meaning for the filter to match, all conditions must match.
Boolean filters - The TrueFilter and FalseFilter either cause all arriving messages (true) or none of the arriving messages (false) to be selected for the subscription.
Reference:
https://docs.microsoft.com/en-us/azure/service-bus-messaging/topic-filters

Question #6*Topic 2*

DRAG DROP -
Your company has several websites that use a company logo image. You use Azure Content Delivery Network (CDN) to store the static image.
You need to determine the correct process of how the CDN and the Point of Presence (POP) server will distribute the image and list the items in the correct order.
In which order do the actions occur? To answer, move all actions from the list of actions to the answer area and arrange them in the correct order.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008800001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/8/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/8/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008800002.jpg)*
Step 1: A user requests the image..
A user requests a file (also called an asset) by using a URL with a special domain name, such as <endpoint name>.azureedge.net. This name can be an endpoint hostname or a custom domain. The DNS routes the request to the best performing POP location, which is usually the POP that is geographically closest to the user.
Step 2: If no edge servers in the POP have the..
If no edge servers in the POP have the file in their cache, the POP requests the file from the origin server. The origin server can be an Azure Web App, Azure
Cloud Service, Azure Storage account, or any publicly accessible web server.
Step 3: The origin server returns the..
The origin server returns the file to an edge server in the POP.
An edge server in the POP caches the file and returns the file to the original requestor (Alice). The file remains cached on the edge server in the POP until the time-to-live (TTL) specified by its HTTP headers expires. If the origin server didn't specify a TTL, the default TTL is seven days.
Step 4: Subsequent requests for..
Additional users can then request the same file by using the same URL that the original user used, and can also be directed to the same POP.
If the TTL for the file hasn't expired, the POP edge server returns the file directly from the cache. This process results in a faster, more responsive user experience.
Reference:
https://docs.microsoft.com/en-us/azure/cdn/cdn-overview

==Question #7*Topic 2*==

You are developing an Azure Cosmos DB solution by using the Azure Cosmos DB SQL API. The data includes millions of documents. Each document may contain hundreds of properties.
The properties of the documents do not contain distinct values for partitioning. Azure Cosmos DB must scale individual containers in the database to meet the performance needs of the application by spreading the workload evenly across all partitions over time.
You need to select a partition key.
Which two partition keys can you use? Each correct answer presents a complete solution.
NOTE: Each correct selection is worth one point.

- A. a single property value that does not appear frequently in the documents
- B. a value containing the collection name
- C. a single property value that appears frequently in the documents
- ==D. a concatenation of multiple property values with a random suffix appended==
- ==E. a hash suffix appended to a property value==

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/8/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/8/#)

**Correct Answer:** *DE*
You can form a partition key by concatenating multiple property values into a single artificial partitionKey property. These keys are referred to as synthetic keys.
Another possible strategy to distribute the workload more evenly is to append a random number at the end of the partition key value. When you distribute items in this way, you can perform parallel write operations across partitions.
Note: It's the best practice to have a partition key with many distinct values, such as hundreds or thousands. The goal is to distribute your data and workload evenly across the items associated with these partition key values. If such a property doesn't exist in your data, you can construct a synthetic partition key.
Reference:
https://docs.microsoft.com/en-us/azure/cosmos-db/synthetic-partition-keys

===Question #8*Topic 2*==

HOTSPOT -
A company develops a series of mobile games. All games use a single leaderboard service.
You have the following requirements:
✑ Code must be scalable and allow for growth.
✑ Each record must consist of a playerId, gameId, score, and time played.
✑ When users reach a new high score, the system will save the new score using the SaveScore function below.
✑ Each game is assigned an Id based on the series title.
You plan to store customer information in Azure Cosmos DB. The following data already exists in the database:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009100001.png)
You develop the following code to save scores in the data store. (Line numbers are included for reference only.)
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009100002.png)
You develop the following code to query the database. (Line numbers are included for reference only.)
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009100003.jpg)
For each of the following statements, select Yes if the statement is true. Otherwise, select No.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009200001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/8/#) [  Discussion  **8**](https://www.examtopics.com/exams/microsoft/az-204/view/8/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009200002.png)*
Box 1: Yes -
Create a table.
A CloudTableClient object lets you get reference objects for tables and entities. The following code creates a CloudTableClient object and uses it to create a new
CloudTable object, which represents a table
// Retrieve storage account from connection-string.
CloudStorageAccount storageAccount = CloudStorageAccount.parse(storageConnectionString);
// Create the table client.
CloudTableClient tableClient = storageAccount.createCloudTableClient();
// Create the table if it doesn't exist.
String tableName = "people";
CloudTable cloudTable = tableClient.getTableReference(tableName); cloudTable.createIfNotExists();

Box 2: No -
==New records are inserted with TableOperation.insert. Old records are not updated. To update old records TableOperation.insertOrReplace should be used instead.==

Box 3: No -

Box 4: Yes -
Reference:
https://docs.microsoft.com/en-us/azure/cosmos-db/table-storage-how-to-use-java

Question #9*Topic 2*

HOTSPOT -
You are developing a solution that uses the Azure Storage Client library for .NET. You have the following code: (Line numbers are included for reference only.)
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009400001.jpg)
For each of the following statements, select Yes if the statement is true. Otherwise, select No.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009400002.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/8/#) [  Discussion  **5**](https://www.examtopics.com/exams/microsoft/az-204/view/8/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009500001.png)*
Box 1: Yes -
AcquireLeaseAsync does not specify leaseTime.
leaseTime is a TimeSpan representing the span of time for which to acquire the lease, which will be rounded down to seconds. If null, an infinite lease will be acquired. If not null, this must be 15 to 60 seconds.

Box 2: No -
The GetBlockBlobReference method just gets a reference to a block blob in this container.

Box 3: Yes -
The BreakLeaseAsync method initiates an asynchronous operation that breaks the current lease on this container.
Reference:
https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.storage.blob.cloudblobcontainer.acquireleaseasync https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.storage.blob.cloudblobcontainer.getblockblobreference https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.storage.blob.cloudblobcontainer.breakleaseasync

Question #10*Topic 2*

You are building a website that uses Azure Blob storage for data storage. You configure Azure Blob storage lifecycle to move all blobs to the archive tier after 30 days.
Customers have requested a service-level agreement (SLA) for viewing data older than 30 days.
You need to document the minimum SLA for data recovery.
Which SLA should you use?

- A. at least two days
- B. between one and 15 hours
- C. at least one day
- D. between zero and 60 minutes

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/9/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-204/view/9/#)

**Correct Answer:** *B*
The archive access tier has the lowest storage cost. But it has higher data retrieval costs compared to the hot and cool tiers. Data in the archive tier can take several hours to retrieve depending on the priority of the rehydration. For small objects, a high priority rehydrate may retrieve the object from archive in under 1 hour.
Reference:
https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-storage-tiers?tabs=azure-portal

Question #11*Topic 2*

HOTSPOT -
You are developing a ticket reservation system for an airline.
The storage solution for the application must meet the following requirements:
✑ Ensure at least 99.99% availability and provide low latency.
✑ Accept reservations event when localized network outages or other unforeseen failures occur.
✑ Process reservations in the exact sequence as reservations are submitted to minimize overbooking or selling the same seat to multiple travelers.
✑ Allow simultaneous and out-of-order reservations with a maximum five-second tolerance window.
You provision a resource group named airlineResourceGroup in the Azure South-Central US region.
You need to provision a SQL API Cosmos DB account to support the app.
How should you complete the Azure CLI commands? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009800001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/9/#) [  Discussion  **6**](https://www.examtopics.com/exams/microsoft/az-204/view/9/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0010000001.jpg)*
Box 1: BoundedStaleness -
Bounded staleness: The reads are guaranteed to honor the consistent-prefix guarantee. The reads might lag behind writes by at most "K" versions (that is,
"updates") of an item or by "T" time interval. In other words, when you choose bounded staleness, the "staleness" can be configured in two ways:
The number of versions (K) of the item
The time interval (T) by which the reads might lag behind the writes
Incorrect Answers:

Strong -
Strong consistency offers a linearizability guarantee. Linearizability refers to serving requests concurrently. The reads are guaranteed to return the most recent committed version of an item. A client never sees an uncommitted or partial write. Users are always guaranteed to read the latest committed write.
Box 2: --enable-automatic-failover true\
For multi-region Cosmos accounts that are configured with a single-write region, enable automatic-failover by using Azure CLI or Azure portal. After you enable automatic failover, whenever there is a regional disaster, Cosmos DB will automatically failover your account.
Question: Accept reservations event when localized network outages or other unforeseen failures occur.
Box 3: --locations'southcentralus=0 eastus=1 westus=2
Need multi-region.
Reference:
https://docs.microsoft.com/en-us/azure/cosmos-db/consistency-levels https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/cosmos-db/manage-with-cli.md
Implement Azure security

## Topic 3 - Question Set 3

Question #1*Topic 3*

You have a new Azure subscription. You are developing an internal website for employees to view sensitive data. The website uses Azure Active Directory (Azure
AD) for authentication.
You need to implement multifactor authentication for the website.
Which two actions should you perform? Each correct answer presents part of the solution.
NOTE: Each correct selection is worth one point.

- A. Configure the website to use Azure AD B2C.
- B. In Azure AD, create a new conditional access policy.
- C. Upgrade to Azure AD Premium.
- D. In Azure AD, enable application proxy.
- E. In Azure AD conditional access, enable the baseline policy.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/9/#) [  Discussion  **7**](https://www.examtopics.com/exams/microsoft/az-204/view/9/#)

**Correct Answer:** *BC*
B: MFA Enabled by conditional access policy. It is the most flexible means to enable two-step verification for your users. Enabling using conditional access policy only works for Azure MFA in the cloud and is a premium feature of Azure AD.
C: Multi-Factor Authentication comes as part of the following offerings:
✑ Azure Active Directory Premium licenses - Full featured use of Azure Multi-Factor Authentication Service (Cloud) or Azure Multi-Factor Authentication Server
(On-premises).
✑ Multi-Factor Authentication for Office 365
✑ Azure Active Directory Global Administrators
Reference:
https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-getstarted

Question #2*Topic 3*

DRAG DROP -
You are developing an application. You have an Azure user account that has access to two subscriptions.
You need to retrieve a storage account key secret from Azure Key Vault.
In which order should you arrange the PowerShell commands to develop the solution? To answer, move all commands from the list of commands to the answer area and arrange them in the correct order.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0013300001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/9/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-204/view/9/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0013400001.png)*
Step 1: Get-AzSubscription -
If you have multiple subscriptions, you might have to specify the one that was used to create your key vault. Enter the following to see the subscriptions for your account:

Get-AzSubscription -
Step 2: Set-AzContext -SubscriptionId
To specify the subscription that's associated with the key vault you'll be logging, enter:
Set-AzContext -SubscriptionId <subscriptionID>

Step 3: Get-AzStorageAccountKey -
You must get that storage account key.
Step 4: $secretvalue = ConvertTo-SecureString <storageAccountKey> -AsPlainText -Force
Set-AzKeyVaultSecret -VaultName <vaultName> -Name <secretName> -SecretValue $secretvalue
After retrieving your secret (in this case, your storage account key), you must convert that key to a secure string, and then create a secret with that value in your key vault.

Step 5: Get-AzKeyVaultSecret -
Next, get the URI for the secret you created. You'll need this URI in a later step to call the key vault and retrieve your secret. Run the following PowerShell command and make note of the ID value, which is the secret's URI:
Get-AzKeyVaultSecret ""VaultName <vaultName>
Reference:
https://docs.microsoft.com/bs-latn-ba/Azure/key-vault/key-vault-key-rotation-log-monitoring

Question #3*Topic 3*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop Azure solutions.
You must grant a virtual machine (VM) access to specific resource groups in Azure Resource Manager.
You need to obtain an Azure Resource Manager access token.
Solution: Use an X.509 certificate to authenticate the VM with Azure Resource Manager.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/10/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-204/view/10/#)

**Correct Answer:** *B*
Instead run the Invoke-RestMethod cmdlet to make a request to the local managed identity for Azure resources endpoint.
Reference:
https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/tutorial-windows-vm-access-arm

Question #4*Topic 3*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop Azure solutions.
You must grant a virtual machine (VM) access to specific resource groups in Azure Resource Manager.
You need to obtain an Azure Resource Manager access token.
Solution: Use the Reader role-based access control (RBAC) role to authenticate the VM with Azure Resource Manager.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/10/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/10/#)

**Correct Answer:** *B*
Instead run the Invoke-RestMethod cmdlet to make a request to the local managed identity for Azure resources endpoint.
Reference:
https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/tutorial-windows-vm-access-arm

Question #5*Topic 3*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop Azure solutions.
You must grant a virtual machine (VM) access to specific resource groups in Azure Resource Manager.
You need to obtain an Azure Resource Manager access token.
Solution: Run the Invoke-RestMethod cmdlet to make a request to the local managed identity for Azure resources endpoint.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/10/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-204/view/10/#)

**Correct Answer:** *A*
Get an access token using the VM's system-assigned managed identity and use it to call Azure Resource Manager
You will need to use PowerShell in this portion.
\1. In the portal, navigate to Virtual Machines and go to your Windows virtual machine and in the Overview, click Connect.
\2. Enter in your Username and Password for which you added when you created the Windows VM.
\3. Now that you have created a Remote Desktop Connection with the virtual machine, open PowerShell in the remote session.
\4. Using the Invoke-WebRequest cmdlet, make a request to the local managed identity for Azure resources endpoint to get an access token for Azure Resource
Manager.
Example:
$response = Invoke-WebRequest -Uri 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https:// management.azure.com/' -Method GET -Headers @{Metadata="true"}
Reference:
https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/tutorial-windows-vm-access-arm

Question #6*Topic 3*

HOTSPOT -
You are building a website to access project data related to teams within your organization. The website does not allow anonymous access. Authentication is performed using an Azure Active Directory (Azure AD) app named internal.
The website has the following authentication requirements:
✑ Azure AD users must be able to login to the website.
✑ Personalization of the website must be based on membership in Active Directory groups.
You need to configure the application's manifest to meet the authentication requirements.
How should you configure the manifest? To answer, select the appropriate configuration in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0013800003.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/10/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/10/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0013900001.png)*
Box 1: groupMembershipClaims -
Scenario: Personalization of the website must be based on membership in Active Directory groups.
Group claims can also be configured in the Optional Claims section of the Application Manifest.
Enable group membership claims by changing the groupMembershipClaim
The valid values are:
"All"
"SecurityGroup"
"DistributionList"
"DirectoryRole"

Box 2: oauth2Permissions -
Scenario: Azure AD users must be able to login to the website. oauth2Permissions specifies the collection of OAuth 2.0 permission scopes that the web API (resource) app exposes to client apps. These permission scopes may be granted to client apps during consent.
Incorrect Answers:
oauth2AllowImplicitFlow. oauth2AllowImplicitFlow specifies whether this web app can request OAuth2.0 implicit flow access tokens. The default is false. This flag is used for browser-based apps, like Javascript single-page apps.
Reference:
https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-fed-group-claims

Question #7*Topic 3*

You develop an app that allows users to upload photos and videos to Azure storage. The app uses a storage REST API call to upload the media to a blob storage account named Account1. You have blob storage containers named Container1 and Container2.
Uploading of videos occurs on an irregular basis.
You need to copy specific blobs from Container1 to Container2 when a new video is uploaded.
What should you do?

- A. Copy blobs to Container2 by using the Put Blob operation of the Blob Service REST API
- B. Create an Event Grid topic that uses the Start-AzureStorageBlobCopy cmdlet
- C. Use AzCopy with the Snapshot switch to copy blobs to Container2
- D. Download the blob to a virtual machine and then upload the blob to Container2

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/11/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-204/view/11/#)

**Correct Answer:** *B*
The Start-AzureStorageBlobCopy cmdlet starts to copy a blob.

Example 1: Copy a named blob -
C:\PS>Start-AzureStorageBlobCopy -SrcBlob "ContosoPlanning2015" -DestContainer "ContosoArchives" -SrcContainer "ContosoUploads"
This command starts the copy operation of the blob named ContosoPlanning2015 from the container named ContosoUploads to the container named
ContosoArchives.
Reference:
https://docs.microsoft.com/en-us/powershell/module/azure.storage/start-azurestorageblobcopy?view=azurermps-6.13.0

Question #8*Topic 3*

You are developing an ASP.NET Core website that uses Azure FrontDoor. The website is used to build custom weather data sets for researchers. Data sets are downloaded by users as Comma Separated Value (CSV) files. The data is refreshed every 10 hours.
Specific files must be purged from the FrontDoor cache based upon Response Header values.
You need to purge individual assets from the Front Door cache.
Which type of cache purge should you use?

- A. single path
- B. wildcard
- C. root domain

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/11/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-204/view/11/#)

**Correct Answer:** *A*
These formats are supported in the lists of paths to purge:
✑ Single path purge: Purge individual assets by specifying the full path of the asset (without the protocol and domain), with the file extension, for example, /
[1]
✑ Wildcard purge: Asterisk (*) may be used as a wildcard. Purge all folders, subfolders, and files under an endpoint with /* in the path or purge all subfolders and files under a specific folder by specifying the folder followed by /*, for example, /pictures/*.
✑ Root domain purge: Purge the root of the endpoint with "/" in the path.
Reference:
https://docs.microsoft.com/en-us/azure/frontdoor/front-door-caching

Question #9*Topic 3*

Your company is developing an Azure API.
You need to implement authentication for the Azure API. You have the following requirements:
All API calls must be secure.
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0014100004.png)
✑ Callers to the API must not send credentials to the API.
Which authentication mechanism should you use?

- A. Basic
- B. Anonymous
- C. Managed identity
- D. Client certificate

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/11/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/11/#)

**Correct Answer:** *C*
Use the authentication-managed-identity policy to authenticate with a backend service using the managed identity of the API Management service. This policy essentially uses the managed identity to obtain an access token from Azure Active Directory for accessing the specified resource. After successfully obtaining the token, the policy will set the value of the token in the Authorization header using the Bearer scheme.
Reference:
https://docs.microsoft.com/bs-cyrl-ba/azure/api-management/api-management-authentication-policies

Question #10*Topic 3*

You are a developer for a SaaS company that offers many web services.
All web services for the company must meet the following requirements:
✑ Use API Management to access the services
✑ Use OpenID Connect for authentication
✑ Prevent anonymous usage
A recent security audit found that several web services can be called without any authentication.
Which API Management policy should you implement?

- A. jsonp
- B. authentication-certificate
- C. check-header
- D. validate-jwt

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/11/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-204/view/11/#)

**Correct Answer:** *D*
Add the validate-jwt policy to validate the OAuth token for every incoming request.
Incorrect Answers:
A: The jsonp policy adds JSON with padding (JSONP) support to an operation or an API to allow cross-domain calls from JavaScript browser-based clients.
JSONP is a method used in JavaScript programs to request data from a server in a different domain. JSONP bypasses the limitation enforced by most web browsers where access to web pages must be in the same domain.
JSONP - Adds JSON with padding (JSONP) support to an operation or an API to allow cross-domain calls from JavaScript browser-based clients.
Reference:
https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-protect-backend-with-aad

Question #11*Topic 3*

DRAG DROP -
Contoso, Ltd. provides an API to customers by using Azure API Management (APIM). The API authorizes users with a JWT token.
You must implement response caching for the APIM gateway. The caching mechanism must detect the user ID of the client that accesses data for a given location and cache the response for that user ID.
You need to add the following policies to the policies file:
✑ a set-variable policy to store the detected user identity
✑ a cache-lookup-value policy
✑ a cache-store-value policy
✑ a find-and-replace policy to update the response body with the user profile information
To which policy section should you add the policies? To answer, drag the appropriate sections to the correct policies. Each section may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0014400001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/12/#) [  Discussion  **10**](https://www.examtopics.com/exams/microsoft/az-204/view/12/#)

Correct Answer: Box 1: Inbound.A set-variable policy to store the detected user identity.Example:<policies><inbound><!-- How you determine user identity is application dependent --><set-variablename="enduserid"value="@(context.Request.Headers.GetValueOrDefault("Authorization","").Split(' ')[1].AsJwt()?.Subject)" />Box 2: Inbound -A cache-lookup-value policy -Example:<inbound><base /><cache-lookup vary-by-developer="true | false" vary-by-developer-groups="true | false" downstream-caching-type="none | private | public" must- revalidate="true | false"><vary-by-query-parameter>parameter name</vary-by-query-parameter> <!-- optional, can repeated several times --></cache-lookup></inbound>Box 3: Outbound -A cache-store-value policy.Example:<outbound><base /><cache-store duration="3600" /></outbound>Box 4: Outbound -A find-and-replace policy to update the response body with the user profile information.Example:<outbound><!-- Update response body with user profile--><find-and-replacefrom='"$userprofile$"'to="@((string)context.Variables["userprofile"])" /><base /></outbound>Reference:https://docs.microsoft.com/en-us/azure/api-management/api-management-caching-policies https://docs.microsoft.com/en-us/azure/api-management/api-management-sample-cache-by-key

Question #12*Topic 3*

DRAG DROP -
You develop a web application.
You need to register the application with an active Azure Active Directory (Azure AD) tenant.
Which three actions should you perform in sequence? To answer, move all actions from the list of actions to the answer area and arrange them in the correct order.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0014700001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/12/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-204/view/12/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0014800001.jpg)*
Register a new application using the Azure portal
\1. Sign in to the Azure portal using either a work or school account or a personal Microsoft account.
\2. If your account gives you access to more than one tenant, select your account in the upper right corner. Set your portal session to the Azure AD tenant that you want.
\3. Search for and select Azure Active Directory. Under Manage, select App registrations.
\4. Select New registration. (Step 1)
\5. In Register an application, enter a meaningful application name to display to users.
\6. Specify who can use the application. Select the Azure AD instance. (Step 2)
\7. Under Redirect URI (optional), select the type of app you're building: Web or Public client (mobile & desktop). Then enter the redirect URI, or reply URL, for your application. (Step 3)
\8. When finished, select Register.
Monitor, troubleshoot, and optimize Azure solutions

## Topic 4 - Question Set 4

Question #1*Topic 4*

HOTSPOT -
You are using Azure Front Door Service.
You are expecting inbound files to be compressed by using Brotli compression. You discover that inbound XML files are not compressed. The files are 9 megabytes (MB) in size.
You need to determine the root cause for the issue.
To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0016200001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/12/#) [  Discussion  **7**](https://www.examtopics.com/exams/microsoft/az-204/view/12/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0016300001.jpg)*
Box 1: No -
Front Door can dynamically compress content on the edge, resulting in a smaller and faster response to your clients. All files are eligible for compression.
However, a file must be of a MIME type that is eligible for compression list.

Box 2: No -
Sometimes you may wish to purge cached content from all edge nodes and force them all to retrieve new updated assets. This might be due to updates to your web application, or to quickly update assets that contain incorrect information.

Box 3: Yes -
These profiles support the following compression encodings: Gzip (GNU zip), Brotli
Reference:
https://docs.microsoft.com/en-us/azure/frontdoor/front-door-caching

Question #2*Topic 4*

HOTSPOT -
You are developing an Azure App Service hosted ASP.NET Core web app to deliver video-on-demand streaming media. You enable an Azure Content Delivery
Network (CDN) Standard for the web endpoint. Customer videos are downloaded from the web app by using the following example URL: http://www.contoso.com/ content.mp4?quality=1
All media content must expire from the cache after one hour. Customer videos with varying quality must be delivered to the closest regional point of presence
(POP) node.
You need to configure Azure CDN caching rules.
Which options should you use? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0016500001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/12/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-204/view/12/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0016600001.jpg)*
Box 1: Override -
Override: Ignore origin-provided cache duration; use the provided cache duration instead. This will not override cache-control: no-cache.
Set if missing: Honor origin-provided cache-directive headers, if they exist; otherwise, use the provided cache duration.
Incorrect:
Bypass cache: Do not cache and ignore origin-provided cache-directive headers.

Box 2: 1 hour -
All media content must expire from the cache after one hour.

Box 3: Cache every unique URL -
Cache every unique URL: In this mode, each request with a unique URL, including the query string, is treated as a unique asset with its own cache. For example, the response from the origin server for a request for example.ashx?q=test1 is cached at the POP node and returned for subsequent caches with the same query string. A request for example.ashx?q=test2 is cached as a separate asset with its own time-to-live setting.
Incorrect Answers:
Bypass caching for query strings: In this mode, requests with query strings are not cached at the CDN POP node. The POP node retrieves the asset directly from the origin server and passes it to the requestor with each request.
Ignore query strings: Default mode. In this mode, the CDN point-of-presence (POP) node passes the query strings from the requestor to the origin server on the first request and caches the asset. All subsequent requests for the asset that are served from the POP ignore the query strings until the cached asset expires.
Reference:
https://docs.microsoft.com/en-us/azure/cdn/cdn-query-string

Question #3*Topic 4*

DRAG DROP -
You develop a web app that uses tier D1 app service plan by using the Web Apps feature of Microsoft Azure App Service.
Spikes in traffic have caused increases in page load times.
You need to ensure that the web app automatically scales when CPU load is about 85 percent and minimize costs.
Which four actions should you perform in sequence? To answer, move the appropriate actions from the list of actions to the answer area and arrange them in the correct order.
NOTE: More than one order of answer choices is correct. You will receive credit for any of the correct orders you select.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0016800001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/13/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/13/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0016900001.jpg)*
Step 1: Configure the web app to the Standard App Service Tier
The Standard tier supports auto-scaling, and we should minimize the cost.
Step 2: Enable autoscaling on the web app

First enable autoscale -

Step 3: Add a scale rule -

Step 4: Add a Scale condition -
Reference:
https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-autoscale-get-started

Question #4*Topic 4*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution. Determine whether the solution meets the stated goals.
You are developing and deploying several ASP.NET web applications to Azure App Service. You plan to save session state information and HTML output.
You must use a storage mechanism with the following requirements:
✑ Share session state across all ASP.NET web applications.
✑ Support controlled, concurrent access to the same session state data for multiple readers and a single writer.
✑ Save full HTTP responses for concurrent requests.
You need to store the information.
Proposed Solution: Enable Application Request Routing (ARR).
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/13/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-204/view/13/#)

**Correct Answer:** *B*
Instead deploy and configure Azure Cache for Redis. Update the web applications.
Reference:
https://docs.microsoft.com/en-us/azure/architecture/best-practices/caching#managing-concurrency-in-a-cache

Question #5*Topic 4*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution. Determine whether the solution meets the stated goals.
You are developing and deploying several ASP.NET web applications to Azure App Service. You plan to save session state information and HTML output.
You must use a storage mechanism with the following requirements:
✑ Share session state across all ASP.NET web applications.
✑ Support controlled, concurrent access to the same session state data for multiple readers and a single writer.
✑ Save full HTTP responses for concurrent requests.
You need to store the information.
Proposed Solution: Deploy and configure an Azure Database for PostgreSQL. Update the web applications.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/13/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-204/view/13/#)

**Correct Answer:** *B*
Instead deploy and configure Azure Cache for Redis. Update the web applications.
Reference:
https://docs.microsoft.com/en-us/azure/architecture/best-practices/caching#managing-concurrency-in-a-cache

Question #6*Topic 4*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution. Determine whether the solution meets the stated goals.
You are developing and deploying several ASP.NET web applications to Azure App Service. You plan to save session state information and HTML output.
You must use a storage mechanism with the following requirements:
Share session state across all ASP.NET web applications.
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0017100004.png)
✑ Support controlled, concurrent access to the same session state data for multiple readers and a single writer.
✑ Save full HTTP responses for concurrent requests.
You need to store the information.
Proposed Solution: Deploy and configure Azure Cache for Redis. Update the web applications.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/13/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-204/view/13/#)

**Correct Answer:** *A*
The session state provider for Azure Cache for Redis enables you to share session information between different instances of an ASP.NET web application.
The same connection can be used by multiple concurrent threads.
Redis supports both read and write operations.
The output cache provider for Azure Cache for Redis enables you to save the HTTP responses generated by an ASP.NET web application.
Note: Using the Azure portal, you can also configure the eviction policy of the cache, and control access to the cache by adding users to the roles provided. These roles, which define the operations that members can perform, include Owner, Contributor, and Reader. For example, members of the Owner role have complete control over the cache (including security) and its contents, members of the Contributor role can read and write information in the cache, and members of the
Reader role can only retrieve data from the cache.
Reference:
https://docs.microsoft.com/en-us/azure/architecture/best-practices/caching

Question #7*Topic 4*

HOTSPOT -
You are debugging an application that is running on Azure Kubernetes cluster named cluster1. The cluster uses Azure Monitor for containers to monitor the cluster.
The application has sticky sessions enabled on the ingress controller.
Some customers report a large number of errors in the application over the last 24 hours.
You need to determine on which virtual machines (VMs) the errors are occurring.
How should you complete the Azure Monitor query? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0017400001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/14/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-204/view/14/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0017600001.png)*
Box 1: ago(1d)

Box 2: distinct containerID -
Box 3: where ContainerID in (ContainerIDs)
Box 4: summarize Count by Computer
Summarize: aggregate groups of rows
Use summarize to identify groups of records, according to one or more columns, and apply aggregations to them. The most common use of summarize is count, which returns the number of results in each group.
Reference:
https://docs.microsoft.com/en-us/azure/azure-monitor/log-query/get-started-queries https://docs.microsoft.com/en-us/azure/azure-monitor/log-query/query-optimization

Question #8*Topic 4*

HOTSPOT -
You plan to deploy a web app to App Service on Linux. You create an App Service plan. You create and push a custom Docker image that contains the web app to Azure Container Registry.
You need to access the console logs generated from inside the container in real-time.
How should you complete the Azure CLI command? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0017800001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/14/#) [  Discussion  **11**](https://www.examtopics.com/exams/microsoft/az-204/view/14/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0017800002.png)*
Box 1: config -
To Configure logging for a web app use the command:
az webapp log config
Box 2: --docker-container-logging
Syntax include:
az webapp log config [--docker-container-logging {filesystem, off}]

Box 3: webapp -
To download a web app's log history as a zip file use the command: az webapp log download

Box 4: download -
Reference:
https://docs.microsoft.com/en-us/cli/azure/webapp/log

Question #9*Topic 4*

You develop and deploy an ASP.NET web app to Azure App Service. You use Application Insights telemetry to monitor the app.
You must test the app to ensure that the app is available and responsive from various points around the world and at regular intervals. If the app is not responding, you must send an alert to support staff.
You need to configure a test for the web app.
Which two test types can you use? Each correct answer presents a complete solution.
NOTE: Each correct selection is worth one point.

- A. integration
- B. multi-step web
- C. URL ping
- D. unit
- E. load

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/14/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-204/view/14/#)

**Correct Answer:** *BC*
There are three types of availability tests:
✑ URL ping test: a simple test that you can create in the Azure portal.
✑ Multi-step web test: A recording of a sequence of web requests, which can be played back to test more complex scenarios. Multi-step web tests are created in
Visual Studio Enterprise and uploaded to the portal for execution.
✑ Custom Track Availability Tests: If you decide to create a custom application to run availability tests, the TrackAvailability() method can be used to send the results to Application Insights.
Reference:
https://docs.microsoft.com/en-us/azure/azure-monitor/app/monitor-web-app-availability

Question #10*Topic 4*

DRAG DROP -
A web service provides customer summary information for e-commerce partners. The web service is implemented as an Azure Function app with an HTTP trigger.
Access to the API is provided by an Azure API Management instance. The API Management instance is configured in consumption plan mode. All API calls are authenticated by using OAuth.
API calls must be cached. Customers must not be able to view cached data for other customers.
You need to configure API Management policies for caching.
How should you complete the policy statement?
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0018100001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/14/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/14/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0018100002.jpg)*
Box 1: internal -
caching-type
Choose between the following values of the attribute:
✑ internal to use the built-in API Management cache,
✑ external to use the external cache as Azure Cache for Redis prefer-external to use external cache if configured or internal cache otherwise.
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0018100005.png)

Box 2: private -
downstream-caching-type
This attribute must be set to one of the following values.
✑ none - downstream caching is not allowed.
✑ private - downstream private caching is allowed.
✑ public - private and shared downstream caching is allowed.

Box 3: Authorization -
<vary-by-header>Authorization</vary-by-header>

<!-- should be present when allow-private-response-caching is "true"-->

Note: Start caching responses per value of specified header, such as Accept, Accept-Charset, Accept-Encoding, Accept-Language, Authorization, Expect, From,

Host, If-Match -
Reference:
https://docs.microsoft.com/en-us/azure/api-management/api-management-caching-policies

Question #11*Topic 4*

You are developing an ASP.NET Core Web API web service. The web service uses Azure Application Insights for all telemetry and dependency tracking. The web service reads and writes data to a database other than Microsoft SQL Server.
You need to ensure that dependency tracking works for calls to the third-party database.
Which two dependency telemetry properties should you use? Each correct answer presents part of the solution.
NOTE: Each correct selection is worth one point.

- A. Telemetry.Context.Cloud.RoleInstance
- B. Telemetry.Id
- C. Telemetry.Name
- D. Telemetry.Context.Operation.Id
- E. Telemetry.Context.Session.Id

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/15/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/15/#)

**Correct Answer:** *BD*
Example:
public async Task Enqueue(string payload)
{
// StartOperation is a helper method that initializes the telemetry item
// and allows correlation of this operation with its parent and children. var operation = telemetryClient.StartOperation<DependencyTelemetry>("enqueue " + queueName);

operation.Telemetry.Type = "Azure Service Bus";
operation.Telemetry.Data = "Enqueue " + queueName;
var message = new BrokeredMessage(payload);
// Service Bus queue allows the property bag to pass along with the message.
// We will use them to pass our correlation identifiers (and other context)
// to the consumer.
message.Properties.Add("ParentId", operation.Telemetry.Id);
message.Properties.Add("RootId", operation.Telemetry.Context.Operation.Id);
Reference:
https://docs.microsoft.com/en-us/azure/azure-monitor/app/custom-operations-tracking
Connect to and consume Azure services and third-party services

## Topic 5 - Question Set 5

Question #1*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure solution to collect point-of-sale (POS) device data from 2,000 stores located throughout the world. A single device can produce 2 megabytes (MB) of data every 24 hours. Each store location has one to five devices that send data.
You must store the device data in Azure Blob storage. Device data must be correlated based on a device identifier. Additional stores are expected to open in the future.
You need to implement a solution to receive the device data.
Solution: Provision an Azure Notification Hub. Register all devices with the hub.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/15/#) [  Discussion  **6**](https://www.examtopics.com/exams/microsoft/az-204/view/15/#)

**Correct Answer:** *B*
Instead use an Azure Service Bus, which is used order processing and financial transactions.
Reference:
https://docs.microsoft.com/en-us/azure/event-grid/compare-messaging-services

Question #2*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure solution to collect point-of-sale (POS) device data from 2,000 stores located throughout the world. A single device can produce 2 megabytes (MB) of data every 24 hours. Each store location has one to five devices that send data.
You must store the device data in Azure Blob storage. Device data must be correlated based on a device identifier. Additional stores are expected to open in the future.
You need to implement a solution to receive the device data.
Solution: Provision an Azure Service Bus. Configure a topic to receive the device data by using a correlation filter.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/15/#) [  Discussion  **10**](https://www.examtopics.com/exams/microsoft/az-204/view/15/#)

**Correct Answer:** *A*
A message is raw data produced by a service to be consumed or stored elsewhere. The Service Bus is for high-value enterprise messaging, and is used for order processing and financial transactions.
Reference:
https://docs.microsoft.com/en-us/azure/event-grid/compare-messaging-services

Question #3*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure solution to collect point-of-sale (POS) device data from 2,000 stores located throughout the world. A single device can produce 2 megabytes (MB) of data every 24 hours. Each store location has one to five devices that send data.
You must store the device data in Azure Blob storage. Device data must be correlated based on a device identifier. Additional stores are expected to open in the future.
You need to implement a solution to receive the device data.
Solution: Provision an Azure Event Grid. Configure event filtering to evaluate the device identifier.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/15/#) [  Discussion  **11**](https://www.examtopics.com/exams/microsoft/az-204/view/15/#)

**Correct Answer:** *B*
Instead use an Azure Service Bus, which is used order processing and financial transactions.
Note: An event is a lightweight notification of a condition or a state change. Event hubs is usually used reacting to status changes.
Reference:
https://docs.microsoft.com/en-us/azure/event-grid/compare-messaging-services

Question #11*Topic 4*

You are developing an ASP.NET Core Web API web service. The web service uses Azure Application Insights for all telemetry and dependency tracking. The web service reads and writes data to a database other than Microsoft SQL Server.
You need to ensure that dependency tracking works for calls to the third-party database.
Which two dependency telemetry properties should you use? Each correct answer presents part of the solution.
NOTE: Each correct selection is worth one point.

- A. Telemetry.Context.Cloud.RoleInstance
- B. Telemetry.Id
- C. Telemetry.Name
- D. Telemetry.Context.Operation.Id
- E. Telemetry.Context.Session.Id

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/15/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/15/#)

**Correct Answer:** *BD*
Example:
public async Task Enqueue(string payload)
{
// StartOperation is a helper method that initializes the telemetry item
// and allows correlation of this operation with its parent and children. var operation = telemetryClient.StartOperation<DependencyTelemetry>("enqueue " + queueName);

operation.Telemetry.Type = "Azure Service Bus";
operation.Telemetry.Data = "Enqueue " + queueName;
var message = new BrokeredMessage(payload);
// Service Bus queue allows the property bag to pass along with the message.
// We will use them to pass our correlation identifiers (and other context)
// to the consumer.
message.Properties.Add("ParentId", operation.Telemetry.Id);
message.Properties.Add("RootId", operation.Telemetry.Context.Operation.Id);
Reference:
https://docs.microsoft.com/en-us/azure/azure-monitor/app/custom-operations-tracking
Connect to and consume Azure services and third-party services

## Topic 5 - Question Set 5

Question #1*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure solution to collect point-of-sale (POS) device data from 2,000 stores located throughout the world. A single device can produce 2 megabytes (MB) of data every 24 hours. Each store location has one to five devices that send data.
You must store the device data in Azure Blob storage. Device data must be correlated based on a device identifier. Additional stores are expected to open in the future.
You need to implement a solution to receive the device data.
Solution: Provision an Azure Notification Hub. Register all devices with the hub.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/15/#) [  Discussion  **6**](https://www.examtopics.com/exams/microsoft/az-204/view/15/#)

**Correct Answer:** *B*
Instead use an Azure Service Bus, which is used order processing and financial transactions.
Reference:
https://docs.microsoft.com/en-us/azure/event-grid/compare-messaging-services

Question #2*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure solution to collect point-of-sale (POS) device data from 2,000 stores located throughout the world. A single device can produce 2 megabytes (MB) of data every 24 hours. Each store location has one to five devices that send data.
You must store the device data in Azure Blob storage. Device data must be correlated based on a device identifier. Additional stores are expected to open in the future.
You need to implement a solution to receive the device data.
Solution: Provision an Azure Service Bus. Configure a topic to receive the device data by using a correlation filter.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/15/#) [  Discussion  **10**](https://www.examtopics.com/exams/microsoft/az-204/view/15/#)

**Correct Answer:** *A*
A message is raw data produced by a service to be consumed or stored elsewhere. The Service Bus is for high-value enterprise messaging, and is used for order processing and financial transactions.
Reference:
https://docs.microsoft.com/en-us/azure/event-grid/compare-messaging-services

Question #3*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure solution to collect point-of-sale (POS) device data from 2,000 stores located throughout the world. A single device can produce 2 megabytes (MB) of data every 24 hours. Each store location has one to five devices that send data.
You must store the device data in Azure Blob storage. Device data must be correlated based on a device identifier. Additional stores are expected to open in the future.
You need to implement a solution to receive the device data.
Solution: Provision an Azure Event Grid. Configure event filtering to evaluate the device identifier.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/15/#) [  Discussion  **11**](https://www.examtopics.com/exams/microsoft/az-204/view/15/#)

**Correct Answer:** *B*
Instead use an Azure Service Bus, which is used order processing and financial transactions.
Note: An event is a lightweight notification of a condition or a state change. Event hubs is usually used reacting to status changes.
Reference:
https://docs.microsoft.com/en-us/azure/event-grid/compare-messaging-services

Question #4*Topic 5*

DRAG DROP -
You manage several existing Logic Apps.
You need to change definitions, add new logic, and optimize these apps on a regular basis.
What should you use? To answer, drag the appropriate tools to the correct functionalities. Each tool may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0019900001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/16/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-204/view/16/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0019900002.jpg)*
Box 1: Enterprise Integration Pack
For business-to-business (B2B) solutions and seamless communication between organizations, you can build automated scalable enterprise integration workflows by using the Enterprise Integration Pack (EIP) with Azure Logic Apps.

Box 2: Code View Editor -

Edit JSON - Azure portal -
\1. Sign in to the Azure portal.
\2. From the left menu, choose All services. In the search box, find "logic apps", and then from the results, select your logic app.
\3. On your logic app's menu, under Development Tools, select Logic App Code View.
\4. The Code View editor opens and shows your logic app definition in JSON format.

Box 3: Logic Apps Designer -
Reference:
https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-enterprise-integration-overview https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-author-definitions

Question #5*Topic 5*

A company is developing a solution that allows smart refrigerators to send temperature information to a central location. You have an existing Service Bus.
The solution must receive and store messages until they can be processed. You create an Azure Service Bus instance by providing a name, pricing tier, subscription, resource group, and location.
You need to complete the configuration.
Which Azure CLI or PowerShell command should you run?
A.
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020000001.png)
B.
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020000002.png)
C.
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020100001.png)
D.
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020100002.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/16/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/16/#)

**Correct Answer:** *A*
A service bus instance has already been created (Step 2 below). Next is step 3, Create a Service Bus queue.
Note:
Steps:
Step 1: # Create a resource group
resourceGroupName="myResourceGroup"
az group create --name $resourceGroupName --location eastus
Step 2: # Create a Service Bus messaging namespace with a unique name namespaceName=myNameSpace$RANDOM az servicebus namespace create --resource-group $resourceGroupName --name $namespaceName --location eastus
Step 3: # Create a Service Bus queue
az servicebus queue create --resource-group $resourceGroupName --namespace-name $namespaceName --name BasicQueue
Step 4: # Get the connection string for the namespace
connectionString=$(az servicebus namespace authorization-rule keys list --resource-group $resourceGroupName --namespace-name $namespaceName --name
RootManageSharedAccessKey --query primaryConnectionString --output tsv)
Reference:
https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-quickstart-cli

Question #6*Topic 5*

HOTSPOT -
You are developing an application that uses Azure Storage Queues.
You have the following code:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020200001.jpg)
For each of the following statements, select Yes if the statement is true. Otherwise, select No.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020300001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/16/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/16/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020300002.jpg)*
Box 1: No -
The QueueDescription.LockDuration property gets or sets the duration of a peek lock; that is, the amount of time that the message is locked for other receivers.
The maximum value for LockDuration is 5 minutes; the default value is 1 minute.

Box 2: Yes -
You can peek at the message in the front of a queue without removing it from the queue by calling the PeekMessage method.

Box 3: Yes -
Reference:
https://docs.microsoft.com/en-us/azure/storage/queues/storage-dotnet-how-to-use-queues https://docs.microsoft.com/en-us/dotnet/api/microsoft.servicebus.messaging.queuedescription.lockduration

Question #7*Topic 5*

HOTSPOT -
You are working for Contoso, Ltd.
You define an API Policy object by using the following XML markup:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020400001.png)
For each of the following statements, select Yes if the statement is true. Otherwise, select No.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020500001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/16/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/16/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020500002.png)*
Box 1: Yes -
Use the set-backend-service policy to redirect an incoming request to a different backend than the one specified in the API settings for that operation. Syntax:
<set-backend-service base-url="base URL of the backend service" />

Box 2: No -
The condition is on 512k, not on 256k.

Box 3: No -
The set-backend-service policy changes the backend service base URL of the incoming request to the one specified in the policy.
Reference:
https://docs.microsoft.com/en-us/azure/api-management/api-management-transformation-policies

Question #8*Topic 5*

You are developing a solution that will use Azure messaging services.
You need to ensure that the solution uses a publish-subscribe model and eliminates the need for constant polling.
What are two possible ways to achieve the goal? Each correct answer presents a complete solution.
NOTE: Each correct selection is worth one point.

- A. Service Bus
- B. Event Hub
- C. Event Grid
- D. Queue

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/17/#) [  Discussion  **16**](https://www.examtopics.com/exams/microsoft/az-204/view/17/#)

**Correct Answer:** *AC*
It is strongly recommended to use available messaging products and services that support a publish-subscribe model, rather than building your own. In Azure, consider using Service Bus or Event Grid. Other technologies that can be used for pub/sub messaging include Redis, RabbitMQ, and Apache Kafka.
Reference:
https://docs.microsoft.com/en-us/azure/architecture/patterns/publisher-subscriber

Question #9*Topic 5*

A company is implementing a publish-subscribe (Pub/Sub) messaging component by using Azure Service Bus. You are developing the first subscription application.
In the Azure portal you see that messages are being sent to the subscription for each topic. You create and initialize a subscription client object by supplying the correct details, but the subscription application is still not consuming the messages.
You need to ensure that the subscription client processes all messages.
Which code segment should you use?

- A. await subscriptionClient.AddRuleAsync(new RuleDescription(RuleDescription.DefaultRuleName, new TrueFilter()));
- B. subscriptionClient = new SubscriptionClient(ServiceBusConnectionString, TopicName, SubscriptionName);
- C. await subscriptionClient.CloseAsync();
- D. subscriptionClient.RegisterMessageHandler(ProcessMessagesAsync, messageHandlerOptions);

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/17/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/17/#)

**Correct Answer:** *D*
Using topic client, call RegisterMessageHandler which is used to receive messages continuously from the entity. It registers a message handler and begins a new thread to receive messages. This handler is waited on every time a new message is received by the receiver. subscriptionClient.RegisterMessageHandler(ReceiveMessagesAsync, messageHandlerOptions);
Reference:
https://www.c-sharpcorner.com/article/azure-service-bus-topic-and-subscription-pub-sub/

Question #10*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure Service application that processes queue data when it receives a message from a mobile application. Messages may not be sent to the service consistently.
You have the following requirements:
✑ Queue size must not grow larger than 80 gigabytes (GB).
✑ Use first-in-first-out (FIFO) ordering of messages.
✑ Minimize Azure costs.
You need to implement the messaging solution.
Solution: Use the .Net API to add a message to an Azure Storage Queue from the mobile application. Create an Azure VM that is triggered from Azure Storage
Queue events.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/17/#) [  Discussion  **5**](https://www.examtopics.com/exams/microsoft/az-204/view/17/#)

**Correct Answer:** *B*
Don't use a VM, instead create an Azure Function App that uses an Azure Service Bus Queue trigger.
Reference:
https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-storage-queue-triggered-function

Question #11*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure Service application that processes queue data when it receives a message from a mobile application. Messages may not be sent to the service consistently.
You have the following requirements:
✑ Queue size must not grow larger than 80 gigabytes (GB).
✑ Use first-in-first-out (FIFO) ordering of messages.
✑ Minimize Azure costs.
You need to implement the messaging solution.
Solution: Use the .Net API to add a message to an Azure Service Bus Queue from the mobile application. Create an Azure Windows VM that is triggered from
Azure Service Bus Queue.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/17/#) [  Discussion  **7**](https://www.examtopics.com/exams/microsoft/az-204/view/17/#)

**Correct Answer:** *B*
Don't use a VM, instead create an Azure Function App that uses an Azure Service Bus Queue trigger.
Reference:
https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-storage-queue-triggered-function

Question #12*Topic 5*

DRAG DROP -
You have an application that provides weather forecasting data to external partners. You use Azure API Management to publish APIs.
You must change the behavior of the API to meet the following requirements:
✑ Support alternative input parameters
✑ Remove formatting text from responses
✑ Provide additional context to back-end services
Which types of policies should you implement? To answer, drag the policy types to the correct scenarios. Each policy type may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0021000001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/18/#) [  Discussion  **12**](https://www.examtopics.com/exams/microsoft/az-204/view/18/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0021000002.png)*

Question #13*Topic 5*

You are developing an e-commerce solution that uses a microservice architecture.
You need to design a communication backplane for communicating transactional messages between various parts of the solution. Messages must be communicated in first-in-first-out (FIFO) order.
What should you use?

- A. Azure Storage Queue
- B. Azure Event Hub
- C. Azure Service Bus
- D. Azure Event Grid

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/18/#) [  Discussion  **8**](https://www.examtopics.com/exams/microsoft/az-204/view/18/#)

**Correct Answer:** *A*
As a solution architect/developer, you should consider using Service Bus queues when:
✑ Your solution requires the queue to provide a guaranteed first-in-first-out (FIFO) ordered delivery.
Reference:
https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-azure-and-service-bus-queues-compared-contrasted

Question #14*Topic 5*

DRAG DROP -
A company backs up all manufacturing data to Azure Blob Storage. Admins move blobs from hot storage to archive tier storage every month.
You must automatically move blobs to Archive tier after they have not been modified within 180 days. The path for any item that is not archived must be placed in an existing queue. This operation must be performed automatically once a month. You set the value of TierAgeInDays to -180.
How should you configure the Logic App? To answer, drag the appropriate triggers or action blocks to the correct trigger or action slots. Each trigger or action block may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0021200001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/18/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/18/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0021300001.jpg)*
Box 1: Reoccurance..
To regularly run tasks, processes, or jobs on specific schedule, you can start your logic app workflow with the built-in Recurrence - Schedule trigger. You can set a date and time as well as a time zone for starting the workflow and a recurrence for repeating that workflow.
Set the interval and frequency for the recurrence. In this example, set these properties to run your workflow every week.
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0021400001.jpg)
Box 2: Condition..
To run specific actions in your logic app only after passing a specified condition, add a conditional statement. This control structure compares the data in your workflow against specific values or fields. You can then specify different actions that run based on whether or not the data meets the condition.

Box 3: Put a message on a queue -
The path for any item that is not archived must be placed in an existing queue.
Note: Under If true and If false, add the steps to perform based on whether the condition is met.
Box 4: ..tier it to Cool or Archive tier.
Archive item.

Box 5: List blobs 2 -
Reference:
https://docs.microsoft.com/en-us/azure/connectors/connectors-native-recurrence https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-control-flow-loops https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-control-flow-conditional-statement

Question #15*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure Service application that processes queue data when it receives a message from a mobile application. Messages may not be sent to the service consistently.
You have the following requirements:
✑ Queue size must not grow larger than 80 gigabytes (GB).
✑ Use first-in-first-out (FIFO) ordering of messages.
✑ Minimize Azure costs.
You need to implement the messaging solution.
Solution: Use the .Net API to add a message to an Azure Service Bus Queue from the mobile application. Create an Azure Function App that uses an Azure
Service Bus Queue trigger.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/18/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/18/#)

**Correct Answer:** *A*
You can create a function that is triggered when messages are submitted to an Azure Storage queue.
Reference:
https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-storage-queue-triggered-function

Question #13*Topic 1*
HOTSPOT -
You are developing an Azure Web App. You configure TLS mutual authentication for the web app.
You need to validate the client certificate in the web app. To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0003700001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/4/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-204/view/4/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0003800001.jpg)*
Accessing the client certificate from App Service.
If you are using ASP.NET and configure your app to use client certificate authentication, the certificate will be available through the HttpRequest.ClientCertificate property. For other application stacks, the client cert will be available in your app through a base64 encoded value in the "X-ARR-ClientCert" request header. Your application can create a certificate from this value and then use it for authentication and authorization purposes in your application.
Reference:
https://docs.microsoft.com/en-us/azure/app-service/app-service-web-configure-tls-mutual-auth

Question #14*Topic 1*

DRAG DROP -
You are developing a Docker/Go using Azure App Service Web App for Containers. You plan to run the container in an App Service on Linux. You identify a
Docker container image to use.
None of your current resource groups reside in a location that supports Linux. You must minimize the number of resource groups required.
You need to create the application and perform an initial deployment.
Which three Azure CLI commands should you use to develop the solution? To answer, move the appropriate commands from the list of commands to the answer area and arrange them in the correct order.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0003900001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/4/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/4/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0004000001.png)*
You can host native Linux applications in the cloud by using Azure Web Apps. To create a Web App for Containers, you must run Azure CLI commands that create a group, then a service plan, and finally the web app itself.

Step 1: az group create -
In the Cloud Shell, create a resource group with the az group create command.
Step 2: az appservice plan create
In the Cloud Shell, create an App Service plan in the resource group with the az appservice plan create command.

Step 3: az webapp create -
In the Cloud Shell, create a web app in the myAppServicePlan App Service plan with the az webapp create command. Don't forget to replace with a unique app name, and <docker-ID> with your Docker ID.
Reference:
https://docs.microsoft.com/mt-mt/azure/app-service/containers/quickstart-docker-go?view=sql-server-ver15

Question #15*Topic 1*

DRAG DROP -
Fourth Coffee has an ASP.NET Core web app that runs in Docker. The app is mapped to the www.fourthcoffee.com domain.
Fourth Coffee is migrating this application to Azure.
You need to provision an App Service Web App to host this docker image and map the custom domain to the App Service web app.
A resource group named FourthCoffeePublicWebResourceGroup has been created in the WestUS region that contains an App Service Plan named
AppServiceLinuxDockerPlan.
Which order should the CLI commands be used to develop the solution? To answer, move all of the Azure CLI commands from the list of commands to the answer area and arrange them in the correct order.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0004200001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/4/#) [  Discussion  **10**](https://www.examtopics.com/exams/microsoft/az-204/view/4/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0004300001.jpg)*
Step 1: #bin/bash -
The appName is used when the webapp-name is created in step 2.
Step 2: az webapp config hostname add
The webapp-name is used when the webapp is created in step 3.

Step 3: az webapp create -
Create a web app. In the Cloud Shell, create a web app in the myAppServicePlan App Service plan with the az webapp create command.
Step : az webapp confing container set
In Create a web app, you specified an image on Docker Hub in the az webapp create command. This is good enough for a public image. To use a private image, you need to configure your Docker account ID and password in your Azure web app.
In the Cloud Shell, follow the az webapp create command with az webapp config container set.
Reference:
https://docs.microsoft.com/en-us/azure/app-service/containers/tutorial-custom-docker-image

Question #16*Topic 1*

DRAG DROP -
You are developing a serverless Java application on Azure. You create a new Azure Key Vault to work with secrets from a new Azure Functions application.
The application must meet the following requirements:
â Reference the Azure Key Vault without requiring any changes to the Java code.
â Dynamically add and remove instances of the Azure Functions host based on the number of incoming application events.
â Ensure that instances are perpetually warm to avoid any cold starts.
â Connect to a VNet.
â Authentication to the Azure Key Vault instance must be removed if the Azure Function application is deleted.
You need to grant the Azure Functions application access to the Azure Key Vault.
Which three actions should you perform in sequence? To answer, move the appropriate actions from the list of actions to the answer area and arrange them in the correct order.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0004500001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/4/#) [  Discussion  **11**](https://www.examtopics.com/exams/microsoft/az-204/view/4/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0004600001.png)*
Step 1: Create the Azure Functions app with a Consumption plan type.
Use the Consumption plan for serverless.
Step 2: Create a system-assigned managed identity for the application.
Create a system-assigned managed identity for your application.
Key Vault references currently only support system-assigned managed identities. User-assigned identities cannot be used.
Step 3: Create an access policy in Key Vault for the application identity.
Create an access policy in Key Vault for the application identity you created earlier. Enable the "Get" secret permission on this policy. Do not configure the
"authorized application" or applicationId settings, as this is not compatible with a managed identity.
Reference:
https://docs.microsoft.com/en-us/azure/app-service/app-service-key-vault-references

Question #17*Topic 1*

You develop a website. You plan to host the website in Azure. You expect the website to experience high traffic volumes after it is published.
You must ensure that the website remains available and responsive while minimizing cost.
You need to deploy the website.
What should you do?

- A. Deploy the website to a virtual machine. Configure the virtual machine to automatically scale when the CPU load is high.
- B. Deploy the website to an App Service that uses the Shared service tier. Configure the App Service plan to automatically scale when the CPU load is high.
- C. Deploy the website to a virtual machine. Configure a Scale Set to increase the virtual machine instance count when the CPU load is high.
- D. Deploy the website to an App Service that uses the Standard service tier. Configure the App Service plan to automatically scale when the CPU load is high.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/5/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-204/view/5/#)

**Correct Answer:** *D*
Windows Azure Web Sites (WAWS) offers 3 modes: Standard, Free, and Shared.
Standard mode carries an enterprise-grade SLA (Service Level Agreement) of 99.9% monthly, even for sites with just one instance.
Standard mode runs on dedicated instances, making it different from the other ways to buy Windows Azure Web Sites.
Incorrect Answers:
B: Shared and Free modes do not offer the scaling flexibility of Standard, and they have some important limits.
Shared mode, just as the name states, also uses shared Compute resources, and also has a CPU limit. So, while neither Free nor Shared is likely to be the best choice for your production environment due to these limits.

Question #18*Topic 1*

HOTSPOT -
A company is developing a Java web app. The web app code is hosted in a GitHub repository located at https://github.com/Contoso/webapp.
The web app must be evaluated before it is moved to production. You must deploy the initial code release to a deployment slot named staging.
You need to create the web app and deploy the code.
How should you complete the commands? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0004800001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/5/#) [  Discussion  **5**](https://www.examtopics.com/exams/microsoft/az-204/view/5/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0004900001.png)*
Box 1: group -
\# Create a resource group.
az group create --location westeurope --name myResourceGroup

Box 2: appservice plan -
\# Create an App Service plan in STANDARD tier (minimum required by deployment slots). az appservice plan create --name $webappname --resource-group myResourceGroup --sku S1

Box 3: webapp -
\# Create a web app.
az webapp create --name $webappname --resource-group myResourceGroup \
--plan $webappname

Box 4: webapp deployment slot -
\#Create a deployment slot with the name "staging".
az webapp deployment slot create --name $webappname --resource-group myResourceGroup \
--slot staging

Box 5: webapp deployment source -
\# Deploy sample code to "staging" slot from GitHub.
az webapp deployment source config --name $webappname --resource-group myResourceGroup \
--slot staging --repo-url $gitrepo --branch master --manual-integration
Reference:
https://docs.microsoft.com/en-us/azure/app-service/scripts/cli-deploy-staging-environment

Question #19*Topic 1*

HOTSPOT -
You have a web service that is used to pay for food deliveries. The web service uses Azure Cosmos DB as the data store.
You plan to add a new feature that allows users to set a tip amount. The new feature requires that a property named tip on the document in Cosmos DB must be present and contain a numeric value.
There are many existing websites and mobile apps that use the web service that will not be updated to set the tip property for some time.
How should you complete the trigger?
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0005100001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/5/#) [  Discussion  **8**](https://www.examtopics.com/exams/microsoft/az-204/view/5/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0005200001.png)*

Question #20*Topic 1*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop an HTTP triggered Azure Function app to process Azure Storage blob data. The app is triggered using an output binding on the blob.
The app continues to time out after four minutes. The app must process the blob data.
You need to ensure the app does not time out and processes the blob data.
Solution: Use the Durable Function async pattern to process the blob data.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/5/#) [  Discussion  **6**](https://www.examtopics.com/exams/microsoft/az-204/view/5/#)

**Correct Answer:** *B*
Instead pass the HTTP trigger payload into an Azure Service Bus queue to be processed by a queue trigger function and return an immediate HTTP success response.
Note: Large, long-running functions can cause unexpected timeout issues. General best practices include:
Whenever possible, refactor large functions into smaller function sets that work together and return responses fast. For example, a webhook or HTTP trigger function might require an acknowledgment response within a certain time limit; it's common for webhooks to require an immediate response. You can pass the
HTTP trigger payload into a queue to be processed by a queue trigger function. This approach lets you defer the actual work and return an immediate response.
Reference:
https://docs.microsoft.com/en-us/azure/azure-functions/functions-best-practices

Question #21*Topic 1*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop an HTTP triggered Azure Function app to process Azure Storage blob data. The app is triggered using an output binding on the blob.
The app continues to time out after four minutes. The app must process the blob data.
You need to ensure the app does not time out and processes the blob data.
Solution: Pass the HTTP trigger payload into an Azure Service Bus queue to be processed by a queue trigger function and return an immediate HTTP success response.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/6/#) [  Discussion  **6**](https://www.examtopics.com/exams/microsoft/az-204/view/6/#)

**Correct Answer:** *A*
Large, long-running functions can cause unexpected timeout issues. General best practices include:
Whenever possible, refactor large functions into smaller function sets that work together and return responses fast. For example, a webhook or HTTP trigger function might require an acknowledgment response within a certain time limit; it's common for webhooks to require an immediate response. You can pass the
HTTP trigger payload into a queue to be processed by a queue trigger function. This approach lets you defer the actual work and return an immediate response.
Reference:
https://docs.microsoft.com/en-us/azure/azure-functions/functions-best-practices

Question #22*Topic 1*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop an HTTP triggered Azure Function app to process Azure Storage blob data. The app is triggered using an output binding on the blob.
The app continues to time out after four minutes. The app must process the blob data.
You need to ensure the app does not time out and processes the blob data.
Solution: Configure the app to use an App Service hosting plan and enable the Always On setting.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/6/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/6/#)

**Correct Answer:** *B*
Instead pass the HTTP trigger payload into an Azure Service Bus queue to be processed by a queue trigger function and return an immediate HTTP success response.
Note: Large, long-running functions can cause unexpected timeout issues. General best practices include:
Whenever possible, refactor large functions into smaller function sets that work together and return responses fast. For example, a webhook or HTTP trigger function might require an acknowledgment response within a certain time limit; it's common for webhooks to require an immediate response. You can pass the
HTTP trigger payload into a queue to be processed by a queue trigger function. This approach lets you defer the actual work and return an immediate response.
Reference:
https://docs.microsoft.com/en-us/azure/azure-functions/functions-best-practices

Question #23*Topic 1*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop a software as a service (SaaS) offering to manage photographs. Users upload photos to a web service which then stores the photos in Azure
Storage Blob storage. The storage account type is General-purpose V2.
When photos are uploaded, they must be processed to produce and save a mobile-friendly version of the image. The process to produce a mobile-friendly version of the image must start in less than one minute.
You need to design the process that starts the photo processing.
Solution: Move photo processing to an Azure Function triggered from the blob upload.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/6/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/6/#)

**Correct Answer:** *A*
Azure Storage events allow applications to react to events. Common Blob storage event scenarios include image or video processing, search indexing, or any file- oriented workflow.
Events are pushed using Azure Event Grid to subscribers such as Azure Functions, Azure Logic Apps, or even to your own http listener.
Note: Only storage accounts of kind StorageV2 (general purpose v2) and BlobStorage support event integration. Storage (general purpose v1) does not support integration with Event Grid.
Reference:
https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-event-overview
Develop for Azure storage

## Topic 2 - Question Set 2

Question #1*Topic 2*

You develop Azure solutions.
You must connect to a No-SQL globally-distributed database by using the .NET API.
You need to create an object to configure and execute requests in the database.
Which code segment should you use?

- A. new Container(EndpointUri, PrimaryKey);
- B. new Database(EndpointUri, PrimaryKey);
- C. new CosmosClient(EndpointUri, PrimaryKey);

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/6/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-204/view/6/#)

**Correct Answer:** *C*
Example:
// Create a new instance of the Cosmos Client
this.cosmosClient = new CosmosClient(EndpointUri, PrimaryKey)
//ADD THIS PART TO YOUR CODE
await this.CreateDatabaseAsync();
Reference:
https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-get-started

Question #2*Topic 2*

DRAG DROP -
You are developing a new page for a website that uses Azure Cosmos DB for data storage. The feature uses documents that have the following format:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0007600001.png)
You must display data for the new page in a specific order. You create the following query for the page:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0007600002.png)
You need to configure a Cosmos DB policy to the support the query.
How should you configure the policy? To answer, drag the appropriate JSON segments to the correct locations. Each JSON segment may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0007700001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/7/#) [  Discussion  **7**](https://www.examtopics.com/exams/microsoft/az-204/view/7/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0007800001.png)*
Box 1: compositeIndexes -
You can order by multiple properties. A query that orders by multiple properties requires a composite index.

Box 2: descending -
Example: Composite index defined for (name ASC, age ASC):
It is optional to specify the order. If not specified, the order is ascending.
{
"automatic":true,
"indexingMode":"Consistent",
"includedPaths":[
{
"path":"/*"
}
],
"excludedPaths":[],
"compositeIndexes":[
[
{
"path":"/name",
},
{
"path":"/age",
}
]
]
}

Question #3*Topic 2*

HOTSPOT -
You are building a traffic monitoring system that monitors traffic along six highways. The system produces time series analysis-based reports for each highway.
Data from traffic sensors are stored in Azure Event Hub.
Traffic data is consumed by four departments. Each department has an Azure Web App that displays the time series-based reports and contains a WebJob that processes the incoming data from Event Hub. All Web Apps run on App Service Plans with three instances.
Data throughput must be maximized. Latency must be minimized.
You need to implement the Azure Event Hub.
Which settings should you use? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008000001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/7/#) [  Discussion  **10**](https://www.examtopics.com/exams/microsoft/az-204/view/7/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008100001.png)*
Box 1: 6 -
The number of partitions is specified at creation and must be between 2 and 32.
There are 6 highways.

Box 2: Highway -
Reference:
https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-features

Question #4*Topic 2*

DRAG DROP -
You are developing a microservices solution. You plan to deploy the solution to a multinode Azure Kubernetes Service (AKS) cluster.
You need to deploy a solution that includes the following features:
â reverse proxy capabilities
â configurable traffic routing
â TLS termination with a custom certificate
Which components should you use? To answer, drag the appropriate components to the correct requirements. Each component may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008200004.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/7/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-204/view/7/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008300001.jpg)*
Box 1: Helm -
To create the ingress controller, use Helm to install nginx-ingress.

Box 2: kubectl -
To find the cluster IP address of a Kubernetes pod, use the kubectl get pod command on your local machine, with the option -o wide .

Box 3: Ingress Controller -
An ingress controller is a piece of software that provides reverse proxy, configurable traffic routing, and TLS termination for Kubernetes services. Kubernetes ingress resources are used to configure the ingress rules and routes for individual Kubernetes services.
Incorrect Answers:
Virtual Kubelet: Virtual Kubelet is an open-source Kubernetes kubelet implementation that masquerades as a kubelet. This allows Kubernetes nodes to be backed by Virtual Kubelet providers such as serverless cloud container platforms.
CoreDNS: CoreDNS is a flexible, extensible DNS server that can serve as the Kubernetes cluster DNS. Like Kubernetes, the CoreDNS project is hosted by the
CNCF.
Reference:
https://docs.microsoft.com/bs-cyrl-ba/azure/aks/ingress-basic https://www.digitalocean.com/community/tutorials/how-to-inspect-kubernetes-networking

Question #5*Topic 2*

DRAG DROP -
You are implementing an order processing system. A point of sale application publishes orders to topics in an Azure Service Bus queue. The Label property for the topic includes the following data:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008400001.png)
The system has the following requirements for subscriptions:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008400002.png)
You need to implement filtering and maximize throughput while evaluating filters.
Which filter types should you implement? To answer, drag the appropriate filter types to the correct subscriptions. Each filter type may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008500001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/7/#) [  Discussion  **14**](https://www.examtopics.com/exams/microsoft/az-204/view/7/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008600001.png)*
FutureOrders: SQLFilter -
HighPriortyOrders: CorrelationFilter

CorrelationID only -

InternationalOrders: SQLFilter -
Country NOT USA requires an SQL Filter

HighQuantityOrders: SQLFilter -
Need to use relational operators so an SQL Filter is needed.

AllOrders: No Filter -
SQL Filter: SQL Filters - A SqlFilter holds a SQL-like conditional expression that is evaluated in the broker against the arriving messages' user-defined properties and system properties. All system properties must be prefixed with sys. in the conditional expression. The SQL-language subset for filter conditions tests for the existence of properties (EXISTS), as well as for null-values (IS NULL), logical NOT/AND/OR, relational operators, simple numeric arithmetic, and simple text pattern matching with LIKE.
Correlation Filters - A CorrelationFilter holds a set of conditions that are matched against one or more of an arriving message's user and system properties. A common use is to match against the CorrelationId property, but the application can also choose to match against ContentType, Label, MessageId, ReplyTo,
ReplyToSessionId, SessionId, To, and any user-defined properties. A match exists when an arriving message's value for a property is equal to the value specified in the correlation filter. For string expressions, the comparison is case-sensitive. When specifying multiple match properties, the filter combines them as a logical
AND condition, meaning for the filter to match, all conditions must match.
Boolean filters - The TrueFilter and FalseFilter either cause all arriving messages (true) or none of the arriving messages (false) to be selected for the subscription.
Reference:
https://docs.microsoft.com/en-us/azure/service-bus-messaging/topic-filters

Question #6*Topic 2*

DRAG DROP -
Your company has several websites that use a company logo image. You use Azure Content Delivery Network (CDN) to store the static image.
You need to determine the correct process of how the CDN and the Point of Presence (POP) server will distribute the image and list the items in the correct order.
In which order do the actions occur? To answer, move all actions from the list of actions to the answer area and arrange them in the correct order.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008800001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/8/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/8/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0008800002.jpg)*
Step 1: A user requests the image..
A user requests a file (also called an asset) by using a URL with a special domain name, such as <endpoint name>.azureedge.net. This name can be an endpoint hostname or a custom domain. The DNS routes the request to the best performing POP location, which is usually the POP that is geographically closest to the user.
Step 2: If no edge servers in the POP have the..
If no edge servers in the POP have the file in their cache, the POP requests the file from the origin server. The origin server can be an Azure Web App, Azure
Cloud Service, Azure Storage account, or any publicly accessible web server.
Step 3: The origin server returns the..
The origin server returns the file to an edge server in the POP.
An edge server in the POP caches the file and returns the file to the original requestor (Alice). The file remains cached on the edge server in the POP until the time-to-live (TTL) specified by its HTTP headers expires. If the origin server didn't specify a TTL, the default TTL is seven days.
Step 4: Subsequent requests for..
Additional users can then request the same file by using the same URL that the original user used, and can also be directed to the same POP.
If the TTL for the file hasn't expired, the POP edge server returns the file directly from the cache. This process results in a faster, more responsive user experience.
Reference:
https://docs.microsoft.com/en-us/azure/cdn/cdn-overview

Question #7*Topic 2*

You are developing an Azure Cosmos DB solution by using the Azure Cosmos DB SQL API. The data includes millions of documents. Each document may contain hundreds of properties.
The properties of the documents do not contain distinct values for partitioning. Azure Cosmos DB must scale individual containers in the database to meet the performance needs of the application by spreading the workload evenly across all partitions over time.
You need to select a partition key.
Which two partition keys can you use? Each correct answer presents a complete solution.
NOTE: Each correct selection is worth one point.

- A. a single property value that does not appear frequently in the documents
- B. a value containing the collection name
- C. a single property value that appears frequently in the documents
- D. a concatenation of multiple property values with a random suffix appended
- E. a hash suffix appended to a property value

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/8/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/8/#)

**Correct Answer:** *DE*
You can form a partition key by concatenating multiple property values into a single artificial partitionKey property. These keys are referred to as synthetic keys.
Another possible strategy to distribute the workload more evenly is to append a random number at the end of the partition key value. When you distribute items in this way, you can perform parallel write operations across partitions.
Note: It's the best practice to have a partition key with many distinct values, such as hundreds or thousands. The goal is to distribute your data and workload evenly across the items associated with these partition key values. If such a property doesn't exist in your data, you can construct a synthetic partition key.
Reference:
https://docs.microsoft.com/en-us/azure/cosmos-db/synthetic-partition-keys

Question #8*Topic 2*

HOTSPOT -
A company develops a series of mobile games. All games use a single leaderboard service.
You have the following requirements:
â Code must be scalable and allow for growth.
â Each record must consist of a playerId, gameId, score, and time played.
â When users reach a new high score, the system will save the new score using the SaveScore function below.
â Each game is assigned an Id based on the series title.
You plan to store customer information in Azure Cosmos DB. The following data already exists in the database:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009100001.png)
You develop the following code to save scores in the data store. (Line numbers are included for reference only.)
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009100002.png)
You develop the following code to query the database. (Line numbers are included for reference only.)
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009100003.jpg)
For each of the following statements, select Yes if the statement is true. Otherwise, select No.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009200001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/8/#) [  Discussion  **8**](https://www.examtopics.com/exams/microsoft/az-204/view/8/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009200002.png)*
Box 1: Yes -
Create a table.
A CloudTableClient object lets you get reference objects for tables and entities. The following code creates a CloudTableClient object and uses it to create a new
CloudTable object, which represents a table
// Retrieve storage account from connection-string.
CloudStorageAccount storageAccount =
CloudStorageAccount.parse(storageConnectionString);
// Create the table client.
CloudTableClient tableClient = storageAccount.createCloudTableClient();
// Create the table if it doesn't exist.
String tableName = "people";
CloudTable cloudTable = tableClient.getTableReference(tableName); cloudTable.createIfNotExists();

Box 2: No -
New records are inserted with TableOperation.insert. Old records are not updated.
To update old records TableOperation.insertOrReplace should be used instead.

Box 3: No -

Box 4: Yes -
Reference:
https://docs.microsoft.com/en-us/azure/cosmos-db/table-storage-how-to-use-java

Question #9*Topic 2*

HOTSPOT -
You are developing a solution that uses the Azure Storage Client library for .NET. You have the following code: (Line numbers are included for reference only.)
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009400001.jpg)
For each of the following statements, select Yes if the statement is true. Otherwise, select No.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009400002.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/8/#) [  Discussion  **5**](https://www.examtopics.com/exams/microsoft/az-204/view/8/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009500001.png)*
Box 1: Yes -
AcquireLeaseAsync does not specify leaseTime.
leaseTime is a TimeSpan representing the span of time for which to acquire the lease, which will be rounded down to seconds. If null, an infinite lease will be acquired. If not null, this must be 15 to 60 seconds.

Box 2: No -
The GetBlockBlobReference method just gets a reference to a block blob in this container.

Box 3: Yes -
The BreakLeaseAsync method initiates an asynchronous operation that breaks the current lease on this container.
Reference:
https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.storage.blob.cloudblobcontainer.acquireleaseasync https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.storage.blob.cloudblobcontainer.getblockblobreference https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.storage.blob.cloudblobcontainer.breakleaseasync

Question #10*Topic 2*

You are building a website that uses Azure Blob storage for data storage. You configure Azure Blob storage lifecycle to move all blobs to the archive tier after 30 days.
Customers have requested a service-level agreement (SLA) for viewing data older than 30 days.
You need to document the minimum SLA for data recovery.
Which SLA should you use?

- A. at least two days
- B. between one and 15 hours
- C. at least one day
- D. between zero and 60 minutes

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/9/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-204/view/9/#)

**Correct Answer:** *B*
The archive access tier has the lowest storage cost. But it has higher data retrieval costs compared to the hot and cool tiers. Data in the archive tier can take several hours to retrieve depending on the priority of the rehydration. For small objects, a high priority rehydrate may retrieve the object from archive in under 1 hour.
Reference:
https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-storage-tiers?tabs=azure-portal

Question #11*Topic 2*

HOTSPOT -
You are developing a ticket reservation system for an airline.
The storage solution for the application must meet the following requirements:
â Ensure at least 99.99% availability and provide low latency.
â Accept reservations event when localized network outages or other unforeseen failures occur.
â Process reservations in the exact sequence as reservations are submitted to minimize overbooking or selling the same seat to multiple travelers.
â Allow simultaneous and out-of-order reservations with a maximum five-second tolerance window.
You provision a resource group named airlineResourceGroup in the Azure South-Central US region.
You need to provision a SQL API Cosmos DB account to support the app.
How should you complete the Azure CLI commands? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0009800001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/9/#) [  Discussion  **6**](https://www.examtopics.com/exams/microsoft/az-204/view/9/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0010000001.jpg)*
Box 1: BoundedStaleness -
Bounded staleness: The reads are guaranteed to honor the consistent-prefix guarantee. The reads might lag behind writes by at most "K" versions (that is,
"updates") of an item or by "T" time interval. In other words, when you choose bounded staleness, the "staleness" can be configured in two ways:
The number of versions (K) of the item
The time interval (T) by which the reads might lag behind the writes
Incorrect Answers:

Strong -
Strong consistency offers a linearizability guarantee. Linearizability refers to serving requests concurrently. The reads are guaranteed to return the most recent committed version of an item. A client never sees an uncommitted or partial write. Users are always guaranteed to read the latest committed write.
Box 2: --enable-automatic-failover true\
For multi-region Cosmos accounts that are configured with a single-write region, enable automatic-failover by using Azure CLI or Azure portal. After you enable automatic failover, whenever there is a regional disaster, Cosmos DB will automatically failover your account.
Question: Accept reservations event when localized network outages or other unforeseen failures occur.
Box 3: --locations'southcentralus=0 eastus=1 westus=2
Need multi-region.
Reference:
https://docs.microsoft.com/en-us/azure/cosmos-db/consistency-levels https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/cosmos-db/manage-with-cli.md
Implement Azure security

## Topic 3 - Question Set 3

Question #1*Topic 3*

You have a new Azure subscription. You are developing an internal website for employees to view sensitive data. The website uses Azure Active Directory (Azure
AD) for authentication.
You need to implement multifactor authentication for the website.
Which two actions should you perform? Each correct answer presents part of the solution.
NOTE: Each correct selection is worth one point.

- A. Configure the website to use Azure AD B2C.
- B. In Azure AD, create a new conditional access policy.
- C. Upgrade to Azure AD Premium.
- D. In Azure AD, enable application proxy.
- E. In Azure AD conditional access, enable the baseline policy.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/9/#) [  Discussion  **7**](https://www.examtopics.com/exams/microsoft/az-204/view/9/#)

**Correct Answer:** *BC*
B: MFA Enabled by conditional access policy. It is the most flexible means to enable two-step verification for your users. Enabling using conditional access policy only works for Azure MFA in the cloud and is a premium feature of Azure AD.
C: Multi-Factor Authentication comes as part of the following offerings:
â Azure Active Directory Premium licenses - Full featured use of Azure Multi-Factor Authentication Service (Cloud) or Azure Multi-Factor Authentication Server
(On-premises).
â Multi-Factor Authentication for Office 365
â Azure Active Directory Global Administrators
Reference:
https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-getstarted

Question #2*Topic 3*

DRAG DROP -
You are developing an application. You have an Azure user account that has access to two subscriptions.
You need to retrieve a storage account key secret from Azure Key Vault.
In which order should you arrange the PowerShell commands to develop the solution? To answer, move all commands from the list of commands to the answer area and arrange them in the correct order.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0013300001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/9/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-204/view/9/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0013400001.png)*
Step 1: Get-AzSubscription -
If you have multiple subscriptions, you might have to specify the one that was used to create your key vault. Enter the following to see the subscriptions for your account:

Get-AzSubscription -
Step 2: Set-AzContext -SubscriptionId
To specify the subscription that's associated with the key vault you'll be logging, enter:
Set-AzContext -SubscriptionId <subscriptionID>

Step 3: Get-AzStorageAccountKey -
You must get that storage account key.
Step 4: $secretvalue = ConvertTo-SecureString <storageAccountKey> -AsPlainText -Force
Set-AzKeyVaultSecret -VaultName <vaultName> -Name <secretName> -SecretValue $secretvalue
After retrieving your secret (in this case, your storage account key), you must convert that key to a secure string, and then create a secret with that value in your key vault.

Step 5: Get-AzKeyVaultSecret -
Next, get the URI for the secret you created. You'll need this URI in a later step to call the key vault and retrieve your secret. Run the following PowerShell command and make note of the ID value, which is the secret's URI:
Get-AzKeyVaultSecret ""VaultName <vaultName>
Reference:
https://docs.microsoft.com/bs-latn-ba/Azure/key-vault/key-vault-key-rotation-log-monitoring

Question #3*Topic 3*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop Azure solutions.
You must grant a virtual machine (VM) access to specific resource groups in Azure Resource Manager.
You need to obtain an Azure Resource Manager access token.
Solution: Use an X.509 certificate to authenticate the VM with Azure Resource Manager.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/10/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-204/view/10/#)

**Correct Answer:** *B*
Instead run the Invoke-RestMethod cmdlet to make a request to the local managed identity for Azure resources endpoint.
Reference:
https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/tutorial-windows-vm-access-arm

Question #4*Topic 3*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop Azure solutions.
You must grant a virtual machine (VM) access to specific resource groups in Azure Resource Manager.
You need to obtain an Azure Resource Manager access token.
Solution: Use the Reader role-based access control (RBAC) role to authenticate the VM with Azure Resource Manager.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/10/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/10/#)

**Correct Answer:** *B*
Instead run the Invoke-RestMethod cmdlet to make a request to the local managed identity for Azure resources endpoint.
Reference:
https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/tutorial-windows-vm-access-arm

Question #5*Topic 3*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You develop Azure solutions.
You must grant a virtual machine (VM) access to specific resource groups in Azure Resource Manager.
You need to obtain an Azure Resource Manager access token.
Solution: Run the Invoke-RestMethod cmdlet to make a request to the local managed identity for Azure resources endpoint.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/10/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-204/view/10/#)

**Correct Answer:** *A*
Get an access token using the VM's system-assigned managed identity and use it to call Azure Resource Manager
You will need to use PowerShell in this portion.
\1. In the portal, navigate to Virtual Machines and go to your Windows virtual machine and in the Overview, click Connect.
\2. Enter in your Username and Password for which you added when you created the Windows VM.
\3. Now that you have created a Remote Desktop Connection with the virtual machine, open PowerShell in the remote session.
\4. Using the Invoke-WebRequest cmdlet, make a request to the local managed identity for Azure resources endpoint to get an access token for Azure Resource
Manager.
Example:
$response = Invoke-WebRequest -Uri 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https:// management.azure.com/' -Method GET -Headers @{Metadata="true"}
Reference:
https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/tutorial-windows-vm-access-arm

Question #6*Topic 3*

HOTSPOT -
You are building a website to access project data related to teams within your organization. The website does not allow anonymous access. Authentication is performed using an Azure Active Directory (Azure AD) app named internal.
The website has the following authentication requirements:
â Azure AD users must be able to login to the website.
â Personalization of the website must be based on membership in Active Directory groups.
You need to configure the application's manifest to meet the authentication requirements.
How should you configure the manifest? To answer, select the appropriate configuration in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0013800003.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/10/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/10/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0013900001.png)*
Box 1: groupMembershipClaims -
Scenario: Personalization of the website must be based on membership in Active Directory groups.
Group claims can also be configured in the Optional Claims section of the Application Manifest.
Enable group membership claims by changing the groupMembershipClaim
The valid values are:
"All"
"SecurityGroup"
"DistributionList"
"DirectoryRole"

Box 2: oauth2Permissions -
Scenario: Azure AD users must be able to login to the website. oauth2Permissions specifies the collection of OAuth 2.0 permission scopes that the web API (resource) app exposes to client apps. These permission scopes may be granted to client apps during consent.
Incorrect Answers:
oauth2AllowImplicitFlow. oauth2AllowImplicitFlow specifies whether this web app can request OAuth2.0 implicit flow access tokens. The default is false. This flag is used for browser-based apps, like Javascript single-page apps.
Reference:
https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-fed-group-claims

Question #7*Topic 3*

You develop an app that allows users to upload photos and videos to Azure storage. The app uses a storage REST API call to upload the media to a blob storage account named Account1. You have blob storage containers named Container1 and Container2.
Uploading of videos occurs on an irregular basis.
You need to copy specific blobs from Container1 to Container2 when a new video is uploaded.
What should you do?

- A. Copy blobs to Container2 by using the Put Blob operation of the Blob Service REST API
- B. Create an Event Grid topic that uses the Start-AzureStorageBlobCopy cmdlet
- C. Use AzCopy with the Snapshot switch to copy blobs to Container2
- D. Download the blob to a virtual machine and then upload the blob to Container2

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/11/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-204/view/11/#)

**Correct Answer:** *B*
The Start-AzureStorageBlobCopy cmdlet starts to copy a blob.

Example 1: Copy a named blob -
C:\PS>Start-AzureStorageBlobCopy -SrcBlob "ContosoPlanning2015" -DestContainer "ContosoArchives" -SrcContainer "ContosoUploads"
This command starts the copy operation of the blob named ContosoPlanning2015 from the container named ContosoUploads to the container named
ContosoArchives.
Reference:
https://docs.microsoft.com/en-us/powershell/module/azure.storage/start-azurestorageblobcopy?view=azurermps-6.13.0

Question #8*Topic 3*

You are developing an ASP.NET Core website that uses Azure FrontDoor. The website is used to build custom weather data sets for researchers. Data sets are downloaded by users as Comma Separated Value (CSV) files. The data is refreshed every 10 hours.
Specific files must be purged from the FrontDoor cache based upon Response Header values.
You need to purge individual assets from the Front Door cache.
Which type of cache purge should you use?

- A. single path
- B. wildcard
- C. root domain

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/11/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-204/view/11/#)

**Correct Answer:** *A*
These formats are supported in the lists of paths to purge:
â Single path purge: Purge individual assets by specifying the full path of the asset (without the protocol and domain), with the file extension, for example, /
[1]
â Wildcard purge: Asterisk (*) may be used as a wildcard. Purge all folders, subfolders, and files under an endpoint with /* in the path or purge all subfolders and files under a specific folder by specifying the folder followed by /*, for example, /pictures/*.
â Root domain purge: Purge the root of the endpoint with "/" in the path.
Reference:
https://docs.microsoft.com/en-us/azure/frontdoor/front-door-caching

Question #9*Topic 3*

Your company is developing an Azure API.
You need to implement authentication for the Azure API. You have the following requirements:
All API calls must be secure.
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0014100004.png)
â Callers to the API must not send credentials to the API.
Which authentication mechanism should you use?

- A. Basic
- B. Anonymous
- C. Managed identity
- D. Client certificate

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/11/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/11/#)

**Correct Answer:** *C*
Use the authentication-managed-identity policy to authenticate with a backend service using the managed identity of the API Management service. This policy essentially uses the managed identity to obtain an access token from Azure Active Directory for accessing the specified resource. After successfully obtaining the token, the policy will set the value of the token in the Authorization header using the Bearer scheme.
Reference:
https://docs.microsoft.com/bs-cyrl-ba/azure/api-management/api-management-authentication-policies

Question #10*Topic 3*

You are a developer for a SaaS company that offers many web services.
All web services for the company must meet the following requirements:
â Use API Management to access the services
â Use OpenID Connect for authentication
â Prevent anonymous usage
A recent security audit found that several web services can be called without any authentication.
Which API Management policy should you implement?

- A. jsonp
- B. authentication-certificate
- C. check-header
- D. validate-jwt

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/11/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-204/view/11/#)

**Correct Answer:** *D*
Add the validate-jwt policy to validate the OAuth token for every incoming request.
Incorrect Answers:
A: The jsonp policy adds JSON with padding (JSONP) support to an operation or an API to allow cross-domain calls from JavaScript browser-based clients.
JSONP is a method used in JavaScript programs to request data from a server in a different domain. JSONP bypasses the limitation enforced by most web browsers where access to web pages must be in the same domain.
JSONP - Adds JSON with padding (JSONP) support to an operation or an API to allow cross-domain calls from JavaScript browser-based clients.
Reference:
https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-protect-backend-with-aad

Question #11*Topic 3*

DRAG DROP -
Contoso, Ltd. provides an API to customers by using Azure API Management (APIM). The API authorizes users with a JWT token.
You must implement response caching for the APIM gateway. The caching mechanism must detect the user ID of the client that accesses data for a given location and cache the response for that user ID.
You need to add the following policies to the policies file:
â a set-variable policy to store the detected user identity
â a cache-lookup-value policy
â a cache-store-value policy
â a find-and-replace policy to update the response body with the user profile information
To which policy section should you add the policies? To answer, drag the appropriate sections to the correct policies. Each section may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0014400001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/12/#) [  Discussion  **10**](https://www.examtopics.com/exams/microsoft/az-204/view/12/#)

Correct Answer:Â Box 1: Inbound.A set-variable policy to store the detected user identity.Example:<policies><inbound><!-- How you determine user identity is application dependent --><set-variablename="enduserid"value="@(context.Request.Headers.GetValueOrDefault("Authorization","").Split(' ')[1].AsJwt()?.Subject)" />Box 2: Inbound -A cache-lookup-value policy -Example:<inbound><base /><cache-lookup vary-by-developer="true | false" vary-by-developer-groups="true | false" downstream-caching-type="none | private | public" must- revalidate="true | false"><vary-by-query-parameter>parameter name</vary-by-query-parameter> <!-- optional, can repeated several times --></cache-lookup></inbound>Box 3: Outbound -A cache-store-value policy.Example:<outbound><base /><cache-store duration="3600" /></outbound>Box 4: Outbound -A find-and-replace policy to update the response body with the user profile information.Example:<outbound><!-- Update response body with user profile--><find-and-replacefrom='"$userprofile$"'to="@((string)context.Variables["userprofile"])" /><base /></outbound>Reference:https://docs.microsoft.com/en-us/azure/api-management/api-management-caching-policies https://docs.microsoft.com/en-us/azure/api-management/api-management-sample-cache-by-key

Question #12*Topic 3*

DRAG DROP -
You develop a web application.
You need to register the application with an active Azure Active Directory (Azure AD) tenant.
Which three actions should you perform in sequence? To answer, move all actions from the list of actions to the answer area and arrange them in the correct order.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0014700001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/12/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-204/view/12/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0014800001.jpg)*
Register a new application using the Azure portal
\1. Sign in to the Azure portal using either a work or school account or a personal Microsoft account.
\2. If your account gives you access to more than one tenant, select your account in the upper right corner. Set your portal session to the Azure AD tenant that you want.
\3. Search for and select Azure Active Directory. Under Manage, select App registrations.
\4. Select New registration. (Step 1)
\5. In Register an application, enter a meaningful application name to display to users.
\6. Specify who can use the application. Select the Azure AD instance. (Step 2)
\7. Under Redirect URI (optional), select the type of app you're building: Web or Public client (mobile & desktop). Then enter the redirect URI, or reply URL, for your application. (Step 3)
\8. When finished, select Register.
Monitor, troubleshoot, and optimize Azure solutions

## Topic 4 - Question Set 4

Question #1*Topic 4*

HOTSPOT -
You are using Azure Front Door Service.
You are expecting inbound files to be compressed by using Brotli compression. You discover that inbound XML files are not compressed. The files are 9 megabytes (MB) in size.
You need to determine the root cause for the issue.
To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0016200001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/12/#) [  Discussion  **7**](https://www.examtopics.com/exams/microsoft/az-204/view/12/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0016300001.jpg)*
Box 1: No -
Front Door can dynamically compress content on the edge, resulting in a smaller and faster response to your clients. All files are eligible for compression.
However, a file must be of a MIME type that is eligible for compression list.

Box 2: No -
Sometimes you may wish to purge cached content from all edge nodes and force them all to retrieve new updated assets. This might be due to updates to your web application, or to quickly update assets that contain incorrect information.

Box 3: Yes -
These profiles support the following compression encodings: Gzip (GNU zip), Brotli
Reference:
https://docs.microsoft.com/en-us/azure/frontdoor/front-door-caching

Question #2*Topic 4*

HOTSPOT -
You are developing an Azure App Service hosted ASP.NET Core web app to deliver video-on-demand streaming media. You enable an Azure Content Delivery
Network (CDN) Standard for the web endpoint. Customer videos are downloaded from the web app by using the following example URL: http://www.contoso.com/ content.mp4?quality=1
All media content must expire from the cache after one hour. Customer videos with varying quality must be delivered to the closest regional point of presence
(POP) node.
You need to configure Azure CDN caching rules.
Which options should you use? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0016500001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/12/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-204/view/12/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0016600001.jpg)*
Box 1: Override -
Override: Ignore origin-provided cache duration; use the provided cache duration instead. This will not override cache-control: no-cache.
Set if missing: Honor origin-provided cache-directive headers, if they exist; otherwise, use the provided cache duration.
Incorrect:
Bypass cache: Do not cache and ignore origin-provided cache-directive headers.

Box 2: 1 hour -
All media content must expire from the cache after one hour.

Box 3: Cache every unique URL -
Cache every unique URL: In this mode, each request with a unique URL, including the query string, is treated as a unique asset with its own cache. For example, the response from the origin server for a request for example.ashx?q=test1 is cached at the POP node and returned for subsequent caches with the same query string. A request for example.ashx?q=test2 is cached as a separate asset with its own time-to-live setting.
Incorrect Answers:
Bypass caching for query strings: In this mode, requests with query strings are not cached at the CDN POP node. The POP node retrieves the asset directly from the origin server and passes it to the requestor with each request.
Ignore query strings: Default mode. In this mode, the CDN point-of-presence (POP) node passes the query strings from the requestor to the origin server on the first request and caches the asset. All subsequent requests for the asset that are served from the POP ignore the query strings until the cached asset expires.
Reference:
https://docs.microsoft.com/en-us/azure/cdn/cdn-query-string

Question #3*Topic 4*

DRAG DROP -
You develop a web app that uses tier D1 app service plan by using the Web Apps feature of Microsoft Azure App Service.
Spikes in traffic have caused increases in page load times.
You need to ensure that the web app automatically scales when CPU load is about 85 percent and minimize costs.
Which four actions should you perform in sequence? To answer, move the appropriate actions from the list of actions to the answer area and arrange them in the correct order.
NOTE: More than one order of answer choices is correct. You will receive credit for any of the correct orders you select.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0016800001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/13/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/13/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0016900001.jpg)*
Step 1: Configure the web app to the Standard App Service Tier
The Standard tier supports auto-scaling, and we should minimize the cost.
Step 2: Enable autoscaling on the web app

First enable autoscale -

Step 3: Add a scale rule -

Step 4: Add a Scale condition -
Reference:
https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-autoscale-get-started

Question #4*Topic 4*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution. Determine whether the solution meets the stated goals.
You are developing and deploying several ASP.NET web applications to Azure App Service. You plan to save session state information and HTML output.
You must use a storage mechanism with the following requirements:
â Share session state across all ASP.NET web applications.
â Support controlled, concurrent access to the same session state data for multiple readers and a single writer.
â Save full HTTP responses for concurrent requests.
You need to store the information.
Proposed Solution: Enable Application Request Routing (ARR).
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/13/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-204/view/13/#)

**Correct Answer:** *B*
Instead deploy and configure Azure Cache for Redis. Update the web applications.
Reference:
https://docs.microsoft.com/en-us/azure/architecture/best-practices/caching#managing-concurrency-in-a-cache

Question #5*Topic 4*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution. Determine whether the solution meets the stated goals.
You are developing and deploying several ASP.NET web applications to Azure App Service. You plan to save session state information and HTML output.
You must use a storage mechanism with the following requirements:
â Share session state across all ASP.NET web applications.
â Support controlled, concurrent access to the same session state data for multiple readers and a single writer.
â Save full HTTP responses for concurrent requests.
You need to store the information.
Proposed Solution: Deploy and configure an Azure Database for PostgreSQL. Update the web applications.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/13/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-204/view/13/#)

**Correct Answer:** *B*
Instead deploy and configure Azure Cache for Redis. Update the web applications.
Reference:
https://docs.microsoft.com/en-us/azure/architecture/best-practices/caching#managing-concurrency-in-a-cache

Question #6*Topic 4*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution. Determine whether the solution meets the stated goals.
You are developing and deploying several ASP.NET web applications to Azure App Service. You plan to save session state information and HTML output.
You must use a storage mechanism with the following requirements:
Share session state across all ASP.NET web applications.
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0017100004.png)
â Support controlled, concurrent access to the same session state data for multiple readers and a single writer.
â Save full HTTP responses for concurrent requests.
You need to store the information.
Proposed Solution: Deploy and configure Azure Cache for Redis. Update the web applications.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/13/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-204/view/13/#)

**Correct Answer:** *A*
The session state provider for Azure Cache for Redis enables you to share session information between different instances of an ASP.NET web application.
The same connection can be used by multiple concurrent threads.
Redis supports both read and write operations.
The output cache provider for Azure Cache for Redis enables you to save the HTTP responses generated by an ASP.NET web application.
Note: Using the Azure portal, you can also configure the eviction policy of the cache, and control access to the cache by adding users to the roles provided. These roles, which define the operations that members can perform, include Owner, Contributor, and Reader. For example, members of the Owner role have complete control over the cache (including security) and its contents, members of the Contributor role can read and write information in the cache, and members of the
Reader role can only retrieve data from the cache.
Reference:
https://docs.microsoft.com/en-us/azure/architecture/best-practices/caching

Question #7*Topic 4*

HOTSPOT -
You are debugging an application that is running on Azure Kubernetes cluster named cluster1. The cluster uses Azure Monitor for containers to monitor the cluster.
The application has sticky sessions enabled on the ingress controller.
Some customers report a large number of errors in the application over the last 24 hours.
You need to determine on which virtual machines (VMs) the errors are occurring.
How should you complete the Azure Monitor query? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0017400001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/14/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-204/view/14/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0017600001.png)*
Box 1: ago(1d)

Box 2: distinct containerID -
Box 3: where ContainerID in (ContainerIDs)
Box 4: summarize Count by Computer
Summarize: aggregate groups of rows
Use summarize to identify groups of records, according to one or more columns, and apply aggregations to them. The most common use of summarize is count, which returns the number of results in each group.
Reference:
https://docs.microsoft.com/en-us/azure/azure-monitor/log-query/get-started-queries https://docs.microsoft.com/en-us/azure/azure-monitor/log-query/query-optimization

Question #8*Topic 4*

HOTSPOT -
You plan to deploy a web app to App Service on Linux. You create an App Service plan. You create and push a custom Docker image that contains the web app to Azure Container Registry.
You need to access the console logs generated from inside the container in real-time.
How should you complete the Azure CLI command? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0017800001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/14/#) [  Discussion  **11**](https://www.examtopics.com/exams/microsoft/az-204/view/14/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0017800002.png)*
Box 1: config -
To Configure logging for a web app use the command:
az webapp log config
Box 2: --docker-container-logging
Syntax include:
az webapp log config [--docker-container-logging {filesystem, off}]

Box 3: webapp -
To download a web app's log history as a zip file use the command: az webapp log download

Box 4: download -
Reference:
https://docs.microsoft.com/en-us/cli/azure/webapp/log

Question #9*Topic 4*

You develop and deploy an ASP.NET web app to Azure App Service. You use Application Insights telemetry to monitor the app.
You must test the app to ensure that the app is available and responsive from various points around the world and at regular intervals. If the app is not responding, you must send an alert to support staff.
You need to configure a test for the web app.
Which two test types can you use? Each correct answer presents a complete solution.
NOTE: Each correct selection is worth one point.

- A. integration
- B. multi-step web
- C. URL ping
- D. unit
- E. load

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/14/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-204/view/14/#)

**Correct Answer:** *BC*
There are three types of availability tests:
â URL ping test: a simple test that you can create in the Azure portal.
â Multi-step web test: A recording of a sequence of web requests, which can be played back to test more complex scenarios. Multi-step web tests are created in
Visual Studio Enterprise and uploaded to the portal for execution.
â Custom Track Availability Tests: If you decide to create a custom application to run availability tests, the TrackAvailability() method can be used to send the results to Application Insights.
Reference:
https://docs.microsoft.com/en-us/azure/azure-monitor/app/monitor-web-app-availability

Question #10*Topic 4*

DRAG DROP -
A web service provides customer summary information for e-commerce partners. The web service is implemented as an Azure Function app with an HTTP trigger.
Access to the API is provided by an Azure API Management instance. The API Management instance is configured in consumption plan mode. All API calls are authenticated by using OAuth.
API calls must be cached. Customers must not be able to view cached data for other customers.
You need to configure API Management policies for caching.
How should you complete the policy statement?
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0018100001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/14/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/14/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0018100002.jpg)*
Box 1: internal -
caching-type
Choose between the following values of the attribute:
â internal to use the built-in API Management cache,
â external to use the external cache as Azure Cache for Redis prefer-external to use external cache if configured or internal cache otherwise.
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0018100005.png)

Box 2: private -
downstream-caching-type
This attribute must be set to one of the following values.
â none - downstream caching is not allowed.
â private - downstream private caching is allowed.
â public - private and shared downstream caching is allowed.

Box 3: Authorization -
<vary-by-header>Authorization</vary-by-header>

<!-- should be present when allow-private-response-caching is "true"-->

Note: Start caching responses per value of specified header, such as Accept, Accept-Charset, Accept-Encoding, Accept-Language, Authorization, Expect, From,

Host, If-Match -
Reference:
https://docs.microsoft.com/en-us/azure/api-management/api-management-caching-policies

Question #11*Topic 4*

You are developing an ASP.NET Core Web API web service. The web service uses Azure Application Insights for all telemetry and dependency tracking. The web service reads and writes data to a database other than Microsoft SQL Server.
You need to ensure that dependency tracking works for calls to the third-party database.
Which two dependency telemetry properties should you use? Each correct answer presents part of the solution.
NOTE: Each correct selection is worth one point.

- A. Telemetry.Context.Cloud.RoleInstance
- B. Telemetry.Id
- C. Telemetry.Name
- D. Telemetry.Context.Operation.Id
- E. Telemetry.Context.Session.Id

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/15/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/15/#)

**Correct Answer:** *BD*
Example:
public async Task Enqueue(string payload)
{
// StartOperation is a helper method that initializes the telemetry item
// and allows correlation of this operation with its parent and children. var operation = telemetryClient.StartOperation<DependencyTelemetry>("enqueue " + queueName);

operation.Telemetry.Type = "Azure Service Bus";
operation.Telemetry.Data = "Enqueue " + queueName;
var message = new BrokeredMessage(payload);
// Service Bus queue allows the property bag to pass along with the message.
// We will use them to pass our correlation identifiers (and other context)
// to the consumer.
message.Properties.Add("ParentId", operation.Telemetry.Id);
message.Properties.Add("RootId", operation.Telemetry.Context.Operation.Id);
Reference:
https://docs.microsoft.com/en-us/azure/azure-monitor/app/custom-operations-tracking
Connect to and consume Azure services and third-party services

## Topic 5 - Question Set 5

Question #1*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure solution to collect point-of-sale (POS) device data from 2,000 stores located throughout the world. A single device can produce 2 megabytes (MB) of data every 24 hours. Each store location has one to five devices that send data.
You must store the device data in Azure Blob storage. Device data must be correlated based on a device identifier. Additional stores are expected to open in the future.
You need to implement a solution to receive the device data.
Solution: Provision an Azure Notification Hub. Register all devices with the hub.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/15/#) [  Discussion  **6**](https://www.examtopics.com/exams/microsoft/az-204/view/15/#)

**Correct Answer:** *B*
Instead use an Azure Service Bus, which is used order processing and financial transactions.
Reference:
https://docs.microsoft.com/en-us/azure/event-grid/compare-messaging-services

Question #2*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure solution to collect point-of-sale (POS) device data from 2,000 stores located throughout the world. A single device can produce 2 megabytes (MB) of data every 24 hours. Each store location has one to five devices that send data.
You must store the device data in Azure Blob storage. Device data must be correlated based on a device identifier. Additional stores are expected to open in the future.
You need to implement a solution to receive the device data.
Solution: Provision an Azure Service Bus. Configure a topic to receive the device data by using a correlation filter.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/15/#) [  Discussion  **10**](https://www.examtopics.com/exams/microsoft/az-204/view/15/#)

**Correct Answer:** *A*
A message is raw data produced by a service to be consumed or stored elsewhere. The Service Bus is for high-value enterprise messaging, and is used for order processing and financial transactions.
Reference:
https://docs.microsoft.com/en-us/azure/event-grid/compare-messaging-services

Question #3*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure solution to collect point-of-sale (POS) device data from 2,000 stores located throughout the world. A single device can produce 2 megabytes (MB) of data every 24 hours. Each store location has one to five devices that send data.
You must store the device data in Azure Blob storage. Device data must be correlated based on a device identifier. Additional stores are expected to open in the future.
You need to implement a solution to receive the device data.
Solution: Provision an Azure Event Grid. Configure event filtering to evaluate the device identifier.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/15/#) [  Discussion  **11**](https://www.examtopics.com/exams/microsoft/az-204/view/15/#)

**Correct Answer:** *B*
Instead use an Azure Service Bus, which is used order processing and financial transactions.
Note: An event is a lightweight notification of a condition or a state change. Event hubs is usually used reacting to status changes.
Reference:
https://docs.microsoft.com/en-us/azure/event-grid/compare-messaging-services

Question #11*Topic 4*

You are developing an ASP.NET Core Web API web service. The web service uses Azure Application Insights for all telemetry and dependency tracking. The web service reads and writes data to a database other than Microsoft SQL Server.
You need to ensure that dependency tracking works for calls to the third-party database.
Which two dependency telemetry properties should you use? Each correct answer presents part of the solution.
NOTE: Each correct selection is worth one point.

- A. Telemetry.Context.Cloud.RoleInstance
- B. Telemetry.Id
- C. Telemetry.Name
- D. Telemetry.Context.Operation.Id
- E. Telemetry.Context.Session.Id

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/15/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/15/#)

**Correct Answer:** *BD*
Example:
public async Task Enqueue(string payload)
{
// StartOperation is a helper method that initializes the telemetry item
// and allows correlation of this operation with its parent and children. var operation = telemetryClient.StartOperation<DependencyTelemetry>("enqueue " + queueName);

operation.Telemetry.Type = "Azure Service Bus";
operation.Telemetry.Data = "Enqueue " + queueName;
var message = new BrokeredMessage(payload);
// Service Bus queue allows the property bag to pass along with the message.
// We will use them to pass our correlation identifiers (and other context)
// to the consumer.
message.Properties.Add("ParentId", operation.Telemetry.Id);
message.Properties.Add("RootId", operation.Telemetry.Context.Operation.Id);
Reference:
https://docs.microsoft.com/en-us/azure/azure-monitor/app/custom-operations-tracking
Connect to and consume Azure services and third-party services

## Topic 5 - Question Set 5

Question #1*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure solution to collect point-of-sale (POS) device data from 2,000 stores located throughout the world. A single device can produce 2 megabytes (MB) of data every 24 hours. Each store location has one to five devices that send data.
You must store the device data in Azure Blob storage. Device data must be correlated based on a device identifier. Additional stores are expected to open in the future.
You need to implement a solution to receive the device data.
Solution: Provision an Azure Notification Hub. Register all devices with the hub.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/15/#) [  Discussion  **6**](https://www.examtopics.com/exams/microsoft/az-204/view/15/#)

**Correct Answer:** *B*
Instead use an Azure Service Bus, which is used order processing and financial transactions.
Reference:
https://docs.microsoft.com/en-us/azure/event-grid/compare-messaging-services

Question #2*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure solution to collect point-of-sale (POS) device data from 2,000 stores located throughout the world. A single device can produce 2 megabytes (MB) of data every 24 hours. Each store location has one to five devices that send data.
You must store the device data in Azure Blob storage. Device data must be correlated based on a device identifier. Additional stores are expected to open in the future.
You need to implement a solution to receive the device data.
Solution: Provision an Azure Service Bus. Configure a topic to receive the device data by using a correlation filter.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/15/#) [  Discussion  **10**](https://www.examtopics.com/exams/microsoft/az-204/view/15/#)

**Correct Answer:** *A*
A message is raw data produced by a service to be consumed or stored elsewhere. The Service Bus is for high-value enterprise messaging, and is used for order processing and financial transactions.
Reference:
https://docs.microsoft.com/en-us/azure/event-grid/compare-messaging-services

Question #3*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure solution to collect point-of-sale (POS) device data from 2,000 stores located throughout the world. A single device can produce 2 megabytes (MB) of data every 24 hours. Each store location has one to five devices that send data.
You must store the device data in Azure Blob storage. Device data must be correlated based on a device identifier. Additional stores are expected to open in the future.
You need to implement a solution to receive the device data.
Solution: Provision an Azure Event Grid. Configure event filtering to evaluate the device identifier.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/15/#) [  Discussion  **11**](https://www.examtopics.com/exams/microsoft/az-204/view/15/#)

**Correct Answer:** *B*
Instead use an Azure Service Bus, which is used order processing and financial transactions.
Note: An event is a lightweight notification of a condition or a state change. Event hubs is usually used reacting to status changes.
Reference:
https://docs.microsoft.com/en-us/azure/event-grid/compare-messaging-services

Question #4*Topic 5*

DRAG DROP -
You manage several existing Logic Apps.
You need to change definitions, add new logic, and optimize these apps on a regular basis.
What should you use? To answer, drag the appropriate tools to the correct functionalities. Each tool may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0019900001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/16/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-204/view/16/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0019900002.jpg)*
Box 1: Enterprise Integration Pack
For business-to-business (B2B) solutions and seamless communication between organizations, you can build automated scalable enterprise integration workflows by using the Enterprise Integration Pack (EIP) with Azure Logic Apps.

Box 2: Code View Editor -

Edit JSON - Azure portal -
\1. Sign in to the Azure portal.
\2. From the left menu, choose All services. In the search box, find "logic apps", and then from the results, select your logic app.
\3. On your logic app's menu, under Development Tools, select Logic App Code View.
\4. The Code View editor opens and shows your logic app definition in JSON format.

Box 3: Logic Apps Designer -
Reference:
https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-enterprise-integration-overview https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-author-definitions

Question #5*Topic 5*

A company is developing a solution that allows smart refrigerators to send temperature information to a central location. You have an existing Service Bus.
The solution must receive and store messages until they can be processed. You create an Azure Service Bus instance by providing a name, pricing tier, subscription, resource group, and location.
You need to complete the configuration.
Which Azure CLI or PowerShell command should you run?
A.
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020000001.png)
B.
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020000002.png)
C.
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020100001.png)
D.
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020100002.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/16/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/16/#)

**Correct Answer:** *A*
A service bus instance has already been created (Step 2 below). Next is step 3, Create a Service Bus queue.
Note:
Steps:
Step 1: # Create a resource group
resourceGroupName="myResourceGroup"
az group create --name $resourceGroupName --location eastus
Step 2: # Create a Service Bus messaging namespace with a unique name namespaceName=myNameSpace$RANDOM az servicebus namespace create --resource-group $resourceGroupName --name $namespaceName --location eastus
Step 3: # Create a Service Bus queue
az servicebus queue create --resource-group $resourceGroupName --namespace-name $namespaceName --name BasicQueue
Step 4: # Get the connection string for the namespace
connectionString=$(az servicebus namespace authorization-rule keys list --resource-group $resourceGroupName --namespace-name $namespaceName --name
RootManageSharedAccessKey --query primaryConnectionString --output tsv)
Reference:
https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-quickstart-cli

Question #6*Topic 5*

HOTSPOT -
You are developing an application that uses Azure Storage Queues.
You have the following code:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020200001.jpg)
For each of the following statements, select Yes if the statement is true. Otherwise, select No.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020300001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/16/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/16/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020300002.jpg)*
Box 1: No -
The QueueDescription.LockDuration property gets or sets the duration of a peek lock; that is, the amount of time that the message is locked for other receivers.
The maximum value for LockDuration is 5 minutes; the default value is 1 minute.

Box 2: Yes -
You can peek at the message in the front of a queue without removing it from the queue by calling the PeekMessage method.

Box 3: Yes -
Reference:
https://docs.microsoft.com/en-us/azure/storage/queues/storage-dotnet-how-to-use-queues https://docs.microsoft.com/en-us/dotnet/api/microsoft.servicebus.messaging.queuedescription.lockduration

Question #7*Topic 5*

HOTSPOT -
You are working for Contoso, Ltd.
You define an API Policy object by using the following XML markup:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020400001.png)
For each of the following statements, select Yes if the statement is true. Otherwise, select No.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020500001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/16/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/16/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0020500002.png)*
Box 1: Yes -
Use the set-backend-service policy to redirect an incoming request to a different backend than the one specified in the API settings for that operation. Syntax:
<set-backend-service base-url="base URL of the backend service" />

Box 2: No -
The condition is on 512k, not on 256k.

Box 3: No -
The set-backend-service policy changes the backend service base URL of the incoming request to the one specified in the policy.
Reference:
https://docs.microsoft.com/en-us/azure/api-management/api-management-transformation-policies

Question #8*Topic 5*

You are developing a solution that will use Azure messaging services.
You need to ensure that the solution uses a publish-subscribe model and eliminates the need for constant polling.
What are two possible ways to achieve the goal? Each correct answer presents a complete solution.
NOTE: Each correct selection is worth one point.

- A. Service Bus
- B. Event Hub
- C. Event Grid
- D. Queue

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/17/#) [  Discussion  **16**](https://www.examtopics.com/exams/microsoft/az-204/view/17/#)

**Correct Answer:** *AC*
It is strongly recommended to use available messaging products and services that support a publish-subscribe model, rather than building your own. In Azure, consider using Service Bus or Event Grid. Other technologies that can be used for pub/sub messaging include Redis, RabbitMQ, and Apache Kafka.
Reference:
https://docs.microsoft.com/en-us/azure/architecture/patterns/publisher-subscriber

Question #9*Topic 5*

A company is implementing a publish-subscribe (Pub/Sub) messaging component by using Azure Service Bus. You are developing the first subscription application.
In the Azure portal you see that messages are being sent to the subscription for each topic. You create and initialize a subscription client object by supplying the correct details, but the subscription application is still not consuming the messages.
You need to ensure that the subscription client processes all messages.
Which code segment should you use?

- A. await subscriptionClient.AddRuleAsync(new RuleDescription(RuleDescription.DefaultRuleName, new TrueFilter()));
- B. subscriptionClient = new SubscriptionClient(ServiceBusConnectionString, TopicName, SubscriptionName);
- C. await subscriptionClient.CloseAsync();
- D. subscriptionClient.RegisterMessageHandler(ProcessMessagesAsync, messageHandlerOptions);

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/17/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/17/#)

**Correct Answer:** *D*
Using topic client, call RegisterMessageHandler which is used to receive messages continuously from the entity. It registers a message handler and begins a new thread to receive messages. This handler is waited on every time a new message is received by the receiver. subscriptionClient.RegisterMessageHandler(ReceiveMessagesAsync, messageHandlerOptions);
Reference:
https://www.c-sharpcorner.com/article/azure-service-bus-topic-and-subscription-pub-sub/

Question #10*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure Service application that processes queue data when it receives a message from a mobile application. Messages may not be sent to the service consistently.
You have the following requirements:
â Queue size must not grow larger than 80 gigabytes (GB).
â Use first-in-first-out (FIFO) ordering of messages.
â Minimize Azure costs.
You need to implement the messaging solution.
Solution: Use the .Net API to add a message to an Azure Storage Queue from the mobile application. Create an Azure VM that is triggered from Azure Storage
Queue events.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/17/#) [  Discussion  **5**](https://www.examtopics.com/exams/microsoft/az-204/view/17/#)

**Correct Answer:** *B*
Don't use a VM, instead create an Azure Function App that uses an Azure Service Bus Queue trigger.
Reference:
https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-storage-queue-triggered-function

Question #11*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure Service application that processes queue data when it receives a message from a mobile application. Messages may not be sent to the service consistently.
You have the following requirements:
â Queue size must not grow larger than 80 gigabytes (GB).
â Use first-in-first-out (FIFO) ordering of messages.
â Minimize Azure costs.
You need to implement the messaging solution.
Solution: Use the .Net API to add a message to an Azure Service Bus Queue from the mobile application. Create an Azure Windows VM that is triggered from
Azure Service Bus Queue.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/17/#) [  Discussion  **7**](https://www.examtopics.com/exams/microsoft/az-204/view/17/#)

**Correct Answer:** *B*
Don't use a VM, instead create an Azure Function App that uses an Azure Service Bus Queue trigger.
Reference:
https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-storage-queue-triggered-function

Question #12*Topic 5*

DRAG DROP -
You have an application that provides weather forecasting data to external partners. You use Azure API Management to publish APIs.
You must change the behavior of the API to meet the following requirements:
â Support alternative input parameters
â Remove formatting text from responses
â Provide additional context to back-end services
Which types of policies should you implement? To answer, drag the policy types to the correct scenarios. Each policy type may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0021000001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/18/#) [  Discussion  **12**](https://www.examtopics.com/exams/microsoft/az-204/view/18/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0021000002.png)*

Question #13*Topic 5*

You are developing an e-commerce solution that uses a microservice architecture.
You need to design a communication backplane for communicating transactional messages between various parts of the solution. Messages must be communicated in first-in-first-out (FIFO) order.
What should you use?

- A. Azure Storage Queue
- B. Azure Event Hub
- C. Azure Service Bus
- D. Azure Event Grid

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/18/#) [  Discussion  **8**](https://www.examtopics.com/exams/microsoft/az-204/view/18/#)

**Correct Answer:** *A*
As a solution architect/developer, you should consider using Service Bus queues when:
â Your solution requires the queue to provide a guaranteed first-in-first-out (FIFO) ordered delivery.
Reference:
https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-azure-and-service-bus-queues-compared-contrasted

Question #14*Topic 5*

DRAG DROP -
A company backs up all manufacturing data to Azure Blob Storage. Admins move blobs from hot storage to archive tier storage every month.
You must automatically move blobs to Archive tier after they have not been modified within 180 days. The path for any item that is not archived must be placed in an existing queue. This operation must be performed automatically once a month. You set the value of TierAgeInDays to -180.
How should you configure the Logic App? To answer, drag the appropriate triggers or action blocks to the correct trigger or action slots. Each trigger or action block may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0021200001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/18/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-204/view/18/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0021300001.jpg)*
Box 1: Reoccurance..
To regularly run tasks, processes, or jobs on specific schedule, you can start your logic app workflow with the built-in Recurrence - Schedule trigger. You can set a date and time as well as a time zone for starting the workflow and a recurrence for repeating that workflow.
Set the interval and frequency for the recurrence. In this example, set these properties to run your workflow every week.
![img](C:\Users\ajitg\Notes\Azure-203Exam\ExamQuestionsDump.assets\0021400001.jpg)
Box 2: Condition..
To run specific actions in your logic app only after passing a specified condition, add a conditional statement. This control structure compares the data in your workflow against specific values or fields. You can then specify different actions that run based on whether or not the data meets the condition.

Box 3: Put a message on a queue -
The path for any item that is not archived must be placed in an existing queue.
Note: Under If true and If false, add the steps to perform based on whether the condition is met.
Box 4: ..tier it to Cool or Archive tier.
Archive item.

Box 5: List blobs 2 -
Reference:
https://docs.microsoft.com/en-us/azure/connectors/connectors-native-recurrence https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-control-flow-loops https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-control-flow-conditional-statement

Question #15*Topic 5*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure Service application that processes queue data when it receives a message from a mobile application. Messages may not be sent to the service consistently.
You have the following requirements:
â Queue size must not grow larger than 80 gigabytes (GB).
â Use first-in-first-out (FIFO) ordering of messages.
â Minimize Azure costs.
You need to implement the messaging solution.
Solution: Use the .Net API to add a message to an Azure Service Bus Queue from the mobile application. Create an Azure Function App that uses an Azure
Service Bus Queue trigger.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-204/view/18/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-204/view/18/#)

**Correct Answer:** *A*
You can create a function that is triggered when messages are submitted to an Azure Storage queue.
Reference:
https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-storage-queue-triggered-function

