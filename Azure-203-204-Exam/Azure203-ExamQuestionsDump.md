## Topic 1 - Question Set 1

Question #1*Topic 1*

HOTSPOT -
You have an Azure Batch project that processes and converts files and stores the files in Azure storage. You are developing a function to start the batch job.
You add the following parameters to the function.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0001800001.png)
You must ensure that converted files are placed in the container referenced by the outputContainerSasUrl parameter. Files which fail to convert are placed in the container referenced by the failedContainerSasUrl parameter.
You need to ensure the files are correctly processed.
How should you complete the code segment? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/#) [  Discussion  **5**](https://www.examtopics.com/exams/microsoft/az-203/view/#)

**Correct Answer:** *Explanation*
Box 1: CreateJob -

Box 2: TaskSuccess -
TaskSuccess: Upload the file(s) only after the task process exits with an exit code of 0.
Incorrect: TaskCompletion: Upload the file(s) after the task process exits, no matter what the exit code was.

Box 3: TaskFailure -
TaskFailure:Upload the file(s) only after the task process exits with a nonzero exit code.

Box 4: OutputFiles -
To specify output files for a task, create a collection of OutputFile objects and assign it to the CloudTask.OutputFiles property when you create the task.
References:
https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.batch.protocol.models.outputfileuploadcondition https://docs.microsoft.com/en-us/azure/batch/batch-task-output-files

Question #2*Topic 1*

You are writing code to create and run an Azure Batch job.
You have created a pool of compute nodes.
You need to choose the right class and its method to submit a batch job to the Batch service.
Which method should you use?

- A. JobOperations.EnableJobAsync(String, IEnumerable<BatchClientBehavior>,CancellationToken)
- B. JobOperations.CreateJob()
- C. CloudJob.Enable(IEnumerable<BatchClientBehavior>)
- D. JobOperations.EnableJob(String,IEnumerable<BatchClientBehavior>)
- E. CloudJob.CommitAsync(IEnumerable<BatchClientBehavior>, CancellationToken)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/#) [  Discussion  **12**](https://www.examtopics.com/exams/microsoft/az-203/view/#)

**Correct Answer:** *E*
A Batch job is a logical grouping of one or more tasks. A job includes settings common to the tasks, such as priority and the pool to run tasks on. The app uses the
BatchClient.JobOperations.CreateJob method to create a job on your pool.
The Commit method submits the job to the Batch service. Initially the job has no tasks.
{
CloudJob job = batchClient.JobOperations.CreateJob();
job.Id = JobId;
job.PoolInformation = new PoolInformation { PoolId = PoolId }; job.Commit();
}
...
References:
https://docs.microsoft.com/en-us/azure/batch/quick-run-dotnet

Question #3*Topic 1*

DRAG DROP -
You are developing Azure WebJobs.
You need to recommend a WebJob type for each scenario.
Which WebJob type should you recommend? To answer, drag the appropriate WebJob types to the correct scenarios. Each WebJob type may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0002000001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-203/view/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0002100001.jpg)*
Box 1: Continuous -
Continuous runs on all instances that the web app runs on. You can optionally restrict the WebJob to a single instance.

Box 2: Triggered -
Triggered runs on a single instance that Azure selects for load balancing.

Box 3: Continuous -
Continuous supports remote debugging.
Note:
The following table describes the differences between continuous and triggered WebJobs.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0002200001.png)
References:
https://docs.microsoft.com/en-us/azure/app-service/web-sites-create-web-jobs

Question #4*Topic 1*

You are developing a software solution for an autonomous transportation system. The solution uses large data sets and Azure Batch processing to simulate navigation sets for entire fleets of vehicles.
You need to create compute nodes for the solution on Azure Batch.
What should you do?

- A. In the Azure portal, add a Job to a Batch account.
- B. In a .NET method, call the method: BatchClient.PoolOperations.CreateJob
- C. In Python, implement the class: JobAddParameter
- D. In Azure CLI, run the command: az batch pool create
- E. In a .NET method, call the method: BatchClient.PoolOperations.CreatePool
- F. In Python, implement the class: TaskAddParameter
- G. In the Azure CLI, run the command: az batch account create

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/#) [  Discussion  **20**](https://www.examtopics.com/exams/microsoft/az-203/view/#)

**Correct Answer:** *B*
A Batch job is a logical grouping of one or more tasks. A job includes settings common to the tasks, such as priority and the pool to run tasks on. The app uses the
BatchClient.JobOperations.CreateJob method to create a job on your pool.
Note:
Step 1: Create a pool of compute nodes. When you create a pool, you specify the number of compute nodes for the pool, their size, and the operating system.
When each task in your job runs, it's assigned to execute on one of the nodes in your pool.
Step 2: Create a job. A job manages a collection of tasks. You associate each job to a specific pool where that job's tasks will run.
Step 3: Add tasks to the job. Each task runs the application or script that you uploaded to process the data files it downloads from your Storage account. As each task completes, it can upload its output to Azure Storage.
Incorrect Answers:
C, F: To create a Batch pool in Python, the app uses the PoolAddParameter class to set the number of nodes, VM size, and a pool configuration.
E: BatchClient.PoolOperations does not have a CreateJob method.
References:
https://docs.microsoft.com/en-us/azure/batch/quick-run-dotnet https://docs.microsoft.com/en-us/azure/batch/quick-run-python

Question #5*Topic 1*

DRAG DROP -
You are deploying an Azure Kubernetes Services (AKS) cluster that will use multiple containers.
You need to create the cluster and verify that the services for the containers are configured correctly and available.
Which four commands should you use to develop the solution? To answer, move the appropriate command segments from the list of command segments to the answer area and arrange them in the correct order.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0002400001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/2/#) [  Discussion  **9**](https://www.examtopics.com/exams/microsoft/az-203/view/2/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0002400002.jpg)*
Step 1: az group create -
Create a resource group with the az group create command. An Azure resource group is a logical group in which Azure resources are deployed and managed.
Example: The following example creates a resource group named myAKSCluster in the eastus location. az group create --name myAKSCluster --location eastus

Step 2 : az aks create -
Use the az aks create command to create an AKS cluster.

Step 3: kubectl apply -
To deploy your application, use the kubectl apply command. This command parses the manifest file and creates the defined Kubernetes objects.

Step 4: az aks get-credentials -
Configure it with the credentials for the new AKS cluster. Example: az aks get-credentials --name aks-cluster --resource-group aks-resource-group
References:
https://docs.bitnami.com/azure/get-started-aks/

==Question #6*Topic 1*==

DRAG DROP -
You are preparing to deploy a medical records application to an Azure virtual machine (VM). The application will be deployed by using a VHD produced by an on- premises build server.
You need to ensure that both the application and related data are encrypted during and after deployment to Azure.
Which three actions should you perform in sequence? To answer, move the appropriate actions from the list of actions to the answer area and arrange them in the correct order.
Select and Place:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/2/#) [  Discussion  **13**](https://www.examtopics.com/exams/microsoft/az-203/view/2/#)

**Correct Answer:** *Explanation*
Step 1: Encrypt the on-premises VHD by using BitLocker without a TPM. Upload the VM to Azure Storage
Step 2: Run the Azure PowerShell command Set-AzureRMVMOSDisk
To use an existing disk instead of creating a new disk you can use the Set-AzureRMVMOSDisk command.
Example:
$osDiskName = $vmname+'_osDisk'
$osDiskCaching = 'ReadWrite'
$osDiskVhdUri = "https://$stoname.blob.core.windows.net/vhds/"+$vmname+"_os.vhd"
$vm = Set-AzureRmVMOSDisk -VM $vm -VhdUri $osDiskVhdUri -name $osDiskName -Create
Step 3: Run the Azure PowerShell command Set-AzureRmVMDiskEncryptionExtension
Use the Set-AzVMDiskEncryptionExtension cmdlet to enable encryption on a running IaaS virtual machine in Azure.
Incorrect:
Not TPM: BitLocker can work with or without a TPM. A TPM is a tamper resistant security chip on the system board that will hold the keys for encryption and check the integrity of the boot sequence and allows the most secure BitLocker implementation. A VM does not have a TPM.
References:
https://www.itprotoday.com/iaaspaas/use-existing-vhd-azurerm-vm

==~~Question #7*Topic 1*==~~

~~DRAG DROP -~~
~~You plan to create a Docker image that runs as ASP.NET Core application named ContosoApp. You have a setup script named setupScript.ps1 and a series of application files including ContosoApp.dll.~~
~~You need to create a Dockerfile document that meets the following requirements:~~
~~✑ Call setupScript.ps1 when the container is built.~~
~~✑ Run ContosoApp.dll when the container starts.~~
~~The Docker document must be created in the same folder where ContosoApp.dll and setupScript.ps1 are stored.~~
~~Which four commands should you use to develop the solution? To answer, move the appropriate commands from the list of commands to the answer area and arrange them in the correct order.~~
~~Select and Place:~~

~~[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/2/#) [  Discussion  **27**](https://www.examtopics.com/exams/microsoft/az-203/view/2/#)~~

~~**Correct Answer:** *Explanation*~~
~~Step 1: WORKDIR /apps/ContosoApp~~
~~Step 2: COPY ./-~~
~~The Docker document must be created in the same folder where ContosoApp.dll and setupScript.ps1 are stored.~~
~~Step 3: EXPOSE ./ContosApp/ /app/ContosoApp~~
~~Step 4: CMD powershell ./setupScript.ps1~~
~~ENTRYPOINT ["dotnet", "ContosoApp.dll"]~~
~~You need to create a Dockerfile document that meets the following requirements:~~
~~✑ Call setupScript.ps1 when the container is built.~~
~~✑ Run ContosoApp.dll when the container starts.~~
~~References:~~
~~https://docs.microsoft.com/en-us/azure/app-service/containers/tutorial-custom-docker-image~~

==Question #8*Topic 1*==

DRAG DROP -
You are creating a script that will run a large workload on an Azure Batch pool. Resources will be reused and do not need to be cleaned up after use.
You have the following parameters:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0002700003.png)
You need to write an Azure CLI script that will create the jobs, tasks, and the pool.
In which order should you arrange the commands to develop the solution? To answer, move the appropriate commands from the list of command segments to the answer area and arrange them in the correct order.
Select and Place:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/2/#) [  Discussion  **6**](https://www.examtopics.com/exams/microsoft/az-203/view/2/#)

**Correct Answer:** *Explanation*
Step 1: az batch pool create -
\# Create a new Linux pool with a virtual machine configuration. az batch pool create \
--id mypool \
--vm-size Standard_A1 \
--target-dedicated 2 \
--image canonical:ubuntuserver:16.04-LTS \
--node-agent-sku-id "batch.node.ubuntu 16.04"

Step 2: az batch job create -
\# Create a new job to encapsulate the tasks that are added.
az batch job create \
--id myjob \
--pool-id mypool

Step 3: az batch task create -
\# Add tasks to the job. Here the task is a basic shell command. az batch task create \
--job-id myjob \
--task-id task1 \
--command-line "/bin/bash -c 'printenv AZ_BATCH_TASK_WORKING_DIR'"
Step 4: for i in {1..$numberOfJobs} do
References:
https://docs.microsoft.com/bs-latn-ba/azure/batch/scripts/batch-cli-sample-run-job

==Question #9*Topic 1*==

HOTSPOT -
You are developing an Azure Function App by using Visual Studio. The app will process orders input by an Azure Web App. The web app places the order information into Azure Queue Storage.
You need to review the Azure Function App code shown below.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0002900001.png)
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0003000001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/3/#) [  Discussion  **10**](https://www.examtopics.com/exams/microsoft/az-203/view/3/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0003000002.png)*
Box 1: No -
ExpirationTime - The time that the message expires.
InsertionTime - The time that the message was added to the queue.

Box 2: Yes -
maxDequeueCount - The number of times to try processing a message before moving it to the poison queue. Default value is 5.

Box 3: Yes -
When there are multiple queue messages waiting, the queue trigger retrieves a batch of messages and invokes function instances concurrently to process them.
By default, the batch size is 16. When the number being processed gets down to 8, the runtime gets another batch and starts processing those messages. So the maximum number of concurrent messages being processed per function on one virtual machine (VM) is 24.

Box 4: Yes -
References:
https://docs.microsoft.com/en-us/azure/azure-functions/functions-bindings-storage-queue

==Question #10*Topic 1*==

DRAG DROP -
You are developing a Docker/Go using Azure App Service Web App for Containers. You plan to run the container in an App Service on Linux. You identify a
Docker container image to use.
None of your current resource groups reside in a location that supports Linux. You must minimize the number of resource groups required.
You need to create the application and perform an initial deployment.
Which three Azure CLI commands should you use to develop the solution? To answer, move the appropriate commands from the list of commands to the answer area and arrange them in the correct order.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0003200001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/3/#) [  Discussion  **9**](https://www.examtopics.com/exams/microsoft/az-203/view/3/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0003300001.png)*
You can host native Linux applications in the cloud by using Azure Web Apps. To create a Web App for Containers, you must run Azure CLI commands that create a group, then a service plan, and finally the web app itself.

Step 1: az group create -
In the Cloud Shell, create a resource group with the az group create command.
Step 2: az appservice plan create
In the Cloud Shell, create an App Service plan in the resource group with the az appservice plan create command.

Step 3: az webapp create -
In the Cloud Shell, create a web app in the myAppServicePlan App Service plan with the az webapp create command. Don't forget to replace with a unique app name, and <docker-ID> with your Docker ID.
References:
https://docs.microsoft.com/mt-mt/azure/app-service/containers/quickstart-docker-go?view=sql-server-ver15

==Question #11*Topic 1*==

DRAG DROP -
You are preparing to deploy an Azure virtual machine (VM)-based application. The VMs that run the application have the following requirements:
✑ When a VM is provisioned the firewall must be automatically configured before it can access Azure resources
✑ Supporting services must be installed by using an Azure PowerShell script that is stored in Azure Storage
You need to ensure that the requirements are met.
Which features should you use? To answer, drag the appropriate features to the correct requirements. Each feature may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0003400003.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/3/#) [  Discussion  **9**](https://www.examtopics.com/exams/microsoft/az-203/view/3/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0003500001.jpg)*
References:
https://docs.microsoft.com/en-us/azure/automation/automation-hybrid-runbook-worker https://docs.microsoft.com/en-us/azure/virtual-machines/windows/run-command

## Topic 2 - Question Set 2

Question #1*Topic 2*

DRAG DROP -
Fourth Coffee has an ASP.NET Core web app that runs in Docker. The app is mapped to the www.fourthcoffee.com domain.
Fourth Coffee is migrating this application to Azure.
You need to provision an App Service Web App to host this docker image and map the custom domain to the App Service web app.
A resource group named FourthCoffeePublicWebResourceGroup has been created in the WestUS region that contains an App Service Plan named
AppServiceLinuxDockerPlan.
Which order should the CLI commands be used to develop the solution? To answer, move all of the Azure CLI command from the list of commands to the answer area and arrange them in the correct order.
Select and Place:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/3/#) [  Discussion  **22**](https://www.examtopics.com/exams/microsoft/az-203/view/3/#)

**Correct Answer:** *Explanation*
Step 1: #bin/bash -
The appName is used when the webapp-name is created in step 2.
Step 2: az webapp config hostname add
The webapp-name is used when the webapp is created in step 3.

Step 3: az webapp create -
Create a web app. In the Cloud Shell, create a web app in the myAppServicePlan App Service plan with the az webapp create command.
Step : az webapp confing container set
In Create a web app, you specified an image on Docker Hub in the az webapp create command. This is good enough for a public image. To use a private image, you need to configure your Docker account ID and password in your Azure web app.
In the Cloud Shell, follow the az webapp create command with az webapp config container set.
References:
https://docs.microsoft.com/en-us/azure/app-service/containers/tutorial-custom-docker-image

==Question #2*Topic 2*==

You develop a serverless application using several Azure Functions. These functions connect to data from within the code.
You want to configure tracing for an Azure Function App project.
You need to change configuration settings in the host.json file.
Which tool should you use?

- A. Visual Studio
- B. Azure portal
- C. Azure PowerShell
- D. Azure Functions Core Tools (Azure CLI)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/4/#) [  Discussion  **16**](https://www.examtopics.com/exams/microsoft/az-203/view/4/#)

**Correct Answer:** *B*
The function editor built into the Azure portal lets you update the function.json file and the code file for a function. The host.json file, which contains some runtime- specific configurations, is in the root folder of the function app.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0005500001.png)
References:
https://docs.microsoft.com/en-us/azure/azure-functions/functions-reference#fileupdate

==Question #3*Topic 2*==

You are developing a mobile instant messaging app for a company.
The mobile app must meet the following requirements:
✑ Support offline data sync.
✑ Update the latest messages during normal sync cycles.
You need to implement Offline Data Sync.
Which two actions should you perform? Each correct answer presents part of the solution.
NOTE: Each correct selection is worth one point.

- A. Retrieve records from Offline Data Sync on every call to the PullAsync method.
- B. Retrieve records from Offline Data Sync using an Incremental Sync.
- C. Push records to Offline Data Sync using an Incremental Sync.
- D. Return the updatedAt column from the Mobile Service Backend and implement sorting by using the column.
- E. Return the updatedAt column from the Mobile Service Backend and implement sorting by the message id.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/4/#) [  Discussion  **13**](https://www.examtopics.com/exams/microsoft/az-203/view/4/#)

**Correct Answer:** *BE*
B: Incremental Sync: the first parameter to the pull operation is a query name that is used only on the client. If you use a non-null query name, the Azure Mobile
SDK performs an incremental sync. Each time a pull operation returns a set of results, the latest updatedAt timestamp from that result set is stored in the SDK local system tables. Subsequent pull operations retrieve only records after that timestamp.
E (not D): To use incremental sync, your server must return meaningful updatedAt values and must also support sorting by this field. However, since the SDK adds its own sort on the updatedAt field, you cannot use a pull query that has its own orderBy clause.
References:
https://docs.microsoft.com/en-us/azure/app-service-mobile/app-service-mobile-offline-data-sync

Question #4*Topic 2*

DRAG DROP -
You are developing a solution for a hospital to support the following use cases:
✑ The most recent patient status details must be retrieved even if multiple users in different locations have updated the patient record.
✑ Patient health monitoring data retrieved must be the current version or the prior version.
✑ After a patient is discharged and all charges have been assessed, the patient billing record contains the final charges.
You provision a Cosmos DB NoSQL database and set the default consistency level for the database account to Strong. You set the value for Indexing Mode to
Consistent.
You need to minimize latency and any impact to the availability of the solution. You must override the default consistency level at the query level to meet the required consistency guarantees for the scenarios.
Which consistency levels should you implement? To answer, drag the appropriate consistency levels to the correct requirements. Each consistency level may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0005700004.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/4/#) [  Discussion  **9**](https://www.examtopics.com/exams/microsoft/az-203/view/4/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0005700005.png)*
Box 1: Strong -
Strong: Strong consistency offers a linearizability guarantee. The reads are guaranteed to return the most recent committed version of an item. A client never sees an uncommitted or partial write. Users are always guaranteed to read the latest committed write.

Box 2: Bounded staleness -
Bounded staleness: The reads are guaranteed to honor the consistent-prefix guarantee. The reads might lag behind writes by at most "K" versions (that is
"updates") of an item or by "t" time interval. When you choose bounded staleness, the "staleness" can be configured in two ways:
The number of versions (K) of the item
The time interval (t) by which the reads might lag behind the writes

Box 3: Eventual -
Eventual: There's no ordering guarantee for reads. In the absence of any further writes, the replicas eventually converge.
Incorrect Answers:
Consistent prefix: Updates that are returned contain some prefix of all the updates, with no gaps. Consistent prefix guarantees that reads never see out-of-order writes.
References:
https://docs.microsoft.com/en-us/azure/cosmos-db/consistency-levels

Question #5*Topic 2*

HOTSPOT -
You are creating a CLI script that creates an Azure web app related services in Azure App Service. The web app uses the following variables:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0005800001.png)
You need to automatically deploy code from GitHub to the newly created web app.
How should you complete the script? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/4/#) [  Discussion  **6**](https://www.examtopics.com/exams/microsoft/az-203/view/4/#)

**Correct Answer:** *Explanation*
Box 1: az appservice plan create
The azure group creates command successfully returns JSON result. Now we can use resource group to create a azure app service plan

Box 2: az webapp create -
Create a new web app..

Box 3: --plan $webappname -
..with the serviceplan we created in step.

Box 4: az webapp deployment -
Continuous Delivery with GitHub. Example:
az webapp deployment source config --name firstsamplewebsite1 --resource-group websites--repo-url $gitrepo --branch master --git-token $token
Box 5: --repo-url $gitrepo --branch master --manual-integration
References:
https://medium.com/@satish1v/devops-your-way-to-azure-web-apps-with-azure-cli-206ed4b3e9b1

Question #6*Topic 2*

HOTSPOT -
You are developing an Azure Web App. You configure TLS mutual authentication for the web app.
You need to validate the client certificate in the web app. To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0006000001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/5/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-203/view/5/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0006100001.jpg)*
Accessing the client certificate from App Service.
If you are using ASP.NET and configure your app to use client certificate authentication, the certificate will be available through the HttpRequest.ClientCertificate property. For other application stacks, the client cert will be available in your app through a base64 encoded value in the "X-ARR-ClientCert" request header. Your application can create a certificate from this value and then use it for authentication and authorization purposes in your application.
References:
https://docs.microsoft.com/en-us/azure/app-service/app-service-web-configure-tls-mutual-auth

Question #7*Topic 2*

