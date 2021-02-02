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

**<u>Domain Driven Design:</u>**

==DDD is a design pattern whereby the structure and language of your code, including class names, methods, and variables, matches the business domain.== The pattern describes independent problem areas as bounded contexts, and emphasizes a common language to describe these problems. Determining where to draw the boundaries is an essential task when designing and defining a microservices-based solution. For each bounded context, you must identify and define the entities, value objects, and aggregates that model your domain.