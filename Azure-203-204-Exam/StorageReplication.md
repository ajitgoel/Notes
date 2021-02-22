# STORAGE REPLICATION

In the [previous post ](https://www.skylinesacademy.com/blog/2019/6/28/azure-storage-options-explained)about Storage Accounts, we talked about various types of accounts and their associated data services. Since that post, the Premium File storage option that was in preview has now gone into General Availability. (https://azure.microsoft.com/en-us/blog/announcing-the-general-availability-of-azure-premium-files/)

Alongside the data access tiers (Hot, Cool, and Archive) and data services (Blob, File, Queue, and Table), Azure also has options around the data redundancy. In this post, we are going to look at the four types of data replication Azure provides. 

## ==LRS (Locally redundant storage)==

The most ubiquitously available option is Locally Redundant Storage (LRS); this is the default and only replication type available for all storage account types.  ==LRS ensure your data is replicated three times within a single data centre. These datastores are updated using synchronous writes to guarantee all three copies are kept up to date.==

==LRS does have downsides, predominately due to a single data centre in a single azure region containing the data replication.== This issue exposes the data to a single point of failure if the Data Centre is entirely offline. Microsoft does commit to a 99.9% SLA for read and writes operations for data stored in LRS datastores. The SLA is not to be confused with the 11 9’s (99.999999999%) guarantee they offer for data durability which is just a commitment to ensure a level of data integrity against data loss or corruption. 

## ==ZRS (Zone redundant storage)==

Introduced for General Purpose v2 storage accounts Zone Redundant Storage (ZRS) brings enhancements to the replication seen in LRS. 

As with LRS, ==ZRS has synchronous writes between 3 copies of your data to ensure data integrity. Although still within the same Azure region, additional resilience is introduced due to the use of availability zones within the region.== Two or three availability zones contain copies of the data. The increased resilience removes the issues of a single data centre outage causing data access issues. ==Although the data is spread across multiple availability zones, these zones are all within a single region, so data available is still susceptible to region-wide outages.==

ZRS has the same SLA levels for read and write operations as LRS, but they increase the integrity of the durability of the data objects by an additional 9 to 99.9999999999% (12 9’s).

## ==GRS (Geo-redundant storage)==

Geo-redundant storage (GRS) brings additional redundancy to the data storage over both LRS or ZRS. ==Along with the three copies of your data stored within a single region, a further three copies are stored in the twinned Azure region.== So using GRS means you get all the features of the LRS storage within your primary zone, but you also get a second LRS data storage in a neighbouring Azure region. This data is updated asynchronously, so there is a small lag between the 2 data sets, but for most cases this is acceptable.

Although using GRS means you are using two different datacentres in conjunction, there is a drawback of GRS, which is the secondary data storage is not accessible to read unless the storage account fails over. Due to all read and write operations still being managed by via a single data centre, Microsoft offers the same read and write SLA’s as ZRS and LRS datastores. 

## ==RA-GRS (Read-Access Geo-redundant)==

The final replication type available is ==Read Access Geo-redundant storage, it has all the benefits and redundancy of the standard GRS replication but also allows for the secondary copy stored in the paired sister Azure region to be readable.==This means you have multiple endpoints that are readable that your applications can use if they are configured to handle this configuration. 

The additional read endpoint also means that for RA-GRS the read operation SLA is increased to 99.99% availability for Hot datastores. Write operations are left at the 99.9% SLA due to the single region still being in control of the write and update operations. 

Both types of GRS replication do have a slight delay in the replication due to its asynchronous behaviour. This is where checks of the LastSyncTime come in useful to ensure you are reading the most up to date copy of the data. This asynchronous replication needs to be checked against your Recovery Point Objectives if you are planning to use GRS / RA-GRS as part of your DR planning. 

Currently, Microsoft controls the failover of storage accounts from one Azure region to another region, so the scope for using the failover on your terms is limited. Microsoft has recently, however, brought into preview an option for a customer-initiated failover themselves. This is currently only available in the US West 2 / US West Central region pair and while in preview not suitable for production environments. 