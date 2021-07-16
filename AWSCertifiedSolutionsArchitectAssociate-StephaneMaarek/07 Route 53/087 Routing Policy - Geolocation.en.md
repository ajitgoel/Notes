
<v Instructor>Okay, let's talk about the</v>
geo location Routing Policy.
So it is different from Latency based,
this one is routing based on the user location.
And so here we're saying, okay,
traffic that originates from the U.K.
should go to this specific IP, if that's a (mumbles) record.
And on top of it, we should create a default policy
in case, for example, we get a user from Germany
but we haven't specified a routing policy
specifically for Germany.
Then we still get that default if you go somewhere else.
So this is to route based on the user location
and to redirect traffic from a specific country.
So if you look at the map, this is, for example,
the West of the European Union,
so here we get, for example we say okay,
all the traffic that comes from the U.K.
should go to 11.22.33.44, whereas all the traffic
that comes from France should go to 22.33.44.55,
and then by the way, there's a default
and the default says if you don't have the,
basically the traffic originating from the U.K. or France,
then the default response is going to be 33.44.55.66.
And that's how geo location works,
now let's practice this in a second.
So in my Hosted Zone, I'm going to create a record
and I'll call this one Geo, and I will say okay,
the value of it is going to be my Ireland instance,
so I'll just say this one here, Ireland,
and I'll say okay, the routing policy
is going to be that geo location.
All the traffic coming from, for example,
you can either say continent or countries,
or a default, so I'll just say a country right now,
and I'll say all the traffic that comes from France
should go, so I'll just set an ID,
so I'll say geo France, should go to this IP right here.
So here if my browser is in France,
which it is right now, then I should get this answer.
So I'll create it.
You can also set a new - create a new records as well.
So I'll name this geo and now I will say maybe
one for America, so if it comes from the United States
or whole American region, I will say okay,
you should go to this IP.
So let's do geo location, and the location
is going to be continent, North America, perfect.
And I'll just call this North America geo,
excellent, and click on create,
and then finally, maybe I want to create a record set,
geo in this one is going to be if you don't have any match,
then send me to Tokyo, and so we're saying okay,
Tokyo IP and geo location.
This time we'll choose default.
So we'll say default redirect to Tokyo,
whatever name you want to set really, okay.
So now after creating this record set,
what we should see here is that we have three records
associated with this geo.stephanietheteacher.com,
and it turns out that if my traffic is from France,
I should be going to this IP,
if my traffic is from America, North America,
then I should be going to this IP,
else any other traffic should go through this one.
So let's try it out, I'll go to geo, to my URL basically,
and the answer I should get from this one
should be from Ireland, so let me just take care of that.
By the way, I should just remove this,
so this is not working- oh, I know why,
because my public IP changed because I basically stopped
and started my EC2 Instance.
This is really silly of me.
So I've gotta go back and basically change
this IP to the correct one, so as you can see,
the last bits of my IP have changed.
So this was a good error to have,
so I'll keep this one as well on record.
But when it stopped and I start an EC2 Instance,
obviously the public IP changes,
and so by the way that means that all my records beforehand
must be updated if I wanted to use them in the future.
So in the meantime what I can do is maybe go to Mexico
and see what's going on in Mexico,
so I'm connecting to Mexico, excellent.
I'm in Mexico and I try this URL,
and the answer I get back is us-east-1a,
so excellent, because I come from North America
it redirected me directly to us-east-1a,
but if I go to Brazil, so let's go to Brazil now,
if I go to Brazil basically because this is South America,
I should be redirected to Tokyo.
So let's try it out.
I'm going to connect to Brazil.
Okay I'm connected to Brazil, and now if I refresh,
the answer I should be getting is one from Tokyo.
So let's try it out, and yes,
as we can see, we get redirected to ap-northeast-1a.
So let's try it out now I'm going to go to France,
and we should be seeing the one instance from Ireland.
So let's try it out, okay we're in France,
I'll refresh my page and here we go,
I get my answer eu-west-1c.
So really cool, we've had a good explanation
of how geo location works, so this is based
on the origination of the traffic,
or where the traffic is originated from,
and then we redirect to whatever we want.
Okay, sounds good. I will see you in the next lecture.