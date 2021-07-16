
<v Instructor>So you need to know a few Lambda limits</v>
before going into the exam
because the exam likes to see if you know these limits,
and these limits are per region.
So we have some Execution limits
and then we'll have some Deployment limits.
So Execution is that the memory allocation
is between 128 megabytes to 3000 megabytes, okay?
And this is in 64 megabytes increments.
And when we increase the memory,
then we have more vCPU, you understand this now.
The maximum execution time is 900 seconds,
which is 15 minutes,
so anything above that is not a good use case for Lambda.
Environment variables, we can only have up to four kilobytes
of environment variables, so a limited amount of space,
but there is a temp space if you want to pull in
some big files while we create another function,
and so this capacity in the /tmp folder
and then we have 512 megabytes there.
We can have up to 1000 concurrent executions
other than the functions.
This can be increased as well if we do a request, okay?
But it's good to use reserve concurrency early on.
Finally, for Deployments, the max size
for your compressed .zip is 50,
uncompressed it is 250 megabytes.
So anything above that, for example big files,
you should use the /tmp space instead.
So, as I said, in case you need to have big file in start up
please use that directory.
And finally, again, the environment variables
is four kilobytes.
So once you know all these limits,
when the exam will ask you a few questions
such as we need six gigabytes of RAM,
or we need 30 minutes of execution time,
or we need a big file of three gigabytes,
then you will know that Lambda is not
the right way to run this work load.
I hope that was helpful
and I'll see you in the next lecture.