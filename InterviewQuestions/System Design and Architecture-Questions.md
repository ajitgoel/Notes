## _Q1_:  What Is CAP Theorem?

**The CAP Theorem for distributed computing** was published by Eric Brewer. This states that it is not possible for a distributed computer system to simultaneously provide all three of the following guarantees:

==1.  _Consistency_ (all nodes see the same data even at the same time with concurrent updates )==
==2.  _Availability_ (a guarantee that every request receives a response about whether it was successful or failed)==
==3.  _Partition tolerance_ (the system continues to operate despite arbitrary message loss or failure of part of the system)==

The CAP acronym corresponds to these three guarantees. This theorem has created the base for modern distributed computing approaches. Worlds most high volume traffic companies (e.g. Amazon, Google, Facebook) use this as basis for deciding their application architecture. It's important to understand that only two of these three conditions can be guaranteed to be met by a system.

---

## _Q2_:  Explain the difference between Asynchronous and Parallel programming?

Answer

When you run something **asynchronously** it means it is non-blocking, you execute it without waiting for it to complete and carry on with other things. **Parallelism** means to run multiple things at the same time, in parallel. Parallelism works well when you can separate tasks into independent pieces of work. Async and Callbacks are generally a way (tool or mechanism) to express concurrency i.e. a set of entities possibly talking to each other and sharing resources.

Take for example rendering frames of a 3D animation. To render the animation takes a long time so if you were to launch that render from within your animation editing software you would make sure it was running _asynchronously_ so it didn't lock up your UI and you could continue doing other things. Now, each frame of that animation can also be considered as an individual task. If we have multiple CPUs/Cores or multiple machines available, we can render multiple frames in _parallel_ to speed up the overall workload.

---

## _Q3_: 

What Is Scalability?

Answer

Scalability is the ability of a system, network, or process to handle a growing amount of load by adding more resources. The adding of resource can be done in two ways

==-   **Scaling Up**  
    This involves adding more resources to the existing nodes. For example, adding more RAM, Storage or processing power.==
==-   **Scaling Out**  
    This involves adding more nodes to support more users.==

Any of the approaches can be used for scaling up/out a application, however the cost of adding resources (per user) may change as the volume increases. If we add resources to the system It should increase the ability of application to take more load in a proportional manner of added resources.

An ideal application should be able to serve high level of load in less resources. However, in practical, linearly scalable system may be the best option achievable. Poorly designed applications may have really high cost on scaling up/out since it will require more resources/user as the load increases.  

---

## _Q4_: 

What are the advantages of NoSQL over traditional RDBMS?

Answer

**NoSQL is better** than RDBMS because of the following reasons/properities of NoSQL:

==-   It supports semi-structured data== and volatile data
==-   It does not have schema==
==-   Read/Write throughput is very high==
==-   Horizontal **scalability** can be achieved easily==
-   Will support Bigdata in volumes of Terra Bytes & Peta Bytes
-   Provides good support for Analytic tools on top of Bigdata
-   Can be hosted in cheaper hardware machines
-   In-memory caching option is available to increase the performance of queries
==-   Faster development life cycles for developers==

Still, **RDBMS is better** than NoSQL for the following reasons/properties of RDBMS:

==-   Transactions with **ACID** properties - Atomicity, Consistency, Isolation & Durability==
==-   Adherence to **Strong Schema** of data being written/read==
-   Real time query management ( in case of data size < 10 Tera bytes )
-   Execution of complex queries involving **join** & **group by** clauses

---

## _Q5_: 

What do you mean by _lower latency interaction_?

Answer

==**Low latency** means that there is very little delay between the time you request something and the time you get a response.== As it applies to webSockets, it just means that data can be sent quicker (particularly over slow links) because the connection has already been established so no extra packet roundtrips are required to establish the TCP connection.

---

## _Q6_: 

What does the expression “Fail Early” mean, and when would you want to do so?

Answer

==Essentially, **fail fast** (a.k.a. **fail early**) is to code your software such that, **when there is a problem, the software fails _as soon as_ and _as visibly as_ possible**, rather than trying to proceed in a possibly unstable state.==

**Fail Fast** approach won’t reduce the overall number of bugs, at least not at first, but it’ll make most defects much _easier to find_.

---

## _Q7_: 

What is Domain Driven Design?

Answer

