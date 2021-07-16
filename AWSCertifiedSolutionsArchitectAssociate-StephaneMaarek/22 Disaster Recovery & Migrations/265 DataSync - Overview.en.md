
<v Presenter>So let's talk about AWS DataSync,</v>
and DataSync is going to be a service used
to move large amount of data from on-premise to AWS,
But here we're talking about more file and file systems.
So it can synchronize to Amazon S3, EFS or FSx for Windows
and it can move data from your on-premise NAS
or file systems that are compatible with the NFS
and SMB protocols, so important to know.
So as we can see in this diagram,
we would have our on-premise NFS or SMB server,
it would be talking to the AWS DataSync agent,
which is an agent we have to install on-premise
that will monitor your on-premise data source for changes
and the DataSync agent will do its work
to transmit it to the DataSync service
which in turn will send the data to Amazon S3,
EFS file system, or Amazon FSx for Windows file server.
The replication tasks from the DataSync agent
all the way to the DataSync service
can be scheduled to have an hourly, daily or weekly
and as I said, you need to install
this DataSync agent on-premise to make things work.
Also, one last thing you should know about DataSync
is that it works for EFS to EFS replication
and as you can see in this diagram,
it still works by using the DataSync agents
on the EC2 machine that monitors
your source Amazon EFS file system
and it will send it to the DataSync service endpoint
that will replicate it automatically
into another EFS service.
So from this lecture, very simple to remember,
DataSync agent is for replicating data
and it goes two ways and finally,
the source can be an NFS or an SMB server
or NAS, all the way into S3, EFS and FSx for Windows,
or you can reuse it for replicating EFS to EFS.
Okay, that's it for this lecture,
I will see you in the next lecture.