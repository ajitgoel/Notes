==The twelve-factor app is a methodology for building software-as-a-service apps that:==

- ==Use **declarative** formats for setup automation,== to minimize time and cost for new developers joining the project;
- ==Have a **clean contract** with the underlying operating system, offering **maximum portability** between execution environments;==
- ==Are suitable for **deployment** on modern **cloud platforms**,== obviating the need for servers and systems administration;
- ==**Minimize divergence** between development and production, enabling **continuous deployment** for maximum agility;==
- ==And can **scale up** without significant changes to tooling, architecture, or development practices.==

**I Codebase** There should be exactly one codebase for a deployed service with the codebase being used for many deployments.
**II Dependencies** All dependencies should be declared, with no implicit reliance on system tools or libraries.
**III Config** Configuration that varies between deployments should be stored in the environment.
**IV Backing services** A *backing service* is any service the app consumes over the network as part of its normal operation.
**The code for a twelve-factor app makes no distinction between local and third party services.** To the app, both are attached resources, accessed via a URL or other locator/credentials stored in the [config](https://12factor.net/config). ==A [deploy](https://12factor.net/codebase) of the twelve-factor app should be able to swap out a local MySQL database with one managed by a third party (such as [Amazon RDS](http://aws.amazon.com/rds/)) without any changes to the app’s code.== 
**V Build, release, run** The delivery pipeline should strictly consist of build, release, run.
**VI Processes** Applications should be deployed as one or more stateless processes with persisted data stored on a backing service.
**VII Port binding** Self-contained services should make themselves available to other services by specified ports.
**VIII Concurrency** Concurrency is advocated by scaling individual processes.
Any computer program, once run, is represented by one or more processes.
**In the twelve-factor app, processes are a first class citizen.** Processes in the twelve-factor app take strong cues from [the unix process model for running service daemons](https://adam.herokuapp.com/past/2011/5/9/applying_the_unix_process_model_to_web_apps/). Using this model, the developer can architect their app to handle diverse workloads by assigning each type of work to a *process type*. For example, ==HTTP requests may be handled by a web process, and long-running background tasks handled by a worker process.==
an individual VM can only grow so large (vertical scale), so ==the application must also be able to span multiple processes running on multiple physical machines.==
The [share-nothing, horizontally partitionable nature of twelve-factor app processes](https://12factor.net/processes) means that adding more concurrency is a simple and reliable operation. 

**IX Disposability** Fast startup and shutdown are advocated for a more robust and resilient system.
==**The twelve-factor app’s [processes](https://12factor.net/processes) are \*disposable\*, meaning they can be started or stopped at a moment’s notice.**== This facilitates fast elastic scaling, rapid deployment of [code](https://12factor.net/codebase) or [config](https://12factor.net/config) changes, and robustness of production deploys.
==Processes should strive to **minimize startup time**. Ideally, a process takes a few seconds from the time the launch command is executed until the process is up and ready to receive requests or jobs.== Short startup time provides more agility for the [release](https://12factor.net/build-release-run) process and scaling up; and it aids robustness, because the process manager can more easily move processes to new physical machines when warranted.
==Processes **shut down gracefully when they receive a [SIGTERM](http://en.wikipedia.org/wiki/SIGTERM)** signal from the process manager. For a web process, graceful shutdown is achieved by ceasing to listen on the service port (thereby refusing any new requests), allowing any current requests to finish, and then exiting.== Implicit in this model is that HTTP requests are short (no more than a few seconds), or in the case of long polling, the client should seamlessly attempt to reconnect when the connection is lost.
==For a worker process, graceful shutdown is achieved by returning the current job to the work queue.==  Implicit in this model is that all jobs are [reentrant](http://en.wikipedia.org/wiki/Reentrant_(subroutine)), which typically is achieved by wrapping the results in a transaction, or making the operation [idempotent](http://en.wikipedia.org/wiki/Idempotence).

**X Dev/Prod parity** All environments should be as similar as possible.
**XI Logs** Applications should produce logs as event streams and leave the execution environment to aggregate.
*Logs* provide visibility into the behavior of a running app. **A twelve-factor app never concerns itself with routing or storage of its output stream.** Instead, each running process writes its event stream, unbuffered, to `stdout`. The event stream for an app can be routed to a file, or watched via realtime tail in a terminal. Most significantly, the stream can be sent to a log indexing and analysis system. 
**XII Admin Processes** Any needed admin tasks should be kept in source control and packaged with the application.
The [process formation](https://12factor.net/concurrency) is the array of processes that are used to do the app’s regular business (such as handling web requests) as it runs. Separately, developers will often wish to do one-off administrative or maintenance tasks for the app, such as:

- Running database migrations
- Running a console (also known as a [REPL](http://en.wikipedia.org/wiki/Read-eval-print_loop) shell) to run arbitrary code or inspect the app’s models against the live database. 
- Running one-time scripts committed into the app’s repo

One-off admin processes should be run in an identical environment as the regular [long-running processes](https://12factor.net/processes) of the app. They run against a [release](https://12factor.net/build-release-run), using the same [codebase](https://12factor.net/codebase) and [config](https://12factor.net/config) as any process run against that release. Admin code must ship with application code to avoid synchronization issues.