
<v Instructor>So let's go into the Amazon S3 Console.</v>
And there we can view all our buckets
and we can create our first bucket.
So I'll go ahead and click on create buckets.
Next we have to give our buckets a name.
And the name has to be globally unique
across all accounts in AWS.
So, if I name my bucket test,
even though there was no test bucket in my accounts.
Scroll all the way down and click on create buckets.
I'm going to get an error saying
that the buckets with the same name already exists.
So I must choose a name that's going
to be globally unique in AWS.
I can do a demos defined as demo-stephane-s3-bucket-2020.
Who know, right?
But this is good enough.
Next you have to choose a region.
So choose a region that's close to you,
for me I'm going to choose EU(Ireland)eu-west-1
but you have to choose a region for you buckets.
But the Amazon S3 console is global.
It does not require a region selection.
So, don't mistake it.
S3 is not a global service.
It is a global console.
But you need to select a region for your S3 buckets.
Okay, great.
Then I'm going to scroll down
and we have the Block Public Access settings.
For now, I'm going to keep them on
and we'll discuss them when we go
into defining our S3 bucket policies
and some securities around the buckets.
And so what I'll do is just skip these settings
because we'll view versioning and so on later
And then we'll click on create buckets.
So our first bucket has been created.
And now I can click on it
and explore the S3 console together.
So when we get there, we get to the buckets level view.
And as we can see, we have objects, properties permissions,
metrics, management, and access points.
We'll view a lot of those in this section.
But for now, what I want to do is to go ahead and create
and upload our first objects in Amazon S3.
So I'm going to click on upload and then add files.
And I'm going to upload my file called coffee.Jpg
is my first file.
And I'm going to scroll down
and look at the different settings we have.
So, as we can see, we have a destination
which is my buckets right here.
And we can view the fact
that the versioning for now is disabled.
We'll talk about versioning later on.
We can do other settings.
And we could look at additional upload options.
But for now let's keep it simple and just click on upload.
We'll see a lot of these settings later on
again in this section.
Okay, so the object has been uploaded.
And so if I click back on my S3 buckets
I can see that the objects now shows the number one.
So there's one object in my buckets.
It's coffee.jpg file.
And it has been uploaded just right now.
Okay.
So now let's open this file
and have a look at some of his details.
So, how about we try to open this file?
So there are two ways to open a file in Amazon S3.
The first one is to click on the object action
and then open.
And if we do so this opens a new tab.
And this tab is showing us
the coffee picture we are expecting.
So this is great.
The second way to open a file in Amazon S3
is to use the public object URL which is right here.
So if I copy this object URL,
open the new tab and paste this URL,
what do I find?
I find that there is an access denied.
So, this is a bit weird, right?
Well, the idea is that,
here we are able to access it, and here not.
Why so?
Well, in the third tab, so this tab,
we are using the public URL of our objects.
And it turns out that's our S3 buckets is not public.
So right now this is not public.
Therefore, when I try to access any URL on my buckets,
it will not work and it gives me an access denied.
It's because my bucket is not public.
But, if I use the second URL,
it looks similar to the first one.
The first part is actually very similar.
But the last part is really long.
As you can see, this is a very long URL.
This is called a pre-signed URL.
And we'll learn about it in this section as well.
And so using pre-signed URL,
what I'm doing is that I'm giving AWS,
my temporary credentials,
to say, hey AWS, that I'm not just using the public URL,
I'm also passing in my credentials, so this is me.
And it was not who I am, so it's okay, cool.
I can show you this coffee.jpg picture.
This is what you can see it by doing this object action open
which will generate a pre-signed URL, okay.
So, back into our buckets,
let's try to create a folder.
For example, I'm going to create the images folder.
And then I will create that folder.
And then within that folder, but I can do, for example,
is upload another file.
I can add a file and upload my beach.jpg file for example,
and then click on upload.
And here we go, my file has been uploaded.
So now if I navigate a little bit, my buckets
as you can see, I'm into the roots of my buckets
and then I'm into the key is named images.
And within it I find my beach.jpg.
And I could, if I wanted to open the beach.jpg
the same way we did it from before.
Okay, pretty good.
Now finally, what we can do is go back one up,
so we can see coffee.jpg and the folder images,
click on this folder, delete,
and then delete everything within that folder.
As you can see, it is a permanent delete.
So, it says typing permanently delete
to delete the objects and the folder.
So this has worked,
this has been deleted.
I can click on exit in the top right corner.
And here we go.
We've had our first introduction to Amazon is free
in which we have created a buckets,
uploaded a file , view that file
and played a little bit with folders and deleting objects.
So that's it for the soft intro.
We'll do a lot more in the section, but I hope you liked it.
And I will see you in the next section.