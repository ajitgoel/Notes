
Now that we know everything about the fundamentals and it's time for us to actually be developers on
AWS and for this, the CLI or a command line interface is going to become your best friend.
The exam will ask you a lot of questions about the CLI
So I want to take this whole section dedicated to understanding how we can programmatically access AWS
Not only we learn about the CLI we will also learn about the SDK, IAM policies and IAM roles
for EC2. So far when we've created stuff in AWS that was as you see a console we manually created the services
and then they actually exposed standard information from our clients.
So when we had an EC2 instance we had an SSH port and we could do whatever we wanted when we had
the RDS database.
It was just a standard MySQL or Postgres database and we could just connect using the URL.
or the connection string and the various tools online.
Same for ElastiCache really it just exposes a URL and you can connect to it and do whatever you would
do with any ElastiCache.
Likewise when we did an ASG or ELB because there were automated and there were managed services and we really
don't have to write any code against them right.
And we set up was manual.
So you get the idea.
Everything we've done so far except S3 was pretty much standard.
You know IT but sometimes when you develop against AWS you have two components you need to take care
of.
Number one is how do you perform interactions with AWS without using the on line console.
As you know doing stuff manually is quite bad.
The second is how do you interact with AWS proprietary services.
And that would be Amazon S3, DynamoDB and other services as we'll see later in this course.
So this is where the CLI comes in when you perform a task in AWS you can do it in several
ways.
You can use the CLI from your local computer.
You can use the CLI from EC2 machines, you can use the SDK from the local computer.
The SDK on your EC2 machines or even using the AWS instance metadata service for EC2.
So there's quite a lot of new concepts in here but we'll go one by one and we'll learn all of them.
And my really strong wish here is to teach you the right and most secure way and we'll adhere to best
practices.
I've seen this section done so many times wrong elsewhere.
So I really want you to get the right idea so that you nailed the exam questions on the CLI and on
IAM roles and policies.
So let's get started.