==**Domain Driven Design** is a methodology and process prescription for the development of complex systems whose focus is mapping activities, tasks, events, and data within a problem domain into the technology artifacts of a solution domain.==

It is all about trying to make your software a model of a real-world system or process.

---

## _Q8_: 

What is meant by the KISS principle?

Answer

==**KISS**, a backronym for "keep it simple, stupid",== is a design principle noted by the U.S. Navy in 1960. T==he KISS principle states that most systems work best if they are kept simple rather than made complicated;== therefore simplicity should be a key goal in design, and that unnecessary complexity should be avoided.

---

## _Q9_: 

Why Do You Need Clustering?

Answer

==_Clustering_ is needed for achieving high availability for a server software. The main purpose of clustering is to achieve 100% availability or a zero down time in service.== A typical server software can be running on one computer machine and it can serve as long as there is no hardware failure or some other failure. By creating a cluster of more than one machine, we can reduce the chances of our service going un-available in case one of the machine fails.

Doing clustering does not always guarantee that service will be 100% available since there can still be a chance that all the machine in a cluster fail at the same time. However it in not very likely in case you have many machines and they are located at different location or supported by their own resources.  

---

## _Q11_: 

Explain Deadlock to 5 years old

Answer

Jack and Jill share a sparse kitchen that has only one of everything. They both want to make a sandwich at the same time. Each needs a slice of bread and each needs a knife, so they both go to get the loaf of bread and the knife from the kitchen.

Jack gets the knife first, while Jill gets the loaf of bread first. Now Jack tries to find the loaf of bread and Jill tries to find the knife, but both find that what they need to finish the task is already in use. If they both decide to wait until what they need is no longer in use, they will wait for each other forever. **Deadlock**.

---

## _Q12_: 

Explain the Single Responsibility Principle (SRP)?

Answer

==**Single responsibility** is the concept of a Class doing one specific thing (responsibility) and not trying to do more than it should, which is also referred to as _High Cohesion_.==

Classes don't often start out with Low Cohesion, but typically after several releases and different developers adding onto them, suddenly you'll notice that it became a monster or **God** class as some call it. So the class should be refactored.

---

## _Q13_: 

Is there any difference between a Binary Semaphore and Mutex?

Answer

-   A **mutex** (or Mutual Exclusion Semaphores) is a **locking mechanism** used to synchronize _access_ to a resource. Only one task (can be a thread or process based on OS abstraction) can acquire the mutex. It means there will be ownership associated with mutex, and only the owner can release the lock (mutex).
    
-   **Semaphore** (or Binary Semaphore) is **signaling mechanism** (“I am done, you can carry on” kind of signal). For example, if you are listening songs (assume it as one task) on your mobile and at the same time your friend called you, an interrupt will be triggered upon which an interrupt service routine (ISR) will signal the call processing task to wakeup. A binary semaphore is NOT protecting a resource from access. Semaphores are more suitable for some synchronization problems like producer-consumer.
    

Short version:

-   A **mutex** can be released only by **the thread that had acquired it**.
-   A **binary semaphore** can be signaled **by any thread** (or process).

---

## _Q14_: 

What Do You Mean By High Availability (HA)?

Answer

**Availability** means the ability of the application user to access the system, If a user cannot access the application, it is assumed unavailable. High Availability means the application will be available, without interruption. ==Using redundant server nodes with clustering is a common way to achieve higher level of availability in web applications.==

Availability is commonly expressed as a percentage of uptime in a given year.

---

## _Q15_: 

==What Is ACID Property Of A System?==

Answer

_ACID_ is a acronym which is commonly used to define the properties of a relational database system, it stand for following terms

==-   **Atomicity** - This property guarantees that if one part of the transaction fails, the entire transaction will fail, and the database state will be left unchanged.==
==-   **Consistency** - This property ensures that any transaction will bring the database from one valid state to another.==
==-   **Isolation** - This property ensures that the concurrent execution of transactions results in a system state that would be obtained if transactions were executed serially.==
==- **Durable** - means that once a transaction has been committed, it will remain so, even in the event of power loss==

---

## _Q16_: 

What Is Sticky Session Load Balancing? What Do You Mean By "Session Affinity"?

Answer

==_Sticky session_ or a _session affinity technique_ is another popular load balancing technique that requires a user session to be always served by an allocated machine.==

