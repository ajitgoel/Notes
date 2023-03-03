**SOLID** is a term describing a collection of design principles for good code.

**SOLID** means:

_a_. Single Responsibility Principle

b. Open/Closed Principle

c. Liskov Substitution Principle

d. Interface Segregation Principle

e. Dependency Inversion Principle

==a. **Single Responsibility Principle** states that every class should have a single responsibility. There should never be more than one reason for a class to change.==

```
//This class violates Single Responsibility Principle since this class is 
//doing two things. It is dealing with both opening \ closing connections 
//and with data communication
public interface IDatabase
{
    void Connect(string connectionString);
    void Close();
    object GetData();
    void SendData(object data);
}
```

**Refactored code to follow Single Responsibility Principle and Open\closed principle:**

```
//Database class has now been refactored into two classes
//The IDataManager class deals with data communication
//The IConnectionManager class deals with opening \ closing connections
//These classes now follow the Single Responsibility Principle
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
```

==b. **Open/Closed Principle** states that software entities should be open for extension, but closed for modification.== In the example above, refactoring `IDatabase`into `IConnectionManager`, `IDataManager`classes allows

a. if the client application likes to change the way it opens or closes connection, it can implement its own `IConnectionManager`and pass it to the `IDataManager`class i.e Without touching the original code, it is able to extend the functionality of the classes without actually breaking the already existing class.

b. if the client application likes to change the way its getting or sending data it can implement its own `IDataManager`and use it with the already existing implementation of `IConnectionManager`.

==**c. Liskov Substitution Principle** states that code should not know it is using base class or its subtypes.==

```
public class DatabaseRepository
{
  //This method violates Liskov Substitution Principle since it consumes an object 
  //of a base type but internally uses the base type's subclass. 
  //According to Liskov Substitution Principle, it should not know it is using 
  //base class or its subtypes. 
  public bool TestConnection(IConnectionManager connMngr)
  {
    if (connMngr is SqlServerConnectionManager)
    {
      // Do something...
    }
    else if (connMngr is OracleConnectionManager)
    {
      // Do something else...
    }
    else
    {
      // ...
    }
  }
}
```

**Refactored code to follow Liskov Substitution Principle:**

```
public interface IConnectionManager
{
    void Connect(string connectionString);
    void Close();
}
public class SqlServerConnectionManager: IConnectionManager
{
    public void Connect(string connectionString){}
    public void Close(){}
}
public class OracleConnectionManager : IConnectionManager
{
    public void Connect(string connectionString){}
    public void Close(){}
}
```

==**d. Interface Segregation Principle** states that clients should not be forced to implement interfaces they don’t use.==

**Existing Design** Let’s assume we have to implement a new Robot class in this design. **`Robots`** will need to implement the **`IWorker`** interface because robots works. On the other side, they don’t have to implement it because they don’t eat. If we keep the present design, the new `Robot`class is forced to implement the `eat` method.

```
public interface IWorker 
{
  public void Work();
  public void Eat();
}
public class Worker : IWorker
{
  public void Work() {}
  public void Eat() {}
}
public class Manager 
{
  IWorker worker;
  public void SetWorker(IWorker w) {worker=w;}
  public void Manage() 
  {
    worker.Work();
  }
}
```

**Refactored code to follow Interface Segregation Principle:** By splitting the `IWorker`interface in `IFeedable`, `IWorkable`interfaces the new `Robot`class is no longer forced to implement the `Eat` method.

```
public interface IWorker : IFeedable, IWorkable{}
public interface IWorkable 
{
  public void Work();
}
public interface IFeedable
{
  public void Eat();
}
public class Worker : IWorkable, IFeedable
{
  public void Work() {}
  public void Eat() {}
}
public class Robot : IWorkable
{
  public void Work() {}
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
```

==**e. Dependency Inversion Principle** states that==
==1.  High-level modules(`Manager`class) should not depend on low-level modules(`Worker`, `SuperWorker`classes). Both(`Manager, Worker, SuperWorker` classes) should depend on abstractions(`IWorker`).==
2.  Abstractions should not depend on details. Details should depend on abstractions.

**Existing Design** Let’s assume we have to implement a new `SuperWorker`class in this design. If we do that then we will have to change the `Manager.Manage()` method also which introduces risk.

```
public class Worker 
{
    public void Work() {}
}
public class SuperWorker: Worker 
{
    public void Work() {}
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

**Refactored code to follow Dependency Inversion Principle:** In this new design a new `IWorker`Interface has been added. Now the `Manager`class doesn’t require changes when `SuperWorkers`are added since the work has been delegated to the `SuperWorker`class. It also reduces risk since no other parts of the system need to be tested.

```
public interface IWorker 
{
    public void Work();
}
public class Worker : IWorker
{
    public void Work() {}
}
public class SuperWorker : IWorker
{
    public void Work() {}
}
public class Manager 
{
  IWorker worker;
  public void SetWorker(IWorker w)
  {
    worker = w;
  }
  public void Manage() 
  {
    worker.Work();
  }
}
```