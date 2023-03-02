## Ensure a class has only one instance and provide a global point of access to it(Singleton Pattern

Suppose you have an application that uses the Singleton Design pattern for one of it’s classes. But, the problem is that the singleton is expensive to create, because a resource intensive database access is necessary to create the singleton. What can you do to possibly add some efficiency to the process of creating a singleton? => ==create the singleton instance lazily.==

---------------------

**Singleton Pattern: **Ensure a class has only one instance and provide a global point of access to it.

**Solution:**
The code below uses Double-checked locking. See [here](http://en.wikipedia.org/wiki/Double-checked_locking) for an explanation of double checked locking.
**Update(06/29/2016):**
Jon Skeet’s article [here](http://csharpindepth.com/Articles/General/Singleton.aspx), does not recommend implementing singleton pattern using Solution 1 below.
He instead recommend’s using .NET 4’s Lazy type, to implement a singleton pattern. The Lazy class internally uses double-checked locking by default to store either the exception that was thrown during construction, or the result of the function that was passed to Lazy.
I have implemented the same in Solution 2 below.

**Solution 1(Not recommended):**

![[Pasted image 20230225154544.png]]

```
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
    private static object tempObjectForLocking = new object();
    private Singleton()
    {
    }
     public static Singleton Instance()
     {
            if (singleton != null)//First check
            {
                return singleton;
            }
            lock (tempObjectForLocking)
            {
/*Multiple processes could access the code below at the same time, therefore a "null" check has been added so only one process can create a singleton instance.*/*
                if (singleton == null)//Second(double) check
                {
                    singleton = new Singleton();
                }
            }
            return singleton;
     }
}
```

**Solution 2(recommended):**

```
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
   /*Using the .NET 4's Lazy<T>; type, to implement a singleton pattern. The Lazy<T>; class internally uses double-checked locking by default to  store either the exception that was thrown during construction, or the result of the function that was passed to Lazy<T>.*/
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
	private Singleton()
	{
	}
}
```