In a load balanced server application where user information is stored in session it will be required to keep the session data available to all machines. This can be avoided by always serving a particular user session request from one machine. The machine is associated with a session as soon as the session is created. All the requests in a particular session are always redirected to the associated machine. This ensures the user data is only at one machine and load is also shared.

==This is typically done by using SessionId cookie. The cookie is sent to the client for the first request and every subsequent request by client must be containing that same cookie to identify the session.==

**What Are The Issues With Sticky Session?**

There are few issues that you may face with this approach

-   The client browser may not support cookies, and your load balancer will not be able to identify if a request belongs to a session. This may cause strange behavior for the users who use no cookie based browsers.
-   In case one of the machine fails or goes down, the user information (served by that machine) will be lost and there will be no way to recover user session.

---
## _Q17_: 

What are the DRY and DIE principles?

Answer

In software engineering, **Don't Repeat Yourself (DRY)** or **Duplication is Evil (DIE)** is a principle of software development.

---

## _Q18_: 

What does SOLID stand for? What are its principles?

Answer

**S.O.L.I.D** is an acronym for the first five object-oriented design (OOD) principles by Robert C. Martin.

-   **S** - _Single-responsiblity principle_. A class should have one and only one reason to change, meaning that a class should have only one job.
-   **O** - _Open-closed principle_. Objects or entities should be open for extension, but closed for modification.
-   **L** - _Liskov substitution principle_. Let q(x) be a property provable about objects of x of type T. Then q(y) should be provable for objects y of type S where S is a subtype of T.
-   **I** - _Interface segregation principle_. A client should never be forced to implement an interface that it doesn't use or clients shouldn't be forced to depend on methods they do not use.
-   **D** - _Dependency Inversion Principle_. Entities must depend on abstractions not on concretions. It states that the high level module must not depend on the low level module, but they should depend on abstractions.

---

## _Q19_: 

What does _program to interfaces, not implementations_ mean?

Answer

**Coding against interface** means, the client code always holds an Interface object which is supplied by a _factory_.

Any instance returned by the factory would be of type Interface which any factory candidate class must have implemented. This way the client program is not worried about implementation and the interface signature determines what all operations can be done.

This approach can be used to change the behavior of a program at run-time. It also helps you to write far better programs from the maintenance point of view.

---

## _Q20_: 

What does it mean "System Shall Be Resilient"?

Answer

==System is **Resilient** if it stays **responsive in the face of failure**.== This applies not only to highly-available, mission critical systems — any system that is _not resilient_ will be unresponsive after a failure.

Resilience is achieved by:

-   replication,
-   containment,
-   isolation and
-   delegation.

Failures are _contained_ within each component, _isolating_ components from each other and thereby ensuring that parts of the system can fail and recover without compromising the system as a whole. Recovery of each component is _delegated_ to another (external) component and high-availability is ensured by _replication_ where necessary. The client of a component is not burdened with handling its failures.

---

## _Q21_: 

What does the CAP Theorem actually say?

Answer

The CAP Theorem says that it is impossible to build an implementation of read-write storage/system in an asynchronous network that satisfies all of the following three properties:

-   **Availability** - will a request made to the data store always eventually complete?
-   **Consistency** - will all executions of reads and writes seen by all nodes be atomic or linearizably consistent?
-   **Partition tolerance** - the network is allowed to drop any messages.

More informally, the CAP theorem tells us that we can't build a database/system that both responds to every request and returns the results that you would expect every time.

---

## _Q22_: 

What is Elasticity (in contrast to Scalability)?

Answer

==**Elasticity** means that the throughput of a system scales up or down automatically to meet varying demand as resource is proportionally added or removed.== The system needs to be scalable to allow it to benefit from the dynamic addition, or removal, of resources at runtime. Elasticity therefore builds upon scalability and expands on it by adding the notion of automatic resource management.

---

## _Q23_: 

What is the difference between Concurrency and Parallelism?

Answer

==-   **Concurrency** is when two or more tasks can start, run, and complete in overlapping time **periods**. It doesn't necessarily mean they'll ever both be running **at the same instant**. For example, _multitasking_ on a single-core machine.==
    
==-   **Parallelism** is when tasks _literally_ run at the same time, e.g., on a multicore processor.==

For instance a bartender is able to look after several customers while he can only prepare one beverage at a time. So he can provide _concurrency without parallelism_.

---

## _Q24_: 

What is the difference between Monolithic, SOA and Microservices Architecture?

Answer

