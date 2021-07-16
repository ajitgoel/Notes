> So this was a very long section, I know, but EC2 is one of the most fundamental service that will come up lots and lots in the exam, and don't worry, we'll talk solution architecture for EC2 once we get to see other concepts in the future sections, but for now, just want to remind you what is really important for EC2 going into the exam. So, number one is that EC2 instances are billed by the second, and if you use a t2.micro, it's a free tier so you can have many t2.micros and you only get a certain amount of hours per month as part of the free tier. On Linux and Mac you can use SSH. On windows, you use Putty, although now with Windows 10, you can start using SSH as well.
> SSH will be on port 22, that means that
> you have to lock down the security group of
> your instances to your IP or to a
> set of IP that you trust to not
> allow anyone to SSH from anywhere.
> If you get any timeout issues happening,
> so the exam will ask you this is timing out,
> this is most likely due to a security group issue.
> Also, if you get to SSH, but you
> get a permission issue, this is on Linux and Mac,
> then you have to know this, you have to
> run this command, chmod 0400, and
> there is a very common question as well.
> Now, security groups, it's very important,
> they can have IPs as rules, but they can
> also reference other security groups
> instead of IP ranges, and what is locked down is
> allowing basically a dynamic set of
> EC2 instances access other EC2 instances, and
> that is a very popular exam question, so
> if you don't really understand that,
> keep on going, I'll be showing it multiple times,
> but security groups can reference other
> security groups as part of rules, and
> that is a very popular exam question.
> Now, this is more IT, but you need to
> understand the difference between what is a
> private IP, what is a public IP, and
> what is an elastic IP, and you can
> customize an EC2 instance at boot time, so
> when it starts, using a boot strap script,
> also called EC2 user data.
> Okay, next, you need to know there's
> four EC2 launch modes, it's very important, and
> because on the exam, the costing options and
> the long term commitment options of these options
> is very important to answer a few questions.
> So, on demand, this is what we've been
> using so far, we create an EC2 instance,
> and here we go, we get billed by the second.
> Reserved is when you have a reserved instance,
> you want to know that, you know already that
> you are going to use it for a year or
> three years, and so you want to
> save on costs, you reserve your instances, and
> that makes you save big money.
> Spot instances is when you wanna have instances very cheap, so you bid on them and then you have a chance of losing them if someone bids higher than you. Basically, spot instances is unused capacity by AWS, and they're for workloads that you can resume later or you don't mind stopping all of a sudden, that kind of stuff. And dedicated hosts is when you need access to the actual host or sockets, whatever. This is usually the case when you have a license that is very restrictive and based on the number of hosts, so dedicated hosts is when you have licensing issue or when you need to see sockets, that kind of stuff. You need to know the basic instances types. I know there are so many instance types and it's very hard to remember them all, but R is for RAM, C is for CPU, M is Medium, so average, I is for IO, G is for GPU, and T2/T3 is burstable type of instances. If you do remember this, you are already pretty well set for the exam. You can create AMIs to pre-install software on your EC2 instance, and the idea is that when you do create AMIs, you have a faster boot time so it doesn't spend as much time installing stuff, and the AMI that you have can be copied across regions and accounts. Just remember that AMI by default is region scoped, it's not a global thing. Now, EC2 instances, they can be started in what's called placement groups. A cluster, if you want them all to be very close together, and this is when you need very high performance computing needs, for example, a really good network, but you run the risk of basically not being highly available, and spread when you want them to be spread around multiple availability zones, and make sure that if one fails, then the other won't fail. So, that's the idea, that's just what you need to know for EC2 for Solutions Architects. I know this is a lot of content to get started with, but trust me, over time you're going to get more and more familiar with all of these concepts, so I hope you liked this lecture, and I will see you in the next lecture.