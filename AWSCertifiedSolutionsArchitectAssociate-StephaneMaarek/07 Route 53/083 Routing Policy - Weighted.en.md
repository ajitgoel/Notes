
<v Instructor>So now a more interesting routing</v>
policy is called Weighted.
And Weighted controls the percentage of the requests
that will go to specific endpoints.
To be concrete and visual,
we have Route 53, and we're going to assign
different IP addresses,
maybe linked to each of two instances,
and we're going to assign weight;
so 70, 20, and 10.
By the way, the sum does not have to be 100,
it's just me who chooses easy number.
But whatever weight you put, whatever the sum is,
you'll just do the average and figure out
a percentage from it.
So what we mean from this weight is that now
Route 53 will send 70% of the answers
to be back from this EC2 instance,
well, they will send 20% of the answer
back from the second one and
10% of the answer back to the third one.
What this means if that now our clients will send 70%
of the traffic to the first instance,
20% of the traffic to the second instance
and 10% of the traffic to the last instance.
So that's really helpful to start,
basically, assigning different weights to different parts,
so what we do to do this,
well, for example, to deploy a new application version
and you wanted to test only 1% of the traffic
on this new app version for example
then that's a nice way to do it with Route 53,
where it's helpful to split traffic between two regions
and this is super quick because you can also associate this
with health checks, so if one EC2 instance
is not working properly, no traffic will be sent to it.
So let's have a look at how this works in the console.
I'm going to create a new record set
and I'll call this one weighted,
and here I'm going to set different values,
so the first value I'm going to set is the one
from eu-west-1a which is Ireland
and then I'm going to say the routing policy is weighted.
Weighted, why?
Because we're going to be able to assign weights.
So we'll say this one is going to be 70
and we'll set the ID My Ireland Data Center
but you could set this to an arbitrarily number,
for example, 700.
So 70 is fine and here you could associate
with a health check, but for now we'll leave it as no.
Alright, we've created a weight,
but now thee cool thing is that we can recreate
another record set on the same name,
so weighted, that defines your dot com.
But now the value is going to be something else.
Maybe us-east-1 and I'll just paste this here
and here we go.
Now again, I will say that the routing policy is weighted,
and this time the weight is going to be 20,
and the ID is going to be US,
whatever you want to set really.
Click on create.
And so the cool thing we see now in the bottom
is that our two records, right here, are added
in two different rows and they basically
point to different values and at the right hand side
we can see the weight as a column right here.
And at the top right hand side,
we can see the ID we set to these records.
So finally, we can set another weight record,
so I'll say weighted, and the value
is going to be my Tokyo instance,
so I'll copy this IP and paste the value in, excellent.
And the routing policy is weighted
and the weight is going to be 10
and I'll call it Tokyo, excellent.
Click on create.
And now what we get out of it is three different records
in here that point to three different instances.
So now, I know you're dying to do it, let's try this URL.
So let's try it weighted.stephanetheteacher.com
and here we get an answer from us-east-1a.
And so if I refresh I'm always going to be redirected
to us-east-1a.
But when the TTL is gone, so when 300 seconds pass,
I did not change it to TTL,
so it's going to be longer to wait,
I will resolve to a new IP.
And the idea is that thanks to the weight,
I have 70% chance of landing on Ireland,
10% change of landing on Tokyo and
20% chance of landing in the US.
You could also take this DNS name
and use dig to query it and see what you get back.
In this case, basically what we're going to get back
from it is only one IP, so we're not aware that
there is any weight applied, we'll just get back one IP.
And this IP, remember, is from Ireland.
And so the idea here is that the Route 53
will serve the answers based on the weights,
and so from a client's side perspective,
we're not aware that there are multiple IPs in the backend.