-   **Monolithic Architecture** is similar to a big container wherein all the software components of an application are assembled together and tightly packaged.
-   A **Service-Oriented Architecture** is a collection of services which communicate with each other. The communication can involve either simple data passing or it could involve two or more services coordinating some activity.
-   **Microservice Architecture** is an architectural style that structures an application as a collection of small autonomous services, modeled around a business domain.

---

## _Q25_: 

When should I use a NoSQL database instead of a relational database?

Answer

**Relational databases** enforces ACID. So, you will have schema based transaction oriented data stores. It's proven and suitable for 99% of the real world applications. You can practically do anything with relational databases.

But, there are limitations on speed and scaling when it comes to massive high availability data stores. For example, Google and Amazon have terabytes of data stored in big data centers. Querying and inserting is not performant in these scenarios because of the blocking/schema/transaction nature of the RDBMs. That's the reason they have implemented their own databases (actually, **key-value stores**) for massive performance gain and scalability.

If you need a NoSQL db you usually know about it, possible reasons are:

-   ==client wants 99.999% availability on a high traffic site.==
-   your data makes no sense in SQL, ==you find yourself doing multiple JOIN queries for accessing some piece of information.==
-   you are breaking the relational model, you have CLOBs that store denormalized data and you generate external indexes to search that data.

---

## _Q26_: 

Compare "Fail Fast" vs "Robust" approaches of building software

Answer

Some people recommend making your software **robust** by working around problems automatically. This results in the software “failing slowly.” The program continues working right after an error but fails in strange ways later on.

A system that **fails fast** does exactly the opposite: when a problem occurs, it fails immediately and visibly. Failing fast is a nonintuitive technique: “failing immediately and visibly” sounds like it would make your software more fragile, but it actually makes it more robust. Bugs are easier to find and fix, so fewer go into production.

In overall, the quicker and easier the failure is, the faster it will be fixed. And the fix will be simpler and also more visible. **Fail Fast** is a much better approach for maintainability.

---

## _Q27_: 

Could you provide an example of the _Single Responsibility Principle_?

Answer

**Single Responsibility Principle (SRP)** states that a class or a method should only be doing one thing and shouldn't be any doing anything related. A class should have only one reason to change.

A typical example could a `EmailSender` class:

-   this should just deal with sending an email out.
-   this should not be responsible for loading the email content from database or even formatting the email content to be sent.

---

## _Q28_: 

Two customers add a product to the basket in the same time whose the stock was only one (1). What will you do?

Problem

What is the best practice to manage the case where two customers add in the same time a product whose the stock was only 1?

Answer

There is no perfect answer for this question and all depends on details but you have some options:

1.  As a first 'defense line' I would try to avoid such situations at all, by simply not selling out articles that low if any possible.
2.  You reserve an item for the customer for a fix time say (20 minutes) after they have added it to the basket – after they time they have to recheck the stock level or start again. This is often used to ticket to events or airline seats
3.  For small jobs the best way is to do a final check right before the payment, when the order is actually placed. In worst case you have to tell you customer that you where running out of stock right now and offer alternatives or discount coupon.
4.  Try to fulfil both orders later - just cause you don't have stock right now, doesn't mean you can't find it in an emergency. If you can't then someone has to contact the user who lucked out and apologise.

Side note:

1.  The solution to do the double check when adding something to the basket isn't very good. People put a lot in baskets without ever actually placing an order. So this may block this article for a certain period of time.

---

## _Q29_: 

What Is Sharding?

Answer

==**Sharding** is a architectural approach that distributes a single logical database system into a cluster of machines. Sharding is _Horizontal partitioning_ design scheme.== In this database design rows of a database table are stored separately, instead of splitting into columns (like in _normalization_ and _vertical partitioning_). Each partition is called as a shard, which can be independently located on a separate database server or physical location.

Sharding makes a database system highly scalable. The total number of rows in each table in each database is reduced since the tables are divided and distributed into multiple servers. This reduces the index size, which generally means improved search performance. ==The most common approach for creating shards is by the use of consistent hashing of a unique id in application (e.g. user id).==

**The downsides of sharding:**

-   It requires application to be aware of the data location.
-   Any addition or deletion of nodes from system will require some rebalance to be done in the system.
-   If you require lot of cross node join queries then your performance will be really bad. Therefore, knowing how the data will be used for querying becomes really important.
-   A wrong sharding logic may result in worse performance. Therefore make sure you shard based on the application need.