DRAG DROP -
You are developing a .NET Core model-view controller (MVC) application hosted on Azure for a health care system that allows providers access to their information.
You develop the following code:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0006200001.png)
You define a role named SysAdmin.
You need to ensure that the application meets the following authorization requirements:
✑ Allow the ProviderAdmin and SysAdmin roles access to the Partner controller regardless of whether the user holds an editor claim of partner.
✑ Limit access to the Manage action of the controller to users with an editor claim of partner who are also members of the SysAdmin role.
How should you complete the code? To answer, drag the appropriate code segments to the correct locations. Each code segment may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/5/#) [  Discussion  **21**](https://www.examtopics.com/exams/microsoft/az-203/view/5/#)

**Correct Answer:** *Explanation*
Box 1:
Allow the ProviderAdmin and SysAdmin roles access to the Partner controller regardless of whether the user holds an editor claim of partner.
Box 2:
Limit access to the Manage action of the controller to users with an editor claim of partner who are also members of the SysAdmin role.

Question #8*Topic 2*

DRAG DROP -
You manage several existing Logic Apps.
You need to change definitions, add new logic, and optimize these apps on a regular basis.
What should you use? To answer, drag the appropriate tools to the correct functionalities. Each tool may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0006300001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/5/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-203/view/5/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0006400001.jpg)*
Box 1: Enterprise Integration Pack
After you create an integration account that has partners and agreements, you are ready to create a business to business (B2B) workflow for your logic app with the Enterprise Integration Pack.

Box 2: Code View Editor -
To work with logic app definitions in JSON, open the Code View editor when working in the Azure portal or in Visual Studio, or copy the definition into any editor that you want.

Box 3: Logical Apps Designer -
You can build your logic apps visually with the Logic Apps Designer, which is available in the Azure portal through your browser and in Visual Studio.
References:
https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-enterprise-integration-b2b https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-author-definitions https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-overview

Question #9*Topic 2*

You are implementing an Azure API app that uses built-in authentication and authorization functionality.
All app actions must be associated with information about the current user.
You need to retrieve the information about the current user.
What are two ways to achieve the goal? Each correct answer presents a complete solution.
NOTE: Each correct selection is worth one point.

- A. HTTP headers
- B. environment variables
- C. /.auth/me HTTP endpoint
- D. /.auth/login endpoint

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/5/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-203/view/5/#)

**Correct Answer:** *AC*
A: After App Service Authentication has been configured, users trying to access your API are prompted to sign in with their organizational account that belongs to the same Azure AD as the Azure AD application used to secure the API. After signing in, you are able to access the information about the current user through the
HttpContext.Current.User property.
C: While the server code has access to request headers, client code can access GET /.auth/me to get the same access tokens (
References:
https://docs.microsoft.com/en-us/azure/app-service/app-service-web-tutorial-auth-aad https://docs.microsoft.com/en-us/sharepoint/dev/spfx/web-parts/guidance/connect-to-api-secured-with-aad

Question #10*Topic 2*

HOTSPOT -
You are developing a back-end Azure App Service that scales based on the number of messages contained in a Service Bus queue.
A rule already exists to scale up the App Service when the average queue length of unprocessed and valid queue messages is greater than 1000.
You need to add a new rule that will continuously scale down the App Service as long as the scale up condition is not met.
How should you configure the Scale rule? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/6/#) [  Discussion  **15**](https://www.examtopics.com/exams/microsoft/az-203/view/6/#)

**Correct Answer:** *Explanation*
Box 1: Service bus queue -
You are developing a back-end Azure App Service that scales based on the number of messages contained in a Service Bus queue.

Box 2: ActiveMessage Count -
ActiveMessageCount: Messages in the queue or subscription that are in the active state and ready for delivery.

Box 3: Count -

Box 4: Less than or equal to -
You need to add a new rule that will continuously scale down the App Service as long as the scale up condition is not met.
Box 5: Decrease count by

Question #11*Topic 2*

HOTSPOT -
A company is developing a Java web app. The web app code is hosted in a GitHub repository located at https://github.com/Contoso/webapp.
The web app must be evaluated before it is moved to production. You must deploy the initial code release to a deployment slot named staging.
You need to create the web app and deploy the code.
How should you complete the commands? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/6/#) [  Discussion  **5**](https://www.examtopics.com/exams/microsoft/az-203/view/6/#)

**Correct Answer:** *Explanation*
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
References:
https://docs.microsoft.com/en-us/azure/app-service/scripts/cli-deploy-staging-environment

Question #12*Topic 2*

DRAG DROP -
You have a web app named MainApp. You are developing a triggered App Service background task by using the WebJobs SDK. This task automatically invokes a function code whenever any new data is received in a queue.
You need to configure the services.
Which service should you use for each scenario? To answer, drag the appropriate services to the correct scenarios. Each service may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/6/#) [  Discussion  **18**](https://www.examtopics.com/exams/microsoft/az-203/view/6/#)

**Correct Answer:** *Explanation*
Box 1: WebJobs -
A WebJob is a simple way to set up a background job, which can process continuously or on a schedule. WebJobs differ from a cloud service as it gives you get less fine-grained control over your processing environment, making it a more true PaaS service.

Box 2: Flow -
Incorrect Answers:
Azure Logic Apps is a cloud service that helps you schedule, automate, and orchestrate tasks, business processes, and workflows when you need to integrate apps, data, systems, and services across enterprises or organizations. Logic Apps simplifies how you design and build scalable solutions for app integration, data integration, system integration, enterprise application integration (EAI), and business-to-business (B2B) communication, whether in the cloud, on premises, or both.
References:
https://code.msdn.microsoft.com/Processing-Service-Bus-84db27b4

Question #13*Topic 2*

HOTSPOT -
A company is developing a mobile app for field service employees using Azure App Service Mobile Apps as the backend.
The company's network connectivity varies throughout the day. The solution must support offline use and synchronize changes in the background when the app is online app.
You need to implement the solution.
How should you complete the code segment? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/6/#) [  Discussion  **5**](https://www.examtopics.com/exams/microsoft/az-203/view/6/#)

**Correct Answer:** *Explanation*
Box 1: var todoTable = client GetSyncTable<TodoItem>()
To setup offline access, when connecting to your mobile service, use the method GetSyncTable instead of GetTable (example):
IMobileServiceSyncTable todoTable = App.MobileService.GetSyncTable(); /
Box 2: await todoTable.PullAsync("allTodoItems",todo.Table.CreateQuery());
Your app should now use IMobileServiceSyncTable (instead of IMobileServiceTable) for CRUD operations. This will save changes to the local database and also keep a log of the changes. When the app is ready to synchronize its changes with the Mobile Service, use the methods PushAsync and PullAsync (example): await App.MobileService.SyncContext.PushAsync(); await todoTable.PullAsync();
References:
https://azure.microsoft.com/es-es/blog/offline-sync-for-mobile-services/

Question #14*Topic 2*

A company is developing a solution that allows smart refrigerators to send temperature information to a central location.
The solution must receive and store messages until they can be processed. You create an Azure Service Bus instance by providing a name, pricing tier, subscription, resource group, and location.
You need to complete the configuration.
Which Azure CLI or PowerShell command should you run?
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0006900001.png)
A.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0007000001.png)
B.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0007000002.png)
C.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0007000003.png)
D.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/7/#) [  Discussion  **34**](https://www.examtopics.com/exams/microsoft/az-203/view/7/#)

**Correct Answer:** *B*
\# Create a Service Bus messaging namespace with a unique name. Example: namespaceName=myNameSpace$RANDOM az servicebus namespace create --resource-group $resourceGroupName --name $namespaceName --location eastus
References:
https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-quickstart-cli

Question #15*Topic 2*

You are a developer for a SaaS company that offers many web services.
All web services for the company must meet the following requirements:
✑ Use API Management to access the services
✑ Use OpenID Connect for authentication.

Prevent anonymous usage -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0007000006.png)
A recent security audit found that several web services can be called without any authentication.
Which API Management policy should you implement?

- A. validate-jwt
- B. jsonp
- C. authentication-certificate
- D. check-header

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/7/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-203/view/7/#)

**Correct Answer:** *A*
Add the validate-jwt policy to validate the OAuth token for every incoming request.
Incorrect Answers:
B: The jsonp policy adds JSON with padding (JSONP) support to an operation or an API to allow cross-domain calls from JavaScript browser-based clients.
JSONP is a method used in JavaScript programs to request data from a server in a different domain. JSONP bypasses the limitation enforced by most web browsers where access to web pages must be in the same domain.
JSONP - Adds JSON with padding (JSONP) support to an operation or an API to allow cross-domain calls from JavaScript browser-based clients.
References:
https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-protect-backend-with-aad

Question #16*Topic 2*

DRAG DROP -
A company backs up all manufacturing data to Azure Blob Storage. Admins move blobs from hot storage to archive tier storage every month.
You must automatically move blocks to Archive tier after they have not been accessed for 180 days. The path for any item that is not archived must be placed in an existing queue. This operation must be performed automatically once a month. You set the value of TierAgeInDays to 180.
How should you configure the Logic App? To answer, drag the appropriate triggers or action blocks to the correct trigger or action slots. Each trigger or action block may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0007200001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/7/#) [  Discussion  **8**](https://www.examtopics.com/exams/microsoft/az-203/view/7/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0007300001.jpg)*
Box 1: Recurrence -

Box 2: Insert Entity -

Box 3 (if true): Tier Blob -
Box 4: (if false):
Leave blank.
References:
https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-perform-data-operations

Question #17*Topic 2*

You develop a website. You plan to host the website in Azure. You expect the website to experience high traffic volumes after it is published.
You must ensure that the website remains available and responsive while minimizing cost.
You need to deploy the website.
What should you do?

- A. Deploy the website to a virtual machine. Configure the virtual machine to automatically scale when the CPU load is high.
- B. Deploy the website to an App Service that uses the Shared service tier. Configure the App service plan to automatically scale when the CPU load is high.
- C. Deploy the website to an App Service that uses the Standard service tier. Configure the App service plan to automatically scale when the CPU load is high.
- D. Deploy the website to a virtual machine. Configure a Scale Set to increase the virtual machine instance count when the CPU load is high.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/7/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-203/view/7/#)

**Correct Answer:** *C*
Windows Azure Web Sites (WAWS) offers 3 modes: Standard, Free, and Shared.
Standard mode carries an enterprise-grade SLA (Service Level Agreement) of 99.9% monthly, even for sites with just one instance.
Standard mode runs on dedicated instances, making it different from the other ways to buy Windows Azure Web Sites.
Incorrect Answers:
B: Shared and Free modes do not offer the scaling flexibility of Standard, and they have some important limits.
Shared mode, just as the name states, also uses shared Compute resources, and also has a CPU limit. So, while neither Free nor Shared is likely to be the best choice for your production environment due to these limits.

Question #18*Topic 2*

HOTSPOT -
A company is developing a Node.js web app. The web app code is hosted in a GitHub repository located at https://github.com/TailSpinToys/weapp.
The web app must be reviewed before it is moved to production. You must deploy the initial code release to a deployment slot named review.
You need to create the web app and deploy the code.
How should you complete the commands? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0007500001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/8/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-203/view/8/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0007600001.jpg)*
The New-AzResourceGroup cmdlet creates an Azure resource group.
The New-AzAppServicePlan cmdlet creates an Azure App Service plan in a given location
The New-AzWebApp cmdlet creates an Azure Web App in a given a resource group
The New-AzWebAppSlot cmdlet creates an Azure Web App slot.
References:
https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azresourcegroup?view=azps-2.3.2 https://docs.microsoft.com/en-us/powershell/module/az.websites/new-azappserviceplan?view=azps-2.3.2 https://docs.microsoft.com/en-us/powershell/module/az.websites/new-azwebapp?view=azps-2.3.2 https://docs.microsoft.com/en-us/powershell/module/az.websites/new-azwebappslot?view=azps-2.3.2

Question #19*Topic 2*

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
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0007800001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/8/#) [  Discussion  **7**](https://www.examtopics.com/exams/microsoft/az-203/view/8/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0007900001.jpg)*
Number of VM instances: 4 -
You are not charged extra for deployment slots.

Pricing tier: Isolated -
The App Service Environment (ASE) is a powerful feature offering of the Azure App Service that gives network isolation and improved scale capabilities. It is essentially a deployment of the Azure App Service into a subnet of a customer's Azure Virtual Network (VNet).
References:
https://azure.microsoft.com/sv-se/blog/announcing-app-service-isolated-more-power-scale-and-ease-of-use/

## Topic 3 - Question Set 3

==Question #1*Topic 3*==

HOTSPOT -
A company develops a series of mobile games. All games use a single leaderboard service.
You have the following requirements:
✑ Code should be scalable and allow for growth.
✑ Each record must consist of a playedId, gameId, score, and time played.
✑ When users reach a new high score, the system will save the new score using the SaveScore function below.
✑ Each game is assigned and Id based on the series title.
You plan to store customer information in an Azure Cosmos database. The following data already exists in the database:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0010300005.png)
You develop the following code to save scores in the database. (line numbers are included for reference only.)
<img src="C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0010300006.jpg" alt="img" style="zoom:67%;" />
You develop the following code to query the database. (line numbers are included for reference only.)
<img src="C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0010400001.jpg" alt="img" style="zoom:67%;" />
For each of the following statements, select Yes if the statement is true. Otherwise, select No.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/8/#) [  Discussion  **15**](https://www.examtopics.com/exams/microsoft/az-203/view/8/#)

**Correct Answer:** *Explanation*
Box 1: Yes -
Code for CosmosDB, example:
// Parse the connection string and return a reference to the storage account.
CloudStorageAccount storageAccount = CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("StorageConnectionString"));
// Create the table client.
CloudTableClient tableClient = storageAccount.CreateCloudTableClient();
// Retrieve a reference to the table.
CloudTable table = tableClient.GetTableReference("people");
// Create the TableOperation object that inserts the customer entity.
TableOperation insertOperation = TableOperation.Insert(customer1);

Box 2: No -
A new record will always be added as TableOperation.Insert is used, instead of TableOperation.InsertOrReplace.

Box 3: No -
No partition key is used.

Box 4: Yes -
References:
https://docs.microsoft.com/en-us/azure/cosmos-db/table-storage-how-to-use-dotnet

Question #2*Topic 3*

HOTSPOT -
You are working for a company that designs mobile applications. They maintain a server where player records are assigned to their different games. The tracking system is new and in development.
The application uses Entity Framework to connect to an Azure Database. The database holds a Player table and Game table.
When adding a player, the code should insert a new player record, and add a relationship between an existing game record and the new player record.
The application will call CreatePlayerWithGame with the correct gameIdand the playerId to start the process. (Line numbers are included for reference only.)
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0010600001.png)
For each of the following statements, select Yes if the statement is true. Otherwise, select No.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/8/#) [  Discussion  **32**](https://www.examtopics.com/exams/microsoft/az-203/view/8/#)

**Correct Answer:** *Explanation*
Box 1: Yes -

Box 2: No -

Box 3: Yes -

Box 4: No -
Many-to-many relationships without an entity class to represent the join table are not yet supported. However, you can represent a many-to-many relationship by including an entity class for the join table and mapping two separate one-to-many relationships. protected override void OnModelCreating(ModelBuilder modelBuilder)
{
modelBuilder.Entity<PostTag>()
.HasKey(t => new { t.PostId, t.TagId });
modelBuilder.Entity<PostTag>()
.HasOne(pt => pt.Post)
.WithMany(p => p.PostTags)
.HasForeignKey(pt => pt.PostId);
modelBuilder.Entity<PostTag>()
.HasOne(pt => pt.Tag)
.WithMany(t => t.PostTags)
.HasForeignKey(pt => pt.TagId);
}
}

==Question #3*Topic 3*==

You use Azure Table storage to store customer information for an application. The data contains customer details and is partitioned by last name.
You need to create a query that returns all customers with the last name Smith.
Which code segment should you use?

- A. TableQuery.GenerateFilterCondition("PartitionKey", Equals, "Smith")
- B. TableQuery.GenerateFilterCondition("LastName", Equals, "Smith")
- ==C. TableQuery.GenerateFilterCondition("PartitionKey", QueryComparisons.Equal, "Smith")==
- D. TableQuery.GenerateFilterCondition("LastName", QueryComparisons.Equal, "Smith")

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/9/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-203/view/9/#)

**Correct Answer:** *C*
Retrieve all entities in a partition. The following code example specifies a filter for entities where 'Smith' is the partition key. This example prints the fields of each entity in the query results to the console.
Construct the query operation for all customer entities where PartitionKey="Smith".
TableQuery<CustomerEntity> query = new TableQuery<CustomerEntity>().Where(TableQuery.GenerateFilterCondition("PartitionKey", QueryComparisons.Equal, "Smith"));
References:
https://docs.microsoft.com/en-us/azure/cosmos-db/table-storage-how-to-use-dotnet

Question #4*Topic 3*

HOTSPOT -
You are developing an app that manages users for a video game. You plan to store the region, email address, and phone number for the player. Some players may not have a phone number. The player's region will be used to load-balance data.
Data for the app must be stored in Azure Table Storage.
You need to develop code to retrieve data for an individual player.
How should you complete the code? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/9/#) [  Discussion  **9**](https://www.examtopics.com/exams/microsoft/az-203/view/9/#)

**Correct Answer:** *Explanation*
Box 1: region -
The player's region will be used to load-balance data.
Choosing the PartitionKey.
The core of any table's design is based on its scalability, the queries used to access it, and storage operation requirements. The PartitionKey values you choose will dictate how a table will be partitioned and the type of queries that can be used. Storage operations, in particular inserts, can also affect your choice of
PartitionKey values.

Box 2: email -
Not phone number some players may not have a phone number.

Box 3: CloudTable -
Box 4 : TableOperation query =..

Box 5: TableResult -
References:
https://docs.microsoft.com/en-us/rest/api/storageservices/designing-a-scalable-partitioning-strategy-for-azure-table-storage

Question #5*Topic 3*

HOTSPOT -
You are developing a data storage solution for a social networking app.
The solution requires a mobile app that stores user information using Azure Table Storage.
You need to develop code that can insert multiple sets of user information.
How should you complete the code? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/9/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-203/view/9/#)

**Correct Answer:** *Explanation*
Box 1, Box 2: TableBatchOperation
Create the batch operation.
TableBatchOperation op = new TableBatchOperation();

Box 3: ExecuteBatch -
/ Execute the batch operation.
table.ExecuteBatch(op);
Note: You can insert a batch of entities into a table in one write operation. Some other notes on batch operations:
You can perform updates, deletes, and inserts in the same single batch operation.
A single batch operation can include up to 100 entities.
All entities in a single batch operation must have the same partition key.
While it is possible to perform a query as a batch operation, it must be the only operation in the batch.
References:
https://docs.microsoft.com/en-us/azure/cosmos-db/table-storage-how-to-use-dotnet

Question #6*Topic 3*

You must implement Application Insights instrumentation capabilities utilizing the Azure Mobile Apps SDK to provide meaningful analysis of user interactions with a molbile app.
You need to capture the data required to implement the Usage Analytics feature of Application Insights.
Which three data values should you capture? Each correct answer presents part of the solution.
NOTE: Each correct selection is worth one point.

- A. Trace
- B. Session Id
- C. Exception
- D. User Id
- E. Events

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/9/#) [  Discussion  **13**](https://www.examtopics.com/exams/microsoft/az-203/view/9/#)

**Correct Answer:** *ADE*
Application Insights is a service for monitoring the performance and usage of your apps. This module allows you to send telemetry of various kinds (events, traces, etc.) to the Application Insights service where your data can be visualized in the Azure Portal.
Application Insights manages the ID of a session for you.
References:
https://github.com/microsoft/ApplicationInsights-Android

Question #7*Topic 3*

DRAG DROP -
You are implementing an order processing system. A point of sale application publishes orders to topics in an Azure Service Bus queue. The Label property for the topic includes the following data:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0011100001.png)
The system has the following requirements for subscriptions:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0011200001.png)
You need to implement filtering and maximize throughput while evaluating filters.
Which filter types should you implement? To answer, drag the appropriate filter types to the correct subscription. Each filter type may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/10/#) [  Discussion  **25**](https://www.examtopics.com/exams/microsoft/az-203/view/10/#)

**Correct Answer:** *Explanation*
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
References:
https://docs.microsoft.com/en-us/azure/service-bus-messaging/topic-filters

Question #8*Topic 3*

DRAG DROP -
Your company has several websites that use a company logo image. You use Azure Content Delivery Network (CDN) to store the static image.
You need to determine the correct process of how the CDN and the Point of Presence (POP) server will distribute the image and list the items in the correct order.
In which order do the actions occur? To answer, move all actions from the list of actions to the answer area and arrange them in the correct order.
Select and Place:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/10/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-203/view/10/#)

**Correct Answer:** *Explanation*
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
References:
https://docs.microsoft.com/en-us/azure/cdn/cdn-overview

Question #9*Topic 3*

You develop a solution that uses an Azure SQL Database to store user information for a mobile app.
The app stores sensitive information about users.
You need to hide sensitive information from developers that query the data for the mobile app.
Which three items must you identify when configuring dynamic data masking? Each correct answer presents a part of the solution.
NOTE: Each correct selection is worth one point.

- A. Column
- B. Table
- C. Trigger
- D. Index
- E. Schema

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/10/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-203/view/10/#)

**Correct Answer:** *ABE*
In the Dynamic Data Masking configuration page, you may see some database columns that the recommendations engine has flagged for masking. In order to accept the recommendations, just click Add Mask for one or more columns and a mask is created based on the default type for this column. You can change the masking function by clicking on the masking rule and editing the masking field format to a different format of your choice.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0011600001.png)
References:
https://docs.microsoft.com/en-us/azure/sql-database/sql-database-dynamic-data-masking-get-started-portal

