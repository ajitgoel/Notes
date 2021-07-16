
<v Narrator>Okay, so let's demonstrate</v>
how the CORS settings work in AWS.
So if we go to this index.html file,
we can see that there is a CORS demo part,
which was commented out
but I want to uncomment it out.
So if I take it from line 13,
and I remove this part right here
and I remove this part right here
this is going to uncomment the code.
And so what is this code doing?
Well this code launches a script
and the script is going to fetch a page
called extra-page.html and then return the response text
of that extra-page.html.
So something very simple.
We make the index.html load another HTML document.
And this other HTML document is extra-page.html
and it says, "This extra-page has been successfully loaded!"
Okay, so this is great.
Now we want to upload these new file versions
onto our S3 buckets, so let's do it right now.
We're going to go into our S3 buckets
and I'm going to upload a file, add files
and I will upload both the extra page
and the index.html that I just modified.
I will upload these two files.
This is working, great.
Let me go back to my bucket.
And I closed my website so I'm going to reopen it.
And if you look at my first webpage now,
it says, "I love coffee, hello world!"
But at the bottom it says,
"This extra page has been successfully loaded!"
And this is exactly what we wanted.
And if I do /extra-page.html, press enter,
we just get that little bit,
"This extra page has been successfully loaded!"
So this has worked because both my index.html
and my extra-page.html files are on the same bucket.
So they are what's called same origin, okay.
But now we want to test for a CORS query, okay.
So different origin.
So for this, we are going to create a new bucket.
So let's go back into Amazon history.
And I'm going to create a bucket.
And this one, I'll call it demo-stephane-cors-2020.
Okay. And I will choose a region, so EU (Ireland).
And then I will unblock the public access
because we want to be,
the files within the bucket to be publicly readable.
So I acknowledge this, this is good.
And create the bucket.
So I'm going to configure that bucket to be a website
so we'll scroll down.
And at the very bottom, I will say, "You are a website."
So I enable it, host a static website.
And I will just have the same settings as before.
Even though we're not specifying these files,
this doesn't really matter.
So this is good.
The next thing we have to do,
so if I go to the website right now, it's not going to work.
The next thing I have to do is to, under permissions,
create a bucket policy and make it public.
So I'll go again to my policy generator
or I can just copy it from the one I have here.
So let's copy this bucket policy, it's going to be easier.
I paste it and please make sure to change the resource ARN,
right here, by the one we have just created.
Okay. So this is good.
This has made my bucket public.
And so if I go now to this bucket URL /extra-page.html,
we are getting a 404 not found.
This makes sense because I haven't uploaded the file yet.
So let's upload the file, extra-page.html.
And upload, here we go, this has been uploaded.
So now if I try to finally reload, that's,
we get, "This extra spread has been successfully loaded!"
So what I've done is that I've set up two websites.
I've set up my first website
and my second website which just contains
the extra-page.html.
And now I'm going to go back into my main bucket
and I'm going to, first of all remove this extra-page.html.
So I'm going to delete it and type, "Delete".
Okay. And so now if I exit and go to my first webpage
and refresh this, I'm going to get an error
because yes, it can't load the extra-page.html.
And the second thing I have to do is to,
to edit my index.html file to fetch this document
from the new bucket URL.
So let's copy the full URL right here
and paste it here.
Okay, so now we have HTTP, the name of the target bucket
we want to load our assets from, /extra-page.html.
Now I'm going to reupload that file into our main bucket.
So I will upload it, add the file, and it's the index.html.
Press upload and it has been successfully uploaded.
So now, you know, if you were to be intuitive,
you're saying, "Fetch this file from this new bucket."
So it should definitely work.
And this is where CORS come into play.
So to demonstrate CORS, what I need to do
is to actually show you the Chrome developer tools.
So on the top right corner,
there is more tools and then developer tools.
And this is something I'd like to have
on the right-hand side, just to show you what happens
in the console and in the network while we do this request.
So let me refresh this page right here.
And I refreshed it.
There was no more error, but now we're getting
an error message saying,
"Access to fetch this page from this origin,"
so the second bucket from the first bucket,
"has been blocked by the CORS policy
because no Access-Control-Allow-Origin header is present
on the requested resource."
So this is where we need to set the CORS policy
on the second bucket.
Okay? So this is the error we get.
And now let's change the CORS in the second bucket
to allow the first bucket to make a request to it.
So, how do we do this?
Well, we go to the second bucket, so this one,
and under permissions, I will scroll down
and find the cross-origin resource sharing, CORS, settings.
And now we have to define it in JSON, so I will edit this.
It used to be XML, but now it's JSON.
So we need to paste in the correct CORS
to allow my webpage to work.
So, thankfully enough, I have coded this for us.
So CORS_CONFIG.json, copy it and paste it.
And you need to, for allowed origin,
put the URL of the first bucket with HTTP,
without the slash at the end.
So let's take this website, which is the one we're doing.
And we paste it right here.
So we do have the http://,
and then please remove the last slash at the end.
So we allow this origin to make a request
onto the second bucket.
I understand this is a bit advanced, obviously.
If you don't want to follow the hands-on, that's fine.
But just remember the idea of CORS, obviously.
But let's finish this hands-on.
So CORS has been edited and that should be it.
Now, if I go back to my first webpage and refresh this,
now we get no more errors,
and yes, "This extra-page has been successfully loaded,"
thanks to the CORS setting, okay.
The other way we can check this
is if we go to the networks tab, as we can see,
"This extra-page.html has been successfully loaded!"
And if we look at the headers of this request
and the response, we can see that in the response headers,
we have the Access-Control-Allow-Origin header,
which contains the full HTTP URL of the first bucket.
And these headers are what is allowing the browser
to load the second URL from the second bucket.
Okay?
So I understand this is quite an advanced hands-on
and you may not be an IT expert, and this is fine.
You don't need you to remember all the steps of what I did.
Just remember that if website number one
needs to access a resource on website number two,
through a web browser, then website number two
needs to have a CORS setting, okay,
to allow the request to be done.
Otherwise the web browser is going to block it.
And this is what I wanted to demo you through this hands-on.
So that's it, I hope you liked it.
And I will see you in the next lecture.