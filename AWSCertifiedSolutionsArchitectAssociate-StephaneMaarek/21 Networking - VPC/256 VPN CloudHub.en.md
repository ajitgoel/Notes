
<v Instructor>Another very, very short lecture,</v>
but this is about VPN CloudHub.
It allows you to create
a secure communication between sites
in case you have multiple VPN connections
between these sites.
So let's have a look.
We would have multiple on-premise sites,
so one, two, and three.
And these sites may be connected already
through some private network,
but we want to have an alternative
to connect these networks together.
And the way it works is that we use VPN CloudHub,
so we created in AWS this VPN CloudHub thing,
and then we establish VPN connections
between each customer site
and this VPN CloudHub.
And what it allows us to do
is to connect network three, for example,
all the way to network one,
and network one all the way to network two.
So it's a way to get either a primary connection
or a secondary backup connection
in case you already have
some connection between these networks
and they fail.
So VPN CloudHub is hub and spoke model,
it's quite low cost,
that allows you to connect all these networks together
through a VPN connection.
And because it's a VPN connection,
it goes over the public internet,
so this is a consideration to do,
but it's going to be encrypted.
All right, so that's it,
just a very, very high level overview of CloudHub,
so that if you see it at exam
you don't get thrown off.
All right, that's it.
I will see you in the next lecture.