Question #10*Topic 3*

HOTSPOT -
You store customer information in an Azure Cosmos DB. The following data already exists in the database:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0011700001.png)
You develop the following code. (Line numbers are included for reference only.)
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0011700002.png)
For each of the following statements, select Yes if the statement is true. Otherwise, select No.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0011800001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/10/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-203/view/10/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0011800002.jpg)*
Box 1: No -
Only the second row is returned thank to the Email filter condition.

Box 2: Yes -
This also returns the second row.

Question #11*Topic 3*

A company uses Azure SQL Database to store data for an app. The data includes sensitive information.
You need to implement measures that allow only members of the managers group to see sensitive information.
Which two actions should you perform? Each correct answer presents part of the solution.
NOTE: Each correct selection is worth one point.

- A. Include the managers group.
- B. Exclude the managers group.
- C. Exclude the administrators group.
- D. Navigate to the following URL: ![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0011900001.png)
- E. Run the following Azure PowerShell command: ![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0011900002.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/11/#) [  Discussion  **15**](https://www.examtopics.com/exams/microsoft/az-203/view/11/#)

**Correct Answer:** *BE*
Dynamic data masking helps prevent unauthorized access to sensitive data by enabling customers to designate how much of the sensitive data to reveal with minimal impact on the application layer.
SQL users excluded from masking - A set of SQL users or AAD identities that get unmasked data in the SQL query results.
Note: The New-AzureRmSqlDatabaseDataMaskingRule cmdlet creates a data masking rule for an Azure SQL database.
References:
https://docs.microsoft.com/en-us/powershell/module/azurerm.sql/new-azurermsqldatabasedatamaskingrule?view=azurermps-6.13.0

Question #12*Topic 3*

HOTSPOT -
You are developing a ticket reservation system for an airline.
The storage solution for the application must meet the following requirements:
✑ Ensure at least 99/99% availability and provide low latency.
✑ Accept reservations even in network outages or other unforseen failures
✑ Process reservations in the exact sequence as reservation are submitted to minimize overbooking or selling the same seat to multiple travelers.
✑ Allow simultaneous and out-of-order reservations with a maximum five-second tolerance window.
You provision a resource group named airlineResourceGroup in the Azure South-Central US region.
You need to provision a SQL API Cosmos DB account to support the app.
How should you complete the Azure CLI commands? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/11/#) [  Discussion  **15**](https://www.examtopics.com/exams/microsoft/az-203/view/11/#)

**Correct Answer:** *Explanation*
Box 1: Strong -
Strong consistency offers a linearizability guarantee. The reads are guaranteed to return the most recent committed version of an item. A client never sees an uncommitted or partial write. Users are always guaranteed to read the latest committed write.
" Process reservations in the exact sequence as reservation are submitted to minimize overbooking or selling the same seat to multiple travelers."
Box 2: Enable-automatic-failover
For multi-region Cosmos accounts that are configured with a single-write region, enable automatic-failover by using Azure CLI or Azure portal. After you enable automatic failover, whenever there is a regional disaster, Cosmos DB will automatically failover your account.
" Accept reservations even in network outages or other unforseen failures"

Box 3: southcentralus -
" You provision a resource group named airlineResourceGroup in the Azure South-Central US region."
References:
https://docs.microsoft.com/en-us/azure/cosmos-db/consistency-levels https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/cosmos-db/high-availability.md

Question #13*Topic 3*

You develop an app that allows users to upload photos and videos to Azure storage. The app uses a storage REST API call to upload the media to a blob storage account named Account1. You have blob storage containers named Container1 and Container2.
Uploading of videos occurs on an irregular basis.
You need to copy specific blobs from Container1 to Container2 in real time when specific requirements are met, excluding backup blob copies.
What should you do?

- A. Download the blob to a virtual machine and then upload the blob to Container2.
- B. Run the Azure PowerShell command Start-AzureStorageBlobCopy.
- C. Copy blobs to Container2 by using the Put Blob operation of the Blob Service REST API.
- D. Use AzCopy with the Snapshot switch blobs to Container2.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/11/#) [  Discussion  **7**](https://www.examtopics.com/exams/microsoft/az-203/view/11/#)

**Correct Answer:** *B*
The Start-AzureStorageBlobCopy cmdlet starts to copy a blob.

Example 1: Copy a named blob -
C:\PS>Start-AzureStorageBlobCopy -SrcBlob "ContosoPlanning2015" -DestContainer "ContosoArchives" -SrcContainer "ContosoUploads"
This command starts the copy operation of the blob named ContosoPlanning2015 from the container named ContosoUploads to the container named
ContosoArchives.
References:
https://docs.microsoft.com/en-us/powershell/module/azure.storage/start-azurestorageblobcopy?view=azurermps-6.13.0

Question #14*Topic 3*

HOTSPOT -
You have an app that stores player scores for an online game. The app stores data in Azure tables using a class named PlayerScore as the table entity. The table is populated with 100,000 records.
You are reviewing the following section of code that is intended to retrieve 20 records where the player score exceeds 15,000. (Line numbers are included for reference only.)
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0012200001.png)
You have the following code. (Line numbers are included for reference only.)
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0012300001.png)
You store customer information in an Azure Cosmos database. The following data already exists in the database:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0012300002.png)
You develop the following code. (Line numbers are included for reference only.)
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0012300003.png)
For each of the following statements, select Yes if the statement is true. Otherwise, select No.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/11/#) [  Discussion  **20**](https://www.examtopics.com/exams/microsoft/az-203/view/11/#)

**Correct Answer:** *Explanation*
Box 1: No -

Box 2: Yes -
The TableQuery.Take method defines the upper bound for the number of entities the query returns.
Example:
query.Take(10);

Box 3: Yes -

Box 4: Yes -
References:
https://www.vkinfotek.com/azureqa/how-do-i-query-azure-table-storage-using-tablequery-class.html

Question #15*Topic 3*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution. Determine whether the solution meets the stated goals.
You are developing and deploying several ASP.Net web applications to Azure App Service. You plan to save session state information and HTML output. You must use a storage mechanism with the following requirements:
✑ Share session state across all ASP.NET web applications
✑ Support controlled, concurrent access to the same session state data for multiple readers and a single writer
✑ Save full HTTP responses for concurrent requests
You need to store the information.
Proposed Solution: Deploy and configure an Azure Database for PostgreSQL. Update the web applications.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/12/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-203/view/12/#)

**Correct Answer:** *B*

Question #16*Topic 3*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution. Determine whether the solution meets the stated goals.
You are developing and deploying several ASP.Net web applications to Azure App Service. You plan to save session state information and HTML output. You must use a storage mechanism with the following requirements:
✑ Share session state across all ASP.NET web applications
✑ Support controlled, concurrent access to the same session state data for multiple readers and a single writer
✑ Save full HTTP responses for concurrent requests
You need to store the information.
Proposed Solution: Deploy and configure Azure Cache for Redis. Update the web applications.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/12/#) [  Discussion  **13**](https://www.examtopics.com/exams/microsoft/az-203/view/12/#)

**Correct Answer:** *B*

Question #17*Topic 3*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this question, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure solution to collect point-of-sale (POS) device data from 2,000 stores located throughout the world. A single device can produce 2 megabytes (MB) of data every 24 hours. Each store location has one to five devices that send data.
You must store the device in Azure Blob storage. Device data must be correlated based on a device identifier. Additional stores are expected to open in the future.
You need to implement a solution to receive the device data.
Solution: Provision an Azure Event Hub. Configure the machine identifier as the partition key and enable capture.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/12/#) [  Discussion  **11**](https://www.examtopics.com/exams/microsoft/az-203/view/12/#)

**Correct Answer:** *A*
References:
https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-programming-guide

Question #18*Topic 3*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this question, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure solution to collect point-of-sale (POS) device data from 2,000 stores located throughout the world. A single device can produce 2 megabytes (MB) of data every 24 hours. Each store location has one to five devices that send data.
You must store the device in Azure Blob storage. Device data must be correlated based on a device identifier. Additional stores are expected to open in the future.
You need to implement a solution to receive the device data.
Solution: Provision an Azure Event Grid. Configure event filtering to evaluate the device identifier.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/12/#) [  Discussion  **6**](https://www.examtopics.com/exams/microsoft/az-203/view/12/#)

**Correct Answer:** *B*
References:
https://docs.microsoft.com/en-us/azure/event-grid/event-filtering

Question #19*Topic 3*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this question, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You are developing an Azure solution to collect point-of-sale (POS) device data from 2,000 stores located throughout the world. A single device can produce 2 megabytes (MB) of data every 24 hours. Each store location has one to five devices that send data.
You must store the device in Azure Blob storage. Device data must be correlated based on a device identifier. Additional stores are expected to open in the future.
You need to implement a solution to receive the device data.
Solution: Provision an Azure Notification Hub. Register all devices with the hub.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/13/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-203/view/13/#)

**Correct Answer:** *B*
Instead provision an Azure Event Hub. Configure the machine identifier as the partition key and enable capture.
References:
https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-programming-guide

Question #20*Topic 3*

You develop and deploy a Java RESTful API to Azure App Service.
You open a browser and navigate to the URL for the API. You receive the following error message:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0012800001.png)
You need to resolve the error.
What should you do?

- A. Bind an SSL certificate
- B. Enable authentication
- C. Enable CORS
- D. Map a custom domain
- E. Add a CDN

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/13/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-203/view/13/#)

**Correct Answer:** *C*
We need to enable Cross-Origin Resource Sharing (CORS).
References:
https://medium.com/@xinganwang/a-practical-guide-to-cors-51e8fd329a1f

## Topic 4 - Question Set 4

Question #1*Topic 4*

HOTSPOT -
Your company is migrating applications to Azure. The IT department must allow internal developers to communicate with Microsoft support.
The service agents of the IT department must only have view resources and create support ticket permissions to all subscriptions. A new custom role must be created by reusing a default role definition and changing the permissions.
You need to create the custom role.
To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/13/#) [  Discussion  **11**](https://www.examtopics.com/exams/microsoft/az-203/view/13/#)

