
<v Instructor>Finally the last routing policy</v>
is going to be called multi value
and this is when you want to route traffic
through multiple resources and you want to also associate
Route 53 health checks with our records.
So it's some sort of improvement over simple routing policy.
It will return up to eight healthy records
for each multi value query.
So you get up to eight values returned
even if you have 50 records in the backend.
And although it looks like a good replacement for ELB,
it is not, it's not a substitute, it's different.
But it really helps to do some kind of load balancing
as well on the client side.
So what this will look like is that we'll have example.com,
A Record we'll have three different values
and all these values will be associated with a health check
and the idea is that if one of these instances
stops serving traffic the Route 53
will not send back the value of that to the clients
but the other two will still be happening.
So let's have a look at in a quick hands on.
So I'm going to create new record set
and this one is going to be called multi.
And the first value is going to be my IP address
of my Ireland instance which has changed
so I'll just keep it here, okay.
And the routing policy is going to be a multi value answer
and I will associate it with a health check, yes.
And I'll associate it with the Ireland health check.
Click on create, so this is set ID is empty
so I need to say okay.
Multi Ireland, okay, click on create.
Next I have to create a new record set
so again it will be a multi,
but this time I will have my multi going to the US.
So I'll just take the one from the US, this IP right here,
and then I will say multi US associate with health check,
yes, and the one is going to be Virginia.
Click on create and then finally
I will have a Tokyo multi value answer in there.
So I'm going to say, create record set, multi
and the value is going to be this,
the routing policy is going to be multi value answer.
This is multi Tokyo,
I will associate it with the Tokyo health check.
So I'll say yes, Tokyo health check,
and I will also set the TTL to be one minute
and this will actually update all the TTLs
for this multi value, so good to know.
I click on create.
And if you look at our multis,
so our multi here has three records.
Okay so I'll just, actually I could filter,
I should have done that.
But we have three multis in there.
All of them have a 60 second TTL
and they're associated with some health checks.
Okay so let's look at the health checks.
I suspect that one health check is unhealthy
because my IP address has changed.
So this one is unhealthy so I'm going to quickly edit it,
edit the health check and I will put this IP address in here
which is the correct IP address.
But this is a really good time
to actually test out our record.
So for this I'll use dig and see how it goes.
So dig and then I'll say multi.stephanetheteacher.com.
And what we get out of it is a strange answer
I have to admit but here in the answer section
we have these two IPs and this is actually due to my VPN.
So we have these two answers right here
which is the two IPs that are healthy
so we can see it didn't return the third one
because the health check was unhealthy.
But what should happen is that
as soon as this health check becomes healthy
and I run the exact same query.
Then I should get three IPs back.
So let's just wait a little bit.
Okay so my health check is now healthy as we can see.
The health check just flipped to being healthy
and so if I go back to dig and do a query
now hopefully I should see three answers.
And here we go, we have three answers redirected to us
because the third one, this one, just got healthy.
And so Route 53 was allowed to give us this answer back.
And so from the web browser perspective if I go to this URL
basically my web browser would have just picked
any of these three IPs at random and just used this one.
So if I just try it out and go here
as we can see my web browser is able to just choose an IP.
And if one of these was unhealthy for whatever reason
then because my web browser has other IPs
it will return as part of the answer
it can try the other ones and see which one would work.
Which is quite cool,
which gives us as well some kind of fault tolerance
but this time on the client side.
So that's it, I hope you enjoyed this lecture,
I hope you understand better how multi record work.
And I will see you in the next lecture.