---

## _Q30_: 

What is GOD class and why should we avoid it?

Answer

The most effective way to break applications it to create **GOD** classes. That are classes that keeps track of a lot of information and have several responsibilities. One code change will most likely affect other parts of the class and therefore indirectly all other classes that uses it. That in turn leads to an even bigger maintenance mess since no one dares to do any changes other than adding new functionality to it.

---

## _Q31_: 

What is Starvation?

Answer

==**Starvation** describes a situation where a thread is unable to gain regular access to shared resources and is unable to make progress. This happens when shared resources are made unavailable for long periods by "greedy" threads or threads with more "prioroty".== For example, suppose an object provides a synchronized method that often takes a long time to return. If one thread invokes this method frequently, other threads that also need frequent synchronized access to the same object will often be blocked.

One more real live example may be this one. Imagine you're in a queue to purchase food at a restaurant, for which pregnant women _have priority_. And there's just a whole bunch of pregnant women arriving all the time. You'll soon be starving.

---

## _Q32_: 

What is _BASE_ property of a system?

Answer

_BASE_ properties are the common properties of recently evolved NoSQL databases. According to CAP theorem, a BASE system does not guarantee consistency. This is a contrived acronym that is mapped to following property of a system in terms of the CAP theorem:

-   **Basically available** indicates that the system is guaranteed to be available
-   **Soft state** indicates that the state of the system may change over time, even without input. This is mainly due to the eventually consistent model.
-   **Eventual consistency** indicates that the system will become consistent over time, given that the system doesn't receive input during that time.

---

## _Q33_: 

What is _Unit test_, _Integration Test_, _Smoke test_, _Regression Test_ and what are the differences between them?

Answer

