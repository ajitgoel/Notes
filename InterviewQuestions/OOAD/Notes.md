**SOLID** is a term describing a collection of design principles for good code. It was invented by Robert C. Martin(Uncle Bob).

==**SOLID** means:
a. Single Responsibility Principle
b. Open/Closed Principle
c. Liskov Substitution Principle
d. Interface Segregation Principle
e. Dependency Inversion Principle==

**a. ==Single Responsibility Principle**==
==Single Responsibility Principle states that every class should have a single responsibility.== There should never be more than one reason for a class to change.

==This class violates Single Responsibility Principle since this class is doing two things. It is dealing with both opening \ closing connections and with data communication.==
public interface IDatabase
{
    void Connect(string connectionString);
    void Close();
    object GetData();
    void SendData(object data);
}

**Refactored code to follow Single Responsibility Principle and Open\closed principle:**
==Database class has now been refactored into two classes.==
==The IDataManager class deals with data communication.==
==The IConnectionManager class deals with opening \ closing connections. These classes now follow the Single Responsibility Principle.==
public interface IDataManager
{
    object GetData(IConnectionManager connManager);
    void SendData(IConnectionManager connManager, object data);
}
public interface IConnectionManager
{
    void Connect(string connectionString);
    void Close();
}

**b. ==Open/Closed Principle**==
==Open/Closed Principle states that software entities should be open for extension, but closed for modification.==

In the example above, refactoring IDatabase into IConnectionManager, IDataManager classes allows the client application to either
a. if the client application likes to change the way it opens or closes connection, it can implement its own IConnectionManager and pass it to the IDataManager class i.e Without touching the original code, it is able to extend the functionality of the classes without actually breaking the already existing class.
b. if the client application likes to change the way its getting or sending data it can implement its own IDataManager and use it with the already existing implementation of IConnectionManager.

==**c. Liskov Substitution Principle**==
==Liskov Substitution Principle states that code should not know it is using base class or its subtypes.==

public class DatabaseRepository
{
   ==This method violates Liskov Substitution Principle since it consumes an object of a base type but internally uses the base type's subclass. According to Liskov Substitution Principle, it should not know it is using base class or its subtypes. 
    public bool TestConnection(IConnectionManager connMngr)==
    {
        ==if (connMngr is SqlServerConnectionManager)==
        {
            // Do something...
        }
        ==else if (connMngr is OracleConnectionManager)==
        {
            // Do something else...
        }
        else
        {
            // ...
        }
    }
}
public interface IConnectionManager
{
    void Connect(string connectionString);
    void Close();
}
public class SqlServerConnectionManager: IConnectionManager
{
    public void Connect(string connectionString)
    {
    }
    public void Close()
    {
    }
}
public class OracleConnectionManager : IConnectionManager
{
    public void Connect(string connectionString)
    {
    }
    public void Close()
    {
    }
}

**d. Interface Segregation Principle**
==The Interface Segregation Principle states that clients should not be forced to implement interfaces they don’t use.==

**Existing Design**
Let’s assume we have to implement a new Robot class in this design. **Robots** will need to implement the **IWorker** interface because robots works. On the other side, they don’t have to implement it because they don’t eat. If we keep the present design, the new Robot class is forced to implement the “eat” method.

```
public interface IWorker 
{
    public void Work();
    public void Eat();
}
public class Worker : IWorker
{
    public void Work() 
        {
    }
    public void Eat() 
        {
    }
}
public class Manager 
{
    IWorker worker;
    public void SetWorker(IWorker w) 
        {
        worker=w;
    }
    public void Manage() 
        {
        worker.Work();
    }
}
```

**Interface Segregation Principle implemented in current design**

==Following code supports the Interface Segregation Principle. By splitting the IWorker interface in IFeedable, IWorkable interfaces the new Robot class is no longer forced to implement the "eat" method.
public interface IWorker : IFeedable, IWorkable== 
{
}
public interface IWorkable 
{
    public void Work();
}
public interface IFeedable
{
    public void Eat();
}
==public class Worker : IWorkable, IFeedable==
{
    public void Work() 
        {
    }
    public void Eat() 
        {
    }
}
==public class Robot : IWorkable==
{
    public void Work() 
        {
    }
}
public class Manager 
{
    IWorkable worker;
    public void SetWorker(IWorkable w) 
    {
        worker=w;
    }
    public void Manage() 
    {
        worker.Work();
    }
}

**e. Dependency Inversion Principle**
==Dependency Inversion Principle states that==

1. ==High-level modules(Manager class) should not depend on low-level modules(Worker, SuperWorker classes). Both(Manager, Worker, SuperWorker classes) should depend on abstractions(IWorker).==
2. Abstractions should not depend on details. Details should depend on abstractions.

**Existing Design**
Let’s assume we have to implement a new SuperWorker class in this design. If we do that then we will have to change the Manager.Manage() method also which introduces risk.

```
public class Worker 
{
    public void Work() 
    {
    }
}
public class SuperWorker: Worker 
{
    public void Work() 
    {
    }
}
public class Manager 
{
    Worker worker;
    public void SetWorker(Worker w) 
    {
        worker = w;
    }
    public void Manage() 
    {
        worker.Work();
    }
}
```

**Dependency Inversion Principle implemented in current design**

==Following code supports the Dependency Inversion Principle. In this new design a new IWorker Interface has been added. Now the Manager class doesn't require  changes when SuperWorkers are added since the work has been delegated to the  SuperWorker class.It also reduces risk since no other parts of the system need to be tested.
public interface IWorker 
{
    public void Work();
}
public class Worker : IWorker==
{
    public void Work() 
    {
    }
}
==public class SuperWorker : IWorker==
{
    public void Work() 
    {
    }
}
public class Manager 
{
    IWorker worker;
    ==public void SetWorker(IWorker w)==
    {
        worker = w;
    }
    public void Manage() 
    {
        worker.Work();
    }
}

**Dependency Injection** is about how one object acquires a dependency.
**Inversion of Control (IoC)** means that objects do not create other objects on which they rely to do their work. Instead, they get the objects that they need from an outside source (for example, an xml configuration file).
**Dependency Injection (DI)** means that this is done without the object intervention, usually by a framework component that passes constructor parameters and set properties.

**Dependency Injection Container** is a way to auto-wire classes

==**Abstraction**: It allows complex real world to be represented in simplified manner.==
==**Encapsulation**: It is a process of hiding all the internal details of an object from the outside world.==
==**Association**: This is the simplest relationship between objects.== Example every customer has sales. So Customer object and sales object have an association relation between them.
==**Aggregation(Composition)**: This is also called as composition model. Example in order to make a “Accounts” class it has use other objects example “Voucher”, “Journal” and “Cash” objects. So accounts class is aggregation of these three objects.==
**Inheritance**: Hierarchy is used to define more specialized classes based on a preexisting generalized class.
**<u>Polymorphism:</u>** ==When inheritance is used to extend a generalized class to a more specialized class, it includes behavior of the top class(Generalized class). The inheriting class often implement a behavior that can be somewhat different than the generalized class, but the name of the behavior can be same. It is important that a given instance of an object use the correct behavior, and the property of polymorphism allows this to happen automatically.==

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