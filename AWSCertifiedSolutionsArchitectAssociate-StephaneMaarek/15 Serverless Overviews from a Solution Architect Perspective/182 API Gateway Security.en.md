
<v Instructor>So here comes the least fun part</v>
with API Gateway, which is around security,
but the exam really needs you to know all
the security aspects of API Gateway, so here it is.
There are three aspects, there is IAM Permissions,
Lambda authorizers, and there is Cognito user pool.
We're going to be see them one-by-one.
The first one is IAM permissions,
so basically, your IAM will be AWS,
and so if you want to give one of your
user, one of your role access to your API
that makes sense to attach an IAM policy
to your user and your role,
and then what happens is that the API Gateway
will verify the IAM informations when
you call your rest API, and it's really good
if you wanna provide API access
within your own infrastructure.
It's a really good way of doing things.
The magic is called Sig v4, for signature v4,
and so the IAM credentials, it's a bit complicated,
but they are in one header,
and the header is passed onto the API Gateway.
So we have our client, it's calling API Gateway
with Sig v4, and then API Gateway calls IAM
verifies the policies, makes sure it all checks out,
and then if it's happy, goes to the back end.
So if we talk about the advantages,
there's no added cost to this solution,
and any time you see Sig v4 in the exam,
think IAM permissions for API Gateway.
It's a pretty easy solution, but if you
give access to users outside of your AWS
then you can't use IAM for missions, obviously.
The second thing that is probably the most common
you're gonna see out there, is Lambda authorizer,
and it used to be known as Custom Authorizers,
so if you see in the exam Custom Authorizers,
think Lambda authorizer.
As the name indicates, it uses Amazon Lambda
to validate the token that is being passed
in the header of your request.
And you can cache the result of your authentication,
so you don't need to call your Authorizer Lambda
every time a request comes in, just once,
and then you can cache your result for say, whenever.
It's used when you have some kind of third party
type authentication, OAuth, SAML, etc.
So any time you need to evaluate the credentials
given by a third party, Lambda authorizer
is a great candidate for this.
And the Lambda, as a result of your authorization
must return an IAM Policy for the user,
and that IAM Policy will define whether or not
the user can call the API.
So, fairly easy, now our client calls a rest API
with a token, a third party token,
and our API Gateway will call the Lambda authorizer,
passing the token to the Lambda authorizer,
and the Lambda will return an IAM Policy,
and if everything checks out,
then the API Gateway talks to the back end and we're good.
Now we have a third kind of users,
and this is the user pools for Cognito,
now there's a whole section on Cognito,
so don't get afraid too much right now,
let's just assume we know what user pools are,
and so Cognito will manage the full user lifecycle,
and the API Gateway will automatically verify
the identity from AWS Cognito,
and you don't need to implement any
custom Lambda function, or anything.
So it's all implemented for you, and free.
But the only thing to know, is that Cognito
only helps this time with authentication, not authorization.
So Cognito just says, yes the user
talking to you right now is indeed the right user.
So the process is that your client calls
the Cognito user pool to authenticate,
and then the Cognito user pool gives back
a token to the client.
The client now calls our API Gateway,
as a rest API and it passes on the token
it just received from the Cognito user pool.
The API Gateway will then make sure
that the Cognito token is correct,
by talking to Cognito directly.
And then when it's happy,
it says okay we can now talk to the back end.
The back end must ensure that you are authorized
to make the call, so this time it's a little bit different.
So in this type of solution,
you manage your own user pool so that this
is going to be great when we see Cognito,
because we can see how we can enable Facebook,
or Google Authentication with that scheme.
And that gives you the third kind of authentication
for the API Gateway.
So let's just summarize, and understand
which scheme to use, and when.
So the first one is going to be IAM,
and IAM is for when you have users
or rolls already within your AWS accounts.
It's handling authentication, and authorization
through IAM Policies, and it leverages Sig v4.
If you use a custom authorizer,
it's great when your third party tokens
that you don't control, and you are very flexible,
in terms of what IAM policy is going to be returned.
You can handle authentication and authorization
because you return an IAM policy,
and you're going to pay per Lambda invocation
but you can use caching to limit the number
of calls you do to your Lambda function
for authorizing, which if you have one million users
then you'll have to call your Lambda function
one million times every time the cache gets invalidated.
Focusing on user pools, then you're going to manage
your own user pool, and we'll see this in Cognito
when we go to the section of Cognito, next section.
You can be backed by Facebook login, Google login etc.
So you don't need to write any custom code,
and you must implement the authorization layer
on the back end.
So Cognito will just provide you an authentication pattern,
not an authorization pattern.
So I hope that helps,
and I will see you in the next lecture.