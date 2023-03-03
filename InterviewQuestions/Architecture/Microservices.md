<u>**Difference between Microservices Architecture and SOA**</u>
I guess you could think of the Microservices Architectural Style as a specialization of SOA. Don't forget that the generally accepted view is that all SOA really is, is four sentences:
==•Boundaries are explicit
•Services are autonomous
•Services share schema and contract, not class
•Service compatibility is based on policy==

![[Pasted image 20230302100641.png]]

These tenets of SOA were given to us by Don Box of Microsoft - MS then went on to release WCF and then told us to Go Forth and Service Orientate. Look where that got us (through no fault of their own - see footnote). Then we have this, from Lewis/Fowler:
In short, ==the microservice architectural style is an approach to developing a single application as a suite of small services, each running in its own process and communicating with lightweight mechanisms, often an HTTP resource API.== These services are built around business capabilities and independently deployable by fully automated deployment machinery. There is a bare mininum of centralized management of these services, which may be written in different programming languages and use different data storage technologies. From this definition it's clear that microservices fulfill at least the first two tenets (with real emphasis on the second), but it's questionable whether they fulfill the third (I don't really understand tenet 4 so I won't comment).
The reason the third tenet may not hold for microservices is that one of the characteristics of microservices is that they are generally exposed over a RESTful API, which, one could argue, does not expose contract and schema at all (over and above the regular http verbage), as we see from Fowler: a suite of small services, each... communicating with lightweight mechanisms, often an HTTP resource API
Another way in which a microservices style deviates from SOA is with this prescription: 
These services are... independently deployable by fully automated deployment machinery
Following the original tenets of SOA does not prevent me from manually copying my service binaries into my production environment, but with the microservices approach, the service deployment and management should be fully automated.
footnote: In WCF, MS created a services framework which is ridiculously easy to abuse. Juvel Lowy, one of the original designers of WCF, offers guidance to how to do SOA properly with WCF with hisServiceModelEx framework.  

**<u>What is a microservice?</u>**
==A microservice is a service with one, and only one, very narrowly focused capability that a remote API exposes to the rest of the system==

**<u>Microservice characteristics:</u>**
 A microservice is responsible for a single capability.
 A microservice is individually deployable.
 A microservice consists of one or more processes.
 A microservice owns its own data store.
 A small team can maintain a handful of microservices.
 A microservice is replaceable  

**<u>Why microservices</u>**
 Enable continuous delivery
 Allow for an efficient developer workflow because they’re highly maintainable
 Are robust by design
 Can scale up or down independently of each other  

**<u>Costs and downsides of microservices</u>**
 Microservice systems are distributed systems. The costs associated with distributed systems are well known. They can be harder to reason about and harder to test than monolithic systems, and communication across process boundaries or across networks is orders of magnitude slower than in-process method calls.
 Microservice systems are made up of many microservices, each of which has to be developed, deployed, and managed in production. This means you’ll have many deployments and a complex production setup.
 Each microservice is a separate codebase. Consequently, refactorings that move code from one microservice to another are painful. You need to invest in getting the scope of each microservice just right.  