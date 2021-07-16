
<v Instructor>So now let's talk about CORS,</v>
or Cross-Origin Resource Sharing
and this is a complicated concept,
but it does come up by the exam in very simple use cases,
but I want to go deep into CORS
to really explain to you how it works,
because it will make answering the question extremely easy.
So what is an origin?
An origin is a scheme, so a protocol,
a host, a domain, and a port.
In English, what that means is that
for example, if you do https://www.example.com,
this is an origin where the scheme is HTTPS,
the host is www.example.com,
and the port is port 443.
Why?
Because as soon as you have HTTPS, it is port 443
as an implied port.
Okay, so CORS means Cross-Origin Resource Sharing.
So that means we want to get resources
from a different origin.
The Web Browser are having this security in place
CORS basically saying as soon as you visit a website,
you can make request to other origins
only if the other origins allow you to make these request.
This is a browser-based security.
So what is the same origin and what is a different origin?
Well for example, same origin is this,
where you go on example.com/app1
or example.com/app2.
This is the same origin, so we can make requests
from the web browser from the first URL to the second URL
because this is the same origin.
But if you visit, for example,
www.example.com and then you're asking your web browser
to make a request to other.example.com,
this is what's called a cross-origin request
and your web browser will block it
unless you have the correct CORS headers
and we'll see what these are in a second.
So now that we now what is the same origin
and what is a different origin,
we know that the request will not be fulfilled
unless the other origin allows for the request
using the CORS Headers.
And the CORS Headers is this one you will see
in the hands-on called Access-Control-Allow-Origin.
Okay, so that's just for the theory,
now let's go in the diagram
and it will make a lot more sense.
So here's our web browser
and it visits our first web server.
And because this is the first visit we do,
it's called the origin.
So for example, our web server is at https://www.example.com
Okay, great.
And there is a second web server called a cross-origin
because it has a different url,
which is https://www.other.com.
So a web browser visits our first origin
and it's going to be asked from the files
that are uploaded from the origin
to make a request to the cross-origin.
So what the web browser will do,
is that it will do what is called a preflight request.
And this preflight request is going to ask
the cross-origin if it is allowed to do a request on it.
So it's going to say,
"Hey cross-origin, the website https://www.example.com
is sending me to you, can I make a request
onto your website?"
and the origin is saying, "yes, here is what you can do."
so the Access-Control-Allow-Origin is saying
is this website allowed or not?
So yes, it is allowed because now we have
the same origin here, the green one,
as we had on the left hand side.
And the methods that are authorized
is GET, PUT, and DELETE.
So we can get a file, delete a file, or update the file.
Okay, so this is what the cross-origin
is allowing our web browser to do.
So this is the CORS method, and therefore,
because our web browser has been authorized to do so,
then it can issue, for example,
a GET to this url, and it will be allowed
because the CORS Headers received previously
allowed the web browser to make this request.
Okay, so this may be new to you,
this may be a lot, but you need to understand this
before we go into the next use case,
which is the S3 CORS.
So if a client does a cross-origin request
on our S3 bucket enabled as a website,
then we need to enable the right CORS headers.
It's a very popular exam question, okay?
So you need to understand
when we need to enable CORS headers,
and where we need to enable CORS headers.
So we'll see this in the hands-on as well.
So we can allow for a specific origin by specifying
the entire origin name,
or as star * for all origins.
So let's have a look.
The web browser for example, is getting HTML files
from our bucket.
And our bucket is enabled as a website.
But there is second bucket that is going to be
our cross-origin bucket,
also enabled as a website,
that contains some files that we want.
So, we're going to do GET index.html
and the website will say, okay here is your index.html
and that file is going to say you need to perform
a GET for another file on the other origin.
And if the other bucket is configured
with the right CORS headers,
then web browser will be able to make the request,
if not it will not be able to make that request
and that is the whole purpose of CORS.
So as we can see here, the CORS headers have to be defined
on the cross-origin bucket,
not the first origin bucket, okay?
So this is just for theory,
we're going to go into the hands-on
to see how we can explain these concepts
in a much more practical way.
So that was it for the lecture.
I will see you in the next lecture.