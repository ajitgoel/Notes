
<v Instructor>So this is just a lecture</v>
about something called EC2-Classic and ClassicLink.
Both these things are deprecated by AWS
and if you see them in your exam,
it's most likely going to be a distractor,
but I just want to give you some background
so you understand what it is
and you don't think that course is incomplete.
So EC2-Classic is when you run your instances
in a single network shared with other customers,
and this is how AWS started.
So you could run (slurring words) instances
and they would be shared with your other customers
in terms of networking.
And then AWS came up with Amazon VPC,
where your instances now run logically isolated
in your AWS account.
So that makes a lot of sense,
we know about VPC,
and EC2-Classic is not even something
we can launch instances in right now
because it's jut not available.
And so when we wanted to have a link
between your VPC and your EC2-Classic instances,
you would need to create a Classic link.
So for this you must associate a security group,
and then that enables your instances
to communicate privately
from EC2-Classic to your VPC instances
using IPv4 private addresses.
And so before you had to use public IPv4,
but thanks to ClassicLink,
you can use the private network.
So don't try to go too deep into this.
These questions are likely to be distractors
at the exam.
Please tell me if you don't think that's the case.
But just what wanted to tell you
what was EC2-Classic and ClassicLink.
There will be no hands-on,
just a very short, informative lecture.
All right, that's it.
I will see you in the next lecture.