<u>**Difference between Microservices Architecture and SOA**</u>
I guess you could think of the Microservices Architectural Style as a specialization of SOA. Don't forget that the generally accepted view is that all SOA really is, is four sentences:
==•Boundaries are explicit
•Services are autonomous
•Services share schema and contract, not class
•Service compatibility is based on policy==
These tenets of SOA were given to us by Don Box of Microsoft - MS then went on to release WCF and then told us to Go Forth and Service Orientate. Look where that got us (through no fault of their own - see footnote). Then we have this, from Lewis/Fowler:
In short, ==the microservice architectural style is an approach to developing a single application as a suite of small services, each running in its own process and communicating with lightweight mechanisms, often an HTTP resource API.== These services are built around business capabilities and independently deployable by fully automated deployment machinery. There is a bare mininum of centralized management of these services, which may be written in different programming languages and use different data storage technologies. From this definition it's clear that microservices fulfill at least the first two tenets (with real emphasis on the second), but it's questionable whether they fulfill the third (I don't really understand tenet 4 so I won't comment).
The reason the third tenet may not hold for microservices is that one of the characteristics of microservices is that they are generally exposed over a RESTful API, which, one could argue, does not expose contract and schema at all (over and above the regular http verbage), as we see from Fowler: a suite of small services, each... communicating with lightweight mechanisms, often an HTTP resource API
Another way in which a microservices style deviates from SOA is with this prescription: 
These services are... independently deployable by fully automated deployment machinery
Following the original tenets of SOA does not prevent me from manually copying my service binaries into my production environment, but with the microservices approach, the service deployment and management should be fully automated.
footnote: In WCF, MS created a services framework which is ridiculously easy to abuse. Juvel Lowy, one of the original designers of WCF, offers guidance to how to do SOA properly with WCF with hisServiceModelEx framework.  

<u>**CQRS** **Command and Query Responsibility Segregation**</u>
Starting with CQRS, CQRS is simply the creation of two objects where there was previously only one The separation occurs based upon whether the methods are a command or a query (the same definition that is used by Meyer in ==Command and Query Separation, a command is any method that mutates state and a query is any method that returns a value==). When most people talk about CQRS they are really speaking about applying the CQRS pattern to the object that represents the service boundary of the application. Consider the following pseudo-code service definition.
**CustomerService**
void MakeCustomerPreferred(CustomerId)
Customer GetCustomer(CustomerId)
CustomerSet GetCustomersWithName(Name)
CustomerSet GetPreferredCustomers()
void ChangeCustomerLocale(CustomerId, NewLocale)
void CreateCustomer(Customer)
void EditCustomerDetails(CustomerDetails)
Applying CQRS on this would result in two services
**CustomerWriteService**
void MakeCustomerPreferred(CustomerId)
void ChangeCustomerLocale(CustomerId, NewLocale)
void CreateCustomer(Customer)
void EditCustomerDetails(CustomerDetails)
**CustomerReadService**
Customer GetCustomer(CustomerId)
CustomerSet GetCustomersWithName(Name)
CustomerSet GetPreferredCustomers()

This separation however enables us to do many interesting things architecturally, the largest is that it forces a break of the mental retardation that because the two use the same data they should also use the same data model. The largest possible benefit though is that it recognizes that their are different architectural properties when dealing with commands and queries … for example it allows us to host the two services differently eg: we can host the read service on 25 servers and the write service on two. The processing of commands and queries is fundamentally asymmetrical, and scaling the services symmetrically does not make a lot of sense.