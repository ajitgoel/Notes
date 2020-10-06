## Encapsulate and vary algorithm from the client that uses it(Strategy Pattern)

**Strategy pattern** is a software design pattern that enables an algorithm’s behavior to be selected at runtime. It
a. defines a family of algorithms,
b. encapsulates each algorithm, and
c. makes the algorithms interchangeable within that family.

**Example:**
![Strategy Design Pattern](http://ajitgoel.net/wp-content/uploads/2016/07/StrategyDesignPattern.jpg)

using System.Collections.Generic;

class StrategyDesignPatternClient
{
    static void Main()
    {
        var sortedList = new SortedList();
        sortedList.Add("name 1");
        sortedList.Add("name 2");
        sortedList.Add("name 3");
        ==//The client passes the "sort strategy" to the SortedList so the SortedList can use that passed strategy to sort the internal list
        sortedList.SetSortStrategy(new QuickSort());==
        sortedList.Sort();
    }
}
public class SortedList
{
    private List<string> list = new List<string>();
    private SortStrategy sortstrategy;
    public void SetSortStrategy(SortStrategy sortstrategy)
    {
        this.sortstrategy = sortstrategy;
    }
    ==public void Add(string name)
    {
        list.Add(name);
    }==
    public void Sort()
    {
        ==//Ask the "SortStrategy" class to sort the list. 
        sortstrategy.Sort(list);==
    }
}
public interface SortStrategy
{
    void Sort(List<string> list);
}
public class QuickSort : SortStrategy
{
    ==public void Sort(List<string> list)
    {
        // Default is Quicksort
        list.Sort(); 
    }==
}
public class ShellSort : SortStrategy
{
    public void Sort(List<string> list)
    {
        // ShellSort the "list" collection here. 
    }
}
public class MergeSort : SortStrategy
{
    public void Sort(List<string> list)
    {
        // MergeSort the "list" collection here. 
    }
}

------

## Adapter Pattern with a twist

One of my friends recently went to an interview to a very well known startup company. It is supposed to hire only the very best people in the industry.  One of the problem that he was asked to white board was:

You have a robot that can turn left and right. It can also move forward and backwards. You have a legacy robot that can only turn right and move forward. You want the legacy robot to turn left and to move backwards. Design a adapter class that would allow the legacy robot to turn right and to move backwards.

**Solution**

![](C:\Users\ajitg\AppData\Local\Microsoft\Windows\INetCache\IE\M06XL6SB\AdapterDesignPatternWithATwist[1].jpg)

using System;
using System.Collections.Generic;
using System.Linq;
public interface IRobot
{
    void GoFront(int noOfSteps);
    void GoBack(int noOfSteps);
    void TurnRight(int degrees);
    void TurnLeft(int degrees);
}
public class LegacyRobot
{
    public void GoFront(int noOfSteps)
    {
    }
    public void TurnRight(int degrees)
    {
    }
}
public class Robot : IRobot
{
    public void GoFront(int noOfSteps)
    {
    }
    public void GoBack(int noOfSteps)
    {
    }
    public void TurnRight(int degrees)
    {
    }
    public void TurnLeft(int degrees)
    {
    }
}
public class LegacyRobotAdapter : IRobot
{
    LegacyRobot legacyRobot;
    public LegacyRobotAdapter(LegacyRobot legacyRobot)
    {
        this.legacyRobot = legacyRobot;
    }
    public void GoFront(int noOfSteps)
    {
        this.legacyRobot.GoFront(noOfSteps);
    }
   ==//The legacy robot can go back by turning right by 180 degrees then going front by the number of steps requested by the client then turning right by 180 //degrees to be facing from where the robot started from.==
    public void GoBack(int noOfSteps)
    {
        ==this.legacyRobot.TurnRight(180);
        this.legacyRobot.GoFront(noOfSteps);
        this.legacyRobot.TurnRight(180);==
    }
    public void TurnRight(int degrees)
    {
        this.legacyRobot.TurnRight(degrees);
    }
	==//The legacy robot can turn left by turning right by 360 degrees minus the client requested degrees to turn==
    public void TurnLeft(int degrees)
    {
        ==this.legacyRobot.TurnRight(360 - degrees);==
    }
}

------

## Ensure a class has only one instance and provide a global point of access to it(Singleton Pattern

**Singleton Pattern: **Ensure a class has only one instance and provide a global point of access to it.

**Solution:**
The code below uses Double-checked locking. See [here](http://en.wikipedia.org/wiki/Double-checked_locking) for an explanation of double checked locking.
**Update(06/29/2016):**
Jon Skeet’s article [here](http://csharpindepth.com/Articles/General/Singleton.aspx), does not recommend implementing singleton pattern using Solution 1 below.
He instead recommend’s using .NET 4’s Lazy type, to implement a singleton pattern. The Lazy class internally uses double-checked locking by default to store either the exception that was thrown during construction, or the result of the function that was passed to Lazy.
I have implemented the same in Solution 2 below.

**Solution 1(Not recommended):**

![](C:\Users\ajitg\AppData\Local\Microsoft\Windows\INetCache\IE\M06XL6SB\SingletonDesignPattern-2[1].jpg)



using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.VisualStudio.TestTools.UnitTesting;
public class UnitTest1
{
        [TestMethod]
        public void SingletonTest()
        {
            var s1 = Singleton.Instance();
            var s2 = Singleton.Instance();
            if (s1 == s2)
           {
            Assert.IsTrue(true);
        }
        else
        {
            Assert.Fail();
        }
    }
}
public class Singleton
{
    private static Singleton singleton;
    ==private static object tempObjectForLocking = new object();
    private Singleton()==
    {
    }
     ==public static Singleton Instance()
     {
            if (singleton != null)//First check
            {
                return singleton;
            }
            lock (tempObjectForLocking)
            {
                //Multiple processes could access the code below at the same time, therefore a "null" check has been added so only one process can create a singleton //instance. 
                if (singleton == null)//Second(double) check
                {
                    singleton = new Singleton();
                }
            }
            return singleton;
     }==
}

**Solution 2(recommended):**

using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.VisualStudio.TestTools.UnitTesting;
public class UnitTest1
{
        [TestMethod]
        public void SingletonTest()
        {
            var s1 = Singleton.Instance();
            var s2 = Singleton.Instance();
            if (s1 == s2)
            {
                Assert.IsTrue(true);
            }
            else
            {
                Assert.Fail();
            }
        }
}
public sealed class Singleton
{
   ==//Using the .NET 4's Lazy<T>; type, to implement a singleton pattern. The Lazy<T>; class internally uses double-checked locking by default to  store either // the exception that was thrown during construction, or the result of the function that was passed to Lazy<T>.
	private static readonly Lazy<Singleton> lazy = new Lazy<Singleton>
	(
	  () => new Singleton()
	);    
	public static Singleton Instance 
	{ 
	  get
	  { 
    	return lazy.Value; 
	  } 
	}
	private Singleton()==
	{
	}
}

------

## Avoid accidentally throwing a NullReferenceException and null object checking code(Null Object Pattern)

**Null Object Pattern:**
Avoid accidentally throwing a NullReferenceException and null object checking code by using the **Null Object** design pattern.

using System;
using System.Linq;
    public static class StringExtensions 
    { 
        public static int GetSafeLength(this string valueOrNull) 
        { 
            return (valueOrNull ?? string.Empty).Length; 
        }
    }
    public static class Program 
    {
        static readonly string[] strings = new [] { "ajit", "goel", null, "kumar" };
        public static void Main(string[] args) 
        {
           ==//no need to do any checks here
            var query = from text in strings select text.GetSafeLength();== 
            Console.WriteLine(query.Sum());
        }
    }

------

## Convert the interface of a class into another interface that the clients expects(Adapter Pattern)

![](C:\Users\ajitg\AppData\Local\Microsoft\Windows\INetCache\IE\M06XL6SB\AdapterPattern[1].jpg)

**Adapter pattern:**

class Program
{
    static IExpectedInterface dependency = new Adapter(new TargetClass());
    static void Main(string[] args)
    {
        dependency.MethodA();
    }
}
public interface IExpectedInterface
{
    void MethodA();
}
public class Adapter : IExpectedInterface
{
    public Adapter(TargetClass target)
    {
        this.target = target;
    }
    public void MethodA()
    {
        target.MethodB();
    }
    private TargetClass target;
}
public class TargetClass
{
    public void MethodB()
    {
    }
}

*Advantages of using a Adaptor pattern:**

- Adapter pattern lets classes work together that couldn’t otherwise because of incompatible interfaces.
- The code is more maintainable.
- most of the applications using third party libraries use adapters as a middle layer between the application and the 3rd party library to decouple the application from the library. If another library has to be used only an adapter for the new library is required without having to change the application code.