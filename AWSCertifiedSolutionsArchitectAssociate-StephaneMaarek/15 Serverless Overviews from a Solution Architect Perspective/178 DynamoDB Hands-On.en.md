
<v Instructor>Okay so let's just quickly see DynamoDB.</v>
Again, this is not something you need to know
in depth as far as how to use it
for a solutions architect exam
but still I'm going to give you a quick overview
so we can reflect on what I said.
So it's a managed NoSQL database
and you get single-digit millisecond latency
at any scale so it's quite high performance.
You can create tables, and we can add and query items,
and then we can monitor and manage tables.
So let's go ahead and create our first table.
We'll call it demo and the partition key
is basically your primary key.
So in this case I'll just say user name.
Okay?
And you can add a sort key that would be like
a second thing to go into primary key.
Now I don't wanna add complexity right now
so I'll just remove it.
Now you can use a default setting and be done
but it's not important for you to understand
how this non-defaulting works.
So secondary indexes, we're not gonna go through.
This is not in scope.
Read write capacity mode, this is where it's important.
So we get provision, which is free-tier eligible,
and we get on-demand.
On-demand I'll tell you all about it
in the next lecture so don't worry too much.
Right now for provisions we get the ability
to specify the read capacity units
and the write capacity units.
Now the cool thing is that you
can get a capacity calculator.
So you're saying okay I got an item size
of 14 kilobytes and I wanna do 23 reads per second
and I want them to be strongly consistent.
And then I want to have maybe
an item write per second of 90 and here you go.
You should get 92 read capacity.
1260 write capacity and this is how much
this table will cost you.
So this is really nice cause now
we can really understand how DynamoDB
is priced and how we can basically scale
the read capacity and write capacity based
on our estimation of throughputs.
So for now though I'm going to have five and five.
As you can see they're grayed out
because I have enabled auto scaling.
So auto scaling is a way for us
to increase and decrease capacity over time
based on the load on our DynamoDB table
so that we don't guess too much.
We just say okay I'm willing to go
between five and 40,000 read capacity.
And I'm going to go between five
and 40,000 write capacity and I want you
to basically scale over time based on demand.
But I can disable auto scaling
and now I can basically provision capacity
for my table manually so I can say I want
five read capacity and two write capacity.
So now you have 10 read capacity
and write capacity free for a month.
So using five and two we'll make you go
within the free tier.
We can also enable encryption at rest
either using KMS default encryption key
or using your own KMS key that you need to provide.
So for now I'll just remain default
and click on create and we're done.
So now the table is being created
and this is our first DynamoDB table,
and that's basically all you need to know.
I'll just show you how to add an item
just so you get a good idea of how things work
but that will be basically it for all
that you need to know in terms of hands-on.
So here is our table and we can create an item.
So we have to specify a username so I'll call it Stephane.
And then maybe I want to specify a string
and I'll say address, and I'll say Dream Street.
Okay, that's my address, Dream Street.
It's actually not my address but here you go.
And maybe I wanna say okay I wanna append a string
and this can be favorite movie,
and this one is going to be Memento.
It's actually a great movie.
And then finally, maybe you want to append a number,
and say number of aws certifications.
And here I will say nine.
It's actually not true but I'll just have it like this.
Okay so this is my first row and I'm able
to basically add another row.
So I create another item.
And I cannot use Stephane again
because if I use Stephane and I save it,
you'll see it'll say it's impossible,
you already have this as your primary key.
So I'll need to use something else.
I'll use John.
And maybe John I will append its age.
So we'll say number and the age of John
is going to be 13 and click on yes.
So as you can see here I've added two rows.
But as we can see we don't need to specify
all the fields for it to work.
Here I was just able to specify age 13,
whereas for me I was specifying address,
a favorite movie, and the number of aws certifications
and everything was fine.
So it gives you an idea of how DynamoDB works.
It gives you an idea that not every column needs
to be specified and not every column needs to have a value.
So you're very free and into how
you want to make it work for you.
So that's it for DynamoDB and some
of the hands-on you need to know about.
Now let's get back to the theory.
You need to know about a few features
you need to know about.
So you're becoming a great solution architect.