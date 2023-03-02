**Solid Principles:** https://confident-neumann-2c8c8f.netlify.app/post/solid-principles/

**Dependency Injection** is about how one object acquires a dependency.
**Inversion of Control (IoC)** means that objects do not create other objects on which they rely to do their work. Instead, they get the objects that they need from an outside source (for example, an xml configuration file).
**Dependency Injection (DI)** means that this is done without the object intervention, usually by a framework component that passes constructor parameters and set properties.

**Dependency Injection Container** is a way to auto-wire classes

==**Abstraction**: It allows complex real world to be represented in simplified manner.==
==**Encapsulation**: It is a process of hiding all the internal details of an object from the outside world.==
==**Association**: This is the simplest relationship between objects.== Example every customer has sales. So Customer object and sales object have an association relation between them.
==**Aggregation(Composition)**: This is also called as composition model. Example in order to make a “Accounts” class it has use other objects example “Voucher”, “Journal” and “Cash” objects. So accounts class is aggregation of these three objects.==
**Inheritance**: Hierarchy is used to define more specialized classes based on a preexisting generalized class.
**Polymorphism: ==When inheritance is used to extend a generalized class to a more specialized class, it includes behavior of the top class(Generalized class). The inheriting class often implement a behavior that can be somewhat different than the generalized class, but the name of the behavior can be same. It is important that a given instance of an object use the correct behavior, and the property of polymorphism allows this to happen automatically.==

**(I) What are abstract classes ?**
Following are features of a abstract class :-
√ You can not create a object of abstract class
√ Abstract class is designed to act as a base class (to be inherited by other classes). Abstract class is a design concept in program development and provides a base upon which other classes are built.
√ Abstract classes are similar to interfaces. After declaring an ==abstract class==, it ==cannot be instantiated on its own, it must be inherited.==
==√ Abstract classes can have implementation or pure abstract methods which should be implemented in the child class.== 
Abstract classes can also have virtual or non-virtual methods.

**(B) What is a Interface ?**
Interface is a contract that defines the signature of the functionality. So if a class is implementing a interface it says to the outer world, that it provides specific behavior.
(A) What is difference between abstract classes and interfaces?
√ Abstract classes can have concrete methods while interfaces have no methods implemented.
√ Interfaces do not come in inheriting chain, while abstract classes come in inheritance.

**<u>Domain Driven Design:</u>** ==DDD is a design pattern whereby the structure and language of your code, including class names, methods, and variables, matches the business domain.== The pattern describes independent problem areas as bounded contexts, and emphasizes a common language to describe these problems. Determining where to draw the boundaries is an essential task when designing and defining a microservices-based solution. For each bounded context, you must identify and define the entities, value objects, and aggregates that model your domain.

**DDD Bounded Context:**: ==DDD says that your application should be broken up into separate parts (DDD terms: *bounded contexts* or *domain*) and these bounded contexts should be isolated from each other so that each bounded context can focus on its particular business group.==