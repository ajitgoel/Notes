
<v Instructor>So now let's talk about flow logs.</v>
Flow logs help you capture information
about the IP traffic that's going within your interfaces.
And you have three kinds of flow logs.
You have the VPC flow log, and that applies
to everything within your VPC.
You have the subnet flow logs,
which applies to something just within your subnet,
and then you have the elastic network interface flow logs,
just for one network interface.
So overall, if you define a VPC flow log,
then it's going to have included the subnet flow log,
and the ENI flow logs as well.
Okay, so why would you do this?
Well, maybe to help monitor and troubleshoot
connectivity issues in case some connections
are rejected we want to understand exactly why.
And so, for this purpose, flow logs data
can go directly into S3 or CloudWatch Logs.
And when you enable it,
it captures all the network information.
Not only from what you own but also
for some of the AWS managed interfaces, such as
ELB, RDS, ElastiCache, Redshift, and WorkSpaces.
So in our graph, what does it look like?
We have a very complicated graph, but now
we're going to add VPC flow logs in the top right.
And the flow logs are directly being collected
at the VPC level, or the subnet or the ENI,
but for now we'll just say VPC level,
and they go directly into CloudWatch and-or S3.
Okay, so now flow log, you are expected
to understand how to read them, and so
we'll be looking at flow logs in this lecture.
But so, it looks like this.
There is a bunch of fields and there is
version, account ID, interface ID, source address,
destination address, source port, destination port,
protocol, packets, bytes, start, end,
action, and log status.
So that's a lot of fields,
but it's important for you to understand the main ones.
Source address and destination address
will help you identify the problematic IPs,
or to filter by some IPs.
Source port and destination port help you
identify the problematic ports, and
action will be success or failure.
It's also called accept or reject in the flow logs directly.
And basically, from this we can rescind whether or not
a security group or maybe a network ACL rule
blocked our request.
It can be used for doing analytics on usage patterns
or observing malicious behavior
and we should be seeing malicious behavior in this lecture,
we'll see that in a second.
And there's a ton of examples of flow logs at this URL,
I recommend you do this in your own time, to read it.
And then, how do we query the VPC flow logs?
Because a CSV, like this format, doesn't really help us.
But we can use Athena on S3 or CloudWatch Logs Insights,
and they're really cool, we'll see them both.
So let's get started.
To enable flow logs is super easy,
you go to Your VPCs, Demo VPC, and then flow logs.
And in there we can create a flow log.
So let's create one.
And we can set up a filter.
So do we want to have all of the accepted requests,
all of the rejected requests only,
or maybe all of the accept and rejects?
So for now we'll just accept all, and then the destination.
It could either go to CloudWatch Logs or to an S3 bucket.
So let's first do CloudWatch Logs.
So let's open CloudWatch, so I'll go to Services,
and I'll type CloudWatch, and here we go.
And I'm going to create a log group for it.
So within it I'm going to go to Logs,
and I'll create a log group.
So, let's go back to Logs, sorry.
Action, create log group, and I'll call it vpc-flow-logs,
and I'll create that log group, excellent.
So now it's been created, and I can go back
to my VPC and flow log creation page,
and I will refresh the log groups,
and it will say VPC flow logs.
The IAM role, you need to select one
to allow your VPC to write to CloudWatch.
Thankfully, you can just click on Set Up Permissions, here.
And this will automatically create an IAM role
that has the required permissions,
and you can view the policy documents right here.
Click on Allow, and here we go, done.
So now we can go back to IAM role,
click on the refresh button, and then here,
scroll down and then we'll find it at some point,
or I'll just type in flow in the search bar
and we'll find it for sure.
Flow logs role, here we go.
Okay, click on create, and now
the following flow logs were created.
So this one is created and it will go into CloudWatch.
Now this can take up to 10 minutes to appear
in CloudWatch or in S3, so we have to wait a little while,
but for now, let's also create a second flow log.
So we do create flow log, and this time
we'll send it to an S3 bucket.
We'll have all the filter, and we have to enter
a bucket ARN, so let's go back to here.
Maybe this tab, and I'm going to open S3 as my service,
Excellence, and I'll create a bucket,
so let's just keep something familiar,
so I'll call it Stephane-vpc-flow-logs, excellence.
And it's going to be in Ireland,
and I'll just go ahead and create if very quickly.
So my bucket is now created.
I'll click on it, and then I have
a Copy Bucket ARN button here,
so I'll copy the bucket ARN, and I'll paste it right here.
So you have to put the full ARN in there.
Okay, and now it will say a resource based policy
will be created for you and attached to the target bucket.
So that VPC can send your logs to this bucket.
Okay, click on create, and
the flow log has been created, excellent.
So now, we have our two flow logs right here being created.
And if we quickly check into our S3 bucket,
let's have a quick look at it.
We go to permissions, bucket policy,
and this was added by AWS itself,
to allow our flow logs to write to this bucket.
Okay, so now what we have to do is just wait a little while.
What you could be doing as well, is go to your instance,
and you could be maybe going to the public one,
and I'll just curl google.com.
Okay, this works.
So you could just send a little bit of traffic,
just to make things moving, but don't worry,
even if you don't do anything, traffics will come.
So I'll just wait 10 minutes,
until we start seeing some data in S3 and in CloudWatch.
Also, while we wait, I will also restore
internet connectivity to my private route table.
So I will say okay on top of using the VPC endpoint for S3
in case we go anywhere else, so here,
you're going to use my NAT gateway.
And this way we also have traffic
going into that second instance of mine.
Okay, excellent.
So now let's go to S3, refresh, nothing here,
and then CloudWatch, there are three ENIs already.
So I'll just scroll, okay.
So maybe we're interested in two of the ENIs
for my public instance, so let's look at the right one.
If you go to EC2 Management, we find this public instance,
has the private IP ending in .08,
and the network interface is this one,
and it looks like the network interface ID ends with b15.
Okay, let's have a look, so we go back to CloudWatch,
and we still don't have anything on b15,
so I'll have to wait-- Oh see, here it is.
This is the second one.
And so we are getting a lot of information.
As we can see, some of this traffic is reject,
and some of the traffic is accept.
So it's very, very interesting.
It looks like some people are trying to access
my EC2 instance because it's public, and a lot of traffic
got rejected because its not authorized.
So to prove this to you,
let's have a look at this one record.
So two is the version of this flow log.
This is my account ID, this is the ENI
that we have for this VPC flow log, excellent,
and this is a source IP.
So if we look at the source IP, and we'll do IP lookup,
let's have a look at what this IP is.
So we'll go, and we'll type in an IP,
get IP details, and it looks like
this is a static IP coming from Japan.
So, someone in Japan is actually talking
to my EC2 instance right now.
But thankfully, it's rejected.
And we can look at other IP addresses.
For example, this one, let's have a look at this one
to see where this one is from.
We'll type it, look it up,
and this one comes from Ireland, okay.
So there's a lot of things happening right here.
And what you should be realizing is that
some people over the internet are scanning
all the IP addresses, trying to find loopholes.
So let's go back to this first record,
so someone in Tokyo is trying to target my EC2 instance,
and then the source port that it tried to access
is this one, the destination port was this one,
So it tried to access the port 766 on my EC2 instance,
and that's a bit scary right?
Then there is six, that means TCP.
So you'll have to look it up in the table.
And then this is the start--
This is the number of packets, sorry.
This is the bytes, this is the start, this is the end,
and it was rejected, and it was logged, so there is an okay.
So, super interesting to see that someone
got a address, a request being rejected,
but you could look at a lot of those.
Basically there's a lot of IP addresses,
let's look at this one, for example,
on the internet that will try to scan all your IPs
on different ports, to try to see
if there's any flaw or something like this.
So this one is in Germany, and it's trying to attack
my EC2 instance as well, but on port 8088.
So everyone around the web, hackers mostly,
are trying to scan for vulnerabilities and an open port.
This is why you have to be very careful
about the ports you open.
So how do we analyze this at scale?
Well, two ways.
Number one is to go to S3, and if I refresh this
I should be seeing AWS logs, and I go deep into it,
and within it I get access to all my VPC flow logs as files,
so I can download these files and keep these logs.
Or, we could use something like Athena.
And this is a very popular question,
so how do you analyze VPC flow logs?
Well, Athena will be the answer.
So we have a default database, but we can create a new one.
So let's create a new table,
so let's go and type Athena VPC flow logs example.
And Google is going to be your best friend for this.
So here we go, there's a direct link.
And it says, create a table,
and then we need to modify the location.
So let's do this right now.
We'll go to Athena, we'll paste this in.
So, create external table if not exists, VPC flow logs,
and that will go directly I guess to my default database.
And then, these are all the fields for my flow logs.
And it's delineated by space and the location of it is,
and we need to specify the log bucket we have,
so it's VPC flow log for Stephane,
so let me copy this right here.
Prefix, there is no prefix,
AWS logs, then the subscribe account ID,
which is right here, so I'll copy this and paste it here.
VPC flow logs and then the region code eu-west-1,
Let's verify this, yes, it's good.
And click on run query.
So now the query is successful,
and now I have a VPC flow log table.
And the next thing I have to do is to
go back to the documentation and add a partition.
So let me copy this sentence right here.
And we go to Athena, and we're going to
replace this entire thing.
We're going to add a partition
The location, I'll just copy this entirely to gain time.
And so the only thing we have to replace
is the year, month, and day, so this is quite manual.
This is something you can automate using glue,
but it's out of scope right now,
so let's go to S3 and 2019, 01, 10,
so this is what we have so, 2019, 01, 10.
And here,
2019, 01, 10.
That should work.
Run the query, and now we've added a partition.
And so if we go back to the documentation,
now we can, for example, run this query
and find all the reject on protocol equals six.
So we'll copy this, we'll go back to Athena,
and then we'll run this query.
Run the query, and as we can see in a second,
after all the data has been analyzed,
we get all these rows right here,
which shows us the source IP address,
and all the reject, and the protocol.
So it could be really interesting to do some analytics.
We can run any single query on your table.
You could, for example, preview table,
and this will show you all the rows in the table.
Like right now there is a limit of 10.
You could see all the rows in here,
and start doing some very interesting SQL queries.
And that's it.
So this gives us a really good way
of looking at VPC flow logs.
I hope you enjoyed this lecture,
and I will see you in the next one.