-   **Unit test**: Specify and test one point of the contract of single method of a class. This should have a very narrow and well defined scope. Complex dependencies and interactions to the outside world are [stubbed or mocked](http://martinfowler.com/articles/mocksArentStubs.html).
    
-   **Integration test**: Test the correct inter-operation of multiple subsystems. There is whole spectrum there, from testing integration between two classes, to testing integration with the production environment.
    
-   **Smoke test (aka Sanity check)**: A simple integration test where we just check that when the system under test is invoked it returns normally and does not blow up.
    
    -   Smoke testing is both an analogy with electronics, where the first test occurs when powering up a circuit (if it smokes, it's bad!)...
    -   ... and, [apparently](https://stackoverflow.com/questions/520064/what-is-unit-test-integration-test-smoke-test-regression-test#comment13627138_520116), with [plumbing](https://en.wikipedia.org/wiki/Smoke_testing_(mechanical)), where a system of pipes is literally filled by smoke and then checked visually. If anything smokes, the system is leaky.
-   **Regression test**: A test that was written when a bug was fixed. It ensures that this specific bug will not occur again. The full name is "non-regression test". It can also be a test made prior to changing an application to make sure the application provides the same outcome.

To this, I will add:

-   **Acceptance test**: Test that a feature or use case is correctly implemented. It is similar to an integration test, but with a focus on the use case to provide rather than on the components involved.
    
-   **System test**: Tests a system as a black box. Dependencies on other systems are often mocked or stubbed during the test (otherwise it would be more of an integration test).
    
-   **Pre-flight check**: Tests that are repeated in a production-like environment, to alleviate the 'builds on my machine' syndrome. Often this is realized by doing an acceptance or smoke test in a production like environment.
    
-   **Canary test** is an automated, non-destructive test that is **run on a regular basis** in a **LIVE** environment, such that if it ever fails, something really bad has happened. Examples might be:
    
    -   Has data that should only ever be available in DEV/TEST appeared in LIVE.
    -   Has a background process failed to run
    -   Can a user logon

---

## _Q34_: 

What's the difference between Deadlock and Livelock?

Answer

-   In concurrent computing, a **deadlock** is a state in which each member of a group of actions, is waiting for some other member to release a lock
    
-   A **livelock** is similar to a deadlock, except that the states of the processes involved in the livelock constantly change with regard to one another, none progressing. Livelock is a special case of **resource starvation**; the general definition only states that a specific process is not progressing.
    
Livelock is a risk with some algorithms that detect and recover from deadlock. If more than one process takes action, the deadlock detection algorithm can be repeatedly triggered. This can be avoided by ensuring that only one process (chosen randomly or by priority) takes action.

---

## _Q35_: 

What's the difference between principles YAGNI and KISS?

Answer

-   ==**YAGNI (You aint gona need it)** refers to over analyzing and implementing things that may or may not be needed.== Sure algorithmic elegance is nice and all but most situation you dont need it. In general engineering terms you should be carefull not to include your own requirements so that you dont taint your customer needs with your own ideas that end up costing the project with little impact for the client.
    
-   **KISS (Keep it simple stupid)** refers to the fact that easy systems are easier to manage. Keeping things simple is not nesseserily less work (like YAGNI is) since it requires more knowlege to implement. They are sometimes similar but grow from different needs.
    
YAGNI grows from a too much future anticipation, overzealous workers if you may. KISS is a strategy that tries to counteract human tendency for design creep.

---

## _Q36_: 

Why layering your application is important? Provide some bad layering example.

Answer

Each component should contain 'layers' - a dedicated object for the web, logic and data access code. This not only ==draws a clean _separation of concerns_ but also significantly eases mocking and testing the system.==

Though this is a very common pattern, API developers tend to mix layers by passing the web layer objects (for example Express req, res) to business logic and data layers - this makes your application dependant on and accessible by Express only. App that mixes web objects with other layers can not be accessed by testing code, CRON jobs and other non-Express callers

---

## _Q37_: 

Why should you structure your solution by components?

Answer

For medium sized apps and above, monoliths are really bad - having one big software with many dependencies is just hard to reason about and often leads to spaghetti code. Even smart architects — those who are skilled enough to tame the beast and 'modularize' it — spend great mental effort on design, and each change requires carefully evaluating the impact on other dependent objects.

The ultimate solution is to develop small software: divide the whole stack into self-contained components that don't share files with others, each constitutes very few files (e.g. API, service, data access, test, etc.) so that it's very easy to reason about it.

Some may call this 'microservices' architecture — it's important to understand that microservices are not a spec which you must follow, but rather a set of principles.

-   Structure your solution by self-contained components is good (orders, users...)
-   Group your files by technical role is bad (ie. controllers, models, helpers...)

---

## _Q38_: 

Are you familiar with The Twelve-Factor App principles?

Answer

## _Q39_: 

Cache miss-storm: Dealing with concurrency when caching invalidates for high-traffic sites

Answer


## _Q40_: 

What Does Eventually Consistent Mean?
==- **Eventual Consistency** is a guarantee that when an update is made in a distributed database, that update will eventually be reflected in all nodes that store the data, resulting in the same response every time the data is queried.==
- Eventually consistent means that a system will eventually  reach a consistent state, even if it is not consistent in the short term.

## _Q41_: 

What Is Shared Nothing Architecture? How Does It Scale?
==**Shared Nothing Architecture** is an approach to database design in which each node in a distributed database system has its own private memory and disk storage and no node shares any memory or disk storage with any other node. This approach maximizes scalability and reliability by eliminating any single point of contention.==
Shared nothing architecture scales by using multiple independent nodes that do not share memory or disks. Each node is independent and can scale independently, allowing for higher scalability and availability.

## _Q42_: 

What are heuristic exceptions?

Answer

## _Q43_: 

What does Amdahl's Law mean?

Answer

## _Q44_: 

What is the difference between Cohesion and Coupling?

Answer
**Cohesion** is the degree to which the elements of a system are bound together, while coupling is the degree to which the elements of a system are connected to each other. **Cohesion** is a measure of the strength of the relationship between elements within a module, while coupling is a measure of the strength of the relationship between modules.

## _Q45_: 

What is the most accepted transaction strategy for microservices?

Answer
- https://softwareengineering.stackexchange.com/questions/290917/what-is-the-most-accepted-transaction-strategy-for-microservices#:~:text=The%20most%20accepted%20transaction%20strategy%20for%20microservices%20is,Show%201%20more%20comment%207%20Answers%20Sorted%20by%3A
	==The usual approach is to isolate those microservices as much as possible - treat them as single units. Then transactions can be developed in context of the service as a whole (ie not part of usual DB transactions, though you can still have DB transactions internal to the service).==
- The most accepted transaction strategy for microservices is the Saga pattern. This pattern uses a series of transactions to ensure data consistency across multiple services. It is an asynchronous process that uses a series of compensating transactions to ensure that if one transaction fails, the rest of the transactions can be rolled back or compensated.













