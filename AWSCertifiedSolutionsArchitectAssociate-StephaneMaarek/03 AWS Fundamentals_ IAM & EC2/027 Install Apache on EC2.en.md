
<v Instructor>Okay, so in this Lecture,</v>
we are actually going to use our EC2 instance
to launch an Apache Server on it.
So, we'll install an Apache Web Server,
and we'll basically display a web page,
and for this web page we'll just create
something called index.html, that will show
the hostname of our machine.
So, pretty simple, but lets go ahead.
It's going to be a bit of fun,
and will get you practice our security groups.
The first thing we have to do is to get the public IP,
because I changed it too many times,
and then I will go into my instance,
and SSH into it, using PuTTY or SSH,
what ever you have as an operating system.
So, now that I am into my machine,
it's time to go ahead and run some commands.
So, the first think I'm going to do is sudo su,
and this will basically elevate my rights on the machine.
I am now the root account,
and I can run any command I want, without any problem.
So, the first thing I want to do
is yum updates, and minus y.
This basically forces my machine to update itself,
and it's really important to keep all the packages updated.
The minus y was to basically allow the updates to go
through, without prompting me to say yes, I want to updates.
Once yum update is done, what we can do
is start installing httpd, okay?
So, to do this, we're going to do
yum install minus y httpd.x86 underscore 64,
so that's a little bit complicated,
but I'm sure you'll be okay.
Then, we basically installed httpd, and the minus y
was used to basically say yes, and not have a prompt.
Now I can clear my screen, and to start the service,
we do systemctl start httpd.service,
and it starts the service, and to ensure that the system
remains enabled across reboots, we say enable httpd.service.
So, these two commands basically allowed us
to start the httpd service,
and makes sure it is enabled across reboots.
Now, let's go ahead and see what happens.
If we do a curl on localhost:80,
we should see this entire page.
So, curl is basically to load whatever is in this URL,
so if we do curl localhost:80,
then we get this giant HTML page
that is not very friendly, but it's working.
So, we kinda wanna have this in a web browser, right?
So, why don't we access it from a web browser?
We go to our EC2 instance,
and look at our public IP address.
So, what we have to do, is open http,
and then the IP address, right here, port 80,
which is just the http port, and press Enter.
And, as we can see, now we just wait, and wait, and wait.
What did that look like?
That looks like a timeout.
So, around timeouts, what do we say?
We say that, yes, any time there's a timeout issue,
it's probably an error with the security group.
Yes, indeed.
If we go to view the inbound rules of our security group,
we can see that it only allows port 22,
but our Apache server was started on port 80.
So, what we have to do is open up that port 80,
so we can access it.
So, I go to my security group, in Inbound rules,
I can edit and add a rule.
Here, in the dropdown, there is already
an http rule written for us.
So, we create HTTP, TCP on port 80,
and the custom, we'll just say zero, zero, zero, slash zero,
and we'll say Allow HTTP traffic for Apache.
Click on Save, everything looks fine,
and now, if you go to our web page and reload it,
so let's go ahead and stop this, and now paste it,
we can see that we got through.
So, by changing that security group
and allowing this rule for port 80,
we are able to get to our test page,
and our test page just basically says that
it is a proper installation of the Apache HTTP server,
and we basically now have to
add some content to var.www./html.
So, let's go ahead and do this.
For this, I'm going to clear my screen, and I'm going to
echo "Hello World" into
var/www/html/index.html.
So, basically, now, if I go to my web browser
and refresh this page, we now see Hello World,
so that's awesome.
We just displayed our first web page on our machine.
Now, because I want to make things
a little bit more interesting for the tutorial,
I'll do "Hello World", from, and then dollar sign,
and here, we can enter a command, hostname minus f,
and then we'll put this into the same file.
Basically what this does is that we'll make sure
it says "Hello World" and then the hostname of our machine.
If you run this command right here, hostname minus f,
it should say ip, then the private ip,
the region you're in, dot compute dot internal.
So now, basically, when we go back to web browser
and reload this, it says Hello World from ip
and the ip of our machine,
and this is actually not the ip.
This is the internal DNS.
So, that's about right.
Now we get Hello World, and we know which machine
we're talking to, so that's pretty awesome.
So, this was a quick lecture to install http Apache server,
because in the next lecture, we're going to
automate this installation using EC2 user data.
So, let's get started.