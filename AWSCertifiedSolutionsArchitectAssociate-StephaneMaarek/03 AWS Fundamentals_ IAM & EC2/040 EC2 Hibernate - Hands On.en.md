
<v Instructor>So let's go ahead</v>
and run our instance.
So we're going to click on Launch an Instance
and try EC2 Hibernate.
So as I said for now, it's only supported on Amazon Linux 2
or Amazon Linux 1 so we use Amazon Linux 2.
And then for the instance type, I show you,
if I use t2 micro,
and I click on Configure Instance Detail,
then I cannot find anything related to Hibernate in here
but if I do Previous, I obviously if you do this tutorial
with me, it's going to cost you a little bit of money
because it's not a t2 micro
so if you just wanna sit and watch,
you can definitely do that.
So let's have a look at an instance, for example,
I'm going to look at the m5.large.
This one and I click on Configure Instance Detail.
Say, Yes, I want to continue with the m5.large again.
This will cost you money.
So if you don't wanna pay any money,
please don't follow me in this hands-on.
Then I will scroll down
and here under Shutdown behavior,
it says Stop and under Stop,
it says Stop Hibernate behavior.
Enable hibernation as an additional stop behavior.
And it says to enable hibernation,
you need to have enough space on your root EBS volume
to accommodate for the instance memory or RAM.
And also it needs to be an encrypted EBS volume.
So we'll see this right now.
I click on Add Storage
and as we can see, we get a little warning message
saying we should encrypt the volume.
I'm going to click on it and choose Default aws/ebs.
So we use the default EBS encryption key
for this EBS volume.
That's perfect and also I'm going
to increase the size to 30 gigabytes just
to show you how it works.
So we have a big enough EBS volume
to get all the RAM into the root-encrypted EBS root volume.
Okay, I will just show you for the name,
I'll call it EC2WithHibernate
and then I will click on Next Configure Security Group.
I will allow SSH on port 22.
And click on Review and Launch.
Launch, choose my key
and say Yes, acknowledge and launch my instance.
Okay.
So we're good to go.
Now we have our instance being instantiated.
Lemme wait for it to start.
Okay, so my instance is now started
and I'm going to play and connect to it,
so I click on Connect.
And I will use EC2 Instance Connect just for fun.
I'll click on Connect.
And because my allowed port was on SSH from anything
that I'm in, this is perfect.
You could use PuTTY, you could use your SSH terminal
for Linux or Mac, whatever you want really.
And so I can click on uptime
and say uptime and it say okay,
my instance has been up for one minute.
So notice this.
My instance has been up for one minute
and what I'm going to do now is I'm going to Hibernate it.
So I'm going back to my instance
and I right click, Instance State
and then I click on Stop Hibernate.
So I'll say Yes, please Hibernate this instance.
And now the instance is now stopping.
Okay, so my instance has now been stopped with Hibernate.
And so what I'll do is right click on Instance
and then Start and it's going to restart
but remember, because it's been hibernated,
we should see the same in-memory state
and so we should see the same uptime.
So let's wait for the instance to start.
Okay, so the instance, two instances now running.
I'm going to close my all SSH connects.
Click on Connect again and click on EC2 Instance Connect.
Click on Connect and we should connect into the instance.
And now if I say uptime,
we've been up for seven minutes,
so as we can see, the instance has been up
and running for a long time.
It has not been stopped.
And so therefore Hibernate is working as expected.
So that's it for this lecture.
Very, very simple but I want to show you ideally
how Hibernate works and finally I'll just click on Terminate
and terminate my instance and we'll be done.
All right, that's it.
I will see you in the next lecture.