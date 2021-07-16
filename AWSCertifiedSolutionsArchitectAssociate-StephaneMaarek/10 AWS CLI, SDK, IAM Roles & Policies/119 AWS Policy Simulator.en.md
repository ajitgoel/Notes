
<v Instructor>Okay so now we have a policy,</v>
and I will just remove the S3 full access,
just for the fun, and I will also detach
the test custom policy that we had created from before.
Okay? Now we wanna test this policy.
Which only allows us to read things.
So, something you can use is called AWS policy simulator.
And that's basically a tool online to test your policies.
So for this you can just access it using this link.
So I'll just click on this.
And this IAM Policy Simulator is basically saying,
okay, what policy do we have?
and then, how do we simulate stuff?
So for example, you can look for a user, a group, or a role.
And for this time, I'll choose my first EC2 role.
And here are the policy that it has.
It has the Amazon S3 read only access.
Now I'm going to select the service,
I'm going to select Amazon S3,
so I just have to find it in this whole bunch of services.
Then an action, let's call it, get object,
and then this is it!
Now I'm going to say, okay, just run a simulation,
and it says okay, yes, you can run a get object
on this statement.
Now we can also say, hey how about, list buckets.
We'll run a simulation, and it says,
yes, it's allowed, right?
Now if we add a put object to this
and run the simulation, it says denied.
It is implicitly denied,
there is no matching statement.
So indeed, in our read only access,
we haven't given the right to put an object.
And you could obviously drill down and stuff,
but this is really nice.
In here it shows you the statements
that matched when there is an allowance
make sure the statement that matched in the policy.
So it's really really nice.
This policy simulator tool can save you hours
in case a statement is denied.
So that's the way number one to test policies.
The way number two is to directly use the CLI.
So let's give it a go in the next lecture.