**Correct Answer:** *Explanation*
Box 1: Set-AzureRmRoleDefinition Input-File C:\SupportRole.json
The Set-AzureRmRoleDefinition cmdlet updates an existing custom role in Azure Role-Based Access Control. Provide the updated role definition as an input to the command as a JSON file or a PSRoleDefinition object.
The role definition for the updated custom role MUST contain the Id and all other required properties of the role even if they are not updated: DisplayName,
Description, Actions, AssignableScope
Box 2: "*/read*."* Microsoft.Support/*"
Microsoft.Support/* Create and manage support tickets
"Microsoft.Support" role definition azure
Incorrect Answers:
Get-AzureRmRoleDefinition. The Get-AzureRmRoleDefinition command does not have an action section.
First, use the Get-AzureRmRoleDefinition command to retrieve the custom role that you wish to modify. Then, modify the properties that you wish to change.
Finally, save the role definition using the Set-AzureRmRoleDefinition command.
References:
https://docs.microsoft.com/en-us/azure/role-based-access-control/custom-roles-powershell

Question #2*Topic 4*

You are developing an internal website for employees to view sensitive data. The website uses Azure Active Directory (AAD) for authentication.
You need to implement multifactor authentication for the website.
What should you do? Each correct answer presents part of the solution.
NOTE: Each correct selection is worth one point.

- A. Upgrade to Azure AD Premium.
- B. In Azure AD conditional access, enable the baseline policy.
- C. In Azure AD, create a new conditional access policy.
- D. In Azure AD, enable application proxy.
- E. Configure the website to use Azure AD B2C.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/13/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-203/view/13/#)

**Correct Answer:** *AC*
A: Multi-Factor Authentication comes as part of the following offerings:
✑ Azure Active Directory Premium licenses - Full featured use of Azure Multi-Factor Authentication Service (Cloud) or Azure Multi-Factor Authentication Server
(On-premises).
✑ Multi-Factor Authentication for Office 365
✑ Azure Active Directory Global Administrators
C: MFA Enabled by conditional access policy. It is the most flexible means to enable two-step verification for your users. Enabling using conditional access policy only works for Azure MFA in the cloud and is a premium feature of Azure AD.
References:
https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-getstarted

Question #3*Topic 4*

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

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/14/#) [  Discussion  **20**](https://www.examtopics.com/exams/microsoft/az-203/view/14/#)

Correct Answer: ExplanationBox 1: Inbound.A set-variable policy to store the detected user identity.Example:<policies><inbound><!-- How you determine user identity is application dependent --><set-variablename="enduserid"value="@(context.Request.Headers.GetValueOrDefault("Authorization","").Split(' ')[1].AsJwt()?.Subject)" />Etc.Box 2: Inbound -A cache-lookup-value policy -Example:<inbound><base /><cache-lookup vary-by-developer="true | false" vary-by-developer-groups="true | false" downstream-caching-type="none | private | public" must-revalidate="true | false"><vary-by-query-parameter>parameter name</vary-by-query-parameter> <!-- optional, can repeated several times --></cache-lookup></inbound>Box 3: Outbound -A cache-store-value policy.Example:<outbound><base /><cache-store duration="3600" /></outbound>Box 4: Outbound -A find-and-replace policy to update the response body with the user profile information.Example:<outbound><!-- Update response body with user profile--><find-and-replacefrom='"$userprofile$"'to="@((string)context.Variables["userprofile"])" /><base /></outbound>References:https://docs.microsoft.com/en-us/azure/api-management/api-management-caching-policies https://docs.microsoft.com/en-us/azure/api-management/api-management-sample-cache-by-key

Question #4*Topic 4*

HOTSPOT -
You plan to deploy a new application to a Linux virtual machine (VM) that is hosted in Azure.
The entire VM must be secured at rest by using industry-standard encryption technology to address organizational security and compliance requirements.
You need to configure Azure Disk Encryption for the VM.
How should you complete the Azure CLI commands? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/14/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-203/view/14/#)

**Correct Answer:** *Explanation*
Box 1: keyvault -
Create an Azure Key Vault with az keyvault create and enable the Key Vault for use with disk encryption. Specify a unique Key Vault name for keyvault_name as follows: keyvault_name=myvaultname$RANDOM az keyvault create \
--name $keyvault_name \
--resource-group $resourcegroup \
--location eastus \
--enabled-for-disk-encryption True

Box 2: keyvault key -
The Azure platform needs to be granted access to request the cryptographic keys when the VM boots to decrypt the virtual disks. Create a cryptographic key in your Key Vault with az keyvault key create. The following example creates a key named myKey: az keyvault key create \
--vault-name $keyvault_name \
--name myKey \
--protection software

Box 3: vm -
Create a VM with az vm create. Only certain marketplace images support disk encryption. The following example creates a VM named myVM using an Ubuntu
16.04 LTS image:
az vm create \
--resource-group $resourcegroup \
--name myVM \
--image Canonical:UbuntuServer:16.04-LTS:latest \
--admin-username azureuser \
--generate-ssh-keys \

Box 4: vm encryption -
Encrypt your VM with az vm encryption enable:
az vm encryption enable \
--resource-group $resourcegroup \
--name myVM \
--disk-encryption-keyvault $keyvault_name \
--key-encryption-key myKey \
--volume-type all
Note: seems to an error in the question. Should have enable instead of create.

Box 5: all -
Encrypt both data and operating system.
References:
https://docs.microsoft.com/bs-latn-ba/azure/virtual-machines/linux/encrypt-disks

Question #5*Topic 4*

HOTSPOT -
You are developing an Azure App Service hosted ASP.NET Core web app to deliver video on-demand streaming media. You enable an Azure Content Delivery
Network (CDN) Standard for the web endpoint. Customer videos are downloaded from the web app by using the following example URL:http//www.contoso.com/ content.p4?quality=1
All media content must expire from the cache after one hour. Customer videos with varying quality must be delivered to the closest regional point of presence
(POP) node.
You need to configure Azure CDN caching rules.
Which options should you use? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/14/#) [  Discussion  **5**](https://www.examtopics.com/exams/microsoft/az-203/view/14/#)

**Correct Answer:** *Explanation*
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
References:
https://docs.microsoft.com/en-us/azure/cdn/cdn-query-string

Question #6*Topic 4*

You have an Azure App Services Web App Azure SQL Database instance Azure Storage Account, and an Azure Redis Cache instance in a resource group.
A developer must be able to publish code to the web app. You must grant the developer the Contribute role to the web app.
You need to grant the role.
Which two commands can you use? Each correct answer presents a complete solution.
NOTE: Each correct selection is worth one point.

- A. az role assignment create
- B. az role definition create
- C. New-AzureRmRoleAssignment
- D. New-AzureRmRoleDefinition

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/14/#) [  Discussion  **5**](https://www.examtopics.com/exams/microsoft/az-203/view/14/#)

**Correct Answer:** *AC*
A: The az role assignment create command creates a new role assignment for a user, group, or service principal.
Example: Create role assignment for an assignee.
az role assignment create --assignee sp_name --role a_role
C: The New-AzureRmRoleAssignment command assigns the specified RBAC role to the specified principal, at the specified scope.
Incorrect Answers:
B, D: Creates a custom role in Azure RBAC.
References:
https://docs.microsoft.com/en-us/cli/azure/role/assignment?view=azure-cli-latest#az-role-assignment-create https://docs.microsoft.com/en-us/powershell/module/azurerm.resources/new-azurermroleassignment?view=azurermps-6.13.0

uestion #7*Topic 4*

You provide an Azure API Management managed web service to clients. The back-end web service implements HTTP Strict Transport Security (HSTS).
Every request to the backend service must include a valid HTTP authorization header.
You need to configure the Azure API Management instance with an authentication policy.
Which two policies can you use? Each correct answer presents a complete solution.
NOTE: Each correct selection is worth one point.

- A. OAuth Client Credential Grant
- B. Basic Authentication
- C. Certificate Authentication
- D. Digest Authentication

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/15/#) [  Discussion  **11**](https://www.examtopics.com/exams/microsoft/az-203/view/15/#)

**Correct Answer:** *AC*

Question #8*Topic 4*

DRAG DROP -
You maintain an existing Azure SQL Database instance. Management of the database is performed by an external party. All cryptographic keys are stored in an
Azure Key Vault.
You must ensure that the external party cannot access the data in the SSN column of the Person table.
Will each protection method meet the requirement? To answer, drag the appropriate responses to the correct protection methods. Each response may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/15/#) [  Discussion  **7**](https://www.examtopics.com/exams/microsoft/az-203/view/15/#)

**Correct Answer:** *Explanation*
Box 1: Yes -
You can configure Always Encrypted for individual database columns containing your sensitive data. When setting up encryption for a column, you specify the information about the encryption algorithm and cryptographic keys used to protect the data in the column.

Box 2: No -

Box 3: Yes -
In SQL Database, the VIEW permissions are not granted by default to the public fixed database role. This enables certain existing, legacy tools (using older versions of DacFx) to work properly. Consequently, to work with encrypted columns (even if not decrypting them) a database administrator must explicitly grant the two VIEW permissions.

Box 4: No -
All cryptographic keys are stored in an Azure Key Vault.
References:
https://docs.microsoft.com/en-us/sql/relational-databases/security/encryption/always-encrypted-database-engine

## Topic 5 - Question Set 5

Question #1*Topic 5*

You develop an Azure web app. You monitor performance of the web app by using Application Insights.
You need to ensure the cost for Application Insights does not exceed a preset budget.
What should you do?

- A. Implement ingestions sampling using the Application Insights SDK.
- B. Set a daily cap for the Application Insights instance.
- C. Implement ingestion sampling using the Azure portal.
- D. Implement adaptive sampling using the Azure portal.
- E. Implement adaptive sampling using the Application Insights SDK.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/15/#) [  Discussion  **24**](https://www.examtopics.com/exams/microsoft/az-203/view/15/#)

**Correct Answer:** *E*
Sampling is an effective way to reduce charges and stay within your monthly quota.
You can set sampling manually, either in the portal on the Usage and estimated costs page; or in the ASP.NET SDK in the .config file; or in the Java SDK in the
ApplicationInsights.xml file, to also reduce the network traffic.
Adaptive sampling is the default for the ASP.NET SDK. Adaptive sampling automatically adjusts to the volume of telemetry that your app sends. It operates automatically in the SDK in your web app so that telemetry traffic on the network is reduced.
Incorrect Answers:
B: You can use the daily volume cap to limit the data collected.
To change the daily cap, in the Configure section of your Application Insights resource, in the Usage and estimated costs pane, select Daily Cap.
References:
https://docs.microsoft.com/en-us/azure/azure-monitor/app/sampling

Question #2*Topic 5*

You are developing an ASP.NET Core Web API web service. The web service uses Azure Application Insights for all telemetry and dependency tracking. The web service reads and writes data to a database other than Microsoft SQL Server.
You need to ensure that dependency tracking works for calls to the third-party database.
Which two Dependency Telemetry properties should you store in the database? Each correct answer presents part of the solution.
NOTE: Each correct selection is worth one point.

- A. Telemetry.Context.Operation.Id
- B. Telemetry.Name
- C. Telemetry.Context.Cloud.RoleInstance
- D. Telemetry.Context.Session.Id
- E. Telemetry.Id

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/15/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-203/view/15/#)

**Correct Answer:** *AE*
References:
https://docs.microsoft.com/en-us/azure/azure-monitor/app/custom-operations-tracking

Question #3*Topic 5*

You are creating a hazard notification system that has a single signaling server which triggers audio and visual alarms to start and stop.
You implement Azure Service Bus to publish alarms. Each alarm controller uses Azure Service Bus to receive alarm signals as part of a transaction. Alarm events must be recorded for audit purposes. Each transaction record must include information about the alarm type that was activated.
You need to implement a reply trail auditing solution. Which two actions should you perform? Each correct answer presents part of the solution.
NOTE: Each correct selection is worth one point.

- A. Assign the value of the hazard message MessageId property to the DeliveryCount property.
- B. Assign the value of the hazard message SequenceNumber property to the DeliveryCount property.
- C. Assign the value of the hazard message MessageId property to the SequenceNumber property.
- D. Assign the value of the hazard message MessageId property to the CorrelationId property.
- E. Assign the value of the hazard message SessionID property to the SequenceNumber property..
- F. Assign the value of the hazard message SessionID property to the ReplyToSessionId property.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/16/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-203/view/16/#)

**Correct Answer:** *DF*
D: CorrelationId: Enables an application to specify a context for the message for the purposes of correlation; for example, reflecting the MessageId of a message that is being replied to.
F: ReplyToSessionId: This value augments the ReplyTo information and specifies which SessionId should be set for the reply when sent to the reply entity.
Incorrect Answers:

A, B: DeliveryCount -
Number of deliveries that have been attempted for this message. The count is incremented when a message lock expires, or the message is explicitly abandoned by the receiver. This property is read-only.

C, E: SequenceNumber -
The sequence number is a unique 64-bit integer assigned to a message as it is accepted and stored by the broker and functions as its true identifier. For partitioned entities, the topmost 16 bits reflect the partition identifier. Sequence numbers monotonically increase and are gapless. They roll over to 0 when the 48-
64 bit range is exhausted. This property is read-only.
References:
https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-messages-payloads

Question #4*Topic 5*

You develop a gateway solution for a public facing news API. The news API back end is implemented as a RESTful service and uses an OpenAPI specification.
You need to ensure that you can access the news API by using an Azure API Management service instance.
Which Azure PowerShell command should you run?

- A. Import-AzureRmApiManagementApi ""Context $ApiMgmtContext ""SpecificationFormat "Swagger" -SpecificationPath $SwaggerPath ""Path $Path
- B. New-AzureRmApiManagementBackend -Context $ApiMgmtContext -Url $Url -Protocol http
- C. New-AzureRmApiManagement ""ResourceGroupName $ResourceGroup ""Name $Name ""Location $Location ""Organization $Org "" AdminEmail $AdminEmail
- D. New-AzureRmApiManagementBackendProxy ""Url $ApiUrl

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/16/#) [  Discussion  **14**](https://www.examtopics.com/exams/microsoft/az-203/view/16/#)

**Correct Answer:** *D*
New-AzureRmApiManagementBackendProxy creates a new Backend Proxy Object which can be piped when creating a new Backend entity.
Example: Create a Backend Proxy In-Memory Object
PS C:\>$secpassword = ConvertTo-SecureString "PlainTextPassword" -AsPlainText -Force
PS C:\>$proxyCreds = New-Object System.Management.Automation.PSCredential ("foo", $secpassword)
PS C:\>$credential = New-AzureRmApiManagementBackendProxy -Url "http://12.168.1.1:8080" -ProxyCredential $proxyCreds
PS C:\>$apimContext = New-AzureRmApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"
PS C:\>$backend = New-AzureRmApiManagementBackend -Context $apimContext -BackendId 123 -Url 'https://contoso.com/awesomeapi' -Protocol http -Title
"first backend" -SkipCertificateChainValidation $true -Proxy $credential -Description "backend with proxy server"
Creates a Backend Proxy Object and sets up Backend
Incorrect Answers:
A: The Import-AzureRmApiManagementApi cmdlet imports an Azure API Management API from a file or a URL in Web Application Description Language (WADL),
Web Services Description Language (WSDL), or Swagger format.
B: New-AzureRmApiManagementBackend creates a new backend entity in Api Management.
C: The New-AzureRmApiManagement cmdlet creates an API Management deployment in Azure API Management.
References:
https://docs.microsoft.com/en-us/powershell/module/azurerm.apimanagement/new-azurermapimanagementbackendproxy?view=azurermps-6.13.0

Question #5*Topic 5*

You are developing a project management service by using ASP.NET. The service hosts conservations, files, to-do lists, and a calendar that users can interact with at any time.
The application uses Azure Search for allowing users to search for keywords in the project data.
You need to implement code that creates the object which is used to create indexes in the Azure Search service.
Which two objects should you use? Each correct answer presents part of the solution.
NOTE: Each correct selection is worth one point.

- A. SearchCredentials
- B. SearchIndexClient
- C. SearchServiceClient
- D. SearchService

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/16/#) [  Discussion  **14**](https://www.examtopics.com/exams/microsoft/az-203/view/16/#)

**Correct Answer:** *BC*
The various client libraries define classes like Index, Field, and Document, as well as operations like Indexes.Create and Documents.Search on the
SearchServiceClient and SearchIndexClient classes.
Example:
The sample application we'll be exploring creates a new index named "hotels", populates it with a few documents, then executes some search queries. Here is the main program, showing the overall flow:
/ This sample shows how to delete, create, upload documents and query an index static void Main(string[] args)
{
IConfigurationBuilder builder = new ConfigurationBuilder().AddJsonFile("appsettings.json");
IConfigurationRoot configuration = builder.Build();
SearchServiceClient serviceClient = CreateSearchServiceClient(configuration);
Console.WriteLine("{0}", "Deleting index...\n");
DeleteHotelsIndexIfExists(serviceClient);
Console.WriteLine("{0}", "Creating index...\n");
CreateHotelsIndex(serviceClient);
ISearchIndexClient indexClient = serviceClient.Indexes.GetClient("hotels");
References:
https://docs.microsoft.com/en-us/azure/search/search-howto-dotnet-sdk

Question #6*Topic 5*

DRAG DROP -
You develop a web app that uses the tier D1 app service plan by using the Web App feature of Microsoft Azure App Service.
Spikes in traffic have caused increases in page load times.
You need to ensure that the web app automatically scales when CPU load is about 85 percent and minimize costs.
Which four actions should you perform in sequence? To answer, move the appropriate actions from the list of actions to the answer area and arrange them in the correct order.
NOTE: More than one order of answer choices is correct. You will receive credit for any of the correct orders you select.
Select and Place:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0020300001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/16/#) [  Discussion  **6**](https://www.examtopics.com/exams/microsoft/az-203/view/16/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0020300002.png)*
Step 1: Configure the web app to the Standard App Service Tier
The Standard tier supports auto-scaling, and we should minimize the cost.
Step 2: Enable autoscaling on the web app

First enable autoscale -

Step 3: Add a scale rule -

Step 4: Add a Scale condidation -
References:
https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-autoscale-get-started https://azure.microsoft.com/en-us/pricing/details/app-service/plans/

Question #7*Topic 5*

DRAG DROP -
You are developing an ASP.NET Core Web API web service that uses Azure Application Insights to monitor performance and track events.
You need to enable logging and ensure that log messages can be correlated to events tracked by Application Insights.
How should you complete the code? To answer, drag the appropriate code segments to the correct locations. Each code segment may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/17/#) [  Discussion  **8**](https://www.examtopics.com/exams/microsoft/az-203/view/17/#)

**Correct Answer:** *Explanation*
Box 1: ApplicationInsightsLoggerOptions
If you want to include the EventId and EventName properties, then add the following to the ConfigureServices method: services
.AddOptions<ApplicationInsightsLoggerOptions>()
.Configure(o => o.IncludeEventId = true);

Box 2: IncludeEventID -

Box 3: ApplicationServices -
In Asp.Net core apps it turns out that trace logs do not show up in Application Insights out of the box. We need to add the following code snippet to our Configure method in Startup.cs: loggerFactory.AddApplicationInsights(app.ApplicationServices, logLevel);
References:
https://blog.computedcloud.com/enabling-application-insights-trace-logging-in-asp-net-core/

Question #8*Topic 5*

DRAG DROP -
You develop an ASP.NET Core MVC application. You configure the application to track webpages and custom events.
You need to identify trends in application usage.
Which Azure Application Insights Usage Analysis features should you use? To answer, drag the appropriate features to the correct requirements. Each feature may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/17/#) [  Discussion  **13**](https://www.examtopics.com/exams/microsoft/az-203/view/17/#)

**Correct Answer:** *Explanation*
Box1: Users -

Box 2: Impact -
One way to think of Impact is as the ultimate tool for settling arguments with someone on your team about how slowness in some aspect of your site is affecting whether users stick around. While users may tolerate a certain amount of slowness, Impact gives you insight into how best to balance optimization and performance to maximize user conversion.

Box 3: Retention -
The retention feature in Azure Application Insights helps you analyze how many users return to your app, and how often they perform particular tasks or achieve goals. For example, if you run a game site, you could compare the numbers of users who return to the site after losing a game with the number who return after winning. This knowledge can help you improve both your user experience and your business strategy.

Box 4: User flows -
The User Flows tool visualizes how users navigate between the pages and features of your site. It's great for answering questions like:
How do users navigate away from a page on your site?
What do users click on a page on your site?
Where are the places that users churn most from your site?
Are there places where users repeat the same action over and over?
Incorrect Answers:
Funnel: If your application involves multiple stages, you need to know if most customers are progressing through the entire process, or if they are ending the process at some point. The progression through a series of steps in a web application is known as a funnel. You can use Azure Application Insights Funnels to gain insights into your users, and monitor step-by-step conversion rates.
References:
https://docs.microsoft.com/en-us/azure/azure-monitor/app/usage-impact

Question #9*Topic 5*

HOTSPOT -
A company is developing a gaming platform. Users can join teams to play online and see leaderboards that include player statistics. The solution includes an entity named Team.
You plan to implement an Azure Redis Cache instance to improve the efficiency of data operations for entities that rarely change.
You need to invalidate the cache when team data is changed.
How should you complete the code? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0020700001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/17/#) [  Discussion  **12**](https://www.examtopics.com/exams/microsoft/az-203/view/17/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0020800001.png)*
Box 1: IDatabase cache = connection.GetDatabase();
Connection refers to a previously configured ConnectionMultiplexer.
Box 2: cache.StringSet("teams",")
To specify the expiration of an item in the cache, use the TimeSpan parameter of StringSet. cache.StringSet("key1", "value1", TimeSpan.FromMinutes(90));
References:
https://azure.microsoft.com/sv-se/blog/lap-around-azure-redis-cache-preview/

## Topic 6 - Question Set 6

Question #1*Topic 6*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this question, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
Margie's Travel is an international travel and bookings management service. The company is expanding into restaurant bookings. You are tasked with implementing Azure Search for the restaurants listed in their solution.
You create the index in Azure Search.
You need to import the restaurant data into the Azure Search service by using the Azure Search .NET SDK.
Solution:
\1. Create a SearchServiceClient object to connect to the search index.
\2. Create a DataContainer that contains the documents which must be added.
\3. Create a DataSource instance and set its Container property to the DataContainer.
\4. Call the Documents.Suggest method of the SearchIndexClient and pass the DataSource.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/17/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-203/view/17/#)

**Correct Answer:** *B*
Use the following method:
\1. - Create a SearchIndexClient object to connect to the search index
\2. - Create an IndexBatch that contains the documents which must be added.
\3. - Call the Documents.Index method of the SearchIndexClient and pass the IndexBatch.
References:
https://docs.microsoft.com/en-us/azure/search/search-howto-dotnet-sdk

Question #2*Topic 6*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this question, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
Margie's Travel is an international travel and bookings management service. The company is expanding into restaurant bookings. You are tasked with implementing Azure Search for the restaurants listed in their solution.
You create the index in Azure Search.
You need to import the restaurant data into the Azure Search service by using the Azure Search .NET SDK.
Solution:
\1. Create a SearchIndexClient object to connect to the search index
\2. Create an IndexBatch that contains the documents which must be added.
\3. Call the Documents.Index method of the SearchIndexClient and pass the IndexBatch.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/18/#) [  Discussion  **5**](https://www.examtopics.com/exams/microsoft/az-203/view/18/#)

**Correct Answer:** *A*
\1. The index needs to be populated. To do this, we will need a SearchIndexClient. There are two ways to obtain one: by constructing it, or by calling
Indexes.GetClient on the SearchServiceClient. Here we will use the first method.
\2. Create the indexBatch with the documents
Something like:
var hotels = new Hotel[];
{
new Hotel()
{
HotelId = "3",
BaseRate = 129.99,
Description = "Close to town hall and the river"
}
};
"¦
var batch = IndexBatch.Upload(hotels);
\3. The next step is to populate the newly-created index
Example:
var batch = IndexBatch.Upload(hotels);
try
{
indexClient.Documents.Index(batch);
}
References:
https://docs.microsoft.com/en-us/azure/search/search-howto-dotnet-sdk

Question #3*Topic 6*

DRAG DROP -
You develop software solutions for a mobile delivery service. You are developing a mobile app that users can use to order from a restaurant in their area. The app uses the following workflow:
\1. - A driver selects the restaurants for which they will deliver orders.
\2. - Orders are sent to all available drivers in an area.
\3. - Only orders for the selected restaurants will appear for the driver.
\4. - The first driver to accept an order removes it from the list of available orders.
You need to implement an Azure Service Bus solution.
Which three actions should you perform in sequence? To answer, move the appropriate actions from the list of actions to the answer area and arrange them in the correct order.
Select and Place:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/18/#) [  Discussion  **16**](https://www.examtopics.com/exams/microsoft/az-203/view/18/#)

**Correct Answer:** *Explanation*
Box 1: Create a single Service Bus Namespace
To begin using Service Bus messaging entities in Azure, you must first create a namespace with a name that is unique across Azure. A namespace provides a scoping container for addressing Service Bus resources within your application.
Box 2: Create a Service Bus Topic for each restaurant for which a driver can receive messages.
Create topics.
Box 3: Create a Service Bus subscription for each restaurant for which a driver can receive orders.
Topics can have multiple, independent subscriptions.
References:
https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-messaging-overview

Question #4*Topic 6*

HOTSPOT -
A company runs an international travel and bookings management service. The company plans to begin offering restaurant bookings.
You must develop a solution that uses Azure Search and meets the following requirements:
✑ Users must be able to search for restaurants by name, description, location, and cuisine.
✑ Users must be able to narrow the results further by location, cuisine, rating, and family-friendliness.
✑ All words in descriptions must be included in searches.
You need to add annotations to the restaurant class.
How should you complete the code segment? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/18/#) [  Discussion  **10**](https://www.examtopics.com/exams/microsoft/az-203/view/18/#)

**Correct Answer:** *Explanation*
Box 1: [IsSearchable.IsFilterable.IsSortable,IsFacetable]

Location -
Users must be able to search for restaurants by name, description, location, and cuisine.
Users must be able to narrow the results further by location, cuisine, rating, and family-friendliness.
Box 2: [IsSearchable.IsFilterable.IsSortable,Required]

Description -
Users must be able to search for restaurants by name, description, location, and cuisine.
All words in descriptions must be included in searches.
Box 3: [IsFilterable,IsSortable,IsFaceTable]

Rating -
Users must be able to narrow the results further by location, cuisine, rating, and family-friendliness.
Box 4: [IsSearchable.IsFilterable,IsFacetable]

Cuisines -
Users must be able to search for restaurants by name, description, location, and cuisine.
Users must be able to narrow the results further by location, cuisine, rating, and family-friendliness.
Box 5: [IsFilterable,IsFacetable]

FamilyFriendly -
Users must be able to narrow the results further by location, cuisine, rating, and family-friendliness.
References:
https://www.henkboelman.com/azure-search-the-basics/

Question #5*Topic 6*

DRAG DROP -
You develop a gateway solution for a public facing news API.
The news API back end is implemented as a RESTful service and hosted in an Azure App Service instance.
You need to configure back-end authentication for the API Management service instance.
Which target and gateway credential type should you use? To answer, drag the appropriate values to the correct parameters. Each value may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/18/#) [  Discussion  **13**](https://www.examtopics.com/exams/microsoft/az-203/view/18/#)

**Correct Answer:** *Explanation*
Box 1: Azure Resource -

Box 2: Client cert -
API Management allows to secure access to the back-end service of an API using client certificates.
References:
https://docs.microsoft.com/en-us/rest/api/apimanagement/apimanagementrest/azure-api-management-rest-api-backend-entity

Question #6*Topic 6*

A company is implementing a publish-subscribe (Pub/Sub) messaging component by using Azure Service Bus. You are developing the first subscription application.
In the Azure portal you see that messages are being sent to the subscription for each topic. You create and initialize a subscription client object by supplying the correct details, but the subscription application is still not consuming the messages.
You need to complete the source code of the subscription client
What should you do?

- A. await subscriptionClient.CloseAsync();
- B. await subscriptionClient.AddRuleAsync(new RuleDescription(RuleDescription.DefaultRuleName, new TrueFilter()));
- C. subscriptionClient.RegisterMessageHandler(ProcessMessagesAsync, messageHandlerOptions);
- D. subscriptionClient = new SubscriptionClient(ServiceBusConnectionString, TopicName, SubscriptionName);

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/19/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-203/view/19/#)

**Correct Answer:** *C*
Using topic client, call RegisterMessageHandler which is used to receive messages continuously from the entity. It registers a message handler and begins a new thread to receive messages. This handler is waited on every time a new message is received by the receiver. subscriptionClient.RegisterMessageHandler(ReceiveMessagesAsync, messageHandlerOptions);
References:
https://www.c-sharpcorner.com/article/azure-service-bus-topic-and-subscription-pub-sub/

Question #7*Topic 6*

DRAG DROP -
You have an application that provides weather forecasting data to external partners. You use Azure API Management to publish APIs.
You must change the behavior of the API to meet the following requirements:
✑ Support alternative input parameters.
✑ Remove formatting text from responses.
✑ Provide additional context to back-end services.
Which types of policies should you implement? To answer, drag the policy types to the correct scenarios. Each policy type may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/19/#) [  Discussion  **24**](https://www.examtopics.com/exams/microsoft/az-203/view/19/#)

**Correct Answer:** *Explanation*

Question #8*Topic 6*

HOTSPOT -
You are developing a .NET Core MVC application for customers to research hotels. The application will use Azure Search. The application will search the index by using various criteria to locate documents related to hotels. The index will include search fields for rate, a list of amenities, and distance to the nearest airport.
The application must support the following scenarios for specifying search criteria and organizing results:
✑ Search the index by using regular expressions.
Organize results by counts for name-value pairs.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0022400005.png)
✑ List hotels within a specified distance to an airport and that fall within a specific price range.
You need to configure the SearchParameters class.
Which properties should you configure? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/19/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-203/view/19/#)

**Correct Answer:** *Explanation*
Box 1: QueryType -
The SearchParameters.QueryType Property gets or sets a value that specifies the syntax of the search query. The default is 'simple'. Use 'full' if your query uses the Lucene query syntax.
You can write queries against Azure Search based on the rich Lucene Query Parser syntax for specialized query forms: wildcard, fuzzy search, proximity search, regular expressions are a few examples.

Box 2: Facets -
The facets property gets or sets the list of facet expressions to apply to the search query. Each facet expression contains a field name, optionally followed by a comma-separated list of name:value pairs.

Box 3: Filter -
The Filter property gets or sets the OData $filter expression to apply to the search query.
References:
https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.search.models.searchparameters https://docs.microsoft.com/en-us/azure/search/query-lucene-syntax https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.search.models.searchparameters.querytype

Question #9*Topic 6*

HOTSPOT -
You develop a news and blog content delivery app for Windows devices.
A notification must arrive on a user's device when there is a new article available for them to view.
You need to implement push notifications.
How should you complete the code segment? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/19/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-203/view/19/#)

**Correct Answer:** *Explanation*
Box 1: NotificationHubClient -

Box 2: NotificationHubClient -
Box 3: CreateClientFromConnectionString
// Initialize the Notification Hub
NotificationHubClient hub = NotificationHubClient.CreateClientFromConnectionString(listenConnString, hubName);
Box 4: SendWindowsNativeNotificationAsync
Send the push notification.
var result = await hub.SendWindowsNativeNotificationAsync(windowsToastPayload);
References:
https://docs.microsoft.com/en-us/azure/notification-hubs/notification-hubs-push-notification-registration-management https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/app-service-mobile/app-service-mobile-windows-store-dotnet-get-started-push.md

Question #10*Topic 6*

HOTSPOT -
You are creating an app that uses Event Grid to connect with other services. Your app's event data will be sent to a serverless function that checks compliance.
This function is maintained by your company.
You write a new event subscription at the scope of your resource. The event must be invalidated after a specific period of time.
You need to configure Event Grid.
What should you implement? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0022700001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/20/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-203/view/20/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0022800001.jpg)*
Box 1: SAS tokens -
Custom topics use either Shared Access Signature (SAS) or key authentication. Microsoft recommends SAS, but key authentication provides simple programming, and is compatible with many existing webhook publishers.
In this case we need the expiration time provided by SAS tokens.

Box 2: ValidationCode handshake -
Event Grid supports two ways of validating the subscription: ValidationCode handshake (programmatic) and ValidationURL handshake (manual).
If you control the source code for your endpoint, this method is recommended.
Incorrect Answers:
ValidationURL handshake (manual): In certain cases, you can't access the source code of the endpoint to implement the ValidationCode handshake. For example, if you use a third-party service (like Zapier or IFTTT), you can't programmatically respond with the validation code.
References:
https://docs.microsoft.com/en-us/azure/event-grid/security-authentication

Question #11*Topic 6*

HOTSPOT -
You are validating the configuration of an Azure Search indexer.
The service has been configured with an indexer that uses the Import Data option. The index is configured using options as shown in the Index Configuration exhibit. (Click the Index Configuration tab.)
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0022900001.png)
You use an Azure table as the data source for the import operation. The table contains three records with item inventory data that matches the fields in the
Storage data exhibit. These records were imported when the index was created. (Click the Storage Data tab.) When users search with no filter, all three records are displayed.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0023000001.png)
When users search for items by description, Search explorer returns no records. The Search Explorer exhibit shows the query and results for a test. In the test, a user is trying to search for all items in the table that have a description that contains the word bag. (Click the Search Explorer tab.)
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0023000002.png)
You need to resolve the issue.
For each of the following statements, select Yes if the statement is true. Otherwise, select No.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/20/#) [  Discussion  **12**](https://www.examtopics.com/exams/microsoft/az-203/view/20/#)

**Correct Answer:** *Explanation*
Box 1: Yes -
The ItemDescription field in not searchable.

Box 2: No -
The ItemDescription field in not searchable, but we would need to recreate the index.

Box 3: Yes -
An indexer in Azure Search is a crawler that extracts searchable data and metadata from an external Azure data source and populates an index based on field-to- field mappings between the index and your data source. This approach is sometimes referred to as a 'pull model' because the service pulls data in without you having to write any code that adds data to an index.

Box 4: No -
References:
https://docs.microsoft.com/en-us/azure/search/search-what-is-an-index https://docs.microsoft.com/en-us/azure/search/search-indexer-overview

Question #12*Topic 6*

HOTSPOT -
You are developing an Azure App Service hosted ASP.NET Core API app by using C#. The API app will allow users to authenticate by using Twitter and Azure
Active Directory (Azure AD).
Users must be authenticated before calling API methods. You must log the user's name for each method call.
You need to configure the API method calls.
Which values should you use? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/20/#) [  Discussion  **7**](https://www.examtopics.com/exams/microsoft/az-203/view/20/#)

**Correct Answer:** *Explanation*
Box 1: Authorize -
Box 2: X-MS-CLIENT-PRINCIPAL-NAME
App Service passes user claims to your application by using special headers. External requests aren't allowed to set these headers, so they are present only if set by App Service. Some example headers include:

X-MS-CLIENT-PRINCIPAL-NAME -

X-MS-CLIENT-PRINCIPAL-ID -
Here's the set of headers you get from Easy Auth for a Twitter authenticated user:
{
"cookie": "AppServiceAuthSession=Lx43...xHDTA==",
...
"x-ms-client-principal-name": "evilSnobu",
"x-ms-client-principal-id": "35....",
"x-ms-client-principal-idp": "twitter",
"x-ms-token-twitter-access-token": "35...Dj",
"x-ms-token-twitter-access-token-secret": "OK3...Jx",
}
References:
https://docs.microsoft.com/en-us/azure/app-service/app-service-authentication-how-to

Question #13*Topic 6*

Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this question, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
Margie's Travel is an international travel and bookings management service. The company is expanding into restaurant bookings. You are tasked with implementing Azure Search for the restaurants listed in their solution.
You create the index in Azure Search.
You need to import the restaurant data into the Azure Search service by using the Azure Search .NET SDK.
Solution:
\1. Create a SearchIndexClient object to connect to the search index.
\2. Create a DataContainer that contains the documents which must be added.
\3. Create a DataSource instance and set its Container property to the DataContainer.
\4. Call the Documents.Suggest method of the SearchIndexClient and pass the DataSource.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/20/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-203/view/20/#)

**Correct Answer:** *B*
Use the following method:
\1. - Create a SearchIndexClient object to connect to the search index
\2. - Create an IndexBatch that contains the documents which must be added.
\3. - Call the Documents.Index method of the SearchIndexClient and pass the IndexBatch.
References:
https://docs.microsoft.com/en-us/azure/search/search-howto-dotnet-sdk

- Question #14*Topic 6*

  Note: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
  After you answer a question in this question, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
  Margie's Travel is an international travel and bookings management service. The company is expanding into restaurant bookings. You are tasked with implementing Azure Search for the restaurants listed in their solution.
  You create the index in Azure Search.
  You need to import the restaurant data into the Azure Search service by using the Azure Search .NET SDK.
  Solution:
  \1. Create a SearchServiceClient object to connect to the search index.
  \2. Create a DataContainer that contains the documents which must be added.
  \3. Create a DataSource instance and set its Container property to the DataContainer.
  \4. Set the DataSources property of the SearchServiceClient.
  Does the solution meet the goal?

  - A. Yes
  - B. No

  [Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/21/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-203/view/21/#)

  **Correct Answer:** *B*
  Use the following method:
  \1. - Create a SearchIndexClient object to connect to the search index
  \2. - Create an IndexBatch that contains the documents which must be added.
  \3. - Call the Documents.Index method of the SearchIndexClient and pass the IndexBatch.
  References:
  https://docs.microsoft.com/en-us/azure/search/search-howto-dotnet-sdk

  ## Topic 7 - Testlet 1

  Question #1*Topic 7*

  Introductory InfoCase Study -
  This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
  To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
  At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

  To start the case study -
  To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

  Background -
  You are a developer for Proseware, Inc. You are developing an application that applies a set of governance policies for Proseware's internal services, external services, and applications. The application will also provide a shared library for common functionality.

  Requirements -

  Policy service -
  You develop and deploy a stateful ASP.NET Core 2.1 web application named Policy service to an Azure App Service Web App. The application reacts to events from Azure Event Grid and performs policy actions based on those events.
  The application must include the Event Grid Event ID field in all Application Insights telemetry.
  Policy service must use Application Insights to automatically scale with the number of policy actions that it is performing.

  Policies -

  Log Policy -
  All Azure App Service Web Apps must write logs to Azure Blob storage. All log files should be saved to a container named logdrop. Logs must remain in the container for 15 days.

  Authentication events -
  Authentication events are used to monitor users signing in and signing out. All authentication events must be processed by Policy service. Sign outs must be processed as quickly as possible.

  PolicyLib -
  You have a shared library named PolicyLib that contains functionality common to all ASP.NET Core web services and applications. The PolicyLib library must:
  Exclude non-user actions from Application Insights telemetry.
  Provide methods that allow a web service to scale itself
  Ensure that scaling actions do not disrupt application usage

  Other -

  Anomaly detection service -
  You have an anomaly detection service that analyzes log information for anomalies. It is implemented as an Azure Machine Learning model. The model is deployed as a web service.
  If an anomaly is detected, an Azure Function that emails administrators is called by using an HTTP WebHook.

  Health monitoring -
  All web applications and services have health monitoring at the /health service endpoint.

  Policy loss -
  When you deploy Policy service, policies may not be applied if they were in the process of being applied during the deployment.

  Performance issue -
  When under heavy load, the anomaly detection service undergoes slowdowns and rejects connections.

  Notification latency -
  Users report that anomaly detection emails can sometimes arrive several minutes after an anomaly is detected.
  Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
  ![img](https://www.examtopics.com/assets/media/exam-media/02838/0000400001.png)
  ![img](https://www.examtopics.com/assets/media/exam-media/02838/0000500001.png)
  Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
  ![img](https://www.examtopics.com/assets/media/exam-media/02838/0000600001.png)QuestionYou need to resolve a notification latency issue.
  Which two actions should you perform? Each correct answer presents part of the solution.
  NOTE: Each correct selection is worth one point.

  - A. Set Always On to false.
  - B. Set Always On to true.
  - C. Ensure that the Azure Function is set to use a consumption plan.
  - D. Ensure that the Azure Function is using an App Service plan.

  [Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/21/#) [  Discussion  **8**](https://www.examtopics.com/exams/microsoft/az-203/view/21/#)

  **Correct Answer:** *BD*
  Azure Functions can run on either a Consumption Plan or a dedicated App Service Plan. If you run in a dedicated mode, you need to turn on the Always On setting for your Function App to run properly. The Function runtime will go idle after a few minutes of inactivity, so only HTTP triggers will actually "wake up" your functions. This is similar to how WebJobs must have Always On enabled.
  Scenario: Notification latency: Users report that anomaly detection emails can sometimes arrive several minutes after an anomaly is detected.
  Anomaly detection service: You have an anomaly detection service that analyzes log information for anomalies. It is implemented as an Azure Machine Learning model. The model is deployed as a web service.
  If an anomaly is detected, an Azure Function that emails administrators is called by using an HTTP WebHook.
  References:
  https://github.com/Azure/Azure-Functions/wiki/Enable-Always-On-when-running-on-dedicated-App-Service-Plan

  ## Topic 8 - Testlet 10

  Question #1*Topic 8*

  Introductory InfoCase Study -
  This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
  To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
  At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

  To start the case study -
  To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

  Background -
  You are a developer for Litware Inc., a SaaS company that provides a solution for managing employee expenses. The solution consists of an ASP.NET Core Web
  API project that is deployed as an Azure Web App.

  Overall architecture -
  Employees upload receipts for the system to process. When processing is complete, the employee receives a summary report email that details the processing results. Employees then use a web application to manage their receipts and perform any additional tasks needed for reimbursement.

  Receipt processing -
  Employees may upload receipts in two ways:
  Uploading using an Azure Files mounted folder
  Uploading using the web application

  Data Storage -
  Receipt and employee information is stored in an Azure SQL database.

  Documentation -
  Employees are provided with a getting started document when they first use the solution. The documentation includes details on supported operating systems for
  Azure File upload, and instructions on how to configure the mounted folder.

  Solution details -

  Users table -
  ![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0013800001.png)

  Web Application -
  You enable MSI for the Web App and configure the Web App to use the security principal name.

  Processing -
  Processing is performed by an Azure Function that uses version 2 of the Azure Function runtime. Once processing is completed, results are stored in Azure Blob
  Storage and an Azure SQL database. Then, an email summary is sent to the user with a link to the processing report. The link to the report must remain valid if the email is forwarded to another user.

  Requirements -

  Receipt processing -
  Concurrent processing of a receipt must be prevented.

  Logging -
  Azure Application Insights is used for telemetry and logging in both the processor and the web application. The processor also has TraceWriter logging enabled.
  Application Insights must always contain all log messages.

  Disaster recovery -
  Regional outage must not impact application availability. All DR operations must not be dependent on application running and must ensure that data in the DR region is up to date.

  Security -
  Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.
  All certificates and secrets used to secure data must be stored in Azure Key Vault.
  You must adhere to the Least Privilege Principal and provide privileges which are essential to perform the intended function.
  All access to Azure Storage and Azure SQL database must use the application's Managed Service Identity (MSI)
  Receipt data must always be encrypted at rest.
  All data must be protected in transit.
  User's expense account number must be visible only to logged in users. All other views of the expense account number should include only the last segment with the remaining parts obscured.
  In the case of a security breach, access to all summary reports must be revoked without impacting other parts of the system.

  Issues -

  Upload format issue -
  Employees occasionally report an issue with uploading a receipt using the web application. They report that when they upload a receipt using the Azure File
  Share, the receipt does not appear in their profile. When this occurs, they delete the file in the file share and use the web application, which returns a 500 Internal
  Server error page.

  Capacity issue -
  During busy periods, employees report long delays between the time they upload the receipt and when it appears in the web application.

  Log capacity issue -
  Developers report that the number of log messages in the trace output for the processor is too high, resulting in lost log messages.

  Processing.cs -
  ![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014000001.png)

  Database.cs -
  ![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014100001.png)

  ReceiptUploader.cs -
  ![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014200001.png)

  ConfigureSSE.ps1 -
  ![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014200002.png)QuestionNote: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
  After you answer a question in this question, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
  You need to ensure that the SecurityPin security requirements are met.
  Solution: Enable Always Encrypted for the SecurityPin column using a certificate based on a trusted certificate authority. Update the Getting Started document with instructions to ensure that the certificate is installed on user machines.
  Does the solution meet the goal?

  - A. Yes
  - B. No

  [Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/21/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-203/view/21/#)

  **Correct Answer:** *B*
  Enable Always Encrypted is correct, but only the WebAppIdentity service principal should be given access to the certificate.
  Scenario: Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.

  Question #2*Topic 8*

  Introductory InfoCase Study -
  This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
  To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
  At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

  To start the case study -
  To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

  Background -
  You are a developer for Litware Inc., a SaaS company that provides a solution for managing employee expenses. The solution consists of an ASP.NET Core Web
  API project that is deployed as an Azure Web App.

  Overall architecture -
  Employees upload receipts for the system to process. When processing is complete, the employee receives a summary report email that details the processing results. Employees then use a web application to manage their receipts and perform any additional tasks needed for reimbursement.

  Receipt processing -
  Employees may upload receipts in two ways:
  Uploading using an Azure Files mounted folder
  Uploading using the web application

  Data Storage -
  Receipt and employee information is stored in an Azure SQL database.

  Documentation -
  Employees are provided with a getting started document when they first use the solution. The documentation includes details on supported operating systems for
  Azure File upload, and instructions on how to configure the mounted folder.

  Solution details -

  Users table -
  ![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0013800001.png)

  Web Application -
  You enable MSI for the Web App and configure the Web App to use the security principal name.

  Processing -
  Processing is performed by an Azure Function that uses version 2 of the Azure Function runtime. Once processing is completed, results are stored in Azure Blob
  Storage and an Azure SQL database. Then, an email summary is sent to the user with a link to the processing report. The link to the report must remain valid if the email is forwarded to another user.

  Requirements -

  Receipt processing -
  Concurrent processing of a receipt must be prevented.

  Logging -
  Azure Application Insights is used for telemetry and logging in both the processor and the web application. The processor also has TraceWriter logging enabled.
  Application Insights must always contain all log messages.

  Disaster recovery -
  Regional outage must not impact application availability. All DR operations must not be dependent on application running and must ensure that data in the DR region is up to date.

  Security -
  Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.
  All certificates and secrets used to secure data must be stored in Azure Key Vault.
  You must adhere to the Least Privilege Principal and provide privileges which are essential to perform the intended function.
  All access to Azure Storage and Azure SQL database must use the application's Managed Service Identity (MSI)
  Receipt data must always be encrypted at rest.
  All data must be protected in transit.
  User's expense account number must be visible only to logged in users. All other views of the expense account number should include only the last segment with the remaining parts obscured.
  In the case of a security breach, access to all summary reports must be revoked without impacting other parts of the system.

  Issues -

  Upload format issue -
  Employees occasionally report an issue with uploading a receipt using the web application. They report that when they upload a receipt using the Azure File
  Share, the receipt does not appear in their profile. When this occurs, they delete the file in the file share and use the web application, which returns a 500 Internal
  Server error page.

  Capacity issue -
  During busy periods, employees report long delays between the time they upload the receipt and when it appears in the web application.

  Log capacity issue -
  Developers report that the number of log messages in the trace output for the processor is too high, resulting in lost log messages.

  Processing.cs -
  ![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014000001.png)

  Database.cs -
  ![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014100001.png)

  ReceiptUploader.cs -
  ![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014200001.png)

  ConfigureSSE.ps1 -
  ![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014200002.png)QuestionNote: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
  After you answer a question in this question, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
  You need to ensure that the SecurityPin security requirements are met.
  Solution: Using the Azure Portal, add Data Masking to the SecurityPin column, and exclude the dbo user. Add a SQL security policy with a filter predicate based on the user identity.
  Does the solution meet the goal?

  - A. Yes
  - B. No

  [Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/21/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-203/view/21/#)

  **Correct Answer:** *B*
  Instead of DataMasing, enable Always Encrypted for the SecurityPin column.
  Scenario: Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.

- C. Ensure that the Azure Function is set to use a consumption plan.

- D. Ensure that the Azure Function is using an App Service plan.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/21/#) [  Discussion  **8**](https://www.examtopics.com/exams/microsoft/az-203/view/21/#)

**Correct Answer:** *BD*
Azure Functions can run on either a Consumption Plan or a dedicated App Service Plan. If you run in a dedicated mode, you need to turn on the Always On setting for your Function App to run properly. The Function runtime will go idle after a few minutes of inactivity, so only HTTP triggers will actually "wake up" your functions. This is similar to how WebJobs must have Always On enabled.
Scenario: Notification latency: Users report that anomaly detection emails can sometimes arrive several minutes after an anomaly is detected.
Anomaly detection service: You have an anomaly detection service that analyzes log information for anomalies. It is implemented as an Azure Machine Learning model. The model is deployed as a web service.
If an anomaly is detected, an Azure Function that emails administrators is called by using an HTTP WebHook.
References:
https://github.com/Azure/Azure-Functions/wiki/Enable-Always-On-when-running-on-dedicated-App-Service-Plan

## Topic 8 - Testlet 10

Question #1*Topic 8*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Litware Inc., a SaaS company that provides a solution for managing employee expenses. The solution consists of an ASP.NET Core Web
API project that is deployed as an Azure Web App.

Overall architecture -
Employees upload receipts for the system to process. When processing is complete, the employee receives a summary report email that details the processing results. Employees then use a web application to manage their receipts and perform any additional tasks needed for reimbursement.

Receipt processing -
Employees may upload receipts in two ways:
Uploading using an Azure Files mounted folder
Uploading using the web application

Data Storage -
Receipt and employee information is stored in an Azure SQL database.

Documentation -
Employees are provided with a getting started document when they first use the solution. The documentation includes details on supported operating systems for
Azure File upload, and instructions on how to configure the mounted folder.

Solution details -

Users table -
![img](https://www.examtopics.com/assets/media/exam-media/02838/0013800001.png)

Web Application -
You enable MSI for the Web App and configure the Web App to use the security principal name.

Processing -
Processing is performed by an Azure Function that uses version 2 of the Azure Function runtime. Once processing is completed, results are stored in Azure Blob
Storage and an Azure SQL database. Then, an email summary is sent to the user with a link to the processing report. The link to the report must remain valid if the email is forwarded to another user.

Requirements -

Receipt processing -
Concurrent processing of a receipt must be prevented.

Logging -
Azure Application Insights is used for telemetry and logging in both the processor and the web application. The processor also has TraceWriter logging enabled.
Application Insights must always contain all log messages.

Disaster recovery -
Regional outage must not impact application availability. All DR operations must not be dependent on application running and must ensure that data in the DR region is up to date.

Security -
Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.
All certificates and secrets used to secure data must be stored in Azure Key Vault.
You must adhere to the Least Privilege Principal and provide privileges which are essential to perform the intended function.
All access to Azure Storage and Azure SQL database must use the application's Managed Service Identity (MSI)
Receipt data must always be encrypted at rest.
All data must be protected in transit.
User's expense account number must be visible only to logged in users. All other views of the expense account number should include only the last segment with the remaining parts obscured.
In the case of a security breach, access to all summary reports must be revoked without impacting other parts of the system.

Issues -

Upload format issue -
Employees occasionally report an issue with uploading a receipt using the web application. They report that when they upload a receipt using the Azure File
Share, the receipt does not appear in their profile. When this occurs, they delete the file in the file share and use the web application, which returns a 500 Internal
Server error page.

Capacity issue -
During busy periods, employees report long delays between the time they upload the receipt and when it appears in the web application.

Log capacity issue -
Developers report that the number of log messages in the trace output for the processor is too high, resulting in lost log messages.

Processing.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014000001.png)

Database.cs -
![img](https://www.examtopics.com/assets/media/exam-media/02838/0014100001.png)

ReceiptUploader.cs -
![img](https://www.examtopics.com/assets/media/exam-media/02838/0014200001.png)

ConfigureSSE.ps1 -
![img](https://www.examtopics.com/assets/media/exam-media/02838/0014200002.png)QuestionNote: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this question, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You need to ensure that the SecurityPin security requirements are met.
Solution: Enable Always Encrypted for the SecurityPin column using a certificate based on a trusted certificate authority. Update the Getting Started document with instructions to ensure that the certificate is installed on user machines.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/21/#) [  Discussion  **1**](https://www.examtopics.com/exams/microsoft/az-203/view/21/#)

**Correct Answer:** *B*
Enable Always Encrypted is correct, but only the WebAppIdentity service principal should be given access to the certificate.
Scenario: Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.

Question #2*Topic 8*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Litware Inc., a SaaS company that provides a solution for managing employee expenses. The solution consists of an ASP.NET Core Web
API project that is deployed as an Azure Web App.

Overall architecture -
Employees upload receipts for the system to process. When processing is complete, the employee receives a summary report email that details the processing results. Employees then use a web application to manage their receipts and perform any additional tasks needed for reimbursement.

Receipt processing -
Employees may upload receipts in two ways:
Uploading using an Azure Files mounted folder
Uploading using the web application

Data Storage -
Receipt and employee information is stored in an Azure SQL database.

Documentation -
Employees are provided with a getting started document when they first use the solution. The documentation includes details on supported operating systems for
Azure File upload, and instructions on how to configure the mounted folder.

Solution details -

Users table -
![img](https://www.examtopics.com/assets/media/exam-media/02838/0013800001.png)

Web Application -
You enable MSI for the Web App and configure the Web App to use the security principal name.

Processing -
Processing is performed by an Azure Function that uses version 2 of the Azure Function runtime. Once processing is completed, results are stored in Azure Blob
Storage and an Azure SQL database. Then, an email summary is sent to the user with a link to the processing report. The link to the report must remain valid if the email is forwarded to another user.

Requirements -

Receipt processing -
Concurrent processing of a receipt must be prevented.

Logging -
Azure Application Insights is used for telemetry and logging in both the processor and the web application. The processor also has TraceWriter logging enabled.
Application Insights must always contain all log messages.

Disaster recovery -
Regional outage must not impact application availability. All DR operations must not be dependent on application running and must ensure that data in the DR region is up to date.

Security -
Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.
All certificates and secrets used to secure data must be stored in Azure Key Vault.
You must adhere to the Least Privilege Principal and provide privileges which are essential to perform the intended function.
All access to Azure Storage and Azure SQL database must use the application's Managed Service Identity (MSI)
Receipt data must always be encrypted at rest.
All data must be protected in transit.
User's expense account number must be visible only to logged in users. All other views of the expense account number should include only the last segment with the remaining parts obscured.
In the case of a security breach, access to all summary reports must be revoked without impacting other parts of the system.

Issues -

Upload format issue -
Employees occasionally report an issue with uploading a receipt using the web application. They report that when they upload a receipt using the Azure File
Share, the receipt does not appear in their profile. When this occurs, they delete the file in the file share and use the web application, which returns a 500 Internal
Server error page.

Capacity issue -
During busy periods, employees report long delays between the time they upload the receipt and when it appears in the web application.

Log capacity issue -
Developers report that the number of log messages in the trace output for the processor is too high, resulting in lost log messages.

Processing.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014000001.png)

Database.cs -
![img](https://www.examtopics.com/assets/media/exam-media/02838/0014100001.png)

ReceiptUploader.cs -
![img](https://www.examtopics.com/assets/media/exam-media/02838/0014200001.png)

ConfigureSSE.ps1 -
![img](https://www.examtopics.com/assets/media/exam-media/02838/0014200002.png)QuestionNote: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this question, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You need to ensure that the SecurityPin security requirements are met.
Solution: Using the Azure Portal, add Data Masking to the SecurityPin column, and exclude the dbo user. Add a SQL security policy with a filter predicate based on the user identity.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/21/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-203/view/21/#)

**Correct Answer:** *B*
Instead of DataMasing, enable Always Encrypted for the SecurityPin column.
Scenario: Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.

Question #3*Topic 8*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Litware Inc., a SaaS company that provides a solution for managing employee expenses. The solution consists of an ASP.NET Core Web
API project that is deployed as an Azure Web App.

Overall architecture -
Employees upload receipts for the system to process. When processing is complete, the employee receives a summary report email that details the processing results. Employees then use a web application to manage their receipts and perform any additional tasks needed for reimbursement.

Receipt processing -
Employees may upload receipts in two ways:
Uploading using an Azure Files mounted folder
Uploading using the web application

Data Storage -
Receipt and employee information is stored in an Azure SQL database.

Documentation -
Employees are provided with a getting started document when they first use the solution. The documentation includes details on supported operating systems for
Azure File upload, and instructions on how to configure the mounted folder.

Solution details -

Users table -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0013800001.png)

Web Application -
You enable MSI for the Web App and configure the Web App to use the security principal name.

Processing -
Processing is performed by an Azure Function that uses version 2 of the Azure Function runtime. Once processing is completed, results are stored in Azure Blob
Storage and an Azure SQL database. Then, an email summary is sent to the user with a link to the processing report. The link to the report must remain valid if the email is forwarded to another user.

Requirements -

Receipt processing -
Concurrent processing of a receipt must be prevented.

Logging -
Azure Application Insights is used for telemetry and logging in both the processor and the web application. The processor also has TraceWriter logging enabled.
Application Insights must always contain all log messages.

Disaster recovery -
Regional outage must not impact application availability. All DR operations must not be dependent on application running and must ensure that data in the DR region is up to date.

Security -
Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.
All certificates and secrets used to secure data must be stored in Azure Key Vault.
You must adhere to the Least Privilege Principal and provide privileges which are essential to perform the intended function.
All access to Azure Storage and Azure SQL database must use the application's Managed Service Identity (MSI)
Receipt data must always be encrypted at rest.
All data must be protected in transit.
User's expense account number must be visible only to logged in users. All other views of the expense account number should include only the last segment with the remaining parts obscured.
In the case of a security breach, access to all summary reports must be revoked without impacting other parts of the system.

Issues -

Upload format issue -
Employees occasionally report an issue with uploading a receipt using the web application. They report that when they upload a receipt using the Azure File
Share, the receipt does not appear in their profile. When this occurs, they delete the file in the file share and use the web application, which returns a 500 Internal
Server error page.

Capacity issue -
During busy periods, employees report long delays between the time they upload the receipt and when it appears in the web application.

Log capacity issue -
Developers report that the number of log messages in the trace output for the processor is too high, resulting in lost log messages.

Processing.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014000001.png)

Database.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014100001.png)

ReceiptUploader.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014200001.png)

ConfigureSSE.ps1 -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014200002.png)QuestionNote: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this question, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You need to ensure that the SecurityPin security requirements are met.
Solution: Enable Always Encrypted for the SecurityPin column using a certificate contained in Azure Key Vault and grant the WebAppIdentity service principal access to the certificate.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/22/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-203/view/22/#)

**Correct Answer:** *A*
Scenario: Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.

Question #4*Topic 8*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Litware Inc., a SaaS company that provides a solution for managing employee expenses. The solution consists of an ASP.NET Core Web
API project that is deployed as an Azure Web App.

Overall architecture -
Employees upload receipts for the system to process. When processing is complete, the employee receives a summary report email that details the processing results. Employees then use a web application to manage their receipts and perform any additional tasks needed for reimbursement.

Receipt processing -
Employees may upload receipts in two ways:
Uploading using an Azure Files mounted folder
Uploading using the web application

Data Storage -
Receipt and employee information is stored in an Azure SQL database.

Documentation -
Employees are provided with a getting started document when they first use the solution. The documentation includes details on supported operating systems for
Azure File upload, and instructions on how to configure the mounted folder.

Solution details -

Users table -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0013800001.png)

Web Application -
You enable MSI for the Web App and configure the Web App to use the security principal name.

Processing -
Processing is performed by an Azure Function that uses version 2 of the Azure Function runtime. Once processing is completed, results are stored in Azure Blob
Storage and an Azure SQL database. Then, an email summary is sent to the user with a link to the processing report. The link to the report must remain valid if the email is forwarded to another user.

Requirements -

Receipt processing -
Concurrent processing of a receipt must be prevented.

Logging -
Azure Application Insights is used for telemetry and logging in both the processor and the web application. The processor also has TraceWriter logging enabled.
Application Insights must always contain all log messages.

Disaster recovery -
Regional outage must not impact application availability. All DR operations must not be dependent on application running and must ensure that data in the DR region is up to date.

Security -
Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.
All certificates and secrets used to secure data must be stored in Azure Key Vault.
You must adhere to the Least Privilege Principal and provide privileges which are essential to perform the intended function.
All access to Azure Storage and Azure SQL database must use the application's Managed Service Identity (MSI)
Receipt data must always be encrypted at rest.
All data must be protected in transit.
User's expense account number must be visible only to logged in users. All other views of the expense account number should include only the last segment with the remaining parts obscured.
In the case of a security breach, access to all summary reports must be revoked without impacting other parts of the system.

Issues -

Upload format issue -
Employees occasionally report an issue with uploading a receipt using the web application. They report that when they upload a receipt using the Azure File
Share, the receipt does not appear in their profile. When this occurs, they delete the file in the file share and use the web application, which returns a 500 Internal
Server error page.

Capacity issue -
During busy periods, employees report long delays between the time they upload the receipt and when it appears in the web application.

Log capacity issue -
Developers report that the number of log messages in the trace output for the processor is too high, resulting in lost log messages.

Processing.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014000001.png)

Database.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014100001.png)

ReceiptUploader.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014200001.png)

ConfigureSSE.ps1 -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014200002.png)QuestionYou need to ensure the security policies are met.
What code do you add at line CS07?

- A. -PermissionsToCertificates create, encrypt, decrypt
- B. -PermissionsToKeys wrapkey, unwrapkey, get
- C. -PermissionsToCertificates wrapkey, unwrapkey, get
- D. -PermissionsToKeys create, encrypt, decrypt

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/22/#) [  Discussion  **12**](https://www.examtopics.com/exams/microsoft/az-203/view/22/#)

**Correct Answer:** *A*
Scenario: All certificates and secrets used to secure data must be stored in Azure Key Vault.
You must adhere to the principle of least privilege and provide privileges which are essential to perform the intended function.
The Set-AzureRmKeyValutAccessPolicy parameter -PermissionsToKeys specifies an array of key operation permissions to grant to a user or service principal.
The acceptable values for this parameter: decrypt, encrypt, unwrapKey, wrapKey, verify, sign, get, list, update, create, import, delete, backup, restore, recover, purge
Incorrect Answers:
A, C: The Set-AzureRmKeyValutAccessPolicy parameter -PermissionsToCertificates specifies an array of certificate permissions to grant to a user or service principal. The acceptable values for this parameter: get, list, delete, create, import, update, managecontacts, getissuers, listissuers, setissuers, deleteissuers, manageissuers, recover, purge, backup, restore
References:
https://docs.microsoft.com/en-us/powershell/module/azurerm.keyvault/set-azurermkeyvaultaccesspolicy

Question #5*Topic 8*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Litware Inc., a SaaS company that provides a solution for managing employee expenses. The solution consists of an ASP.NET Core Web
API project that is deployed as an Azure Web App.

Overall architecture -
Employees upload receipts for the system to process. When processing is complete, the employee receives a summary report email that details the processing results. Employees then use a web application to manage their receipts and perform any additional tasks needed for reimbursement.

Receipt processing -
Employees may upload receipts in two ways:
Uploading using an Azure Files mounted folder
Uploading using the web application

Data Storage -
Receipt and employee information is stored in an Azure SQL database.

Documentation -
Employees are provided with a getting started document when they first use the solution. The documentation includes details on supported operating systems for
Azure File upload, and instructions on how to configure the mounted folder.

Solution details -

Users table -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0013800001.png)

Web Application -
You enable MSI for the Web App and configure the Web App to use the security principal name.

Processing -
Processing is performed by an Azure Function that uses version 2 of the Azure Function runtime. Once processing is completed, results are stored in Azure Blob
Storage and an Azure SQL database. Then, an email summary is sent to the user with a link to the processing report. The link to the report must remain valid if the email is forwarded to another user.

Requirements -

Receipt processing -
Concurrent processing of a receipt must be prevented.

Logging -
Azure Application Insights is used for telemetry and logging in both the processor and the web application. The processor also has TraceWriter logging enabled.
Application Insights must always contain all log messages.

Disaster recovery -
Regional outage must not impact application availability. All DR operations must not be dependent on application running and must ensure that data in the DR region is up to date.

Security -
Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.
All certificates and secrets used to secure data must be stored in Azure Key Vault.
You must adhere to the Least Privilege Principal and provide privileges which are essential to perform the intended function.
All access to Azure Storage and Azure SQL database must use the application's Managed Service Identity (MSI)
Receipt data must always be encrypted at rest.
All data must be protected in transit.
User's expense account number must be visible only to logged in users. All other views of the expense account number should include only the last segment with the remaining parts obscured.
In the case of a security breach, access to all summary reports must be revoked without impacting other parts of the system.

Issues -

Upload format issue -
Employees occasionally report an issue with uploading a receipt using the web application. They report that when they upload a receipt using the Azure File
Share, the receipt does not appear in their profile. When this occurs, they delete the file in the file share and use the web application, which returns a 500 Internal
Server error page.

Capacity issue -
During busy periods, employees report long delays between the time they upload the receipt and when it appears in the web application.

Log capacity issue -
Developers report that the number of log messages in the trace output for the processor is too high, resulting in lost log messages.

Processing.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014000001.png)

Database.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014100001.png)

ReceiptUploader.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014200001.png)

ConfigureSSE.ps1 -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014200002.png)QuestionNote: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this question, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You need to ensure that the SecurityPin security requirements are met.
Solution: Configure the web application to connect to the database using the WebAppIdentity security prinicipal. Using the Azure Portal, add Data Masking to the
SecurityPin column and exclude the WebAppIdentity service principal.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/22/#) [  Discussion  **6**](https://www.examtopics.com/exams/microsoft/az-203/view/22/#)

**Correct Answer:** *A*
Scenario: Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.
All certificates and secrets used to secure data must be stored in Azure Key Vault.

Question #6*Topic 8*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Litware Inc., a SaaS company that provides a solution for managing employee expenses. The solution consists of an ASP.NET Core Web
API project that is deployed as an Azure Web App.

Overall architecture -
Employees upload receipts for the system to process. When processing is complete, the employee receives a summary report email that details the processing results. Employees then use a web application to manage their receipts and perform any additional tasks needed for reimbursement.

Receipt processing -
Employees may upload receipts in two ways:
Uploading using an Azure Files mounted folder
Uploading using the web application

Data Storage -
Receipt and employee information is stored in an Azure SQL database.

Documentation -
Employees are provided with a getting started document when they first use the solution. The documentation includes details on supported operating systems for
Azure File upload, and instructions on how to configure the mounted folder.

Solution details -

Users table -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0013800001.png)

Web Application -
You enable MSI for the Web App and configure the Web App to use the security principal name.

Processing -
Processing is performed by an Azure Function that uses version 2 of the Azure Function runtime. Once processing is completed, results are stored in Azure Blob
Storage and an Azure SQL database. Then, an email summary is sent to the user with a link to the processing report. The link to the report must remain valid if the email is forwarded to another user.

Requirements -

Receipt processing -
Concurrent processing of a receipt must be prevented.

Logging -
Azure Application Insights is used for telemetry and logging in both the processor and the web application. The processor also has TraceWriter logging enabled.
Application Insights must always contain all log messages.

Disaster recovery -
Regional outage must not impact application availability. All DR operations must not be dependent on application running and must ensure that data in the DR region is up to date.

Security -
Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.
All certificates and secrets used to secure data must be stored in Azure Key Vault.
You must adhere to the Least Privilege Principal and provide privileges which are essential to perform the intended function.
All access to Azure Storage and Azure SQL database must use the application's Managed Service Identity (MSI)
Receipt data must always be encrypted at rest.
All data must be protected in transit.
User's expense account number must be visible only to logged in users. All other views of the expense account number should include only the last segment with the remaining parts obscured.
In the case of a security breach, access to all summary reports must be revoked without impacting other parts of the system.

Issues -

Upload format issue -
Employees occasionally report an issue with uploading a receipt using the web application. They report that when they upload a receipt using the Azure File
Share, the receipt does not appear in their profile. When this occurs, they delete the file in the file share and use the web application, which returns a 500 Internal
Server error page.

Capacity issue -
During busy periods, employees report long delays between the time they upload the receipt and when it appears in the web application.

Log capacity issue -
Developers report that the number of log messages in the trace output for the processor is too high, resulting in lost log messages.

Processing.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014000001.png)

Database.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014100001.png)

ReceiptUploader.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014200001.png)

ConfigureSSE.ps1 -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014200002.png)QuestionHOTSPOT -
You need to ensure that security policies are met.
What code should you add at line PC26?
To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/22/#) [  Discussion  **6**](https://www.examtopics.com/exams/microsoft/az-203/view/22/#)

**Correct Answer:** *Explanation*
Box 1: var key = await Resolver.ResolveKeyAsyn(keyBundle,KeyIdentifier.CancellationToken.None);
Box 2: var x = new BlobEncryptionPolicy(key,resolver);
Example:
// We begin with cloudKey1, and a resolver capable of resolving and caching Key Vault secrets.
BlobEncryptionPolicy encryptionPolicy = new BlobEncryptionPolicy(cloudKey1, cachingResolver); client.DefaultRequestOptions.EncryptionPolicy = encryptionPolicy;
Box 3: cloudblobClient. DefaultRequestOptions.EncryptionPolicy = x;
References:
https://github.com/Azure/azure-storage-net/blob/master/Samples/GettingStarted/EncryptionSamples/KeyRotation/Program.cs

Question #7*Topic 8*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Litware Inc., a SaaS company that provides a solution for managing employee expenses. The solution consists of an ASP.NET Core Web
API project that is deployed as an Azure Web App.

Overall architecture -
Employees upload receipts for the system to process. When processing is complete, the employee receives a summary report email that details the processing results. Employees then use a web application to manage their receipts and perform any additional tasks needed for reimbursement.

Receipt processing -
Employees may upload receipts in two ways:
Uploading using an Azure Files mounted folder
Uploading using the web application

Data Storage -
Receipt and employee information is stored in an Azure SQL database.

Documentation -
Employees are provided with a getting started document when they first use the solution. The documentation includes details on supported operating systems for
Azure File upload, and instructions on how to configure the mounted folder.

Solution details -

Users table -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0013800001.png)

Web Application -
You enable MSI for the Web App and configure the Web App to use the security principal name.

Processing -
Processing is performed by an Azure Function that uses version 2 of the Azure Function runtime. Once processing is completed, results are stored in Azure Blob
Storage and an Azure SQL database. Then, an email summary is sent to the user with a link to the processing report. The link to the report must remain valid if the email is forwarded to another user.

Requirements -

Receipt processing -
Concurrent processing of a receipt must be prevented.

Logging -
Azure Application Insights is used for telemetry and logging in both the processor and the web application. The processor also has TraceWriter logging enabled.
Application Insights must always contain all log messages.

Disaster recovery -
Regional outage must not impact application availability. All DR operations must not be dependent on application running and must ensure that data in the DR region is up to date.

Security -
Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.
All certificates and secrets used to secure data must be stored in Azure Key Vault.
You must adhere to the Least Privilege Principal and provide privileges which are essential to perform the intended function.
All access to Azure Storage and Azure SQL database must use the application's Managed Service Identity (MSI)
Receipt data must always be encrypted at rest.
All data must be protected in transit.
User's expense account number must be visible only to logged in users. All other views of the expense account number should include only the last segment with the remaining parts obscured.
In the case of a security breach, access to all summary reports must be revoked without impacting other parts of the system.

Issues -

Upload format issue -
Employees occasionally report an issue with uploading a receipt using the web application. They report that when they upload a receipt using the Azure File
Share, the receipt does not appear in their profile. When this occurs, they delete the file in the file share and use the web application, which returns a 500 Internal
Server error page.

Capacity issue -
During busy periods, employees report long delays between the time they upload the receipt and when it appears in the web application.

Log capacity issue -
Developers report that the number of log messages in the trace output for the processor is too high, resulting in lost log messages.

Processing.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014000001.png)

Database.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014100001.png)

ReceiptUploader.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014200001.png)

ConfigureSSE.ps1 -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0014200002.png)QuestionHOTSPOT -
You need to ensure that security requirements are met.
How should you complete the code segment?
To answer, select the appropriate option in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/23/#) [  Discussion  **12**](https://www.examtopics.com/exams/microsoft/az-203/view/23/#)

**Correct Answer:** *Explanation*
Box 1: ExpenseAccount -
Scenario: User's expense account number must be visible only to logged in users. All other views of the expense account number should include only the last segment. With the remaining parts obscured.

Box 2: Text -
If MaskingFunction has a value of Number or Text, you can specify the NumberFrom and NumberTo parameters, for number masking, or the PrefixSize,
ReplacementString, and SuffixSize for text masking.

Box 3: 4 -
-SuffixSize specifies the number of characters at the end of the text that are not masked. Specify this parameter only if you specify a value of Text for the
MaskingFunction parameter.
Scenario: Format is 1234-1234-1235
Box 4: xxxx"
Scenario: Format is 1234-1234-1235
References:
https://docs.microsoft.com/en-us/powershell/module/azurerm.sql/new-azurermsqldatabasedatamaskingrule?view=azurermps-6.13.0

## Topic 9 - Testlet 11

Question #1*Topic 9*

Introductory InfoCase study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Proseware, Inc. You are developing an application that applies a set of governance policies for Proseware's internal services, external services, and applications. The application will also provide a shared library for common functionality.

Requirements -

Policy service -
You develop and deploy a stateful ASP.NET Core 2.1 web application named Policy service to an Azure App Service Web App. The application reacts to events from Azure Event Grid and performs policy actions based on those events.
The application must include the Event Grid Event ID field in all Application Insights telemetry.
Policy service must use Application Insights to automatically scale with the number of policy actions that it is performing.

Policies -

Log Policy -
All Azure App Service Web Apps must write logs to Azure Blob storage. All log files should be saved to a container named logdrop. Logs must remain in the container for 15 days.

Authentication events -
Authentication events are used to monitor users signing in and signing out. All authentication events must be processed by Policy service. Sign outs must be processed as quickly as possible.

PolicyLib -
You have a shared library named PolicyLib that contains functionality common to all ASP.NET Core web services and applications. The PolicyLib library must:
Exclude non-user actions from Application Insights telemetry.
Provide methods that allow a web service to scale itself
Ensure that scaling actions do not disrupt application usage

Other -

Anomaly detection service -
You have an anomaly detection service that analyzes log information for anomalies. It is implemented as an Azure Machine Learning model. The model is deployed as a web service.
If an anomaly is detected, an Azure Function that emails administrators is called by using an HTTP WebHook.

Health monitoring -
All web applications and services have health monitoring at the /health service endpoint.

Policy loss -
When you deploy Policy service, policies may not be applied if they were in the process of being applied during the deployment.

Performance issue -
When under heavy load, the anomaly detection service undergoes slowdowns and rejects connections.

Notification latency -
Users report that anomaly detection emails can sometimes arrive several minutes after an anomaly is detected.
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0015000001.png)
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0015100001.png)
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0015200001.png)QuestionNote: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this question, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You need to ensure that authentication events are triggered and processed according to the authentication events policy.
Solution: Create a new Azure Event Grid subscription for all authentication that delivers messages to an Azure Event Hub. Use the subscription to process signout events.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/23/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-203/view/23/#)

**Correct Answer:** *B*
Use a separate Azure Event Grid topics and subscriptions for sign-in and sign-out events.
Scenario: Authentication events are used to monitor users signing in and signing out. All authentication events must be processed by Policy service. Sign outs must be processed as quickly as possible.

## Topic 10 - Testlet 12

Question #1*Topic 10*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an
All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
Wide World Importers is moving all their datacenters to Azure. The company has developed several applications and services to support supply chain operations and would like to leverage serverless computing where possible.

Current environment -
Windows Server 2016 virtual machine
This virtual machine (VM) runs Biz Talk Server 2016. The VM runs the following workflows:
Ocean Transport "" This workflow gathers and validates container infromation including container contents and arrival notices at various shipping ports.
Inland Transport "" This workflow gathers and validates trucking information including fuel usage, number of stops, and routes.
The VM supports the following REST API calls:
Container API "" This API provides container information including weight, contents, and other attributes.
Location API "" This API provides location information regarding shipping ports of call and truck stops.
Shipping REST API "" This API provides shipping information for use and display on the shipping website.

Shipping Data -
The application uses MongoDB JSON document storage database for all container and transport information.

Proposed solution -
The site displays shipping container tracking information and container contents. The site is located at http://shipping.wideworldimporters.com
The on-premises shipping application must be moved to Azure. The VM has been migrated to a new Standard_D16s_v3 Azure VM by using Azure Site Recovery and must remain running in Azure to complete the BizTalk component migrations. You create a Standard_D16s_v3 Azure VM to host BizTalk Server. The Azure architecture diagram for the proposed solution is shown below:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0015500001.jpg)

Shipping Logic App -
The Shipping Logic app must meet the following requirements:
Support the ocean transport and inland transport workflows by using a Logic App.
Support industry standard protocol X12 message format for various messages including vessel content details and arrival notices.
Secure resources to the corporate VNet and use dedicated storage resources with a fixed costing model.
Maintain on-premises connectivity to support legacy applications and final BizTalk migrations.

Shipping Function app -
Implement secure function endpoints by using app-level security and include Azure Active Directory (Azure AD).

REST APIs -
The REST API's that support the solution must meet the following requirements:
Secure resources to the corporate VNet.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0015500006.png)
Allow deployment to a testing location within Azure while not incurring additional costs.
Automatically scale to double capacity during peak shipping times while not causing application downtime.
Minimize costs when selecting an Azure payment model.

Shipping data -
Data migration from on-premises to Azure must minimize costs and downtime.

Shipping website -
Use Azure Content Delivery Network (CDN) and ensure maximum performance for dynamic content while minimizing latency and costs.

Issues -

Windows Server 2016 VM -
The VM shows high network latency, jitter, and high CPU utilization. The VM is critical and has not been backed up in the past. The VM must enable a quick restore from a 7-day snapshot to include in-place restore of disks in case of failure.

Shipping website and REST APIs -
The following error message displays while you are testing the website:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0015600004.jpg)QuestionHOTSPOT -
You need to resolve the Shipping web site error.
How should you configre the Azure Table Storage service? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0015700001.png)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/23/#) [  Discussion  **19**](https://www.examtopics.com/exams/microsoft/az-203/view/23/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0015700002.png)*
Box 1: AllowedOrigins -
A CORS request will fail if Access-Control-Allow-Origin is missing.
Scenario:
The following error message displays while you are testing the website:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0015800001.png)
Box 2: http://test-shippingapi.wideworldimporters.com
Syntax: Access-Control-Allow-Origin: *
Access-Control-Allow-Origin: <origin>
Access-Control-Allow-Origin: null
<origin> Specifies an origin. Only a single origin can be specified.

Box 3: AllowedOrigins -

Box 4: POST -
The only allowed methods are GET, HEAD, and POST. In this case POST is used.
"<Corsrule>" "allowedmethods" Failed to load no "Access-control-Origin" header is present
References:
https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Origin

## Topic 11 - Testlet 13

Question #1*Topic 11*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Proseware, Inc. You are developing an application that applies a set of governance policies for Proseware's internal services, external services, and applications. The application will also provide a shared library for common functionality.

Policy service -
You develop and deploy a stateful ASP.NET Core 2.1 web application named Policy service to an Azure App Service Web App. The application reacts to events from Azure Event Grid and performs policy actions based on those events.
The application must include the Event Grid Event ID field in all Application Insights telemetry.
Policy service must use Application Insights to automatically scale with the number of policy actions that it is performing.

Other -

Anomaly detection service -
You have an anomaly detection service that analyzes log information for anomalies. It is implemented as an Azure Machine Learning model. The model is deployed as a web service.
If an anomaly is detected, an Azure Function that emails administrators is called by using an HTTP WebHook.

Health monitoring -
All web applications and services have health monitoring at the /health service endpoint.

Issues -

Policy loss -
When you deploy Policy service, policies may not be applied if they were in the process of being applied during the deployment.

Performance issue -
When under heavy load, the anomaly detection service undergoes slowdowns and rejects connections.

Notification latency -
Users report that anomaly detection emails can sometimes arrive several minutes after an anomaly is detected.

Policies -

Log policy -
All Azure App Service Web Apps must write logs to Azure Blob storage. All log files should be saved to a container named logdrop. Logs must remain in the container for 15 days.

Authentication events -
Authentication events are used to monitor users signing in and signing out. All authentication events must be processed by Policy service. Sign outs must be processed as quickly as possible.

PolicyLib -
You have a shared library named PolicyLib that contains functionality common to all ASP.NET Core web services and applications. The PolicyLib library must:
Exclude non-user actions from Application Insights telemetry.
Provide methods that allow a web service to scale itself.
Ensure that scaling actions do not disrupt application usage.
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0017100001.png)
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0017200001.png)QuestionYou need to meet the scaling requirements for Policy Service.
What should you store in Azure Redis Cache?

- A. TempData
- B. HttpContext.Items
- C. ViewState
- D. Session state

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/23/#) [  Discussion  **2**](https://www.examtopics.com/exams/microsoft/az-203/view/23/#)

**Correct Answer:** *D*
Azure Cache for Redis provides a session state provider that you can use to store your session state in-memory with Azure Cache for Redis instead of a SQL
Server database.
Scenario: You have a shared library named PolicyLib that contains functionality common to all ASP.NET Core web services and applications. The PolicyLib library must:
Ensure that scaling actions do not disrupt application usage.
References:
https://docs.microsoft.com/en-us/azure/azure-cache-for-redis/cache-aspnet-session-state-provider

Question #2*Topic 11*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Proseware, Inc. You are developing an application that applies a set of governance policies for Proseware's internal services, external services, and applications. The application will also provide a shared library for common functionality.

Policy service -
You develop and deploy a stateful ASP.NET Core 2.1 web application named Policy service to an Azure App Service Web App. The application reacts to events from Azure Event Grid and performs policy actions based on those events.
The application must include the Event Grid Event ID field in all Application Insights telemetry.
Policy service must use Application Insights to automatically scale with the number of policy actions that it is performing.

Other -

Anomaly detection service -
You have an anomaly detection service that analyzes log information for anomalies. It is implemented as an Azure Machine Learning model. The model is deployed as a web service.
If an anomaly is detected, an Azure Function that emails administrators is called by using an HTTP WebHook.

Health monitoring -
All web applications and services have health monitoring at the /health service endpoint.

Issues -

Policy loss -
When you deploy Policy service, policies may not be applied if they were in the process of being applied during the deployment.

Performance issue -
When under heavy load, the anomaly detection service undergoes slowdowns and rejects connections.

Notification latency -
Users report that anomaly detection emails can sometimes arrive several minutes after an anomaly is detected.

Policies -

Log policy -
All Azure App Service Web Apps must write logs to Azure Blob storage. All log files should be saved to a container named logdrop. Logs must remain in the container for 15 days.

Authentication events -
Authentication events are used to monitor users signing in and signing out. All authentication events must be processed by Policy service. Sign outs must be processed as quickly as possible.

PolicyLib -
You have a shared library named PolicyLib that contains functionality common to all ASP.NET Core web services and applications. The PolicyLib library must:
Exclude non-user actions from Application Insights telemetry.
Provide methods that allow a web service to scale itself.
Ensure that scaling actions do not disrupt application usage.
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0017100001.png)
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0017200001.png)QuestionDRAG DROP -
You need to implement telemetry for non-user actions.
How should you complete the Filter class? To answer, drag the appropriate code segments to the correct locations. Each code segment may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/24/#) [  Discussion  **4**](https://www.examtopics.com/exams/microsoft/az-203/view/24/#)

**Correct Answer:** *Explanation*
Scenario: Exclude non-user actions from Application Insights telemetry.

Box 1: ITelemetryProcessor -
To create a filter, implement ITelemetryProcessor. This technique gives you more direct control over what is included or excluded from the telemetry stream.

Box 2: ITelemetryProcessor -

Box 3: ITelemetryProcessor -

Box 4: RequestTelemetry -

Box 5: /health -
To filter out an item, just terminate the chain.
References:
https://docs.microsoft.com/en-us/azure/azure-monitor/app/api-filtering-sampling

Question #3*Topic 11*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Proseware, Inc. You are developing an application that applies a set of governance policies for Proseware's internal services, external services, and applications. The application will also provide a shared library for common functionality.

Policy service -
You develop and deploy a stateful ASP.NET Core 2.1 web application named Policy service to an Azure App Service Web App. The application reacts to events from Azure Event Grid and performs policy actions based on those events.
The application must include the Event Grid Event ID field in all Application Insights telemetry.
Policy service must use Application Insights to automatically scale with the number of policy actions that it is performing.

Other -

Anomaly detection service -
You have an anomaly detection service that analyzes log information for anomalies. It is implemented as an Azure Machine Learning model. The model is deployed as a web service.
If an anomaly is detected, an Azure Function that emails administrators is called by using an HTTP WebHook.

Health monitoring -
All web applications and services have health monitoring at the /health service endpoint.

Issues -

Policy loss -
When you deploy Policy service, policies may not be applied if they were in the process of being applied during the deployment.

Performance issue -
When under heavy load, the anomaly detection service undergoes slowdowns and rejects connections.

Notification latency -
Users report that anomaly detection emails can sometimes arrive several minutes after an anomaly is detected.

Policies -

Log policy -
All Azure App Service Web Apps must write logs to Azure Blob storage. All log files should be saved to a container named logdrop. Logs must remain in the container for 15 days.

Authentication events -
Authentication events are used to monitor users signing in and signing out. All authentication events must be processed by Policy service. Sign outs must be processed as quickly as possible.

PolicyLib -
You have a shared library named PolicyLib that contains functionality common to all ASP.NET Core web services and applications. The PolicyLib library must:
Exclude non-user actions from Application Insights telemetry.
Provide methods that allow a web service to scale itself.
Ensure that scaling actions do not disrupt application usage.
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0017100001.png)
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0017200001.png)QuestionYou need to ensure that the solution can meet the scaling requirements for Policy Service.
Which Azure Application Insights data model should you use?

- A. an Application Insights metric
- B. an Application Insights trace
- C. an Application Insights dependency
- D. an Application Insights event

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/24/#) [  Discussion  **5**](https://www.examtopics.com/exams/microsoft/az-203/view/24/#)

**Correct Answer:** *A*
Application Insights provides three additional data types for custom telemetry:
Trace - used either directly, or through an adapter to implement diagnostics logging using an instrumentation framework that is familiar to you, such as Log4Net or
System.Diagnostics.
Event - typically used to capture user interaction with your service, to analyze usage patterns.
Metric - used to report periodic scalar measurements.
Scenario:
Policy service must use Application Insights to automatically scale with the number of policy actions that it is performing.
References:
https://docs.microsoft.com/en-us/azure/azure-monitor/app/data-model

Question #4*Topic 11*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Proseware, Inc. You are developing an application that applies a set of governance policies for Proseware's internal services, external services, and applications. The application will also provide a shared library for common functionality.

Policy service -
You develop and deploy a stateful ASP.NET Core 2.1 web application named Policy service to an Azure App Service Web App. The application reacts to events from Azure Event Grid and performs policy actions based on those events.
The application must include the Event Grid Event ID field in all Application Insights telemetry.
Policy service must use Application Insights to automatically scale with the number of policy actions that it is performing.

Other -

Anomaly detection service -
You have an anomaly detection service that analyzes log information for anomalies. It is implemented as an Azure Machine Learning model. The model is deployed as a web service.
If an anomaly is detected, an Azure Function that emails administrators is called by using an HTTP WebHook.

Health monitoring -
All web applications and services have health monitoring at the /health service endpoint.

Issues -

Policy loss -
When you deploy Policy service, policies may not be applied if they were in the process of being applied during the deployment.

Performance issue -
When under heavy load, the anomaly detection service undergoes slowdowns and rejects connections.

Notification latency -
Users report that anomaly detection emails can sometimes arrive several minutes after an anomaly is detected.

Policies -

Log policy -
All Azure App Service Web Apps must write logs to Azure Blob storage. All log files should be saved to a container named logdrop. Logs must remain in the container for 15 days.

Authentication events -
Authentication events are used to monitor users signing in and signing out. All authentication events must be processed by Policy service. Sign outs must be processed as quickly as possible.

PolicyLib -
You have a shared library named PolicyLib that contains functionality common to all ASP.NET Core web services and applications. The PolicyLib library must:
Exclude non-user actions from Application Insights telemetry.
Provide methods that allow a web service to scale itself.
Ensure that scaling actions do not disrupt application usage.
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0017100001.png)
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0017200001.png)QuestionDRAG DROP -
You need to implement the Log policy.
How should you complete the Azure Event Grid subscription? To answer, drag the appropriate JSON segments to the correct locations. Each JSON segment may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/24/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-203/view/24/#)

**Correct Answer:** *Explanation*
Box 1:WebHook -
Scenario: If an anomaly is detected, an Azure Function that emails administrators is called by using an HTTP WebHook. endpointType: The type of endpoint for the subscription (webhook/HTTP, Event Hub, or queue).

Box 2: SubjectBeginsWith -
Box 3: Microsoft.Storage.BlobCreated

Scenario: Log Policy -
All Azure App Service Web Apps must write logs to Azure Blob storage. All log files should be saved to a container named logdrop. Logs must remain in the container for 15 days.

Example subscription schema -
{
"properties": {
"destination": {
"endpointType": "webhook",
"properties": {
"endpointUrl": "https://example.azurewebsites.net/api/HttpTriggerCSharp1?code=VXbGWce53l48Mt8wuotr0GPmyJ/nDT4hgdFj9DpBiRt38qqnnm5OFg=="
}
},
"filter": {
"includedEventTypes": [ "Microsoft.Storage.BlobCreated", "Microsoft.Storage.BlobDeleted" ],
"subjectBeginsWith": "blobServices/default/containers/mycontainer/log",
[1]
"isSubjectCaseSensitive ": "true"
}
}
}
References:
https://docs.microsoft.com/en-us/azure/event-grid/subscription-creation-schema

Question #5*Topic 11*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Proseware, Inc. You are developing an application that applies a set of governance policies for Proseware's internal services, external services, and applications. The application will also provide a shared library for common functionality.

Policy service -
You develop and deploy a stateful ASP.NET Core 2.1 web application named Policy service to an Azure App Service Web App. The application reacts to events from Azure Event Grid and performs policy actions based on those events.
The application must include the Event Grid Event ID field in all Application Insights telemetry.
Policy service must use Application Insights to automatically scale with the number of policy actions that it is performing.

Other -

Anomaly detection service -
You have an anomaly detection service that analyzes log information for anomalies. It is implemented as an Azure Machine Learning model. The model is deployed as a web service.
If an anomaly is detected, an Azure Function that emails administrators is called by using an HTTP WebHook.

Health monitoring -
All web applications and services have health monitoring at the /health service endpoint.

Issues -

Policy loss -
When you deploy Policy service, policies may not be applied if they were in the process of being applied during the deployment.

Performance issue -
When under heavy load, the anomaly detection service undergoes slowdowns and rejects connections.

Notification latency -
Users report that anomaly detection emails can sometimes arrive several minutes after an anomaly is detected.

Policies -

Log policy -
All Azure App Service Web Apps must write logs to Azure Blob storage. All log files should be saved to a container named logdrop. Logs must remain in the container for 15 days.

Authentication events -
Authentication events are used to monitor users signing in and signing out. All authentication events must be processed by Policy service. Sign outs must be processed as quickly as possible.

PolicyLib -
You have a shared library named PolicyLib that contains functionality common to all ASP.NET Core web services and applications. The PolicyLib library must:
Exclude non-user actions from Application Insights telemetry.
Provide methods that allow a web service to scale itself.
Ensure that scaling actions do not disrupt application usage.
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0017100001.png)
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0017200001.png)QuestionDRAG DROP -
You need to ensure that PolicyLib requirements are met.
How should you complete the code segment? To answer, drag the appropriate code segments to the correct locations. Each code segment may be used once, more than once, or not at all. You may need to drag the split bar between panes or scroll to view content.
NOTE: Each correct selection is worth one point.
Select and Place:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/24/#) [  Discussion  **5**](https://www.examtopics.com/exams/microsoft/az-203/view/24/#)

**Correct Answer:** *Explanation*
Scenario: You have a shared library named PolicyLib that contains functionality common to all ASP.NET Core web services and applications. The PolicyLib library must:
✑ Exclude non-user actions from Application Insights telemetry.
✑ Provide methods that allow a web service to scale itself.
✑ Ensure that scaling actions do not disrupt application usage.

Box 1: ITelemetryInitializer -
Use telemetry initializers to define global properties that are sent with all telemetry; and to override selected behavior of the standard telemetry modules.

Box 2: Initialize -

Box 3: Telemetry.Context -
Box 4: [(EventTelemetry)telemetry.Properties("EventID")
References:
https://docs.microsoft.com/en-us/azure/azure-monitor/app/api-filtering-sampling

## Topic 12 - Testlet 14

Question #1*Topic 12*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Litware Inc., a SaaS company that provides a solution for managing employee expenses. The solution consists of an ASP.NET Core Web
API project that is deployed as an Azure Web App.

Overall architecture -
Employees upload receipts for the system to process. When processing is complete, the employee receives a summary report email that details the processing results. Employees then use a web application to manage their receipts and perform any additional tasks needed for reimbursement.

Receipt processing -
Employees may upload receipts in two ways:
Uploading using an Azure Files mounted folder
Uploading using the web application

Data Storage -
Receipt and employee information is stored in an Azure SQL database.

Documentation -
Employees are provided with a getting started document when they first use the solution. The documentation includes details on supported operating systems for
Azure File upload, and instructions on how to configure the mounted folder.

Solution details -

Users table -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0017800001.png)

Web Application -
You enable MSI for the Web App and configure the Web App to use the security principal name.

Processing -
Processing is performed by an Azure Function that uses version 2 of the Azure Function runtime. Once processing is completed, results are stored in Azure Blob
Storage and an Azure SQL database. Then, an email summary is sent to the user with a link to the processing report. The link to the report must remain valid if the email is forwarded to another user.

Requirements -

Receipt processing -
Concurrent processing of a receipt must be prevented.

Logging -
Azure Application Insights is used for telemetry and logging in both the processor and the web application. The processor also has TraceWriter logging enabled.
Application Insights must always contain all log messages.

Disaster recovery -
Regional outage must not impact application availability. All DR operations must not be dependent on application running and must ensure that data in the DR region is up to date.

Security -
Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.
All certificates and secrets used to secure data must be stored in Azure Key Vault.
You must adhere to the Least Privilege Principal and provide privileges which are essential to perform the intended function.
All access to Azure Storage and Azure SQL database must use the application's Managed Service Identity (MSI)
Receipt data must always be encrypted at rest.
All data must be protected in transit.
User's expense account number must be visible only to logged in users. All other views of the expense account number should include only the last segment with the remaining parts obscured.
In the case of a security breach, access to all summary reports must be revoked without impacting other parts of the system.

Issues -

Upload format issue -
Employees occasionally report an issue with uploading a receipt using the web application. They report that when they upload a receipt using the Azure File
Share, the receipt does not appear in their profile. When this occurs, they delete the file in the file share and use the web application, which returns a 500 Internal
Server error page.

Capacity issue -
During busy periods, employees report long delays between the time they upload the receipt and when it appears in the web application.

Log capacity issue -
Developers report that the number of log messages in the trace output for the processor is too high, resulting in lost log messages.

Processing.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0018000001.png)

Database.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0018100001.png)

ReceiptUploader.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0018200001.png)

ConfigureSSE.ps1 -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0018200002.png)QuestionYou need to resolve the log capacity issue.
What should you do?

- A. Set a LogCategoryFilter during startup.
- B. Create an Application Insights Telemetry Filter.
- C. Change the minimum log level in the host.json file for the function.
- D. Implement Application Insights Sampling.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/25/#) [  Discussion  **5**](https://www.examtopics.com/exams/microsoft/az-203/view/25/#)

**Correct Answer:** *D*
Scenario, the log capacity issue: Developers report that the number of log message in the trace output for the processor is too high, resulting in lost log messages.
Sampling is a feature in Azure Application Insights. It is the recommended way to reduce telemetry traffic and storage, while preserving a statistically correct analysis of application data. The filter selects items that are related, so that you can navigate between items when you are doing diagnostic investigations. When metric counts are presented to you in the portal, they are renormalized to take account of the sampling, to minimize any effect on the statistics.
Sampling reduces traffic and data costs, and helps you avoid throttling.
References:
https://docs.microsoft.com/en-us/azure/azure-monitor/app/sampling

Question #2*Topic 12*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Litware Inc., a SaaS company that provides a solution for managing employee expenses. The solution consists of an ASP.NET Core Web
API project that is deployed as an Azure Web App.

Overall architecture -
Employees upload receipts for the system to process. When processing is complete, the employee receives a summary report email that details the processing results. Employees then use a web application to manage their receipts and perform any additional tasks needed for reimbursement.

Receipt processing -
Employees may upload receipts in two ways:
Uploading using an Azure Files mounted folder
Uploading using the web application

Data Storage -
Receipt and employee information is stored in an Azure SQL database.

Documentation -
Employees are provided with a getting started document when they first use the solution. The documentation includes details on supported operating systems for
Azure File upload, and instructions on how to configure the mounted folder.

Solution details -

Users table -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0017800001.png)

Web Application -
You enable MSI for the Web App and configure the Web App to use the security principal name.

Processing -
Processing is performed by an Azure Function that uses version 2 of the Azure Function runtime. Once processing is completed, results are stored in Azure Blob
Storage and an Azure SQL database. Then, an email summary is sent to the user with a link to the processing report. The link to the report must remain valid if the email is forwarded to another user.

Requirements -

Receipt processing -
Concurrent processing of a receipt must be prevented.

Logging -
Azure Application Insights is used for telemetry and logging in both the processor and the web application. The processor also has TraceWriter logging enabled.
Application Insights must always contain all log messages.

Disaster recovery -
Regional outage must not impact application availability. All DR operations must not be dependent on application running and must ensure that data in the DR region is up to date.

Security -
Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.
All certificates and secrets used to secure data must be stored in Azure Key Vault.
You must adhere to the Least Privilege Principal and provide privileges which are essential to perform the intended function.
All access to Azure Storage and Azure SQL database must use the application's Managed Service Identity (MSI)
Receipt data must always be encrypted at rest.
All data must be protected in transit.
User's expense account number must be visible only to logged in users. All other views of the expense account number should include only the last segment with the remaining parts obscured.
In the case of a security breach, access to all summary reports must be revoked without impacting other parts of the system.

Issues -

Upload format issue -
Employees occasionally report an issue with uploading a receipt using the web application. They report that when they upload a receipt using the Azure File
Share, the receipt does not appear in their profile. When this occurs, they delete the file in the file share and use the web application, which returns a 500 Internal
Server error page.

Capacity issue -
During busy periods, employees report long delays between the time they upload the receipt and when it appears in the web application.

Log capacity issue -
Developers report that the number of log messages in the trace output for the processor is too high, resulting in lost log messages.

Processing.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0018000001.png)

Database.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0018100001.png)

ReceiptUploader.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0018200001.png)

ConfigureSSE.ps1 -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0018200002.png)QuestionYou need to resolve the capacity issue.
What should you do?

- A. Move the Azure Function to a dedicated App Service Plan.
- B. Convert the trigger on the Azure Function to a File Trigger.
- C. Ensure that the consumption plan is configured correctly to allow for scaling.
- D. Update the loop starting on line PC09 to process items in parallel.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/25/#) [  Discussion  **15**](https://www.examtopics.com/exams/microsoft/az-203/view/25/#)

**Correct Answer:** *D*
If you want to read the files in parallel, you cannot use forEach. Each of the async callback function calls does return a promise. You can await the array of promises that you'll get with Promise.all.
Scenario: Capacity issue: During busy periods, employees report long delays between the time they upload the receipt and when it appears in the web application.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0018400001.png)
References:
https://stackoverflow.com/questions/37576685/using-async-await-with-a-foreach-loop

Question #3*Topic 12*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Litware Inc., a SaaS company that provides a solution for managing employee expenses. The solution consists of an ASP.NET Core Web
API project that is deployed as an Azure Web App.

Overall architecture -
Employees upload receipts for the system to process. When processing is complete, the employee receives a summary report email that details the processing results. Employees then use a web application to manage their receipts and perform any additional tasks needed for reimbursement.

Receipt processing -
Employees may upload receipts in two ways:
Uploading using an Azure Files mounted folder
Uploading using the web application

Data Storage -
Receipt and employee information is stored in an Azure SQL database.

Documentation -
Employees are provided with a getting started document when they first use the solution. The documentation includes details on supported operating systems for
Azure File upload, and instructions on how to configure the mounted folder.

Solution details -

Users table -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0017800001.png)

Web Application -
You enable MSI for the Web App and configure the Web App to use the security principal name.

Processing -
Processing is performed by an Azure Function that uses version 2 of the Azure Function runtime. Once processing is completed, results are stored in Azure Blob
Storage and an Azure SQL database. Then, an email summary is sent to the user with a link to the processing report. The link to the report must remain valid if the email is forwarded to another user.

Requirements -

Receipt processing -
Concurrent processing of a receipt must be prevented.

Logging -
Azure Application Insights is used for telemetry and logging in both the processor and the web application. The processor also has TraceWriter logging enabled.
Application Insights must always contain all log messages.

Disaster recovery -
Regional outage must not impact application availability. All DR operations must not be dependent on application running and must ensure that data in the DR region is up to date.

Security -
Users' SecurityPin must be stored in such a way that access to the database does not allow the viewing of SecurityPins. The web application is the only system that should have access to SecurityPins.
All certificates and secrets used to secure data must be stored in Azure Key Vault.
You must adhere to the Least Privilege Principal and provide privileges which are essential to perform the intended function.
All access to Azure Storage and Azure SQL database must use the application's Managed Service Identity (MSI)
Receipt data must always be encrypted at rest.
All data must be protected in transit.
User's expense account number must be visible only to logged in users. All other views of the expense account number should include only the last segment with the remaining parts obscured.
In the case of a security breach, access to all summary reports must be revoked without impacting other parts of the system.

Issues -

Upload format issue -
Employees occasionally report an issue with uploading a receipt using the web application. They report that when they upload a receipt using the Azure File
Share, the receipt does not appear in their profile. When this occurs, they delete the file in the file share and use the web application, which returns a 500 Internal
Server error page.

Capacity issue -
During busy periods, employees report long delays between the time they upload the receipt and when it appears in the web application.

Log capacity issue -
Developers report that the number of log messages in the trace output for the processor is too high, resulting in lost log messages.

Processing.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0018000001.png)

Database.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0018100001.png)

ReceiptUploader.cs -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0018200001.png)

ConfigureSSE.ps1 -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0018200002.png)QuestionYou need to ensure receipt processing occurs correctly.
What should you do?

- A. Use blob metadata to prevent concurrency problems.
- B. Use blob SnapshotTime to prevent concurrency problems.
- C. Use blob leases to prevent concurrency problems.
- D. Use blob properties to prevent concurrency problems.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/25/#) [  Discussion  **7**](https://www.examtopics.com/exams/microsoft/az-203/view/25/#)

**Correct Answer:** *B*
You can create a snapshot of a blob. A snapshot is a read-only version of a blob that's taken at a point in time. Once a snapshot has been created, it can be read, copied, or deleted, but not modified. Snapshots provide a way to back up a blob as it appears at a moment in time.
Scenario: Processing is performed by an Azure Function that uses version 2 of the Azure Function runtime. Once processing is completed, results are stored in
Azure Blob Storage and an Azure SQL database. Then, an email summary is sent to the user with a link to the processing report. The link to the report must remain valid if the email is forwarded to another user.
References:
https://docs.microsoft.com/en-us/rest/api/storageservices/creating-a-snapshot-of-a-blob

## Topic 13 - Testlet 15

Question #1*Topic 13*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

LabelMaker app -
Coho Winery produces bottles, and distributes a variety of wines globally. You are developer implementing highly scalable and resilient applications to support online order processing by using Azure solutions.
Coho Winery has a LabelMaker application that prints labels for wine bottles. The application sends data to several printers. The application consists of five modules that run independently on virtual machines (VMs). Coho Winery plans to move the application to Azure and continue to support label creation.
External partners send data to the LabelMaker application to include artwork and text for custom label designs.

Data -
You identify the following requirements for data management and manipulation:
Order data is stored as nonrelational JSON and must be queried using Structured Query Language (SQL).
Changes to the Order data must reflect immediately across all partitions. All reads to the Order data must fetch the most recent writes.
You have the following security requirements:
Users of Coho Winery applications must be able to provide access to documents, resources, and applications to external partners.
External partners must use their own credentials and authenticate with their organization's identity management solution.
External partner logins must be audited monthly for application use by a user account administrator to maintain company compliance.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0018600005.png)
Storage of e-commerce application settings must be maintained in Azure Key Vault.
E-commerce application sign-ins must be secured by using Azure App Service authentication and Azure Active Directory (AAD).
Conditional access policies must be applied at the application level to protect company content
The LabelMaker applications must be secured by using an AAD account that has full access to all namespaces of the Azure Kubernetes Service (AKS) cluster.

LabelMaker app -
Azure Monitor Container Health must be used to monitor the performance of workloads that are deployed to Kubernetes environments and hosted on Azure
Kubernetes Service (AKS).
You must use Azure Container Registry to publish images that support the AKS deployment.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0018800001.jpg)
Calls to the Printer API App fail periodically due to printer communication timeouts.
Printer communications timeouts occur after 10 seconds. The label printer must only receive up to 5 attempts within one minute.
The order workflow fails to run upon initial deployment to Azure.

Order .json -
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0019000001.png)QuestionYou need to troubleshoot the order workflow.
What should you do? Each correct answer presents part of the solution.
NOTE: Each correct selection is worth one point.

- A. Review the trigger history.
- B. Review the API connections.
- C. Review the run history.
- D. Review the activity log.

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/25/#) [  Discussion  **12**](https://www.examtopics.com/exams/microsoft/az-203/view/25/#)

**Correct Answer:** *AD*
Scenario: The order workflow fails to run upon initial deployment to Azure.
Deployment errors arise from conditions that occur during the deployment process. They appear in the activity log.
References:
https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-audit

## Topic 14 - Testlet 16

Question #1*Topic 14*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an
All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
Wide World Importers is moving all their datacenters to Azure. The company has developed several applications and services to support supply chain operations and would like to leverage serverless computing where possible.

Current environment -
Windows Server 2016 virtual machine
This virtual machine (VM) runs Biz Talk Server 2016. The VM runs the following workflows:
Ocean Transport "" This workflow gathers and validates container infromation including container contents and arrival notices at various shipping ports.
Inland Transport "" This workflow gathers and validates trucking information including fuel usage, number of stops, and routes.
The VM supports the following REST API calls:
Container API "" This API provides container information including weight, contents, and other attributes.
Location API "" This API provides location information regarding shipping ports of call and truck stops.
Shipping REST API "" This API provides shipping information for use and display on the shipping website.

Shipping Data -
The application uses MongoDB JSON document storage database for all container and transport information.

Proposed solution -
The site displays shipping container tracking information and container contents. The site is located at http://shipping.wideworldimporters.com
The on-premises shipping application must be moved to Azure. The VM has been migrated to a new Standard_D16s_v3 Azure VM by using Azure Site Recovery and must remain running in Azure to complete the BizTalk component migrations. You create a Standard_D16s_v3 Azure VM to host BizTalk Server. The Azure architecture diagram for the proposed solution is shown below:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0019300001.jpg)

Shipping Logic App -
The Shipping Logic app must meet the following requirements:
Support the ocean transport and inland transport workflows by using a Logic App.
Support industry standard protocol X12 message format for various messages including vessel content details and arrival notices.
Secure resources to the corporate VNet and use dedicated storage resources with a fixed costing model.
Maintain on-premises connectivity to support legacy applications and final BizTalk migrations.

Shipping Function app -
Implement secure function endpoints by using app-level security and include Azure Active Directory (Azure AD).

REST APIs -
The REST API's that support the solution must meet the following requirements:
Secure resources to the corporate VNet.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0019300006.png)
Allow deployment to a testing location within Azure while not incurring additional costs.
Automatically scale to double capacity during peak shipping times while not causing application downtime.
Minimize costs when selecting an Azure payment model.

Shipping data -
Data migration from on-premises to Azure must minimize costs and downtime.

Shipping website -
Use Azure Content Delivery Network (CDN) and ensure maximum performance for dynamic content while minimizing latency and costs.

Issues -

Windows Server 2016 VM -
The VM shows high network latency, jitter, and high CPU utilization. The VM is critical and has not been backed up in the past. The VM must enable a quick restore from a 7-day snapshot to include in-place restore of disks in case of failure.

Shipping website and REST APIs -
The following error message displays while you are testing the website:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0019400004.jpg)QuestionHOTSPOT -
You need to correct the VM issues.
Which tools should you use? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0019500001.jpg)

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/26/#) [  Discussion  ](https://www.examtopics.com/exams/microsoft/az-203/view/26/#)

**Correct Answer:** *![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0019600001.jpg)*
Backup and Restore: Azure Backup
Scenario: The VM is critical and has not been backed up in the past. The VM must enable a quick restore from a 7-day snapshot to include in-place restore of disks in case of failure.
In-Place restore of disks in IaaS VMs is a feature of Azure Backup.
Performance: Accelerated Networking
Scenario: The VM shows high network latency, jitter, and high CPU utilization.
Accelerated networking enables single root I/O virtualization (SR-IOV) to a VM, greatly improving its networking performance. This high-performance path bypasses the host from the datapath, reducing latency, jitter, and CPU utilization, for use with the most demanding network workloads on supported VM types.
References:
https://azure.microsoft.com/en-us/blog/an-easy-way-to-bring-back-your-azure-vm-with-in-place-restore/

## Topic 15 - Testlet 17

Question #1*Topic 15*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Proseware, Inc. You are developing an application that applies a set of governance policies for Proseware's internal services, external services, and applications. The application will also provide a shared library for common functionality.

Policy service -
You develop and deploy a stateful ASP.NET Core 2.1 web application named Policy service to an Azure App Service Web App. The application reacts to events from Azure Event Grid and performs policy actions based on those events.
The application must include the Event Grid Event ID field in all Application Insights telemetry.
Policy service must use Application Insights to automatically scale with the number of policy actions that it is performing.

Other -

Anomaly detection service -
You have an anomaly detection service that analyzes log information for anomalies. It is implemented as an Azure Machine Learning model. The model is deployed as a web service.
If an anomaly is detected, an Azure Function that emails administrators is called by using an HTTP WebHook.

Health monitoring -
All web applications and services have health monitoring at the /health service endpoint.

Issues -

Policy loss -
When you deploy Policy service, policies may not be applied if they were in the process of being applied during the deployment.

Performance issue -
When under heavy load, the anomaly detection service undergoes slowdowns and rejects connections.

Notification latency -
Users report that anomaly detection emails can sometimes arrive several minutes after an anomaly is detected.

Policies -

Log policy -
All Azure App Service Web Apps must write logs to Azure Blob storage. All log files should be saved to a container named logdrop. Logs must remain in the container for 15 days.

Authentication events -
Authentication events are used to monitor users signing in and signing out. All authentication events must be processed by Policy service. Sign outs must be processed as quickly as possible.

PolicyLib -
You have a shared library named PolicyLib that contains functionality common to all ASP.NET Core web services and applications. The PolicyLib library must:
Exclude non-user actions from Application Insights telemetry.
Provide methods that allow a web service to scale itself.
Ensure that scaling actions do not disrupt application usage.
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0021100001.png)
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0021200001.png)QuestionHOTSPOT -
You need to implement the Log policy.
How should you complete the EnsureLogging method in EventGridController.cs? To answer, select the appropriate options in the answer area.
NOTE: Each correct selection is worth one point.
Hot Area:

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/26/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-203/view/26/#)

**Correct Answer:** *Explanation*
Box 1: logdrop -
All log files should be saved to a container named logdrop.

Box 2: 15 -
Logs must remain in the container for 15 days.
Box 3: UpdateApplicationSettings
All Azure App Service Web Apps must write logs to Azure Blob storage.
References:
https://blog.hompus.nl/2017/05/29/adding-application-logging-blob-to-a-azure-web-app-service-using-powershell/

Question #2*Topic 15*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Proseware, Inc. You are developing an application that applies a set of governance policies for Proseware's internal services, external services, and applications. The application will also provide a shared library for common functionality.

Policy service -
You develop and deploy a stateful ASP.NET Core 2.1 web application named Policy service to an Azure App Service Web App. The application reacts to events from Azure Event Grid and performs policy actions based on those events.
The application must include the Event Grid Event ID field in all Application Insights telemetry.
Policy service must use Application Insights to automatically scale with the number of policy actions that it is performing.

Other -

Anomaly detection service -
You have an anomaly detection service that analyzes log information for anomalies. It is implemented as an Azure Machine Learning model. The model is deployed as a web service.
If an anomaly is detected, an Azure Function that emails administrators is called by using an HTTP WebHook.

Health monitoring -
All web applications and services have health monitoring at the /health service endpoint.

Issues -

Policy loss -
When you deploy Policy service, policies may not be applied if they were in the process of being applied during the deployment.

Performance issue -
When under heavy load, the anomaly detection service undergoes slowdowns and rejects connections.

Notification latency -
Users report that anomaly detection emails can sometimes arrive several minutes after an anomaly is detected.

Policies -

Log policy -
All Azure App Service Web Apps must write logs to Azure Blob storage. All log files should be saved to a container named logdrop. Logs must remain in the container for 15 days.

Authentication events -
Authentication events are used to monitor users signing in and signing out. All authentication events must be processed by Policy service. Sign outs must be processed as quickly as possible.

PolicyLib -
You have a shared library named PolicyLib that contains functionality common to all ASP.NET Core web services and applications. The PolicyLib library must:
Exclude non-user actions from Application Insights telemetry.
Provide methods that allow a web service to scale itself.
Ensure that scaling actions do not disrupt application usage.
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0021100001.png)
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0021200001.png)QuestionNote: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You need to ensure that authentication events are triggered and processed according to the authentication events policy.
Solution: Create a new Azure Event Grid topic and add a subscription for the events.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/26/#) [  Discussion  **3**](https://www.examtopics.com/exams/microsoft/az-203/view/26/#)

**Correct Answer:** *B*
Instead ensure that signout events have a subject prefix. Create an Azure Event Grid subscription that uses the subjectBeginsWith filter.
Scenario: Authentication events are used to monitor users signing in and signing out. All authentication events must be processed by Policy service. Sign outs must be processed as quickly as possible.

Question #3*Topic 15*

Introductory InfoCase Study -
This is a case study. Case studies are not timed separately. You can use as much exam time as you would like to complete each case. However, there may be additional case studies and sections on this exam. You must manage your time to ensure that you are able to complete all questions included on this exam in the time provided.
To answer the questions included in a case study, you will need to reference information that is provided in the case study. Case studies might contain exhibits and other resources that provide more information about the scenario that is described in the case study. Each question is independent of the other question on this case study.
At the end of this case study, a review screen will appear. This screen allows you to review your answers and to make changes before you move to the next sections of the exam. After you begin a new section, you cannot return to this section.

To start the case study -
To display the first question on this case study, click the Next button. Use the buttons in the left pane to explore the content of the case study before you answer the questions. Clicking these buttons displays information such as business requirements, existing environment, and problem statements. If the case study has an All Information tab, note that the information displayed is identical to the information displayed on the subsequent tabs. When you are ready to answer a question, click the Question button to return to the question.

Background -
You are a developer for Proseware, Inc. You are developing an application that applies a set of governance policies for Proseware's internal services, external services, and applications. The application will also provide a shared library for common functionality.

Policy service -
You develop and deploy a stateful ASP.NET Core 2.1 web application named Policy service to an Azure App Service Web App. The application reacts to events from Azure Event Grid and performs policy actions based on those events.
The application must include the Event Grid Event ID field in all Application Insights telemetry.
Policy service must use Application Insights to automatically scale with the number of policy actions that it is performing.

Other -

Anomaly detection service -
You have an anomaly detection service that analyzes log information for anomalies. It is implemented as an Azure Machine Learning model. The model is deployed as a web service.
If an anomaly is detected, an Azure Function that emails administrators is called by using an HTTP WebHook.

Health monitoring -
All web applications and services have health monitoring at the /health service endpoint.

Issues -

Policy loss -
When you deploy Policy service, policies may not be applied if they were in the process of being applied during the deployment.

Performance issue -
When under heavy load, the anomaly detection service undergoes slowdowns and rejects connections.

Notification latency -
Users report that anomaly detection emails can sometimes arrive several minutes after an anomaly is detected.

Policies -

Log policy -
All Azure App Service Web Apps must write logs to Azure Blob storage. All log files should be saved to a container named logdrop. Logs must remain in the container for 15 days.

Authentication events -
Authentication events are used to monitor users signing in and signing out. All authentication events must be processed by Policy service. Sign outs must be processed as quickly as possible.

PolicyLib -
You have a shared library named PolicyLib that contains functionality common to all ASP.NET Core web services and applications. The PolicyLib library must:
Exclude non-user actions from Application Insights telemetry.
Provide methods that allow a web service to scale itself.
Ensure that scaling actions do not disrupt application usage.
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0021100001.png)
Relevant portions of the app files are shown below. Line numbers are included for reference only and include a two-character prefix that denotes the specific file to which they belong.
![img](C:\Users\ajitg\Notes\Azure-203-204-Exam\Azure203-ExamQuestionsDump.assets\0021200001.png)QuestionNote: This question is part of a series of questions that present the same scenario. Each question in the series contains a unique solution that might meet the stated goals. Some question sets might have more than one correct solution, while others might not have a correct solution.
After you answer a question in this section, you will NOT be able to return to it. As a result, these questions will not appear in the review screen.
You need to ensure that authentication events are triggered and processed according to the authentication events policy.
Solution: Create separate Azure Event Grid topics and subscriptions for sign-in and sign-out events.
Does the solution meet the goal?

- A. Yes
- B. No

[Hide Solution](https://www.examtopics.com/exams/microsoft/az-203/view/26/#) [  Discussion  **10**](https://www.examtopics.com/exams/microsoft/az-203/view/26/#)

**Correct Answer:** *B*
Instead ensure that signout events have a subject prefix. Create an Azure Event Grid subscription that uses the subjectBeginsWith filter.
Scenario: Authentication events are used to monitor users signing in and signing out. All authentication events must be processed by Policy service. Sign outs must be processed as quickly as possible.

