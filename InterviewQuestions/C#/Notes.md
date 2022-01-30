

## ==C# Func and Action types==

==The **Func type** provides a way to store anonymous methods. For the Func type, the first type parameters are the arguments to the methods, and the final type parameter is the return value.==

**Example.**

using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml.Serialization;
using Microsoft.VisualStudio.TestTools.UnitTesting;
[TestClass]
public class UnitTest1
{
    [TestMethod]
    public void FuncTypeTest()
    {
		==Func<string, bool> validator =word =>
        {
            var count = word.Length;
            return count > 4;
        };==
        var isValid = ==validator("AjitGoel");==
        Assert.IsTrue(isValid);
    }
}

==**Action type** objects do not return a value. They are similar to a void method. A Func type on the other hand returns a result.==

==Action<int> action1 = (int counter) => Console.WriteLine("Write {0}", counter);==

**Yield keyword:**

==The use of the yield keyword controls the iterator’s behavior. If the consumer requests an iterator to produce a value, it runs until a yield statement is encountered. At that point, the iterator is ssuspended until the consumer asks for the next value.==

[TestClass]
public class FizzBuzzTest
{
    [TestMethod]
    public void Test1()
    {
        var iEnumerableString = new FizzBuzz().GenerateFizzBuzzUpto(100);
        var list = iEnumerableString.ToList();
        Assert.IsTrue(list[0] == "Fizz:3");
        Assert.IsTrue(list[1] == "Buzz:5");
        Assert.IsTrue(list[6] == "FizzBuzz:15");
    }
}
public class FizzBuzz
{
    public IEnumerable<string> GenerateFizzBuzzUpto(int numberUpto)
    {
        for (var counter = 1; counter < numberUpto; counter++)
        {
            if (counter%3 == 0 && counter%5 == 0)
            {

                yield return $"FizzBuzz:{counter}";
            }
            if (counter % 3 == 0)
            {
                yield return $"Fizz:{counter}";
            }
            if (counter % 5 == 0)
            {
                yield return $"Buzz:{counter}";
            }
        }
    }
}

------

**==When to Use Parallel Framework(PFX)==:** The primary use case for PFX is parallel programming: ==leveraging multicore processors to speed up computationally intensive code.==  

**Example: Parallel Spellchecker**
Suppose that we want to write a spellchecker that runs quickly with very large documents by utilizing all available cores. By formulating our algorithm into a LINQ query, we can very easily parallelize it.
The first step is to download a dictionary of English words into a HashSet for efficient lookup:
if (!File.Exists ("WordLookup.txt")) // Contains about 150,000 words
	new WebClient().DownloadFile ("http://www.albahari.com/ispell/allwords.txt", "WordLookup.txt");
var wordLookup = new HashSet<string> (File.ReadAllLines ("WordLookup.txt"),StringComparer.InvariantCultureIgnoreCase);
We then use our word lookup to create a test “document” comprising an array of a million random words. After we build the array, let’s introduce a couple of spelling mistakes:
var random = new Random();
string[] wordList = wordLookup.ToArray();
string[] wordsToTest = Enumerable.Range (0, 1000000).Select (i => wordList [random.Next (0, wordList.Length)]).ToArray();
wordsToTest [12345] = "woozsh"; // Introduce a couple
wordsToTest [23456] = "wubsie"; // of spelling mistakes.
Now we can perform our parallel spellcheck by testing wordsToTest against wordLookup. PLINQ makes this very easy:
var query = wordsToTest==.AsParallel()==.Select ((word, index) => new IndexedWord { Word=word, Index=index }).Where (iword => !wordLookup.Contains (iword.Word)).OrderBy (iword => iword.Index);
foreach (var mistake in query)
Console.WriteLine (mistake.Word + " - index = " + mistake.Index);
// OUTPUT:
// woozsh - index = 12345
// wubsie - index = 23456
IndexedWord is a custom struct that we define as follows: struct IndexedWord { public string Word; public int Index; }

**Working with AggregateException :**
==Because these libraries utilize many threads, it’s actually possible for two or more exceptions to be thrown simultaneously. To ensure that all exceptions are reported, exceptions are therefore wrapped in an AggregateException container, which exposes an InnerExceptions property containing each of the caught exception(s):==
try
{
}
====catch (AggregateException aex)==
=={==
	==foreach (Exception ex in aex.InnerExceptions)==
		==Console.WriteLine (ex.Message);==
}

**Concurrent Collections**
.NET offers thread-safe collections in the System.Collections.Concurrent namespace:
**Concurrent collection**  ConcurrentStack<T>  ConcurrentQueue<T>  ConcurrentBag<T> 
==The ConcurrentBag allows us to store objects in an unordered manner and allows for duplicates.== It is useful in a scenario where we do not need to worry about the order in which we would retrieve the objects from the collection.

**Nonconcurrent equivalent** Stack<T> Queue<T> (none)

• The conventional collections outperform the concurrent collections in all but highly concurrent scenarios.
• A thread-safe collection doesn’t guarantee that the code using it will be threadsafe
• If you enumerate over a concurrent collection while another thread is modifying it, no exception is thrown—instead, you get a mixture of old and new content.
these collections are not merely shortcuts for using an ordinary collection with a lock. 

# Map and Reduce in .NET

Linq equivalents of Map and Reduce: If you’re lucky enough to have linq then you don’t need to write your own map and reduce functions. C# 3.5 and Linq already has it albeit under different names.

Map is `Select`:

```cs
Enumerable.Range(1, 10).Select(x => x + 2);
```

Reduce is `Aggregate`:

```cs
Enumerable.Range(1, 10).Aggregate(0, (acc, x) => acc + x);
```

Filter is `Where`:

```cs
Enumerable.Range(1, 10).Where(x => x % 2 == 0);
```

------

**(B)What is garbage collection?**
Garbage collection is a CLR feature which automatically manages memory. CLR automatically releases objects when they are no longer in use and referenced. One side effect of this non-deterministic feature is that we cannot assume an object is destroyed when it goes out of the scope of a function. We should avoid using destructors because before GC destroys the object it first executes destructor in that case it will have to wait for code to release the umanaged resource.
resultin in additional delays in GC. So its recommended to implement IDisposable interface and write cleaup code in Dispose method and call GC.SuppressFinalize method so instructing GC not to call your constructor.

**(B) What are Value types and Reference types ?**

==Value types directly contain their data which are either allocated on the stack or allocated in-line in a structure. Reference types store a reference to the value's memory address==, and are allocated on the ==heap==. Variables that are value types each have their own copy of the data, and therefore operations on one variable do not affect other variables. Variables that are reference types can refer to the same object; therefore, operations on one variable can affect the same object referred to by another variable.

**(B) What is concept of Boxing and Unboxing ?**

Boxing permits any value type to be implicitly converted to type object or to any interface type implemented by value type.
Unboxing is vice versa of boxing operation where the value is copied from the instance in to appropriate storage location.
==boxing process: value Type=> Object Type
Unboxing process: Object Type=> Value Type==
**(I) What is the difference between Convert.toString and .toString() method ?**
The basic difference between them is “Convert” function handles NULLS while “i.ToString()” does not it will throw a NULL reference exception error. So as good coding practice using “convert” is always safe.
**(B)What is an application domain?**
Previously “PROCESS” where used as security boundaries. One process has its own virtual memory and does not overlap the other process virtual memory; due to this one process can not crash the other process. In .NET they went one step ahead introducing application domains. In application domains multiple applications can run in same process with out influencing each other. If one of the application domains throws error it does not affect the other application domains.
**(B) What is UDDI ?**
UDDI is Universal Description, Discovery and Integration. It is a directory that can be used to publish and discover public Web Services.
**(B) What is DISCO ?**
DISCO is the abbreviated form of Discovery. It is basically used to club or group common services together on a server and provides links to the schema documents of the services it describes may require.
**(B) What is WSDL?**
Web Service Description Language (WSDL)is a W3C specification which defines XML grammar for describing Web Services. 

**(B) What is a delegate ?** Delegate is a class that can hold a reference to a method or a function. Delegate class has a signature and it can only reference those methods whose signature is compliant with the class.

using System;
class Program
{
	==delegate string UppercaseDelegate(string input);==
	static string ==UppercaseAll(string input)==
	{
		return input.ToUpper();
	}
	static void WriteOutput(string input, UppercaseDelegate del)
	{
		Console.WriteLine("Your string before: {0}", input);
		Console.WriteLine("Your string after: {0}", ==del(input)==);
	}
static void Main()
{
	WriteOutput("perls", ==new UppercaseDelegate(UppercaseAll)==);
}
}

Structure are value types and classes are reference types. So ==structures use stack and classes use heap.==

**(B) What does virtual keyword mean ?**
They signify that method and property can be overridden.

**(B) What does virtual keyword mean ?**
They signify that method and property can be overridden.
==An abstract function cannot have functionality. You're basically saying, any child class MUST give their own version of this method, however it's too general to even try to implement in the parent class.
A virtual function, is basically saying look, here's the functionality that may or may not be good enough for the child class. So if it is good enough, use this method, if not, then override me, and provide your own functionality.==

**(B) What is Dispose method in .NET ?**
.NET provides “Finalize” method in which we can clean up our resources.
Array list can hold item of different types. As Array list can increase and decrease size dynamically
Hashtable provides way of accessing the index using a user identified KEY value,
Queue is for first-in, first-out (FIFO) structures. Stack is for last-in, first-out (LIFO) structures.
**Why is Dictionary preferred over hashtable?** 
==Dictionary is a generic type, Hashtable is not. That means you get type safety with Dictionary, because you can't insert any random object into it, and you don't have to cast the values you take out.
And also generic collections are a lot faster as there's no boxing/unboxing==
using System;
using System.Collections.Generic;
class Program
{
static void Main()
{
Dictionary<string, int> dictionary =new Dictionary<string, int>();
dictionary.Add("cat", 2);
dictionary.Add("dog", 1);
dictionary.Add("llama", 0);
dictionary.Add("iguana", -1);
}
}

**Order of Constructor and Destructor:**
The constructor of the derived class gets called after the constructor of the base class. The destructors get called in reversed order.

**(B)What is the significance of Finalize method in .NET?**
.NET Garbage collector does almost all clean up activity for your objects. But unmanaged resources (ex: - Windows API created objects, File, Database connection objects, COM objects etc) is outside the scope of .NET framework we have to explicitly clean our resources. which can be overridden and clean up code for unmanaged resources can be put in this section.

**(A)Why is it preferred to not use finalize for clean up?**
Problem with finalize is that garbage collection has to make two rounds in order to remove objects which have finalize methods.

**(I)How can we suppress a finalize method?**
GC.SuppressFinalize ()

**(B)What is the use of DISPOSE method?**
Dispose method belongs to IDisposable interface. We had seen in the previous section how bad it can be to override the finalize method for writing the cleaning of unmanaged resources. So if any object wants to release its unmanaged code best is to implement IDisposable and override the Dispose method of IDisposable interface. Now once your class has exposed the Dispose method it’s the responsibility of the client to call the Dispose method to do the cleanup.

**(A) What is the difference between System.String and System.StringBuilder classes?**
System.String is immutable; System.StringBuilder can have mutable string where a variety of operations can be performed. Response.Redirect sends message to the browser saying it to move to some different page, while server.transfer does not send any message to the browser but rather redirects the user directly from the server itself. So in server.transfer there is no round trip while response.redirect has a round trip Authentication is verifying the identity of a user and authorization is process where we check does this identity have access rights to the system.

**(I) What is impersonation in ASP.NET ?**
By default, ASP.NET executes in the security context of a restricted user account on the local machine. Sometimes you need to access network resources such as a file on a shared drive, which requires additional permissions. One way to overcome this restriction is to use impersonation. With impersonation, ASP.NET can execute the request using the identity of the client who is making the request, or ASP.NET can impersonate a specific account you specify in web.config

**(B)What is a candidate key ?**
A table may have more than one combination of columns that could uniquely identify the rows in a table; each
combination is a candidate key.
A clustered index is a special type of index that reorders the way in which records in the table are physically stored.
Therefore table can have only one clustered index.
A nonclustered index is a special type of index in which the logical order of the index does not match the physical stored
order of the rows on disk.
The 'fill factor' option specifies how full SQL Server will make each index page. When there is no free space to insert new
row on the index page, SQL Server will create new index page and transfer some rows from the previous page to the new
one. This operation is called page splits.
DELETE TABLE syntax logs the deletes thus make the delete operation slow. TRUNCATE table does not log any information
but it logs information about deallocation of data page of the table so TRUNCATE table is faster as
compared to delete table.
√ DELETE table can have criteria while TRUNCATE can not.
√ TRUNCATE table can not trigger.
(I)What are the different types of triggers in Sql SERVER 2000 ?
There are two types of triggers :-
√ INSTEAD OF triggers
INSTEAD OF triggers fire in place of the triggering action. For example, if an INSTEAD OF UPDATE trigger exists on the
Sales table and an UPDATE statement is executed against the Sales table, the UPDATE statement will not change a row in
the sales table. Instead, the UPDATE statement causes the INSTEAD OF UPDATE trigger to be executed, which may or may
not modify data in the Sales table.
√ AFTER triggers
AFTER triggers execute following the SQL action, such as an insert, update, or delete. This is the traditional trigger which
existed in SQL SERVER. INSTEAD OF triggers gets executed automatically before the Primary Key and the Foreign Key
constraints are checked, whereas the traditional AFTER triggers gets executed after these constraints are checked. Unlike
AFTER triggers, INSTEAD OF triggers can be created on views.
(A)In What scenarios will you use a DOM parser and SAX parser?
√ If you do not need all the data from the XML file then SAX approach is much preferred than DOM as DOM can quiet
memory intensive. In short if you need large portion of the XML document its better to have DOM.
what are end points, contract, address and bindings?
Contract (What) Contract is an agreement between two or more parties. Technically it describes parameters and return
values for a method.
√ Address ( Where) An Address indicates where we can find this service. Address is a URL which points to the location of
the service.
√ Binding (How) It determines how communications is done.
(A) Which specifications does WCF follow?
WCF supports specifications defined by WS-* specifications.
Messaging (WS-Addressing):- WSAddressing defines some extra additions to SOAP headers which makes SOAP free from
underlying transport protocol.
Security (WS-Security, WS-Trust and WS-SecureConversation):-
Reliability (WS-ReliableMessaging):-
Transactions (WS-Coordination and WS-AtomicTransaction):-
(A) What are the main components of WCF?
We need to define three main components in WCF:-
√ Service class.
√ Hosting environment
√ End point
Service Contract attribute define saying which application interface will be exposed as a service.
OperationContract dictates which methods should be exposed to the external client using this service.
Data Contract attributes defines which type of complex data will be exchanged between the client and the service. They
determine which parameters to be serialized.
(I) what are the advantages of hosting WCF Services in IIS as compared to self hosting?
Automatic activation IIS provides automatic activation that means the service is not necessary to be running in advance.
Process recycling If IIS finds that a service is not healthy that means if it has memory leaks etc, IIS recycles the process.
Prevent deadlocks in database
Although deadlocks cannot be completely avoided, following certain coding conventions can minimize the chance of
generating a deadlock. Minimizing deadlocks can increase transaction throughput and reduce system overhead because
fewer transactions are:
Rolled back, undoing all the work performed by the transaction.
Resubmitted by applications because they were rolled back when deadlocked.
To help minimize deadlocks:
• Access objects in the same order.
• Avoid user interaction in transactions.
• Keep transactions short and in one batch.
• Use a lower isolation level.
• Use a row versioning-based isolation level.
• Set READ_COMMITTED_SNAPSHOT database option ON to enable read-committed transactions to use row
versioning.
• Use snapshot isolation.
• Use bound connections.
Access Objects in the Same Order
If all concurrent transactions access objects in the same order, deadlocks are less likely to occur. For example, if two
concurrent transactions obtain a lock on the Supplier table and then on the Part table, one transaction is blocked on
the Supplier table until the other transaction is completed. After the first transaction commits or rolls back, the second
continues, and a deadlock does not occur. Using stored procedures for all data modifications can standardize the order of
accessing objects.
Avoid User Interaction in Transactions
Avoid writing transactions that include user interaction, because the speed of batches running without user intervention is
much faster than the speed at which a user must manually respond to queries, such as replying to a prompt for a
parameter requested by an application. For example, if a transaction is waiting for user input and the user goes to lunch
or even home for the weekend, the user delays the transaction from completing. This degrades system throughput
because any locks held by the transaction are released only when the transaction is committed or rolled back. Even if a
deadlock situation does not arise, other transactions accessing the same resources are blocked while waiting for the
transaction to complete.
Keep Transactions Short and in One Batch
A deadlock typically occurs when several long-running transactions execute concurrently in the same database. The longer
the transaction, the longer the exclusive or update locks are held, blocking other activity and leading to possible deadlock
situations.
Keeping transactions in one batch minimizes network roundtrips during a transaction, reducing possible delays in
completing the transaction and releasing locks.
Use a Lower Isolation Level
Determine whether a transaction can run at a lower isolation level. Implementing read committed allows a transaction to
read data previously read (not modified) by another transaction without waiting for the first transaction to complete.
Using a lower isolation level, such as read committed, holds shared locks for a shorter duration than a higher isolation
level, such as serializable. This reduces locking contention
Use a Row Versioning-based Isolation Level
When the READ_COMMITTED_SNAPSHOT database option is set ON, a transaction running under read committed isolation
level uses row versioning rather than shared locks during read operations.
Note
Some applications rely upon locking and blocking behavior of read committed isolation. For these applications, some
change is required before this option can be enabled.
Snapshot isolation also uses row versioning, which does not use shared locks during read operations. Before a transaction
can run under snapshot isolation, the ALLOW_SNAPSHOT_ISOLATION database option must be set ON.
Implement these isolation levels to minimize deadlocks that can occur between read and write operations.
Use Bound Connections
Using bound connections, two or more connections opened by the same application can cooperate with each other. Any
locks acquired by the secondary connections are held as if they were acquired by the primary connection, and vice versa.
Therefore they do not block each other.
Difference between overloading and overridding?
Operator Overloading It provides a way to define and use operators such as +, -, and / for user-defined classes or structs.
Overloading Overloading is when you have multiple methods in the same scope, with the same name but different
signatures.
//Overloading
public class test
{
public void getStuff(int id)
{}
public void getStuff(string name)
{}
}
Overriding Overriding is a principle that allows you to change the functionality of a method in a child class.
//Overriding
public class test
{
public virtual void getStuff(int id)
{
//Get stuff default location
}
}
public class test2 : test
{
public override void getStuff(int id)
{
//base.getStuff(id);
//or - Get stuff new location
}
}
Difference between windows.onload and document.ready?
Access identifier:
Private Access: All members regardless of access level are accessible in the class in which they are declared, the
enclosing class. This is the only place where a private member can be accessed.
A protected member can also be accessed from within a derived class, but it is inaccessible from other classes.
An internal access member can be accessed anywhere within the local assembly, but not from another assembly. In .NET,
an assembly is either a program (.exe) or a library (.dll).
Protected internal access means either protected or internal. A protected internal member can therefore be accessed
anywhere within the current assembly, or in classes outside the assembly that are derived from the enclosing class.
Public access gives unrestricted access from anywhere that the member can be referenced.

What is the difference between MVVM and MVC design patterns?
What is the difference between “null” and “undefined”?
Which situations will you use a sql based database versus a no-sql database?
Difference between Document-based and Key/Value-based databases?
I know there are three different, popular types of non-sql databases.
Key/Value: Redis, Tokyo Cabinet, Memcached
ColumnFamily: Cassandra, Hbase
Document: MongoDB, CouchDB
I have read long blogs about it without understanding so much.
I know relational databases and get the hang around document-based databases like MongoDB/CouchDB.
Could someone tell me what the major differences are between these and the 2 former on the list?
there are five:
(1)Key-Value Stores: Oracle Coherence, Redis, Kyoto Cabinet
(2)BigTable-style Databases: Apache HBase, Apache Cassandra
(3)Document Databases: MongoDB, CouchDB
(4)Full Text Search Engines: Apache Lucene, Apache Solr
(5)Graph Databases: neo4j, FlockDB
The main differences are the data model and the querying capabilities.
Key-value stores: The first type is very simple and probably doesn't need any further explanation.
Data model: more than key-value stores
Although there is some debate on the correct name for databases such as Cassandra, I'd like to call them column-family
stores. Although key-value pairs are an essential part of Cassandra, it's not limited to just that. It allows you to nest keyvalue pairs, so a key could refer to multiple sub-key-value pairs.
You cannot nest key-value pairs indefinitely though. Your limited to three levels (column families) or four levels of nesting
(super-column families). In case the term column family doesn't ring a bell, see the WTF is a SuperColumn article, it's a
good explanation of Cassandra's data model.
Document databases, such as CouchDB and MongoDB store entire documents in the form of JSON objects. You can think of
these objects as nested key-value pairs. Unlike Cassandra, you can nest key-value pairs as much as you want. JSON also
supports arrays and understands different data types, such as strings, numbers and boolean values.
Querying
I believe column-family stores can only be queried by key, or by writing map-reduce functions. You cannot query the
values like you would in an SQL database. If your application needs more complex queries, your application will have to
create and maintain indexes in order to access the desired data.
Document databases support queries by key and map-reduce functions as well, but also allow you to do basic queries by
value, such as "Give me all users with more than 10 posts". Document databases are more flexible in this way.
Proper use of the IDisposable interface
The point of Dispose is to free unmanaged resources. It needs to be done at some point, otherwise they will never be
cleaned up. The garbage collector doesn't know how to call DeleteHandle() on a variable of type IntPtr, it doesn't
know whether or not it needs to call DeleteHandle().
Note: What is an unmanaged resource? If you found it in the Microsoft .NET Framework: it's managed. If you went
poking around MSDN yourself, it's unmanaged. Anything you've used P/Invoke calls to get outside of the nice comfy
world of everything available to you in the .NET Framwork is unmanaged – and you're now responsible for cleaning
it up.
The object that you've created needs to expose some method, that the outside world can call, in order to clean up
unmanaged resources. The method can be named whatever you like:
public void Cleanup()
public void Shutdown()
But instead there is a standardized name for this method:
public void Dispose()
There was even an interface created, IDisposable, that has just that one method:
public interface IDisposable
{
void Dispose()
}
So you make your object expose the IDisposable interface, and that way you promise that you've written that single
method to clean up your unmanaged resources:
public void Dispose()
{
Win32.DestroyHandle(this.CursorFileBitmapIconServiceHandle);
}
And you're done. Except you can do better.
What if your object has allocated a 250MB System.Drawing.Bitmap (i.e. the .NET managed Bitmap class) as some sort of
frame buffer? Sure, this is a managed .NET object, and the garbage collector will free it. But do you really want to leave
250MB of memory just sitting there – waiting for the garbage collector to eventually come along and free it? What if
there's an open database connection? Surely we don't want that connection sitting open, waiting for the GC to finalize the
object.
If the user has called Dispose() (meaning they no longer plan to use the object) why not get rid of those wasteful bitmaps
and database connections?
So now we will:
•get rid of unmanaged resources (because we have to), and
•get rid of managed resources (because we want to be helpful)
So let's update our Dispose() method to get rid of those managed objects:
public void Dispose()
{
//Free unmanaged resources
Win32.DestroyHandle(this.CursorFileBitmapIconServiceHandle);
//Free managed resources too
if (this.databaseConnection != null)
{
this.databaseConnection.Dispose();
this.databaseConnection = null;
}
if (this.frameBufferImage != null)
{
this.frameBufferImage.Dispose();
this.frameBufferImage = null;
}
}
And all is good, except you can do better!
What if the person forgot to call Dispose() on your object? Then they would leak some unmanagedresources!
Note: They won't leak managed resources, because eventually the garbage collector is going to run, on a
background thread, and free the memory associated with any unused objects. This will include your object,
and any managed objects you use (e.g. the Bitmap and the DbConnection).
If the person forgot to call Dispose(), we can still save their bacon! We still have a way to call it forthem: when the
garbage collector finally gets around to freeing (i.e. finalizing) our object.
Note: The garbage collector will eventually free all managed objects. When it does, it calls
the Finalize method on the object. The GC doesn't know, or care, about your Dispose method. That was just
a name we chose for a method we call when we want to get rid of unmanaged stuff.
The destruction of our object by the Garbage collector is the perfect time to free those pesky unmanaged resources. We
do this by overriding the Finalize() method.
Note: In C#, you don't explicitly override the Finalize() method. You write a method that looks like a C++
destructor, and the compiler takes that to be your implementation of the Finalize()method:
~MyObject()
{
//we're being finalized (i.e. destroyed), call Dispose in case the user forgot to
Dispose(); //<--Warning: subtle bug! Keep reading!
}
But there's a bug in that code. You see, the garbage collector runs on a background thread; you don't know the order in
which two objects are destroyed. It is entirely possible that in your Dispose()code, the managed object you're trying to
get rid of (because you wanted to be helpful) is no longer there:
public void Dispose()
{
//Free unmanaged resources
Win32.DestroyHandle(this.gdiCursorBitmapStreamFileHandle);
//Free managed resources too
if (this.databaseConnection != null)
{
this.databaseConnection.Dispose(); //<-- crash, GC already destroyed it
this.databaseConnection = null;
}
if (this.frameBufferImage != null)
{
this.frameBufferImage.Dispose(); //<-- crash, GC already destroyed it
this.frameBufferImage = null;
}
}
So what you need is a way for Finalize() to tell Dispose() that it should not touch any managedresources (because
they might not be there anymore), while still freeing unmanaged resources.
The standard pattern to do this is to have Finalize() and Dispose() both call a third(!) method; where you pass a Boolean
saying if you're calling it from Dispose() (as opposed to Finalize()), meaning it's safe to free managed resources.
This internal method could be given some arbitrary name like "CoreDispose", or "MyInternalDispose", but is tradition to call
it Dispose(Boolean):
protected void Dispose(Boolean disposing)
But a more helpful parameter name might be:
protected void Dispose(Boolean itIsSafeToAlsoFreeManagedObjects)
{
//Free unmanaged resources
Win32.DestroyHandle(this.CursorFileBitmapIconServiceHandle);
//Free managed resources too, but only if I'm being called from Dispose
//(If I'm being called from Finalize then the objects might not exist
//anymore
if (itIsSafeToAlsoFreeManagedObjects)
{
if (this.databaseConnection != null)
{
this.databaseConnection.Dispose();
this.databaseConnection = null;
}
if (this.frameBufferImage != null)
{
this.frameBufferImage.Dispose();
this.frameBufferImage = null;
}
}
}
And you change your implementation of the IDisposable.Dispose() method to:
public void Dispose()
{
Dispose(true); //I am calling you from Dispose, it's safe
}
and your finalizer to:
~MyObject()
{
Dispose(false); //I am *not* calling you from Dispose, it's *not* safe
}
Note: If your object descends from an object that implements Dispose, then don't forget to call
their base Dispose method when you override Dispose:
public Dispose()
{
try
{
Dispose(true); //true: safe to free managed resources
}
finally
{
base.Dispose();
}
}
And all is good, except you can do better!
If the user calls Dispose() on your object, then everything has been cleaned up. Later on, when the garbage collector
comes along and calls Finalize, it will then call Dispose again.
Not only is this wasteful, but if your object has junk references to objects you already disposed of from the last call
to Dispose(), you'll try to dispose them again!
You'll notice in my code I was careful to remove references to objects that I've disposed, so I don't try to call Dispose on a
junk object reference. But that didn't stop a subtle bug from creeping in.
When the user calls Dispose(): the handle CursorFileBitmapIconServiceHandle is destroyed. Later when the garbage
collector runs, it will try to destroy the same handle again.
protected void Dispose(Boolean iAmBeingCalledFromDisposeAndNotFinalize)
{
//Free unmanaged resources
Win32.DestroyHandle(this.CursorFileBitmapIconServiceHandle); //<--double destroy
...
}
The way you fix this is tell the garbage collector that it doesn't need to bother finalizing the object – its resources have
already been cleaned up, and no more work is needed. You do this by calling GC.SuppressFinalize() in
the Dispose() method:
public void Dispose()
{
Dispose(true); //I am calling you from Dispose, it's safe
GC.SuppressFinalize(this); //Hey, GC: don't bother calling finalize later
}
Now that the user has called Dispose(), we have:
•freed unmanaged resources
•freed managed resources
There's no point in the GC running the finalizer – everything's taken care of.
Couldn't I use Finalize to cleanup unmanaged resources?
The documentation for Object.Finalize says:
The Finalize method is used to perform cleanup operations on unmanaged resources held by the current
object before the object is destroyed.
But the MSDN documentation also says, for IDisposable.Dispose:
Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
So which is it? Which one is the place for me to cleanup unmanaged resources? The answer is:
It's your choice! But choose Dispose.
You certainly could place your unmanaged cleanup in the finalizer:
~MyObject()
{
//Free unmanaged resources
Win32.DestroyHandle(this.CursorFileBitmapIconServiceHandle);
//A C# destructor automatically calls the destructor of its base class.
}
The problem with that is you have no idea when the garbage collector will get around to finalizing your object. Your unmanaged, un-needed, un-used native resources will stick around until the garbage collector eventually runs. Then it will
call your finalizer method; cleaning up unmanaged resources. The documentation of Object.Finalize points this out:
The exact time when the finalizer executes is undefined. To ensure deterministic release of resources for
instances of your class, implement a Close method or provide a IDisposable.Dispose implementation.
This is the virtue of using Dispose to cleanup unmanaged resources; you get to know, and control, when unmanaged
resource are cleaned up. Their destruction is "deterministic".
To answer your original question: Why not release memory now, rather than for when the GC decides to do it? I have a
facial recognition software that needs to get rid of 530 MB of internal images now, since they're no longer needed. When
we don't: the machine grinds to a swapping halt.
Bonus Reading
For anyone who likes the style of this answer (explaining the why, so the how becomes obvious), I suggest you read
Chapter One of Don Box's Essential COM:
•Direct link: Chapter 1 sample by Pearson Publishing
•magnet: 84bf0b960936d677190a2be355858e80ef7542c0
In 35 pages he explains the problems of using binary objects, and invents COM before your eyes. Once you realize
the why of COM, the remaining 300 pages are obvious, and just detail Microsoft's implementation.
I think every programmer who has ever dealt with objects or COM should, at the very least, read the first chapter. It is the
best explanation of anything ever.
Difference between Microservices Architecture and SOA
I guess you could think of the Microservices Architectural Style as a specialization of SOA. Don't forget that the generally
accepted view is that all SOA really is, is four sentences:
•Boundaries are explicit
•Services are autonomous
•Services share schema and contract, not class
•Service compatibility is based on policy
These tenets of SOA were given to us by Don Box of Microsoft - MS then went on to release WCF and then told us to Go
Forth and Service Orientate. Look where that got us (through no fault of their own - see footnote).
Then we have this, from Lewis/Fowler:
In short, the microservice architectural style is an approach to developing a single application as a suite of
small services, each running in its own process and communicating with lightweight mechanisms, often an
HTTP resource API. These services are built around business capabilities and independently deployable by
fully automated deployment machinery. There is a bare mininum of centralized management of these
services, which may be written in different programming languages and use different data storage
technologies.
From this definition it's clear that microservices fulfill at least the first two tenets (with real emphasis on the second), but
it's questionable whether they fulfill the third (I don't really understand tenet 4 so I won't comment).
The reason the third tenet may not hold for microservices is that one of the characteristics of microservices is that they
are generally exposed over a RESTful API, which, one could argue, does not expose contract and schema at all (over and
above the regular http verbage), as we see from Fowler:
a suite of small services, each... communicating with lightweight mechanisms, often an HTTP resource API
Another way in which a microservices style deviates from SOA is with this prescription:
These services are... independently deployable by fully automated deployment machinery
Following the original tenets of SOA does not prevent me from manually copying my service binaries into my production
environment, but with the microservices approach, the service deployment and management should be fully automated.
footnote: In WCF, MS created a services framework which is ridiculously easy to abuse. Juvel Lowy, one of the original
designers of WCF, offers guidance to how to do SOA properly with WCF with hisServiceModelEx framework.

**What is REST?**
Ans. REST stands for Representational State Transfer. REST is an architectural style which treat each service as a
resource and access data by HTTP protocol methods like GET, POST, PUT, and DELETE.
==**What is difference between REST and SOAP?**==
Ans. The difference between REST and SOAP is given below:
Performance
specifications for State, security
Message Format-xml\json, how information is passed
how are services\resources exposed. 

==Performance is slow as compared to REST. REST is fast as compared to SOAP.
a. SOAP has specifications for both stateless and stateful implementation whereas REST is completely stateless.
c. SOAP has a defined standard specification. For example, WS-Security is the specification for implementing security. Rest has no defined standard specifications.
b. SOAP enforces message format as XML whereas REST does not enforces message format as XML or JSON.
d. The SOAP message consists of an envelope which includes SOAP headers and body to store the actual information you want to send. REST uses the HTTP build-in headers (with a variety of media-types) to carry meta information and use the GET, POST, PUT and DELETE verbs to perform CRUD operations.
e. SOAP uses interfaces and named operations to expose your service. REST uses URI and methods like (GET, PUT, POST, DELETE) to expose resources.==

**Why to choose Web API**
\6. It is light weight architecture and good for devices which have limited bandwidth like smart phones.
\3. It doesn't have tedious and extensive configuration like WCF REST service.
\7. It is open source.
\5. It is only based on HTTP and easy to define, expose and consume in a REST-ful way.
\1. If we need a Web Service and don’t need SOAP, then ASP.Net Web API is best choice.
\2. It is used to build simple, non-SOAP-based HTTP Services on top of existing WCF message pipeline.
\4. Simple service creation with Web API. With WCF REST Services, service creation is difficult.

Which one to choose between WCF and Web API?
Ans. The following points help you to choose between WCF and Web API:
\1. Choose WCF when you want to create a service that should support special scenarios such as one way messaging,
message queues, duplex communication etc.
\2. Choose WCF when you want to create a service that can use fast transport channels when available, such as TCP,
Named Pipes, or maybe even UDP (in WCF 4.5), and you also want to support HTTP when all other transport channels are
unavailable.
\3. Choose Web API when you want to create resource-oriented services over HTTP that can use the full features of HTTP
(like URIs, request/response headers, caching, versioning, various content formats).
\4. Choose Web API when you want to expose your service to a broad range of clients including browsers, mobiles, iphone
and tablets.

(I) what are the important principles of SOA (Service oriented Architecture)?
Boundaries are well defined= > In SOA everything is formalized. The client who is consuming the service does not need to
know how the implementation of the service is done. In SOA the rule is if you do enhancement you do not need to change
anything at the client. SOA based application only understands that there is an end point, contract and bindings.
Services evolve => In SOA services can be versioned and you can host those services in new end points.
Services share only schemas and contracts=> Services use Schemas to represent data and contracts to understand
behavior. XML is used to define schemas and contracts. Due to this there is not heavy coupling between environments.
Service compatibility is policy based => Depending on policies the service can degrade to match the service for the client
For instance your service needs to be hosted for two types of client one which uses Remoting as the communication
methodology while other client uses DCOM. An ideal SOA service can cater to both of them according to there
communication policies.
Difference between WSE and WCF:
WCF is the windows communications framework introduced in .Net 3.0. WSE 2.0 is web service enhancements and
produced as an add in for .Net 1.1. There is also a WSE 3.0 for .Net 2.0.
WCF is much more configurable than WSE and has good interoperability with non .Net clients and servers.WCF is a
communications framework for SOAP and non-soap messages (binary etc.). A WCF host can run in IIS (as in WSE) but also in
a console program, winforms program etc.
Web Service Specifications Supported by WSE: The Web services architecture defines a framework that augments the
basic Web service. The following table lists the Web services architecture specifications and the XML namespace for the
version of the specification that is supported by the Web Services Enhancements 3.0 for Microsoft .NET (WSE).
Specifications
Area Specification
Security Web Services Security: SOAP Message Security (WS-Security) 1.0 and 1.1
Web Services Secure Conversation Language (WS-SecureConversation)
Web Services Trust Language (WS-Trust)
Web Services Security X.509 Certificate Token Profile
Web Services Security UsernameToken Profile 1.0
Web Services Security Kerberos Token Profile 1.0
Messaging Web Services Addressing (WS-Addressing)
SOAP Message Transmission Optimization Mechanism (MTOM)
SOAP 1.1
SOAP 1.2
When to use WSE
The Web Services Enhancements for Microsoft .NET (WSE) enables you to develop secure, interoperable Web services that
are based on open industry specifications for .NET Framework applications. WSE enables this type of development by
implementing the WS-* specifications to provide end-to-end message level security.
Using the .NET Framework 2.0 or Visual Studio 2005
WSE enables you to build secure Web services using the .NET Framework 2.0 and Visual Studio 2005.
Interoperable with Windows Communication Foundation
WSE-enabled clients will interoperate with Windows Communication Foundation (WCF). Additionally, WCF clients will
interoperate with WSE 3.0-enabled Web services. WSE 3.0 is wire-level-compatible with WCF using the HTTP protocol and
the corresponding turnkey security scenarios. Interoperability is not guaranteed with other protocols such as TCP.
Simplification of Web services security
WSE simplifies the security model in previous versions of WSE by introducing a set of turnkey security assertions. Instead
of applying security to SOAP messages on a per SOAP message basis, these turnkey security assertions are designed to be
applied apply to SOAP message exchanges that are based upon the distributed application's scenario.
Difference between array and arraylist, arraylist and list
ArrayList is a non-generic collection class and resides in System.Collection namespace whereas List is a generic class and
resides in System.Collections.Generic namespace
Array (A System namespace) is a datatype, that can be used by calling indexes. during runtime, one cannot really change
the size of the array, unless you use the method of copying the array and getting rid of the old one.
In .NET, the Visual Studio makes use of a special class to store the data. Because of this, the performance is actually quite
fast. This is also because in an array, you need to specify the size and thus, the data is stored one after the other.
Examples:
int[] myNumbers= new int[5];
myNumbers[0] = 16;
ArrayList (System.Collections namespace) is a datatype collection. In order to fill an ArrayList, one can use the .Add
method. ArrayLists are very dynamic in the sense that when you add and/or remove items from it, the performace stays
the same.
The internal structure of an ArrayList is an array.
Examples:
ArrayList myArray = new ArrayList();
myArray.Add(“Steph”);
string str = myArray[0];
Most of the time, we tend to choose array lists rather than arrays since we have no idea how big it is going to turn out.
Arrays are ideal when you know how many items you are going to put in it. Whenever possible, it is recommended to use
arrays as this drastically improves the performance.
Array are sequence of homogeneous data while ArrayList is sequence of heterogenous data. That's why we have to
typecast every data in ArrayLists.
Arrays are multidimensional but ArrayList is always single-dimensional.
Arrays are strongly typed, and work well as parameters. If you know the length of your collection and it is fixed, you
should use an array.
ArrayLists are not strongly typed, every Insertion or Retrial will need a cast to get back to your original type. If you need a
method to take a list of a specific type, ArrayLists fall short because you could pass in an ArrayList containing any type.
ArrayLists use a dynamically expanding array internally, so there is also a hit to expand the size of the internal array when
it hits its capacity.
space occupied by pointer
what is delegate
what happens if u have a method in base class and same method in child class? Will it work?
What design patterns do u know? What is a factory design pattern?
Difference between upcasting and downcasting:
Upcasting (using(Employee)someInstance) is generally easy as the compiler can tell you at compile time if a type is
derived from another.
Downcasting however has to be done at run time generally as the compiler may not always know whether the instance in
question is of the type given. C# provides two operators for this -is which tells you if the downcast works, and return
true/false. And as which attempts to do the cast and returns the correct type if possible, or null if not.
To test if an employee is a manager:
Employee m = new Manager();
Employee e = new Employee();
if(m is Manager) Console.WriteLine("m is a manager");
if(e is Manager) Console.WriteLine("e is a manager");
Type Checking: typeof, GetType, or is?
All are different.
•typeof takes a type name (which you specify at compile time).
•GetType gets the runtime type of an instance.
•is returns true if an instance is in the inheritance tree.
Example
class Animal { }
class Dog : Animal { }
void PrintTypes(Animal a) {
print(a.GetType() == typeof(Animal)) // false
print(a is Animal) // true
print(a.GetType() == typeof(Dog)) // true
}
Dog spot = new Dog();
PrintTypes(spot);
What about typeof(T)? Is it also resolved at compile time?
Yes. T is always what the type of the expression is. Remember, a generic method is basically a whole bunch of methods
with the appropriate type. Example:
string Foo<T>(T object) { return typeof(T).Name; }
Animal probably_a_dog = new Dog();
Dog definitely_a_dog = new Dog();
Foo(probably_a_dog); // this calls Foo<Animal> and returns "Animal"
Foo<Animal>(probably_a_dog); // this is exactly the same as above
Foo<Dog>(probably_a_dog); // !!! This will not compile. The parameter expects a Dog, you cannot pass in an Animal.
Foo(definitely_a_dog); // this calls Foo<Dog> and returns "Dog"
Foo<Dog>(definitely_a_dog); // this is exactly the same as above.
Foo<Animal>(definitely_a_dog); // this calls Foo<Animal> and returns "Animal".
Foo((Animal)definitely_a_dog); // this does the same as above, returns "Animal"
What is the difference between a deep copy and a shallow copy?
Breadth vs Depth; think in terms of a tree of references with your object as the root node.
Shallow:
The variables A and B refer to different areas of memory, when B is assigned to A the two variables refer to the same area
of memory. Later modifications to the contents of either are instantly reflected in the contents of other, as they share
contents.
Deep:
The variables A and B refer to different areas of memory, when B is assigned to A the values in the memory area which A
points to are copied into the the memory area to which B points. Later modifications to the contents of either remain
unique to A or B; the contents are not shared.
Repository Pattern
As a summary, I would describe the wider impact of the repository pattern. It allows all of your code to use objects
without having to know how the objects are persisted. All of the knowledge of persistence, including mapping from tables
to objects, is safely contained in the repository.
Very often, you will find SQL queries scattered in the codebase and when you come to add a column to a table you have to
search code files to try and find usages of a table. The impact of the change is far-reaching.
With the repository pattern, you would only need to change one object and one repository. The impact is very small.
Perhaps it would help to think about why you would use the repository pattern. Here are some reasons:
•You have a single place to make changes to your data access
•You have a single place responsible for a set of tables (usually)
•It is easy to replace a repository with a fake implementation for testing - so you don't need to have a database
available to your unit tests
There are other benefits too, for example, if you were using MySQL and wanted to switch to SQL Server - but I have never
actually seen this in practice!
Facade Design Pattern
A design pattern is a common way of solving a recurring problem. Classes in all design patterns are just normal classes.
What is important is how they are structured and how they work together to solve a given problem in the best possible
way.
The Facade design pattern simplifies the interface to a complex system; because it is usually composed of all the classes
which make up the subsystems of the complex system.
A Facade shields the user from the complex details of the system and provides them with a simplified view of it which
is easy to use. It also decouples the code that uses the system from the details of the subsystems, making it easier to
modify the system later.
http://www.dofactory.com/Patterns/PatternFacade.aspx
http://www.blackwasp.co.uk/Facade.aspx
Also, what is important while learning design patterns is to be able to recognize which pattern fits your given problem and
then using it appropriately. It is a very common thing to misuse a pattern or trying to fit it to some problem just because
you know it. Be aware of those pitfalls while learning\using design patterns.
What is LINQ and why to use it?
Ans. LINQ stands for "Language Integrated Query" and pronounced as "LINK". LINQ was introduced with .NET
Framework 3.5 including Visual Studio 2008, C# 3.0 and VB.NET 2008 (VB 9.0). It enables you to query the data from the
various data sources like SQL databases, XML documents, ADO.NET Datasets, Web services and any other objects such as
Collections, Generics etc. by using a SQL Query like syntax with .NET framework languages like C# and VB.NET.
What are advantages of LINQ?
Ans. There are following advantages of using LINQ:
\1. It provides a uniform programming model (i.e. common query syntax) to query data sources (like SQL
databases, XML documents, ADO.NET Datasets, Various Web services and any other objects such as
Collections, Generics etc.)
\2. It has full type checking at compile-time and IntelliSense support in Visual Studio. This powerful feature
helps you to avoid run-time errors.
\3. It supports various powerful features like filtering, ordering and grouping with minimum code.
\4. Its Query can be reused.
\5. It also allows debugging through .NET debugger
What are disadvantages of LINQ?
Ans. There are following disadvantages of using LINQ:
\1. LINQ is not good to write complex queries like SQL.
\2. LINQ doesn’t take the full advantage of SQL features like cached execution plan for stored procedure.
\3. Performance is degraded if you don't write the LINQ query correctly.
\4. If you have done some changes in your query, you have to recompile it and redeploy its dll to the server.
The FULL OUTER JOIN keyword returns all the rows from the left table (Customers), and all the rows from the right table
(Orders). If there are rows in "Customers" that do not have matches in "Orders", or if there are rows in "Orders" that do not
have matches in "Customers", those rows will be listed as well.
The SQL UNION Operator: The UNION operator is used to combine the result-set of two or more SELECT statements. The
UNION operator selects only distinct values by default. To allow duplicate values, use the ALL keyword with UNION.
UNION cannot be used to list ALL cities from the two tables. If several customers and suppliers share the same city, each
city will only be listed once. UNION selects only distinct values. Use UNION ALL to also select duplicate values!
SQL Injection:
SQL injection is a technique where malicious users can inject SQL commands into an SQL statement, via web page input.
Injected SQL commands can alter SQL statement and compromise the security of a web application.
To protect a web site from SQL injection attacks use SQL parameters. SQL parameters are values that are added to an SQL
query at execution time, in a controlled manner. The SQL engine checks each parameter to ensure that it is correct for its
column and are treated literally, and not as part of the SQL to be executed.
SQL Wildcards
Wildcard Example Description
% //all customers with a City starting with "ber":
SELECT * FROM Customers WHERE City LIKE 'ber%';
A substitute for zero or more
characters
_
//all customers with a City starting with any character, followed
by "erlin":
SELECT * FROM Customers WHERE City LIKE '_erlin';
A substitute for a single character
[charlist]
//all customers with a City starting with "b", "s", or "p":
SELECT * FROM Customers WHERE City LIKE '[bsp]%';
//all customers with a City starting with "a", "b", or "c":
SELECT * FROM Customers WHERE City LIKE '[a-c]%';
Sets and ranges of characters to
match
[^charlist]
or
[!charlist]
//all customers with a City NOT starting with "b", "s", or "p"
SELECT * FROM Customers WHERE City LIKE '[!bsp]%';
or
SELECT * FROM Customers WHERE City NOT LIKE '[bsp]%';
Matches only a character NOT
specified within the brackets
Primary Key ID's versus GUIDs:
GUID Pros
Unique across every table, every database, every server
Allows easy merging of records from different databases
Allows easy distribution of databases across multiple servers
You can generate IDs anywhere, instead of having to roundtrip to the database
Most replication scenarios require GUID columns anyway
GUID Cons
It is a whopping 4 times larger than the traditional 4-byte index value; this can have serious performance and storage
implications if you're not careful
Cumbersome to debug where userid='{BAE7DF4-DDF-3RG-5TY3E3RF456AS10}'
The generated GUIDs should be partially sequential for best performance (eg, newsequentialid() on SQL 2005) and to
enable use of clustered indexes
Is the size of C “int” 2 bytes or 4 bytes?
I know it's equal to sizeof(int). The size of an int is really compiler dependent. Back in the day, when processors were 16
bit, an int was 2 bytes. Nowadays, it's most often 4 bytes on a 32 bits system or 8 bytes on 64 bits system.
Still, using sizeof(int) is the best way to get the size of an integer for the specific system the program is executed on.
1 Byte=8 bits
What do you use to tell Web API to use the request as JSON?
What kinds of responses can you get in We API? Can you get binary responses, SOAP responses?
Advantages of Web API webservices over ASMX web services?
Advantages of Web API webservices over WCF web services?
\~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
AWS Benefits:
Easy to use: AWS is designed to allow application providers, ISVs, and vendors to quickly and securely host your
applications – whether an existing application or a new SaaS-based application. You can use the AWS Management Console
or well-documented web services APIs to access AWS’s application hosting platform.
Flexible: AWS enables you to select the operating system, programming language, web application platform, database,
and other services you need. With AWS, you receive a virtual environment that lets you load the software and services
your application requires. This eases the migration process for existing applications while preserving options for building
new solutions.
Cost-Effective: You pay only for the compute power, storage, and other resources you use, with no long-term contracts or
up-front commitments. For more information on comparing the costs of other hosting alternatives with AWS, see the AWS
Economics Center.
Reliable: With AWS, you take advantage of a scalable, reliable, and secure global computing infrastructure, the virtual
backbone of Amazon.com’s multi-billion dollar online business that has been honed for over a decade.
Scalable and high-performance: Using AWS tools, Auto Scaling, and Elastic Load Balancing, your application can scale up
or down based on demand. Backed by Amazon’s massive infrastructure, you have access to compute and storage resources
when you need them.
Secure: AWS utilizes an end-to-end approach to secure and harden our infrastructure, including physical, operational, and
software measures.
Various Collection Classes and Their Usage
The following are the various commonly used classes of theSystem.Collection namespace. Click the following links to
check their detail.
Class Description and Useage
ArrayList It represents ordered collection of an object that can beindexed individually.
It is basically an alternative to an array. However, unlike array you can add and remove items from a list at
a specified position using an index and the array resizes itself automatically. It also allows dynamic memory
allocation, adding, searching and sorting items in the list.
Hashtable
It uses a key to access the elements in the collection.
A hash table is used when you need to access elements by using key, and you can identify a useful key
value. Each item in the hash table has a key/value pair. The key is used to access the items in the
collection.
SortedList
It uses a key as well as an index to access the items in a list.
A sorted list is a combination of an array and a hash table. It contains a list of items that can be accessed
using a key or an index. If you access items using an index, it is an ArrayList, and if you access items using a
key , it is a Hashtable. The collection of items is always sorted by the key value.
Stack
It represents a last-in, first out collection of object.
It is used when you need a last-in, first-out access of items. When you add an item in the list, it is
calledpushing the item and when you remove it, it is calledpopping the item.
Queue
It represents a first-in, first out collection of object.
It is used when you need a first-in, first-out access of items. When you add an item in the list, it is called
enqueue and when you remove an item, it is called deque.
BitArray
It represents an array of the binary representation using the values 1 and 0.
It is used when you need to store the bits but do not know the number of bits in advance. You can access
items from the BitArray collection by using an integer index, which starts from zero.
C# - Nullables
C# provides a special data types, the nullable types, to which you can assign normal range of values as well as null values.
For example, you can store any value from -2,147,483,648 to 2,147,483,647 or null in a Nullable<Int32> variable. Similarly,
you can assign true, false, or null in a Nullable<bool> variable. Syntax for declaring anullable type is as follows:
< data_type> ? <variable_name> = null;
The following example demonstrates use of nullable data types:
using System;
namespace CalculatorApplication
{
class NullablesAtShow
{
static void Main(string[] args)
{
int? num1 = null;
int? num2 = 45;
double? num3 = new double?();
double? num4 = 3.14157;
bool? boolval = new bool?();
// display the values
Console.WriteLine("Nullables at Show: {0}, {1}, {2}, {3}", num1, num2, num3, num4);
Console.WriteLine("A Nullable boolean value: {0}", boolval);
Console.ReadLine();
}
}
}
When the above code is compiled and executed, it produces the following result:
Nullables at Show: , 45, , 3.14157
A Nullable boolean value:
The Null Coalescing Operator (??)
The null coalescing operator is used with the nullable value types and reference types. It is used for converting an
operand to the type of another nullable (or not) value type operand, where an implicit conversion is possible.
If the value of the first operand is null, then the operator returns the value of the second operand, otherwise it returns
the value of the first operand. The following example explains this:
using System;
namespace CalculatorApplication
{
class NullablesAtShow
{
static void Main(string[] args)
{
double? num1 = null;
double? num2 = 3.14157;
double num3;
num3 = num1 ?? 5.34;
Console.WriteLine(" Value of num3: {0}", num3);
num3 = num2 ?? 5.34;
Console.WriteLine(" Value of num3: {0}", num3);
Console.ReadLine();
}
}
}
When the above code is compiled and executed, it produces the following result:
Value of num3: 5.34
Value of num3: 3.14157
1."Tell me a little about yourself," is often the first question. Interviewers don’t want your life story; they want
to know if meeting you would be a good use of their time. Answer with a brief work history showing how each job
and project helped prepare you for this job. Then give a profile of the "professional you," showcasing your skills in
a way that will have the interviewer mentally picturing you doing the same things for him.
2.“What experience do you have in…?” Make any discussion of your experience relevant to the deliverables of this
particular job, and reference the specific skills you possess that enable you to do it well. At its core, this job
exists to help the company make money in some way; and your work helps achieve this goal by solving problems
and preventing problems from arising within your areas of responsibility. Your answers should show that you are a
problem solver (and problem preventer) by nature, and that this problem prevention and solution attitude is
always part of your thinking. You do this by giving concrete examples of problem identification and solution.
3."What are your strengths?" Whatever your particular strengths, you want to get these three points across:
•You have the specific technical skills needed to do the job well.
•You have a problem-prevention-and-solution mindset.
•You are fully aware that the product of your work (that sale, that accounting report) in turn becomes
part of someone else’s work. You understand your work is one small but important cog in the complex
machinery that helps the company make money.
4."What are your weaknesses?” You can safely—and honestly—say that your greatest weakness is finding time to
stay current with all the new technology skills required in your work. This is a challenge for everyone, so you’re
neither lying nor making yourself seem “less than.” Then you must be ready to end your answer with examples of
how you’ve been proactive in combating this deficiency.
5.“How much do you want?” If the interviewer asks about money, say that at this point you don't know enough
about the company or the job to answer accurately. If you are pressed give a range, say, "I have no real
understanding of your needs yet, or of the different benefits that could come from joining your team. However, I
would probably be looking at something in the range of $X-$Y."
\1. Prepare as though it’s an in-person interview. Despite the fact that phone interviews are commonplace nowadays,
some applicants fail to treat them as an essential part of the search process. Devote as much time to prepping for a phone
meeting as you would for an initial meeting in person. Los Angeles executive and career coach David Couper, author of
Outsiders on the Inside: How to Create a Winning Career… Even When You Don’t Fit In!, recommends having a written list
of 5-10 stories about yourself that illustrate your accomplishments. “If you say you managed a department with five
people, you need to have a story about that,” advises Couper, who used to work in human resources at now-defunct
consulting giant Arthur Andersen. “You can say, there was one person working for me, and I put forth a proposal for more
staff, which was granted and we increased sales by X amount.” The stories should have a beginning, middle and end, says
Couper.
\2. If the call comes out of the blue, say you’re in the middle of something and set a time to talk. If you get a call
without a warning in advance, say you’re delighted to talk to the interviewer, but could you speak later, and suggest a
time. Even if it’s just 15 minutes later, you need to gather your résumé, your notes and your thoughts.
\3. Make sure you’re in a quiet place with a good connection where you won’t be interrupted. Use a land line if
possible. If you’re talking on a cell phone, let the interviewer know. and apologize in advance for any service interruption.
Make sure children, pets and other possible interruptions are out of the room. Get yourself a glass of water.
\4. Ask how much time the interviewer has to talk. This will help you pace yourself and cover the ground you’re planning
in the interview.
\5. Stand up and smile. Standing knocks your energy level up a notch. When you smile, it affects your tone of voice and
can make a more favorable impression. Some people find it useful to dress nicely, to put them in a professional state of
mind. Imagine standing, dressed in a suit, as opposed to slouching over your desk wearing pajamas.
\6. Early in the conversation, ask the interviewer what she’s looking for. Say something like, “I’ve read the position
description, but I’d love to hear in your words what you’re looking for in this role.” Though most phone interviewers have
a list of questions they want to ask, they won’t be put off by this question.
\7. Don’t over-talk. When you’re on the phone, it’s impossible to read the nonverbal cues that interviewers send in
person, like averting their gaze or adjusting their posture as though they want to speak. Watch the clock and don’t talk
for more than one minute at a stretch. Then pause and ask whether more detail would be useful.
\8. Listen closely. Take notes of the questions the interviewer is asking. This can help you write a great thank-you note
after you’re done.
\9. Ask about the next step in the process. Before signing off, say that you’re excited about the opportunity and ask what
the next step in the process will be.
\10. Follow up. Treat the follow-up for a phone interview the same way you would an in-person interview. Email a thankyou note that refers to details in the interview. Include several concrete, specific ways you would contribute to the
company if you got the job. Roy Cohen, a New York career coach who used to handle outplacement for Goldman Sachs and
is the author of The Wall Street Professional’s Survival Guide, says that if you don’t get a response to your email, you
should leave more than one phone message. You can say,” I want to make sure there wasn’t any information you need
from me to move forward.” If it’s your second or third message, try, “I want to make sure everything is OK.” “I like to
refer to this as the Jewish guilt approach,” says Cohen. Either you’re out of the running, in which case you have nothing
to lose, or the interviewer has been busy and distracted, and will appreciate the reminder.
Guidance on doing a phone interview:
1.Treat the phone interview seriously, just as you would a face-to-face interview.
2.Have your resume and cover letter in front of you.
3.Make a cheat sheet.
4.Get a high-quality phone.
5.Shower, groom and dress up (at least a little).
6.Stand up, or at least sit up straight at a table or desk.
In the days before the interview
Draw a line down the center of a piece of paper. On the left side, make a bulleted list of what the employer is
looking for based on the job posting. On the right side, make a bulleted list of the qualities you possess that fit those
requirements.
Research the company, industry and the competition.
Prepare your 60-second personal statement.
Write at least five success stories to answer behavioral interview questions ("Tell me about a time when..." or "Give
me an example of a time...").
List five questions to ask the interviewer about the job, the company and the industry.
Research salaries to determine your worth.
Determine your salary needs based on your living expenses.
Get permission from your references to use their names.
Prepare your interview answers
Be ready to answer common interview questions such as these:
Tell me about yourself.
Why did you leave your last position, or why are you leaving your current position?
What do you know about this company?
What are your goals?
What are your strengths and weaknesses?
Why do you want to work here?
What has been your most significant achievement?
How would your last boss and colleagues describe you?
Very dependable and honest
Willing to go alone, take the path less travelled.
Very high quality of work.
Can be relied on to do the diagnose and resolve complex issues using innovative approaches, within the technical
constraints imposed by the project.
Why should we hire you?
• Have deep experience designing, coding, testing SQL Server databases
• Design, code, and deliver multi-tier products with web-based, windows-based, mobile-based clients on the
.NET/SQL Server technology stack.
• Develop applications in C# / .NET for high-volume transaction SQL database.
• Take ownership of the technology used on projects and their implementation, and mentor less-experienced staff in
their technical development
• Diagnose and resolve complex issues using innovative approaches.
• Leverage continuous build and automated unit test frameworks.
 Drive the appropriate use & implementation of technology to deliver high quality solutions that delight our
customers.
 Develop applications utilizing Hybrid Cloud technologies (SaaS, Paas, IaaS).
 Generate innovative approaches and solutions to complex issues.
 Mentor less-experienced staff in their career development, and provide them daily guidance and direction.
What are your salary expectations?
Before you go to the interview
Do you look professional? Check yourself in the mirror; part of your confidence will come from looking good.
Carry these items to the interview:
Several copies of your resume on quality paper.
A copy of your references.
A pad of paper on which to take notes, though notes are optional.
Directions to the interview site.
Upon arrival
Arrive early—enter the building 10 minutes before your appointment.
Review your prepared stories and answers.
Go to the restroom and check your appearance one last time.
Announce yourself to the receptionist in a professional manner.
Stand and greet your interviewer with a hearty—not bone-crushing—handshake.
Smile and maintain eye contact.
During the interview
Try to focus on the points you have prepared without sounding rehearsed or stiff.
Relax and enjoy the conversation.
Learn what you can about the company.
Ask questions and listen; read between the lines.
At the conclusion, thank the interviewer, and determine the next steps.
Ask for the interviewer's business card so you can send a follow-up letter.
After the interview
As soon as possible, write down what you are thinking and feeling.
Later in the day, review what you wrote and assess how you did.
Write an interview thank-you letter, reminding the interviewer of your qualities.
Explain the lock construct in c#
Answer
The lock keyword ensures that only one thread can enter the code block surrounded by the lock statement. If a thread is
inside the code block and another thread tries to enter the locked code the thread will have to wait till the first thread
exits out of the locked code.
lock(_locker){ //Code which can only be accessed by one thread at a time.}
_locker has to be a reference type and should be the same instance for all threads.
lock is a syntactic sugar for Monitor.Enter(Object) and Monitor.Exit(Object) which correspond to the opening and closing
brackets for the lock statement. (Plus some additional code to protect against some advanced scenarios)
In multithreading the advantage is that the memory is shared and multiple threads can use the same area of memory
requiring it to load just once given synchronization issues are handled properly. Processes are isolated from each other and
cannot directly access memory allocated to each other.
Due to isolation processes dont interfere with each other. e.g. if one process crashes other processes are unaffected. In
case of multithreading all threads within the process stop executing when a process crashes. If one thread misbehaves and
corrupts the shared area of memory, other threads would be affected too as they too are dependent on the same shared
memory area.
What is Thread Safety. Give an Example of Thread Unsafe code and how to make it thread safe.
Answer: A Thread-Safe code is code that will work without any side effects even if multiple threads are executing it
simultaneously.
Consider the following code:
public class ThreadSafetyTest
{
private static bool _printed = false;
public static void Run()
{
if(!_printed)
{
Console.WriteLine("You would here from me only once!");
_printed = true;
}
}
}
In the above code if Run() is called it prints the message. If it is called again it wont print the message again as _printed
variable is set to true. Now if Run() method was called in parallel by two different threads, can we guarantee that the
message would be printed only once? If no the code is not thread safe as we cannot deterministically determine the
output. Apparently the above code is not thread safe. Consider this. First thread comes and checks the variable _printed
and finds it that it is false. The code will enter the condition. Now before first thread moves ahead, a second thread
comes and checks for the variable _printed. It is still false as the first thread hasn't yet set the _printed variable to true.
Now both threads will execute and print the message twice.
How can we remedy this problem? We can use locking constructs. In .net the simplest locking construct is a "lock", which
gurantees that at a time only one thread can access the code inside lock. Following modified version of the above code is
thread safe:
public class ThreadSafetyTest
{
private static bool _printed = false;
private static object _locker = new object();
public static void Run()
{
lock(_locker)
{
if(!_printed)
{
Console.WriteLine("You would here from me only once!");
_printed = true;
}
}
}
}
What is a thread pool
Creating a Thread is expensive as it requires a few hundred milliseconds to create a new one. Additionally each thread
requires atleast around 1MB of data. So instead of creating and destroying a thread each time we could just create a
collection of preinstantiated threads and use them instead. Whenever we require a thread we ask thread pool for a thread
which we can use and when we are done with it instead of destroying it we can send it back to the collection for
recycling. This way we avoid the cost it incurs for creating and destroying threads. This collection of preinstantiated
thread is called a Thread Pool.
Can we have memory leaks in a .Net Application?
Though .Net has automatic memory management and it does a good job in freeing up objects not in use, there is still a
possibility of a memory leak when unwanted references linger around indefinitely or when unmanaged resources are not
disposed off. Following are a few examples:
Subscriptions to Event Handlers
Consider the following code:
var shortLivedObject = new ShortLivedObject();
mainForm.SomeEvent += shortLivedObject.HandleSomeEvent;
Now say after a short while shortLivedObject is not needed and is either disposed off or goes out of scope and there are
no other variables pointing to this instance. We would then expect the garbage collector to free up the memory allocated
for it when it runs. However Garbage Collector is unable to do so as mainForm.SomeEvent still has an active reference to
this instance (more specifically the handler which resides in this instance). So it cannot clean it up till the mainForm
object is destroyed. We have a leak.
To avoid this we must unsubscribe to this event (mainForm.SomeEvent -= shortLivedObject.HandleSomeEvent). A better
practice is to use weak event pattern. See here for more details.
Unmanaged Memory Leak
In C# you can allocate unmanged memory. If you do so you must free it explicitly or else you will have a memory leak.
Garbage Collector can only manage the managed heap.
var ptr = Marshal.AllocHGlobal(Marshal.SizeOf(someObject));
The memory allocated by the above statement will remain allocated throughout the life of the application, unless you call
Marshal.FreeHGlobal(ptr);
Other Instances of Leak
If your object lives longer than expected even after multiple garbage collection cycles, you have a potential memory leak.
There could be numerous scenarios of this and would be very specific to the code you are writing. E.g. suppose you are
having a static list of objects. If you add an object to this list you must also remove it once it is no longer required. If you
forget to remove it, or some exception causes it to be not getting removed from the list, you are introducing a memory
leak.
Some people classify not calling the dispose method of an IDisposable object (e.g Streams etc) as introducing a memory
leak. These are not exactly memory leaks as when the garbage collector runs it will call dispose and clean up the object.
Nevertheless you should always call Dispose() on disposable objects (or use using statement), to avoid performance
degradation.
What are the differences between an Interface and an Abstract Class
Superficially, both interfaces and abstract classes are look similar, but there are a few important differences:
An interface is a contract, and any class which implements the interface has to abide by the contract by providing an
implementation of the methods and/or properties which the interface declares. An interface cannot contain any code. A
class can implement any number of interfaces.
An abstract class is a class which cannot be instantiated. It contains at least one abstract method (method with no
definition) or property and can contain members and other function definitions like a normal class (in c# a class can be
marked as abstract even if it doesnt have any abstract members). A class cannot implement more than one class (abstract
or not).
What is the difference between a var and a dynamic keyword in c#
When you use the var keyword, you tell the compiler to automatically determine the type of the variable based on the
value assigned.
When you use the dynamic keyword you tell the compiler to turn off compile-time checking. However the type checks still
do happen during runtime, and instead of compile time errors, you get runtime errors.
The following code won't compile as the compiler has inferred the value of v to be string, and ++ is not defined for a
string.
var v = "some string"; //compiler infers type of v is string
v++; // compiler error here. The code does not compile.
The below code compiles fine as the compiler checks are turned off for dynamic. However if we run it, we will get a
Runtime exception when we attempt to increment a string.
dynamic d = "some string"
d+;
For var the type of the variable is determined at the time of declaration and the type does not change throughout the
lifetime of the variable. However for a variable declared using the dynamic keyword, the variable can assume different
underlying types.
dynamic d = "some string"; // d is string
d = 100; // d is now int
With dynamic we lose compile time checks, so it is generally advised to avoid using dynamics unless necessary. Following
quote from MSDN nicely summarized when use of dynamics is justified:
As a developer, you use the dynamic keyword with variables expected to contain objects of uncertain type such as objects
returned from a COM or DOM API; obtained from a dynamic language (IronRuby, for example); from reflection; from
objects built dynamically in C# 4.0 using the new expand capabilities.
What do you mean by String objects are immutable
What is an Immutable Object
An object is immutable if it's state does not change once the object has been created. So an immutable object does not
have any properties or methods which can change its state (i.e any public or private member variables).
Checking If String objects are Immutable
If we analyse all properties and methods of String, we will observe that there is no method or property which changes the
string itself. Even if functions like Replace seem to be changing the object, they are not. They create a new string object
whenever a method is called which can change the object. The signature of the function also makes it clear as it always
returns a string object.
If we call
someString.Replace('a','b');
someString is not changed. We have to update the someString pointer to point to the new object
someString = someString.Replace('a','b');
Are there any problems that immuatability brings along with itself?
One downside to immutability is that if we are doing excessive manipulations on a string, every manipulation will create a
new object. This is unnecessary and can hurt performance and increase memory footprint in cases where we are
manipulating large strings. The old object after manipulation in most use cases is freed up for garbage collection, but
garbage collector then could get invoked more frequently which again hurts performance.
But Why?
Seeing that using immutable objects could hurt performance, this is obvious that you ask. .NET and (even Java) wanted to
treat Strings similar to basic types like int, float etc. which are inherently immutable as they are fixed length value types
and stored on stack (If you change the value, you are creating a new value type with the modified value). Strings on the
other hand had to be reference type because of its variable length. So they made sure they do not expose any properties
which could change the state of the object.
Also if a String variable is passed into a function, any manipulations that happen inside the function wont affect the
variable which is passed from outside, as a manipulation would happen on a copy (a behaviour similar to basic value types
which are passed by value)
It also provides a way to cache the hash of a string. As a string object can never change, its hash also remains constant.
This provides performance benefits in cases where string keys are used in hashsets etc.
It also makes possible an optimization called String interning, by which if we create two string objects with the same
value in code, both will share the same area of memory, thus saving memory allocation. E.g the following code will print
True.
String a = "ABC";
String b = "ABC";
Console.WriteLine(Object.ReferenceEquals(s1, s2));
In a multithreaded environment operations on immutable objects are thread safe (This is an hefty subject and has a few
quirks, but this is the best I can do in one line)
What if I really want to manipulate strings excessively?
You can use StringBuilder for such cases which is specifically designed for this purpose and would manipulate the string in
memory. Although in a case where you are just adding two strings, using string concatenation is better than using
StringBuilder.Append.
What is a Mutex. How is it different from a lock
A mutex is a synchronization mechanism similar to a lock used to synchronize and protect access to shared variables in a
multithreaded environment. The main difference between a mutex and a lock is that mutex is a OS level construct while a
lock is pure managed construct. Hence a mutex is cross process and a named mutex created in one process is accessible to
other processes as well. lock works only within the AppDomain. Mutexes are 50 times slower than a lock.
Simple Mutex Usage
Create a mutex object.
private static Mutex mutex = new Mutex();
To protect an area of code it should start with Mutex.WaitOne and end with Mutex.ReleaseMutex
mutex.WaitOne();
//protected code.
mutex.ReleaseMutex();
Simple Lock Usage
lock(obj)
{
//protected code.
}
What is a deadlock. Give an example.
Two threads each of them waiting for a resource held by the other thread in such a way that neither can proceed, are said
to be in a deadlock.
Suppose there are two threads, T1 & T2 and two resources R1 & R2.
T1 needs to take a lock on R1 and then on R2
T2 needs to take a lock on R2 and then on R1
Now suppose following sequence of events happen:
\1. T1 takes a lock on R1
\2. T2 takes a lock on R2
\3. T1 wants to take a lock on R2 but cannot as T2 has already taken a lock on R2. So T1 waits.
\4. Same with T2. T2 wants to take a lock on R1 but cannot as T1 has already taken a lock on R1. T2 waits.
In the above scenario both T1 and T2 are waiting for each other to release locks. Hence no progress can be made by these
threads at all. They are in deadlock.
The above scenario in code (Assume Thread1Func and Thread2Func are running on separate threads)
object resourceLock1 = new object();
object resourceLock2 = new object();
public void Thread1Func()
{
lock (resourceLock1)
{
//Some Code
lock (resourceLock2) // Deadlock can happen here
{/*some code*/}
}
}
public void Thread2Func()
{
lock (resourceLock2)
{
//some code
lock (resourceLock1) // Deadlock can happen here
{/*some code*/}
}
}
What’s the difference between a local temp table and a global temp table
Local Temp Table A local temporary table, #temptable, exists only for the duration of a user session or the procedure that
created the temporary table. When the user logs off or when the procedure that created the table completes, the local
temporary table is lost. Multiple users can't share a local temporary table because it is local to one user session. You also
can't grant or revoke permissions on the local temporary table.
Global Temp Table A global temporary table, ##temptable, also exists for the duration of a user session or the procedure
that created the table. When the last user session that references the table disconnects, the global temporary table is
lost. However, multiple users can access a global temporary table; in fact, all other database users can access it. But you
can't grant or revoke permissions on the global temporary table because it's always available to everyone.
What are the different types of indexes in SQL Server
Composite index An index that contains more than one column. In both SQL Server 2005 and 2008, you can include up to
16 columns in an index, as long as the index doesn’t exceed the 900-byte limit. Both clustered and nonclustered indexes
can be composite indexes.
Unique Index An index that ensures the uniqueness of each value in the indexed column.
A unique index is automatically created when you define a primary key or unique constraint:
Primary key: When you define a primary key constraint on one or more columns, SQL Server automatically creates a
unique, clustered index if a clustered index does not already exist on the table or view. However, you can override the
default behavior and define a unique, nonclustered index on the primary key.
Unique: When you define a unique constraint, SQL Server automatically creates a unique, nonclustered index. You can
specify that a unique clustered index be created if a clustered index does not already exist on the table.
Covering index A type of index that includes all the columns that are needed to process a particular query. For example,
your query might retrieve the FirstName and LastName columns from a table, based on a value in the ContactID column.
You can create a covering index that includes all three columns.
Query to find 5th Highest salary without using SubQuery / Top. (Change 5 to any N value to get Nth highest Salary)
WITH Salaries AS(SELECT Salary, ROW_NUMBER() OVER(ORDER BY Salary DESC) AS 'RowNum' FROM Employee)
SELECT Salary fROM Salaries WHERE RowNum = 5
MongoDB Interview Questions
Dear readers, these MongoDB Interview Questions have been designed specially to get you acquainted with the nature of
questions you may encounter during your interview for the subject of MongoDB. As per my experience good interviewers
hardly plan to ask any particular question during your interview, normally questions start with some basic concept of the
subject and later they continue based on further discussion and what you answer:
What are NoSQL databases? What are the different types of NoSQL databases?
A NoSQL database provides a mechanism for storage and retrieval of data that is modeled in means other than the tabular
relations used in relational databases (like SQL, Oracle, etc.).
Types of NoSQL databases:
Document Oriented
Key Value
Graph
Column Oriented
What kind of NoSQL database MongoDB is?
MongoDB is a document oriented database. It stores data in the form of BSON structure based documents. These
documents are stored in a collection.
Which are the most important features of MongoDB?
Flexible data model in form of documents
Agile and highly scalable database
Faster than traditional databases
Expressive query language
What is a Namespace in MongoDB? A Namespace is the concatenation of the database name and collection nameFor e.g.
school.students with school as the database and students as the collection
Which all languages can be used with MongoDB?
Currently, MonggoDB provides official driver support for C, C++, C#, Java, Node.js, Perl, PHP, Python, Ruby, Scala, Go and
Erlang. MongoDB can easily be used with any of these languages. There are some other community supported drivers too
but the above mentioned ones are officially provided by MongoDB.
Compare SQL databases and MongoDB at a high level.
SQL databases store data in form of tables, rows, columns and records. This data is stored in a pre-defined data model
which is not very much flexible for today's real-world highly growing applications. MongoDB in contrast uses a flexible
structure which can be easily modified and extended.
How is MongoDB better than other SQL databases?
MongoDB allows a highly flexible and scalable document structure. For e.g. one data document in MongoDB can have five
columns and the other one in the same collection can have ten columns. Also, MongoDB database are faster as compared
to SQL databases due to efficient indexing and storage techniques.
Compare MongoDB and CouchDB at high level.
Although both of these databases are document oriented, MongoDB is a better choice for applications which need dynamic
queries and good performance on a very big database. On the other side, CouchDB is better used for applications with
occasionally changing queries and pre-defined queries.
Does MongoDB support foreign key constraints?
No. MongoDB does not support such relationships.
Does MongoDB support ACID transaction management and locking functionalities?
No. MongoDB does not support default multi-document ACID transactions. However, MongoDB provides atomic operation on
a single document.
How can you achieve primary key - foreign key relationships in MongoDB?
By default MongoDB does not support such primary key - foreign key relationships. However, we can achieve this concept
by embedding one document inside another. Foe e.g. an address document can be embedded inside customer document.
Does MongoDB need a lot of RAM?
No. MongoDB can be run even on a small amount of RAM. MongoDB dynamically allocates and de-allocates RAM based on
the requirements of other processes.
Does MongoDB pushes the writes to disk immediately or lazily? MongoDB pushes the data to disk lazily. It updates the
immediately written to the journal but writing the data from journal to disk happens lazily.
Explain the structure of ObjectID in MongoDB.
ObjectID is a 12-byte BSON type with:
4 bytes value representing seconds
3 byte machine identifier
2 byte process id
3 byte counter
MongoDB uses BSON to represent document structures. True or False?
True
If you remove a document from database, does MongoDB remove it from disk?
Yes. Removing a document from database removes it from disk too.
Mention the command to insert a document in a database called school and collection called persons.
db.products.insert( { item: "card", qty: 15 } )
What are Indexes in MongoDB?
Indexes support the efficient execution of queries in MongoDB. Without indexes, MongoDB must perform a collection scan,
i.e. scan every document in a collection, to select those documents that match the query statement. If an appropriate
index exists for a query, MongoDB can use the index to limit the number of documents it must inspect.
How many indexes does MongoDB create by default for a new collection?
By default, MongoDB created the _id collection for every collection.
Can you create an index on an array field in MongoDB? If yes, what happens in this case?
Yes. An array field can be indexed in MongoDB. In this case, MongoDB would index each value of the array.
What is a covered query in MongoDB?
A covered query is the one in which:
fields used in the query are part of an index used in the query, and
the fields returned in the results are in the same index
Why is a covered query important?
Since all the fields are covered in the index itself, MongoDB can match the query condition as well as return the result
fields using the same index without looking inside the documents. Since indexes are stored in RAM or sequentially located
on disk, such access is a lot faster.
Does MongoDB provide a facility to do text searches? How? Yes. MongoDB supports creating text indexes to support text
search inside string content. This was a new feature which can introduced in version 2.6.
What happens if an index does not fit into RAM? If the indexes do not fit into RAM, MongoDB reads data from disk which
is relatively very much slower than reading from RAM.
Mention the command to list all the indexes on a particular collection. db.collection.getIndexes()
At what interval does MongoDB write updates to the disk? By default configuration, MongoDB writes updates to the disk
every 60 seconds. However, this is configurable with the commitIntervalMs and syncPeriodSecs options.
How can you achieve transaction and locking in MongoDB? To achieve concepts of transaction and locking in MongoDB,
we can use the nesting of documents, also called embedded documents. MongoDB supports atomic operations within a
single document.
What is Aggregation in MongoDB? Aggregations operations process data records and return computed results. Aggregation
operations group values from multiple documents together, and can perform a variety of operations on the grouped data
to return a single result. MongoDB provides three ways to perform aggregation: the aggregation pipeline, the map-reduce
function, and single purpose aggregation methods and commands.
What is Sharding in MongoDB? Explain. Sharding is a method for storing data across multiple machines. MongoDB uses
sharding to support deployments with very large data sets and high throughput operations
What is Replication in MongoDB? Explain. Replication is the process of synchronizing data across multiple servers.
Replication provides redundancy and increases data availability. With multiple copies of data on different database
servers, replication protects a database from the loss of a single server. Replication also allows you to recover from
hardware failure and service interruptions.
What are Primary and Secondary Replica sets?
Primary and master nodes are the nodes that can accept writes. MongoDB's replication is 'single-master:' only one node can
accept write operations at a time.
Secondary and slave nodes are read-only nodes that replicate from the primary.
By default, MongoDB writes and reads data from both primary and secondary replica sets. True or False.
False. MongoDB writes data only to the primary replica set.
Why are MongoDB data files large in size?
MongoDB preallocates data files to reserve space and avoid file system fragmentation when you setup the server.
When should we embed one document within another in MongoDB?
You should consider embedding documents for:
'contains' relationships between entities
One-to-many relationships
Performance reasons
Why MongoDB is not preferred over a 32-bit system?
When running a 32-bit build of MongoDB, the total storage size for the server, including data and indexes, is 2 gigabytes.
For this reason, do not deploy MongoDB to production on 32-bit machines.
If you're running a 64-bit build of MongoDB, there's virtually no limit to storage size.
What is a Storage Engine in MongoDB
A storage engine is the part of a database that is responsible for managing how data is stored on disk. For example, one
storage engine might offer better performance for read-heavy workloads, and another might support a higher-throughput
for write operations.
Which are the two storage engines used by MongoDB?
MongoDB uses MMAPv1 and WiredTiger.
What is the role of a profiler in MongoDB? Where does the writes all the data?
The database profiler collects fine grained data about MongoDB write operations, cursors, database commands on a
running mongod instance. You can enable profiling on a per-database or per-instance basis.
The database profiler writes all the data it collects to the system.profile collection, which is a capped collection.
How does Journaling work in MongoDB?
When running with journaling, MongoDB stores and applies write operations in memory and in the on-disk journal before
the changes are present in the data files on disk. Writes to the journal are atomic, ensuring the consistency of the on-disk
journal files. With journaling enabled, MongoDB creates a journal subdirectory within the directory defined by dbPath,
which is /data/db by default.
Mention the command to check whether you are on the master server or not.
db.isMaster()
Can you configure the cache size for MMAPv1? How?
No. MMAPv1 does not allow configuring the cache size.
Can you configure the cache size for WiredTiger? How?
For the WiredTiger storage engine, you can specify the maximum size of the cache that WiredTiger will use for all data.
This can be done using storage.wiredTiger.engineConfig.cacheSizeGB option.
How does MongoDB provide concurrency? MongoDB uses reader-writer locks that allow concurrent readers shared access
to a resource, such as a database or collection, but give exclusive access to a single write operation.
How can you isolate your cursors from intervening with the write operations?
You can use the snapshot() method on a cursor to isolate the operation for a very specific case. snapshot() traverses the
index on the _id field and guarantees that the query will return each document no more than once.
Can one MongoDB operation lock more than one databases? If yes, how?
Yes. Operations like copyDatabase(), repairDatabase(), etc. can lock more than onne databases involved.
How can concurrency affect replica sets primary?
In replication, when MongoDB writes to a collection on the primary, MongoDB also writes to the primary's oplog, which is a
special collection in the local database. Therefore, MongoDB must lock both the collection's database and the local
database.
What is GridFS?
GridFS is a specification for storing and retrieving files that exceed the BSON-document size limit of 16MB. Instead of
storing a file in a single document, GridFS divides a file into parts, or chunks, and stores each of those chunks as a
separate document.
Can you run multiple Javascript operations in a single mongod instance?
Yes. The V8 JavaScript engine added in 2.4 allows multiple JavaScript operations to run at the same time.
Which command can be used to provide various information on the query plans used by a MongoDB query?
The explain() command can be used for this information. The possible modes are: 'queryPlanner', 'executionStats', and
'allPlansExecution'.
The document is archived and information here might be outdated
Walkthrough: Creating a Windows Service Application in the Component Designer
Visual Studio .NET 2003
Note The Windows Service template and associated functionality is not available in the Standard Edition of
Visual Basic and Visual C# .NET. For more information, see Visual Basic Standard Edition Features or Visual
C# Standard Edition Features.
The procedures in this topic walk you through the process of creating a simple Windows Service application that writes
messages to an event log. The basic steps that you perform to create and use your service include:
• Create a project using the Windows Service application template. This template creates a class for you that
inherits from ServiceBase and writes much of the basic service code, such as the code to start the service.
• Write the code for the OnStart and OnStop procedures, and override any other methods that you want to
redefine.
• Add the necessary installers for your service application. By default, a class containing two or more installers is
added to your application when you click the Add Installer link: one to install the process, and one for each of the
associated services your project contains.
• Build your project.
• Create a setup project to install your service, and then install it.
• Access the Windows 2000 Services Control Manager and start your service.
To begin with, you create the project and set values that are necessary for the service to function correctly.
To create and configure your service
\1. On the File menu, point to New, and then click Project.
The New Project dialog box opens.
\2. Select the Windows Service project from the list of Visual Basic or Visual C# project templates, and name
it MyNewService.
Note The project template automatically adds a component class called Service1 that inherits
fromSystem.ServiceProcess.ServiceBase.
\3. Click the designer to select Service1. Then, in the Properties window, set the ServiceName property for Service1
to MyNewService.
\4. Set the AutoLog property to true.
\5. On the View menu, choose Code to open the Code Editor. Edit the Main method to create an instance
of MyNewService. When you renamed the service in step 3, the class name was not modified in the Main method.
To access the Main method in Visual Basic, expand the Component Designer generated code region.
static void Main()
{
System.ServiceProcess.ServiceBase[] ServicesToRun = new System.ServiceProcess.ServiceBase[]
{ new MyNewService() };
System.ServiceProcess.ServiceBase.Run(ServicesToRun);
}
In the next section, you will add a custom event log to your Windows service. Event logs are not associated in any way
with Windows services. Here theEventLog component is used as an example of the type of components you could add to a
Windows service. For more information on custom event logs, see Creating and Removing Custom Event Logs.
To add custom event log functionality to your service
\1. In the Solution Explorer, right-click Service1.vb or Service1.cs and select View Designer.
\2. From the Components tab of the Toolbox, drag an EventLog component to the designer.
\3. In the Solution Explorer, right-click Service1.vb or Service1.cs and select View Code.
\4. Edit the constructor to define a custom event log. To access the constructor in Visual Basic, expand
the Component Designer generated coderegion.
public MyNewService()
{
InitializeComponent();
if (!System.Diagnostics.EventLog.SourceExists("MySource"))
{
System.Diagnostics.EventLog.CreateEventSource("MySource","MyNewLog");
}
eventLog1.Source = "MySource";
eventLog1.Log = "MyNewLog";
}
To define what happens when the service starts
• In the Code Editor, locate the OnStart method that was automatically overridden when you created the project,
and write code to determine what occurs when the service begins running:
protected override void OnStart(string[] args)
{
eventLog1.WriteEntry("In OnStart");
}
• Note A service application is designed to be long running. As such, it usually polls or monitors something in the
system. The monitoring is set up in the OnStart method. However, OnStart does not actually do the monitoring.
The OnStart method must return to the operating system once the service's operation has begun. It must not loop
forever or block. To set up a simple polling mechanism, you can use the System.Timers.Timer component. In
the OnStart method, you would set parameters on the component, and then you would set
the Timer.Enabled property to true. The timer would then raise events in your code periodically, at which time
your service could do its monitoring.
To define what happens when the service is stopped
• In the Code Editor, locate the OnStop procedure that was automatically overridden when you created the project,
and write code to determine what occurs when the service is stopped:
protected override void OnStop()
{
eventLog1.WriteEntry("In onStop.");
}
You can also override the OnPause, OnContinue, and OnShutdown methods to define further processing for your
component.
To define other actions for the service
• For the method you want to handle, override the appropriate method and define what you want to occur.
The following code shows what it looks like if you override the OnContinue method:
protected override void OnContinue()
{
eventLog1.WriteEntry("In OnContinue.");
}
Some custom actions need to occur when installing a Windows service, which can be done by the Installer class. Visual
Studio can create these installers specifically for a Windows service and add them to your project.
To create the installers for your service
\1. Return to Design view for Service1.
\2. Click the background of the designer to select the service itself, rather than any of its contents.
\3. In the Properties window, click the Add Installer link in the gray area beneath the list of properties.
By default, a component class containing two installers is added to your project. The component is
named ProjectInstaller, and the installers it contains are the installer for your service and the installer for the
service's associated process.
\4. Access Design view for ProjectInstaller, and click ServiceInstaller1.
\5. In the Properties window, set the ServiceName property to MyNewService.
\6. Set the StartType property to Automatic.
\7. In the designer, select ServiceProcessInstaller1 (for a Visual Basic project), or serviceProcessInstaller1 (for a Visual
C# project). Set the Accountproperty to LocalService. This will cause the service to be installed and to run on a
local service account. For more information, seeServiceProcessInstaller.Account Property.
Security Note The LocalService account acts as a non-privileged user on the local computer, and
presents anonymous credentials to any remote server. Use the other accounts with caution, as they
run with higher privileges and increase your risk of attacks from malicious code.
To build your service project
\1. In Solution Explorer, right-click your project and select Properties from the shortcut menu. The project's Property
Pages dialog box appears.
\2. In the left pane, select the General tab in the Common Properties folder.
\3. From the Startup object list, choose MyNewService (for a Visual Basic project),
or MyNewService.MyNewService (for a Visual C# project). ClickOK.
\4. Press CTRL+SHIFT+B to build the project.
Now that the project is built, it can be deployed. A setup project will install the compiled project files and run the
installers needed to run the Windows service. To create a complete setup project you will need to add the project
output, MyNewService.exe, to the setup project and then add a custom action to have MyNewService.exe installed. For
more information on setup projects, see Setup Projects. For more information on custom actions, seeWalkthrough:
Creating a Custom Action.
To create a setup project for your service
\1. On the File menu, point to Add Project, and then choose New Project.
\2. In the Project Types pane, select the Setup and Deployment Projects folder.
\3. In the Templates pane, select Setup Project. Name the project MyServiceSetup.
A setup project is added to the solution.
Next you will add the output from the Windows Service project, MyNewService.exe, to the setup.
To add MyNewService.exe to the setup project
\1. In Solution Explorer, right-click MyServiceSetup, point to Add, then choose Project Output.
The Add Project Output Group dialog box appears.
\2. MyNewService is selected in the Project box.
\3. From the list box, select Primary Output, and click OK.
A project item for the primary output of MyNewService is added to the setup project. Now add a custom action to
install the MyNewService.exe file.
To add a custom action to the setup project
\1. In Solution Explorer, right-click the setup project, point to View, then choose Custom Actions.
The Custom Actions editor appears.
\2. In the Custom Actions editor, right-click the Custom Actions node and choose Add Custom Action.
The Select Item in Project dialog box appears.
\3. Double-click the Application Folder in the list box to open it, select Primary Output from MyNewService (Active),
and click OK.
The primary output is added to all four nodes of the custom actions — Install, Commit, Rollback, and Uninstall.
\4. In Solution Explorer, right-click the MyServiceSetup project and choose Build.
To install the Windows Service
• To install MyEventLog.exe, right-click the setup project in the Solution Explorer and select Install.
To start and stop your service
\1. Open the Services Control Manager by doing one of the following:
• In Windows 2000 Professional, right-click My Computer on the desktop, then click Manage. In
the Computer Management console, expand the Services and Applications node.
\- or -
• In Windows 2000 Server, click Start, point to Programs, click Administrative Tools, and then
click Services.
Note In Windows NT version 4.0, you can open this dialog box from Control Panel.
You should now see MyNewService listed in the Services section of the window.
\2. Select your service in the list, right-click it, and then click Start.
\3. Right-click the service, and then click Stop.
To verify the event log output of your service
\1. Open Server Explorer and access the Event Logs node. For more information, see Working with Event Logs in
Server Explorer.
Note The Servers node of Server Explorer is not available in the Standard Edition of Visual Basic
and Visual C# .NET. For more information, see Visual Basic Standard Edition Features or Visual C#
Standard Edition Features.
\2. Locate the listing for MyNewLog and expand it. You should see entries for the actions your service has performed.
To uninstall your service
• On the Start menu, open Control Panel and click Add/Remove Programs, and then locate your service and
click Uninstall.
• You can also uninstall the program by right-clicking the program icon for the .msi file and selecting Uninstall.
Note If you installed the service on Windows 2000, you will need to reboot the system before you
can reinstall the service. In Windows 2000, services are not completely deleted until the system is
rebooted.
Next Steps
You might also explore the use of a ServiceController component to allow you to send commands to the service you have
installed. For more information on using the ServiceController component, see Monitoring Windows Services.
You can use an installer to create an event log when the application is installed, rather than creating the event log when
the application runs. Additionally, the event log will be deleted by the installer when the application is uninstalled. For
more information, see Walkthrough: Installing an Event Log Component.
Asynchronous Programming with async and await (C#)
You can avoid performance bottlenecks and enhance the overall responsiveness of your application by using asynchronous
programming. However, traditional techniques for writing asynchronous applications can be complicated, making them
difficult to write, debug, and maintain.
Visual Studio 2012 introduced a simplified approach, async programming, that leverages asynchronous support in the .NET
Framework 4.5 and higher as well as in the Windows Runtime. The compiler does the difficult work that the developer
used to do, and your application retains a logical structure that resembles synchronous code. As a result, you get all the
advantages of asynchronous programming with a fraction of the effort.
This topic provides an overview of when and how to use async programming and includes links to support topics that
contain details and examples.
Async Improves Responsiveness
Asynchrony is essential for activities that are potentially blocking, such as when your application accesses the web.
Access to a web resource sometimes is slow or delayed. If such an activity is blocked within a synchronous process, the
entire application must wait. In an asynchronous process, the application can continue with other work that doesn't
depend on the web resource until the potentially blocking task finishes.
The following table shows typical areas where asynchronous programming improves responsiveness. The listed APIs from
the .NET Framework 4.5 and the Windows Runtime contain methods that support async programming.
Application area Supporting APIs that contain async methods
Web access HttpClient, SyndicationClient
Working with files StorageFile, StreamWriter, StreamReader, XmlReader
Working with images MediaCapture, BitmapEncoder, BitmapDecoder
WCF programming Synchronous and Asynchronous Operations
Asynchrony proves especially valuable for applications that access the UI thread because all UI-related activity usually
shares one thread. If any process is blocked in a synchronous application, all are blocked. Your application stops
responding, and you might conclude that it has failed when instead it's just waiting.
When you use asynchronous methods, the application continues to respond to the UI. You can resize or minimize a window,
for example, or you can close the application if you don't want to wait for it to finish.
The async-based approach adds the equivalent of an automatic transmission to the list of options that you can choose
from when designing asynchronous operations. That is, you get all the benefits of traditional asynchronous programming
but with much less effort from the developer.
Async Methods Are Easier to Write
The async and await keywords in C# are the heart of async programming. By using those two keywords, you can use
resources in the .NET Framework or the Windows Runtime to create an asynchronous method almost as easily as you
create a synchronous method. Asynchronous methods that you define by using async and await are referred to as async
methods.
The following example shows an async method. Almost everything in the code should look completely familiar to you. The
comments call out the features that you add to create the asynchrony.
You can find a complete Windows Presentation Foundation (WPF) example file at the end of this topic, and you can
download the sample fromAsync Sample: Example from "Asynchronous Programming with Async and Await".
// Mark the event handler with async so you can use await in it.
private async void StartButton_Click(object sender, RoutedEventArgs e)
{
// Call and await separately.
//Task<int> getLengthTask = AccessTheWebAsync();
//// You can do independent work here.
//int contentLength = await getLengthTask;
int contentLength = await AccessTheWebAsync();
resultsTextBox.Text +=String.Format("\r\nLength of string: {0}.\r\n", contentLength);
}
// Three things to note in the signature:
// - The method has an async modifier.
// - The return type is Task or Task<T>. (See "Return Types" section.)
// Here, it is Task<int> because the return statement returns an integer.
// - The method name ends in "Async."
async Task<int> AccessTheWebAsync()
{
// You need to add a reference to System.Net.Http to declare client.
HttpClient client = new HttpClient();
// GetStringAsync returns a Task<string>. That means that when you await the
// task you'll get a string (urlContents).
Task<string> getStringTask = client.GetStringAsync("http://msdn.microsoft.com");
// You can do work here that doesn't rely on the string from GetStringAsync.
DoIndependentWork();
// The await operator suspends AccessTheWebAsync.
// - AccessTheWebAsync can't continue until getStringTask is complete.
// - Meanwhile, control returns to the caller of AccessTheWebAsync.
// - Control resumes here when getStringTask is complete.
// - The await operator then retrieves the string result from getStringTask.
string urlContents = await getStringTask;
// The return statement specifies an integer result.
// Any methods that are awaiting AccessTheWebAsync retrieve the length value.
return urlContents.Length;
}
If AccessTheWebAsync doesn't have any work that it can do between calling GetStringAsync and awaiting its completion,
you can simplify your code by calling and awaiting in the following single statement.
string urlContents = await client.GetStringAsync();
The following characteristics summarize what makes the previous example an async method.
• The method signature includes an async modifier.
• The name of an async method, by convention, ends with an "Async" suffix.
• The return type is one of the following types:
• Task<TResult> if your method has a return statement in which the operand has type TResult.
• Task if your method has no return statement or has a return statement with no operand.
• Void if you're writing an async event handler.
For more information, see "Return Types and Parameters" later in this topic.
• The method usually includes at least one await expression, which marks a point where the method can't continue
until the awaited asynchronous operation is complete. In the meantime, the method is suspended, and control
returns to the method's caller. The next section of this topic illustrates what happens at the suspension point.
In async methods, you use the provided keywords and types to indicate what you want to do, and the compiler does the
rest, including keeping track of what must happen when control returns to an await point in a suspended method. Some
routine processes, such as loops and exception handling, can be difficult to handle in traditional asynchronous code. In an
async method, you write these elements much as you would in a synchronous solution, and the problem is solved.
For more information about asynchrony in previous versions of the .NET Framework, see TPL and Traditional .NET
Framework Asynchronous Programming.
What Happens in an Async Method
The most important thing to understand in asynchronous programming is how the control flow moves from method to
method. The following diagram leads you through the process.
The numbers in the diagram correspond to the following steps.
\1. An event handler calls and awaits the AccessTheWebAsync async method.
\2. AccessTheWebAsync creates an HttpClient instance and calls the GetStringAsync asynchronous method to
download the contents of a website as a string.
\3. Something happens in GetStringAsync that suspends its progress. Perhaps it must wait for a website to download
or some other blocking activity. To avoid blocking resources, GetStringAsync yields control to its
caller, AccessTheWebAsync.
GetStringAsync returns a Task<TResult> where TResult is a string, and AccessTheWebAsync assigns the task to
the getStringTaskvariable. The task represents the ongoing process for the call to GetStringAsync, with a
commitment to produce an actual string value when the work is complete.
\4. Because getStringTask hasn't been awaited yet, AccessTheWebAsync can continue with other work that doesn't
depend on the final result from GetStringAsync. That work is represented by a call to the synchronous
method DoIndependentWork.
\5. DoIndependentWork is a synchronous method that does its work and returns to its caller.
\6. AccessTheWebAsync has run out of work that it can do without a result
from getStringTask. AccessTheWebAsync next wants to calculate and return the length of the downloaded string,
but the method can't calculate that value until the method has the string.
Therefore, AccessTheWebAsync uses an await operator to suspend its progress and to yield control to the method
that calledAccessTheWebAsync. AccessTheWebAsync returns a Task<int> to the caller. The task represents a
promise to produce an integer result that's the length of the downloaded string.
Note
If GetStringAsync (and therefore getStringTask) is complete before AccessTheWebAsync awaits it, control
remains inAccessTheWebAsync. The expense of suspending and then returning to AccessTheWebAsync would be
wasted if the called asynchronous process (getStringTask) has already completed and AccessTheWebSync doesn't
have to wait for the final result.
Inside the caller (the event handler in this example), the processing pattern continues. The caller might do other
work that doesn't depend on the result from AccessTheWebAsync before awaiting that result, or the caller might
await immediately. The event handler is waiting forAccessTheWebAsync, and AccessTheWebAsync is waiting
for GetStringAsync.
\7. GetStringAsync completes and produces a string result. The string result isn't returned by the call
to GetStringAsync in the way that you might expect. (Remember that the method already returned a task in step
3.) Instead, the string result is stored in the task that represents the completion of the method, getStringTask.
The await operator retrieves the result from getStringTask. The assignment statement assigns the retrieved result
to urlContents.
\8. When AccessTheWebAsync has the string result, the method can calculate the length of the string. Then the work
of AccessTheWebAsync is also complete, and the waiting event handler can resume. In the full example at the
end of the topic, you can confirm that the event handler retrieves and prints the value of the length result.
If you are new to asynchronous programming, take a minute to consider the difference between synchronous and
asynchronous behavior. A synchronous method returns when its work is complete (step 5), but an async method returns a
task value when its work is suspended (steps 3 and 6). When the async method eventually completes its work, the task is
marked as completed and the result, if any, is stored in the task.
For more information about control flow, see Control Flow in Async Programs (C#).
API Async Methods
You might be wondering where to find methods such as GetStringAsync that support async programming. The .NET
Framework 4.5 or higher contains many members that work with async and await. You can recognize these members by
the "Async" suffix that’s attached to the member name and a return type of Task or Task<TResult>. For example,
the System.IO.Stream class contains methods such as CopyToAsync, ReadAsync, and WriteAsync alongside the synchronous
methods CopyTo, Read, and Write.
The Windows Runtime also contains many methods that you can use with async and await in Windows apps. For more
information and example methods, see Quickstart: using the await operator for asynchronous programming, Asynchronous
programming (Windows Store apps), andWhenAny: Bridging between the .NET Framework and the Windows Runtime (C#).
Threads
Async methods are intended to be non-blocking operations. An await expression in an async method doesn’t block the
current thread while the awaited task is running. Instead, the expression signs up the rest of the method as a continuation
and returns control to the caller of the async method.
The async and await keywords don't cause additional threads to be created. Async methods don't require multithreading
because an async method doesn't run on its own thread. The method runs on the current synchronization context and uses
time on the thread only when the method is active. You can use Task.Run to move CPU-bound work to a background
thread, but a background thread doesn't help with a process that's just waiting for results to become available.
The async-based approach to asynchronous programming is preferable to existing approaches in almost every case. In
particular, this approach is better than BackgroundWorker for IO-bound operations because the code is simpler and you
don't have to guard against race conditions.
In combination with Task.Run, async programming is better than BackgroundWorker for CPU-bound operations because
async programming separates the coordination details of running your code from the work that Task.Run transfers to the
threadpool.
async and await
If you specify that a method is an async method by using an async modifier, you enable the following two capabilities.
• The marked async method can use await to designate suspension points. The await operator tells the compiler
that the async method can't continue past that point until the awaited asynchronous process is complete. In the
meantime, control returns to the caller of the async method.
The suspension of an async method at an await expression doesn't constitute an exit from the method,
and finally blocks don’t run.
• The marked async method can itself be awaited by methods that call it.
An async method typically contains one or more occurrences of an await operator, but the absence of await expressions
doesn’t cause a compiler error. If an async method doesn’t use an await operator to mark a suspension point, the method
executes as a synchronous method does, despite the async modifier. The compiler issues a warning for such methods.
async and await are contextual keywords. For more information and examples, see the following topics:
• async (C# Reference)
• await (C# Reference)
Return Types and Parameters
In .NET Framework programming, an async method typically returns a Task or a Task<TResult>. Inside an async method,
an await operator is applied to a task that's returned from a call to another async method.
You specify Task<TResult> as the return type if the method contains a return statement that specifies an operand of
type TResult.
You use Task as the return type if the method has no return statement or has a return statement that doesn't return an
operand.
The following example shows how you declare and call a method that returns a Task<TResult> or a Task.
// Signature specifies Task<TResult>
async Task<int> TaskOfTResult_MethodAsync()
{
int hours;
// Return statement specifies an integer result.
return hours;
}
// Calls to TaskOfTResult_MethodAsync
Task<int> returnedTaskTResult = TaskOfTResult_MethodAsync();
int intResult = await returnedTaskTResult;
// or, in a single statement
int intResult = await TaskOfTResult_MethodAsync();
// Signature specifies Task
async Task Task_MethodAsync()
{
// . . .
// The method has no return statement.
}
// Calls to Task_MethodAsync
Task returnedTask = Task_MethodAsync();
await returnedTask;
// or, in a single statement
await Task_MethodAsync();
Each returned task represents ongoing work. A task encapsulates information about the state of the asynchronous process
and, eventually, either the final result from the process or the exception that the process raises if it doesn't succeed.
An async method can also have a void return type. This return type is used primarily to define event handlers, where
a void return type is required. Async event handlers often serve as the starting point for async programs.
An async method that has a void return type can’t be awaited, and the caller of a void-returning method can't catch any
exceptions that the method throws.
An async method can't declare ref or out parameters, but the method can call methods that have such parameters.
For more information and examples, see Async Return Types (C#). For more information about how to catch exceptions in
async methods, see try-catch (C# Reference).
Asynchronous APIs in Windows Runtime programming have one of the following return types, which are similar to tasks:
• IAsyncOperation, which corresponds to Task<TResult>
• IAsyncAction, which corresponds to Task
• IAsyncActionWithProgress
• IAsyncOperationWithProgress
For more information and an example, see Quickstart: using the await operator for asynchronous programming.
Naming Convention
By convention, you append "Async" to the names of methods that have an async modifier.
You can ignore the convention where an event, base class, or interface contract suggests a different name. For example,
you shouldn’t rename common event handlers, such as Button1_Click.
Related Topics and Samples (Visual Studio)
Title Description Sample
Walkthrough: Accessing the
Web by Using async and
await (C#)
Shows how to convert a synchronous WPF solution to an
asynchronous WPF solution. The application downloads a
series of websites.
Async Sample: Accessing the
Web Walkthrough
How to: Extend the async
Walkthrough by Using
Task.WhenAll (C#)
Adds Task.WhenAll to the previous walkthrough. The use
of WhenAllstarts all the downloads at the same time.
How to: Make Multiple Web
Requests in Parallel by
Using async and await (C#)
Demonstrates how to start several tasks at the same time.
Async Sample: Make
Multiple Web Requests in
Parallel
Async Return Types (C#)
Illustrates the types that async methods can return and
explains when each type is appropriate.
Control Flow in Async
Programs (C#)
Traces in detail the flow of control through a succession of
await expressions in an asynchronous program.
Async Sample: Control Flow
in Async Programs
Fine-Tuning Your Async
Application (C#)
Shows how to add the following functionality to your async
solution:
• Cancel an Async Task or a List of Tasks (C#)
• Cancel Async Tasks after a Period of Time (C#)
• Cancel Remaining Async Tasks after One Is Complete
(C#)
• Start Multiple Async Tasks and Process Them As They
Complete (C#)
Async Sample: Fine Tuning
Your Application
Handling Reentrancy in
Async Apps (C#)
Shows how to handle cases in which an active asynchronous
operation is restarted while it’s running.
WhenAny: Bridging between
the .NET Framework and the
Windows Runtime (C#)
Shows how to bridge between Task types in the .NET
Framework and IAsyncOperations in the Windows Runtime so
that you can useWhenAny<TResult> with a Windows Runtime
method.
Async Sample: Bridging
between .NET and Windows
Runtime (AsTask and
WhenAny)
Async Cancellation: Bridging
between the .NET
Framework and the
Windows Runtime (C#)
Shows how to bridge between Task types in the .NET
Framework and IAsyncOperations in the Windows Runtime so
that you can useCancellationTokenSource with a Windows
Runtime method.
Async Sample: Bridging
between .NET and Windows
Runtime (AsTask &
Cancellation)
Using Async for File Access
(C#)
Lists and demonstrates the benefits of using async and await
to access files.
Task-based Asynchronous
Pattern (TAP)
Describes a new pattern for asynchrony in the .NET
Framework. The pattern is based on
the Task and Task<TResult> types.
Async Videos on Channel 9 Provides links to a variety of videos about async programming.
Complete Example
The following code is the MainWindow.xaml.cs file from the Windows Presentation Foundation (WPF) application that
this topic discusses. You can download the sample from Async Sample: Example from "Asynchronous Programming with
Async and Await".
C#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
// Add a using directive and a reference for System.Net.Http;
using System.Net.Http;
namespace AsyncFirstExample
{
public partial class MainWindow : Window
{
// Mark the event handler with async so you can use await in it.
private async void StartButton_Click(object sender, RoutedEventArgs e)
{
// Call and await separately.
//Task<int> getLengthTask = AccessTheWebAsync();
//// You can do independent work here.
//int contentLength = await getLengthTask;
int contentLength = await AccessTheWebAsync();
resultsTextBox.Text +=String.Format("\r\nLength of the downloaded string: {0}.\r\n", contentLength);
}
// Three things to note in the signature:
// - The method has an async modifier.
// - The return type is Task or Task<T>. (See "Return Types" section.)
// Here, it is Task<int> because the return statement returns an integer.
// - The method name ends in "Async."
async Task<int> AccessTheWebAsync()
{
// You need to add a reference to System.Net.Http to declare client.
HttpClient client = new HttpClient();
// GetStringAsync returns a Task<string>. That means that when you await the
// task you'll get a string (urlContents).
Task<string> getStringTask = client.GetStringAsync("http://msdn.microsoft.com");
// You can do work here that doesn't rely on the string from GetStringAsync.
DoIndependentWork();
// The await operator suspends AccessTheWebAsync.
// - AccessTheWebAsync can't continue until getStringTask is complete.
// - Meanwhile, control returns to the caller of AccessTheWebAsync.
// - Control resumes here when getStringTask is complete.
// - The await operator then retrieves the string result from getStringTask.
string urlContents = await getStringTask;
// The return statement specifies an integer result.
// Any methods that are awaiting AccessTheWebAsync retrieve the length value.
return urlContents.Length;
}
void DoIndependentWork()
{
resultsTextBox.Text += "Working . . . . . . .\r\n";
}
}
}
// Sample Output:
// Working . . . . . . .
// Length of the downloaded string: 41564.
Walkthrough: Accessing the Web by Using async and await (C#)
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
// Add the following using directives, and add a reference for System.Net.Http.
using System.Net.Http;
using System.IO;
using System.Net;
namespace AsyncExampleWPF
{
public partial class MainWindow : Window
{
public MainWindow()
{
InitializeComponent();
}
private async void startButton_Click(object sender, RoutedEventArgs e)
{
startButton.IsEnabled = false;
resultsTextBox.Clear();
await SumPageSizesAsync();
resultsTextBox.Text += "\r\nControl returned to startButton_Click.\r\n";
startButton.IsEnabled = true;
}
private async Task SumPageSizesAsync()
{
List<string> urlList = SetUpURLList();
var total = 0;
foreach (var url in urlList)
{
byte[] urlContents = await GetURLContentsAsync(url);
DisplayResults(url, urlContents);
total += urlContents.Length;
}
resultsTextBox.Text +=
string.Format("\r\n\r\nTotal bytes returned: {0}\r\n", total);
}
private List<string> SetUpURLList()
{
List<string> urls = new List<string>
{
"http://msdn.microsoft.com/library/windows/apps/br211380.aspx",
"http://msdn.microsoft.com",
"http://msdn.microsoft.com/en-us/library/hh290136.aspx",
"http://msdn.microsoft.com/en-us/library/ee256749.aspx",
"http://msdn.microsoft.com/en-us/library/hh290138.aspx",
"http://msdn.microsoft.com/en-us/library/hh290140.aspx",
"http://msdn.microsoft.com/en-us/library/dd470362.aspx",
"http://msdn.microsoft.com/en-us/library/aa578028.aspx",
"http://msdn.microsoft.com/en-us/library/ms404677.aspx",
"http://msdn.microsoft.com/en-us/library/ff730837.aspx"
};
return urls;
}
private async Task<byte[]> GetURLContentsAsync(string url)
{
var content = new MemoryStream();
var webReq = (HttpWebRequest)WebRequest.Create(url);
using (WebResponse response = await webReq.GetResponseAsync())
{
using (Stream responseStream = response.GetResponseStream())
{
await responseStream.CopyToAsync(content);
}
}
return content.ToArray();
}
private void DisplayResults(string url, byte[] content)
{
var bytes = content.Length;
var displayURL = url.Replace("http://", "");
resultsTextBox.Text += string.Format("\n{0,-58} {1,8}", displayURL, bytes);
}
}
}
How to: Extend the async Walkthrough by Using Task.WhenAll (C#)
using System.Net.Http;
using System.IO;
using System.Net;
namespace AsyncExampleWPF_HttpClient_WhenAll
{
public partial class MainWindow : Window
{
public MainWindow()
{
InitializeComponent();
}
private async void startButton_Click(object sender, RoutedEventArgs e)
{
resultsTextBox.Clear();
await SumPageSizesAsync();
resultsTextBox.Text += "\r\nControl returned to startButton_Click.\r\n";
}
private async Task SumPageSizesAsync()
{
List<string> urlList = SetUpURLList();
HttpClient client = new HttpClient() { MaxResponseContentBufferSize = 1000000 };
IEnumerable<Task<int>> downloadTasksQuery = from url in urlList select ProcessURL(url, client);
Task<int>[] downloadTasks = downloadTasksQuery.ToArray();
int[] lengths = await Task.WhenAll(downloadTasks);
int total = lengths.Sum();
resultsTextBox.Text +=string.Format("\r\n\r\nTotal bytes returned: {0}\r\n", total);
}
private List<string> SetUpURLList()
{
List<string> urls = new List<string>
{
"http://msdn.microsoft.com",
"http://msdn.microsoft.com/en-us/library/hh290136.aspx",
"http://msdn.microsoft.com/en-us/library/ee256749.aspx",
"http://msdn.microsoft.com/en-us/library/hh290138.aspx",
"http://msdn.microsoft.com/en-us/library/hh290140.aspx",
"http://msdn.microsoft.com/en-us/library/dd470362.aspx",
"http://msdn.microsoft.com/en-us/library/aa578028.aspx",
"http://msdn.microsoft.com/en-us/library/ms404677.aspx",
"http://msdn.microsoft.com/en-us/library/ff730837.aspx"
};
return urls;
}
async Task<int> ProcessURL(string url, HttpClient client)
{
byte[] byteArray = await client.GetByteArrayAsync(url);
DisplayResults(url, byteArray);
return byteArray.Length;
}
private void DisplayResults(string url, byte[] content)
{
var bytes = content.Length;
var displayURL = url.Replace("http://", "");
resultsTextBox.Text += string.Format("\n{0,-58} {1,8}", displayURL, bytes);
}
}
}
How to: Make Multiple Web Requests in Parallel by Using async and await (C#)
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Net.Http;
namespace AsyncExample_MultipleTasks
{
public partial class MainWindow : Window
{
public MainWindow()
{
InitializeComponent();
}
private async void startButton_Click(object sender, RoutedEventArgs e)
{
resultsTextBox.Clear();
await CreateMultipleTasksAsync();
resultsTextBox.Text += "\r\n\r\nControl returned to startButton_Click.\r\n";
}
private async Task CreateMultipleTasksAsync()
{
HttpClient client =
new HttpClient() { MaxResponseContentBufferSize = 1000000 };
Task<int> download1 =
ProcessURLAsync("http://msdn.microsoft.com", client);
Task<int> download2 =
ProcessURLAsync("http://msdn.microsoft.com/en-us/library/hh156528(VS.110).aspx", client);
Task<int> download3 =
ProcessURLAsync("http://msdn.microsoft.com/en-us/library/67w7t67f.aspx", client);
int length1 = await download1;
int length2 = await download2;
int length3 = await download3;
int total = length1 + length2 + length3;
resultsTextBox.Text +=
string.Format("\r\n\r\nTotal bytes returned: {0}\r\n", total);
}
async Task<int> ProcessURLAsync(string url, HttpClient client)
{
var byteArray = await client.GetByteArrayAsync(url);
DisplayResults(url, byteArray);
return byteArray.Length;
}
private void DisplayResults(string url, byte[] content)
{
var bytes = content.Length;
var displayURL = url.Replace("http://", "");
resultsTextBox.Text += string.Format("\n{0,-58} {1,8}", displayURL, bytes);
}
}
}
TPL and Traditional .NET Framework Asynchronous Programming
The .NET Framework provides the following two standard patterns for performing I/O-bound and compute-bound
asynchronous operations:
• Asynchronous Programming Model (APM), in which asynchronous operations are represented by a pair of
Begin/End methods such asFileStream.BeginRead and Stream.EndRead.
• Event-based asynchronous pattern (EAP), in which asynchronous operations are represented by a method/event
pair that are namedOperationNameAsync and OperationNameCompleted, for
example, WebClient.DownloadStringAsync andWebClient.DownloadStringCompleted. (EAP was introduced in
the .NET Framework version 2.0.)
The Task Parallel Library (TPL) can be used in various ways in conjunction with either of the asynchronous patterns. You
can expose both APM and EAP operations as Tasks to library consumers, or you can expose the APM patterns but use Task
objects to implement them internally. In both scenarios, by using Task objects, you can simplify the code and take
advantage of the following useful functionality:
• Register callbacks, in the form of task continuations, at any time after the task has started.
• Coordinate multiple operations that execute in response to a Begin_ method, by using
the ContinueWhenAll and ContinueWhenAny methods, or the WaitAll method or the WaitAny method.
• Encapsulate asynchronous I/O-bound and compute-bound operations in the same Task object.
• Monitor the status of the Task object.
• Marshal the status of an operation to a Task object by using TaskCompletionSource<TResult>.
Wrapping APM Operations in a Task
Both the System.Threading.Tasks.TaskFactory and System.Threading.Tasks.TaskFactory<TResult> classes provide
several overloads of theTaskFactory.FromAsync and TaskFactory<TResult>.FromAsync methods that let you encapsulate an
APM Begin/End method pair in one Task orTask<TResult> instance. The various overloads accommodate any Begin/End
method pair that have from zero to three input parameters.
For pairs that have End methods that return a value (Function in Visual Basic), use the methods
in TaskFactory<TResult> that create aTask<TResult>. For End methods that return void (Sub in Visual Basic), use the
methods in TaskFactory that create a Task.
For those few cases in which the Begin method has more than three parameters or contains ref or out parameters,
additional FromAsyncoverloads that encapsulate only the End method are provided.
The following example shows the signature for the FromAsync overload that matches
the FileStream.BeginRead and FileStream.EndRead methods. This overload takes three input parameters, as follows.
public Task<TResult> FromAsync<TArg1, TArg2, TArg3>(
Func<TArg1, TArg2, TArg3, AsyncCallback, object, IAsyncResult> beginMethod, //BeginRead
Func<IAsyncResult, TResult> endMethod, //EndRead
TArg1 arg1, // the byte[] buffer
TArg2 arg2, // the offset in arg1 at which to start writing data
TArg3 arg3, // the maximum number of bytes to read
object state // optional state information
)
The first parameter is a Func<T1, T2, T3, T4, T5, TResul           t> delegate that matches the signature of
the FileStream.BeginRead method. The second parameter is a Func<T, TResult>   delegate that takes an IAsyncResult and
returns a TResult. Because EndRead returns an integer, the compiler infers the type of TResult as Int32 and the type of the
task as Task. The last four parameters are identical to those in the FileStream.BeginRead method:
• The buffer in which to store the file data.
• The offset in the buffer at which to begin writing data.
• The maximum amount of data to read from the file.
• An optional object that stores user-defined state data to pass to the callback.
Using ContinueWith for the Callback Functionality
If you require access to the data in the file, as opposed to just the number of bytes, the FromAsync method is not
sufficient. Instead, use Task, whose Result property contains the file data. You can do this by adding a continuation to the
original task. The continuation performs the work that would typically be performed by the AsyncCallback delegate. It is
invoked when the antecedent completes, and the data buffer has been filled. (The FileStream object should be closed
before returning.)
The following example shows how to return a Task that encapsulates the BeginRead/EndRead pair of the FileStream class.
C#
VB
const int MAX_FILE_SIZE = 14000000;
public static Task<string> GetFileStringAsync(string path)
{
FileInfo fi = new FileInfo(path);
byte[] data = null;
data = new byte[fi.Length];
FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read, FileShare.Read, data.Length, true);
//Task<int> returns the number of bytes read
Task<int> task = Task<int>.Factory.FromAsync(
fs.BeginRead, fs.EndRead, data, 0, data.Length, null);
// It is possible to do other work here while waiting
// for the antecedent task to complete.
// ...
// Add the continuation, which returns a Task<string>.
return task.ContinueWith((antecedent) =>
{
fs.Close();
// Result = "number of bytes read" (if we need it.)
if (antecedent.Result < 100)
{
return "Data is too small to bother with.";
}
else
{
// If we did not receive the entire file, the end of the
// data buffer will contain garbage.
if (antecedent.Result < data.Length)
Array.Resize(ref data, antecedent.Result);
// Will be returned in the Result property of the Task<string>
// at some future point after the asynchronous file I/O operation completes.
return new UTF8Encoding().GetString(data);
}
});
}
The method can then be called, as follows.
C#
VB
Task<string> t = GetFileStringAsync(path);
// Do some other work:
// ...
try
{
Console.WriteLine(t.Result.Substring(0, 500));
}
catch (AggregateException ae)
{
Console.WriteLine(ae.InnerException.Message);
}
Providing Custom State Data
In typical IAsyncResult operations, if your AsyncCallback delegate requires some custom state data, you have to pass it in
through the last parameter in the Begin method, so that the data can be packaged into the IAsyncResult object that is
eventually passed to the callback method. This is typically not required when the FromAsync methods are used. If the
custom data is known to the continuation, then it can be captured directly in the continuation delegate. The following
example resembles the previous example, but instead of examining the Result property of the antecedent, the
continuation examines the custom state data that is directly accessible to the user delegate of the continuation.
C#
VB
public Task<string> GetFileStringAsync2(string path)
{
FileInfo fi = new FileInfo(path);
byte[] data = new byte[fi.Length];
MyCustomState state = GetCustomState();
FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read, FileShare.Read, data.Length, true);
// We still pass null for the last parameter because
// the state variable is visible to the continuation delegate.
Task<int> task = Task<int>.Factory.FromAsync(
fs.BeginRead, fs.EndRead, data, 0, data.Length, null);
return task.ContinueWith((antecedent) =>
{
// It is safe to close the filestream now.
fs.Close();
// Capture custom state data directly in the user delegate.
// No need to pass it through the FromAsync method.
if (state.StateData.Contains("New York, New York"))
{
return "Start spreading the news!";
}
else
{
// If we did not receive the entire file, the end of the
// data buffer will contain garbage.
if (antecedent.Result < data.Length)
Array.Resize(ref data, antecedent.Result);
// Will be returned in the Result property of the Task<string>
// at some future point after the asynchronous file I/O operation completes.
return new UTF8Encoding().GetString(data);
}
});
}
Synchronizing Multiple FromAsync Tasks
The static ContinueWhenAll and ContinueWhenAny methods provide added flexibility when used in conjunction with
the FromAsync methods. The following example shows how to initiate multiple asynchronous I/O operations, and then
wait for all of them to complete before you execute the continuation.
C#
VB
public Task<string> GetMultiFileData(string[] filesToRead)
{
FileStream fs;
Task<string>[] tasks = new Task<string>[filesToRead.Length];
byte[] fileData = null;
for (int i = 0; i < filesToRead.Length; i++)
{
fileData = new byte[0x1000];
fs = new FileStream(filesToRead[i], FileMode.Open, FileAccess.Read, FileShare.Read, fileData.Length, true);
// By adding the continuation here, the
// Result of each task will be a string.
tasks[i] = Task<int>.Factory.FromAsync(
fs.BeginRead, fs.EndRead, fileData, 0, fileData.Length, null)
.ContinueWith((antecedent) =>
{
fs.Close();
// If we did not receive the entire file, the end of the
// data buffer will contain garbage.
if (antecedent.Result < fileData.Length)
Array.Resize(ref fileData, antecedent.Result);
// Will be returned in the Result property of the Task<string>
// at some future point after the asynchronous file I/O operation completes.
return new UTF8Encoding().GetString(fileData);
});
}
// Wait for all tasks to complete.
return Task<string>.Factory.ContinueWhenAll(tasks, (data) =>
{
// Propagate all exceptions and mark all faulted tasks as observed.
Task.WaitAll(data);
// Combine the results from all tasks.
StringBuilder sb = new StringBuilder();
foreach (var t in data)
{
sb.Append(t.Result);
}
// Final result to be returned eventually on the calling thread.
return sb.ToString();
});
}
FromAsync Tasks For Only the End Method
For those few cases in which the Begin method requires more than three input parameters, or has ref or out parameters,
you can use theFromAsync overloads, for example, TaskFactory<TResult>.FromAsync(IAsyncResult, Func<IAsync     Result,
TResult>), that represent only the Endmethod. These methods can also be used in any scenario in which you are passed
an IAsyncResult and want to encapsulate it in a Task.
C#
VB
static Task<String> ReturnTaskFromAsyncResult()
{
IAsyncResult ar = DoSomethingAsynchronously();
Task<String> t = Task<string>.Factory.FromAsync(ar, _ =>
{
return (string)ar.AsyncState;
});
return t;
}
Starting and Canceling FromAsync Tasks
The task returned by a FromAsync method has a status of WaitingForActivation and will be started by the system at some
point after the task is created. If you attempt to call Start on such a task, an exception will be raised.
You cannot cancel a FromAsync task, because the underlying .NET Framework APIs currently do not support in-progress
cancellation of file or network I/O. You can add cancellation functionality to a method that encapsulates
a FromAsync call, but you can only respond to the cancellation before FromAsync is called or after it completed (for
example, in a continuation task).
Some classes that support EAP, for example, WebClient, do support cancellation, and you can integrate that native
cancellation functionality by using cancellation tokens.
Exposing Complex EAP Operations As Tasks
The TPL does not provide any methods that are specifically designed to encapsulate an event-based asynchronous
operation in the same way that the FromAsync family of methods wrap the IAsyncResult pattern. However, the TPL does
provide theSystem.Threading.Tasks.TaskCompletionSource<TResult> class, which can be used to represent any arbitrary
set of operations as a Task<TResult>. The operations may be synchronous or asynchronous, and may be I/O bound or
compute-bound, or both.
The following example shows how to use a TaskCompletionSource<TResult> to expose a set of
asynchronous WebClient operations to client code as a basic Task<TResult>. The method lets you enter an array of Web
URLs, and a term or name to search for, and then returns the number of times the search term occurs on each site.
C#
VB
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading;
using System.Threading.Tasks;
public class SimpleWebExample
{
public Task<string[]> GetWordCountsSimplified(string[] urls, string name,
CancellationToken token)
{
TaskCompletionSource<string[]> tcs = new TaskCompletionSource<string[]>();
WebClient[] webClients = new WebClient[urls.Length];
object m_lock = new object();
int count = 0;
List<string> results = new List<string>();
// If the user cancels the CancellationToken, then we can use the
// WebClient's ability to cancel its own async operations.
token.Register(() =>
{
foreach (var wc in webClients)
{
if (wc != null)
wc.CancelAsync();
}
});
for (int i = 0; i < urls.Length; i++)
{
webClients[i] = new WebClient();
\#region callback
// Specify the callback for the DownloadStringCompleted
// event that will be raised by this WebClient instance.
webClients[i].DownloadStringCompleted += (obj, args) =>
{
// Argument validation and exception handling omitted for brevity.
// Split the string into an array of words,
// then count the number of elements that match
// the search term.
string[] words = args.Result.Split(' ');
string NAME = name.ToUpper();
int nameCount = (from word in words.AsParallel()
where word.ToUpper().Contains(NAME)
select word)
.Count();
// Associate the results with the url, and add new string to the array that
// the underlying Task object will return in its Result property.
lock (m_lock)
{
results.Add(String.Format("{0} has {1} instances of {2}", args.UserState, nameCount, name));
// If this is the last async operation to complete,
// then set the Result property on the underlying Task.
count++;
if (count == urls.Length)
{
tcs.TrySetResult(results.ToArray());
}
}
};
\#endregion
// Call DownloadStringAsync for each URL.
Uri address = null;
address = new Uri(urls[i]);
webClients[i].DownloadStringAsync(address, address);
} // end for
// Return the underlying Task. The client code
// waits on the Result property, and handles exceptions
// in the try-catch block there.
return tcs.Task;
}
}
For a more complete example, which includes additional exception handling and shows how to call the method from client
code, see How to: Wrap EAP Patterns in a Task.
Remember that any task that is created by a TaskCompletionSource<TResult> will be started by that TaskCompletionSource
and, therefore, user code should not call the Start method on that task.
Implementing the APM Pattern By Using Tasks
In some scenarios, it may be desirable to directly expose the IAsyncResult pattern by using Begin/End method pairs in
an API. For example, you may want to maintain consistency with existing APIs, or you may have automated tools that
require this pattern. In such cases, you can use Tasks to simplify how the APM pattern is implemented internally.
The following example shows how to use tasks to implement an APM Begin/End method pair for a long-running computebound method.
C#
VB
class Calculator
{
public IAsyncResult BeginCalculate(int decimalPlaces, AsyncCallback ac, object state)
{
Console.WriteLine("Calling BeginCalculate on thread {0}", Thread.CurrentThread.ManagedThreadId);
Task<string> f = Task<string>.Factory.StartNew(_ => Compute(decimalPlaces), state);
if (ac != null) f.ContinueWith((res) => ac(f));
return f;
}
public string Compute(int numPlaces)
{
Console.WriteLine("Calling compute on thread {0}", Thread.CurrentThread.ManagedThreadId);
// Simulating some heavy work.
Thread.SpinWait(500000000);
// Actual implemenation left as exercise for the reader.
// Several examples are available on the Web.
return "3.14159265358979323846264338327950288";
}
public string EndCalculate(IAsyncResult ar)
{
Console.WriteLine("Calling EndCalculate on thread {0}", Thread.CurrentThread.ManagedThreadId);
return ((Task<string>)ar).Result;
}
}
public class CalculatorClient
{
static int decimalPlaces = 12;
public static void Main()
{
Calculator calc = new Calculator();
int places = 35;
AsyncCallback callBack = new AsyncCallback(PrintResult);
IAsyncResult ar = calc.BeginCalculate(places, callBack, calc);
// Do some work on this thread while the calulator is busy.
Console.WriteLine("Working...");
Thread.SpinWait(500000);
Console.ReadLine();
}
public static void PrintResult(IAsyncResult result)
{
Calculator c = (Calculator)result.AsyncState;
string piString = c.EndCalculate(result);
Console.WriteLine("Calling PrintResult on thread {0}; result = {1}", Thread.CurrentThread.ManagedThreadId,
piString);
}
}
Using the StreamExtensions Sample Code
The Streamextensions.cs file, in Samples for Parallel Programming with the .NET Framework 4 on the MSDN Web site,
contains several reference implementations that use Task objects for asynchronous file and network I/O.
SOLID means:
a. Single Responsibility Principle Single Responsibility Principle states that every class should have a single
responsibility. There should never be more than one reason for a class to change.
b. Open/Closed Principle Open/Closed Principle states that software entities should be open for extension, but
closed for modification.
c. Liskov Substitution Principle Liskov Substitution Principle states that code that uses a base class must be able to
substitute a subclass without knowing it.
d. Interface Segregation Principle The Interface Segregation Principle states that classes should not be forced to
implement interfaces they don’t use.
e. Dependency Inversion Principle: Dependency Inversion Principle states that
\1. High-level modules should not depend on low-level modules. Both should depend on abstractions.
\2. Abstractions should not depend on details. Details should depend on abstractions.
CPU bound versus IO bound
A program is CPU bound if it would go faster if the CPU were faster, i.e. it spends the majority of its time simply using
the CPU (doing calculations). A program that computes new digits of π will typically be CPU-bound, it's just crunching
numbers.
A program is I/O bound if it would go faster if the I/O subsystem was faster. Which exact I/O system is meant can vary; I
typically associate it with disk. A program that looks through a huge file for some data will often be I/O bound, since the
bottleneck is then the reading of e data from disk.
What's the difference between the 'ref' and 'out' keywords? ref tells the compiler that the object is initialized before
entering the function, while out tells the compiler that the object will be initialized inside the function. So while ref is
two-ways, out is out-only.
ASP.NET MVC Action Results:
The ASP.NET MVC framework supports several types of action results including:
\1. ViewResult - Represents HTML and markup.
\2. EmptyResult - Represents no result.
\3. RedirectResult - Represents a redirection to a new URL.
\4. JsonResult - Represents a JavaScript Object Notation result that can be used in an AJAX application.
\5. JavaScriptResult - Represents a JavaScript script.
\6. ContentResult - Represents a text result.
\7. FileContentResult - Represents a downloadable file (with the binary content).
\8. FilePathResult - Represents a downloadable file (with a path).
\9. FileStreamResult - Represents a downloadable file (with a file stream).
Question
Is the following SQL good or bad practice from a performance perspective?
Searching for all rows of the year 2012:
CREATE INDEX tbl_idx ON tbl (date_column);
SELECT text, date_column FROM tbl WHERE datepart(yyyy, date_column) = 2012;
Given Answer
Bad practice
There is a major improvement possible.
Explanation
Wrapping the table column in a function renders the index useless for this query. Write queries for continuous periods as
explicit range condition:
SELECT text, date_column FROM tbl
WHERE date_column >= CAST('2012-01-01' AS DATE)
AND date_column < CAST('2013-01-01' AS DATE)
Alternatively, but less desirable: Indexing Computed Columns
Question
Is the following SQL good or bad practice from a performance perspective?
To find the most recent row
CREATE INDEX tbl_idx ON tbl (a, date_column);
SELECT TOP 1 id, date_column
FROM tbl
WHERE a = @a
ORDER BY date_column DESC
Given Answer
Bad practice
There is a major improvement possible.
Explanation
The statement can be executed as an indexed Top-N query. It performs just like a B-Tree traversal only so it's very
efficient.
The trick is that the index supports the where as well as the order by clause. The database uses the index to find the last
entry that matches the where clause and takes it as result. There is no need to actually perform a sort for the order by.
See also: Querying Top-N Rows in my Book SQL Performance Explained
Question
Is the following SQL good or bad practice from a performance perspective?
Two queries, searching by a common column:
CREATE INDEX tbl_idx ON tbl (a, b);
SELECT id, a, b
FROM tbl
WHERE a = @a
AND b = @b;
SELECT id, a, b
FROM tbl
WHERE b = @b;
Given Answer
Bad practice
There is a major improvement possible.
Explanation
The index covers the first query only, the second query cannot use the index to the best extent possible.
Changing the column order makes the index suitable for both queries—without additional overhead. The index should
therefore look like this (columns exchanged):
CREATE INDEX tbl_idx ON tbl (b, a);
See also: Multi-Column Indexes
Question
Is the following SQL troublesome or bulletproof from a performance perspective?
Searching within a string:
CREATE INDEX tbl_idx ON tbl (text);
SELECT id, text
FROM tbl
WHERE text LIKE '%TERM%';
Given Answer
Bulletproof
It will always run fast.
Explanation
LIKE expressions starting with a wildcard cannot use an index to locate the matching entries. There is no simple way to
tune such a query. Use another access path if possible (e.g., additional where conditions). Otherwise consider using a fulltext index.
See also: A visual explanation why SQL's LIKE is slow
Question
How will the change affect query performance?
Current situation, selecting about hundred rows out of a million
CREATE INDEX tbl_idx ON tbl (a, date_column);
SELECT date_column, count(*)
FROM tbl
WHERE a = @a
GROUP BY date_column;
Changed query, selecting about ten rows out of a million
SELECT date_column, count(*)
FROM tbl
WHERE a = @a
AND b = @b
GROUP BY date_column;
Given Answer
The query will be much slower (impact >10%)
Explanation
The query will be much slower—regardless of the data. The original query is executed as an index-only scan. It doesn't
need to access the table because the index covers the entire query—all referenced columns are covered in the index.
Although the additional where clause reduces the number of returned rows, it requires a table access to fetch the column
B, which is not included in the index. That means that the new query cannot run as an index-only scan; it must access the
table as well. This access is additional work that slows the query down—regardless whether the final result is smaller due
to this filter.
How do you create your own dictionary class?
What is the difference between a dictionary class and a hashtable class?
How do you handle errors that occur at the appdomain level?
Your application had an error in production. How will you diagnose what is the cause of that error?
Do you contribute to open source projects? If not, why not?
How do you handle a situation when the architect tells you to do something that you don't agree with?
For C#, On a level of 1 to 10, where do you consider yourself to be at?
What design patterns have you used?
If you had a webservice access into a list and wanted to make the access to that instance available via a singleton
pattern, how would you do it? Where will you write the “lock” construct?
How will you do error handling on a async thread.
Why should we hire you?
• Have deep experience designing, coding, g SQL Server databases
• Design, code, and deliver multi-tier products with web-based, windows-based, mobile-based clients on the
.NET/SQL Server technology stack.
• Develop applications in C# / .NET for high-volume transaction SQL database.
• Take ownership of the technology used on projects and their implementation, and mentor less-experienced staff in
their technical development
• Diagnose and resolve complex issues using innovative approaches.
• Leverage continuous build and automated unit test frameworks.
 Drive the appropriate use & implementation of technology to deliver high quality solutions that delight our
customers.
How would your last boss and colleagues describe you?
Very dependable and honest
Willing to go alone, take the path less travelled.
Very high quality of work.
Can be relied on to do the diagnose and resolve complex issues using innovative approaches, within the technical constraints imposed by the project.
Team Player, a person that can be trusted to tell it as it is, without going “round and round”.
**Closing Questions example:**
Is there any other information you need from me regarding my application?
Do you have any hesitations about me for this position?
How do I compare to my competition?
Is there any reason why I would not be an asset in the job I am interviewing for?
I want to work for your company; can you see any reason how I might not fit into your corporate culture?
Is there anything hindering me from moving forward in the interview process?
Where do I go from here? What are your next steps?
What is your timeframe for making a final decision?
Do you know when I might hear correspondence regarding the next step?

**Behavioural questions:**
**Genuine Questions:**
These are the questions you actually want to know the answers to. Here are a few ideas of questions that are valuable to many candidates:
\1. "How much of your day do you spend coding?"
\2. "How many meetings do you have every week?"
\3. "What is the ratio of testers to developers to program managers? What is the interaction like? How does project planning happen on the team?

**Insightful Questions**
These questions are designed to demonstrate your deep knowledge of programming or technologies, and they also demonstrate your passion for the company or product.
\1. "I noticed that you use technology X. How do you handle problem Y?"
\2. "Why did the product choose to use the X protocol over the Y protocol? I know it has benefits like A, B,C, but many companies choose not to use it because of issue D."
Asking such questions will typically require advance research about the company
**Passion Questions**
These questions are designed to demonstrate your passion for technology. They show that you're interested in learning and will be a strong contributor to the company.
\1. "I'm very interested in scalability. Did you come in with a background in this, or what opportunities are there to learn about it?"
\2. "I'm not familiar with technology X, but it sounds like a very interesting solution. Could you tell me a bit more about how it works?"
Advice when responding to questions.
a. Be Specific,Not Arrogant
b. Limit Details
c. Give Structured Answers
c.1. Nugget First
For example:
• Interviewer: "Tell me about a time you had to persuade a group of people to make a big change."
• Candidate: "Sure, let me tell you about the time when I convinced my school to let undergraduates teach their own courses. Initially, my school had a rule where..."
c.2. S.A.R. (Situation, Action, Result)
The S.A.R. approach means that you start off outlining the situation, then explaining the actions you took, and lastly, describing the result.
Example: "Tell me about a challenging interaction with a teammate."
• Situation:On my operating systems project, I was assigned to work with three other people. While two were great, the third team member didn't contribute much. He stayed quiet during meetings, rarely chipped in during email discussions, and struggled to complete his components.
• Action: One day after class, I pulled him aside to speak about the course and then moved the discussion into talking about the project. I asked him open-ended questions about how he felt it was going and which components he was most excited about tackling. He suggested all the easiest components, and yet offered to do the write-up. I realized then that he wasn't lazy—he was actually just really confused about the project and lacked confidence. I worked with him after that to break down the components into smaller pieces, and I made sure to compliment him a lot on his work to boost his
confidence.
• Result
Common Questions 
**Enterprise Online leasing-next version.**
EOL Pepsi SourceRad Project 5
**Most Challenging** Stabilizing application by increasing code coverage through new unit tests.
custom workflow in application.
**What you learned** ASP.Net MVC, TDD, Dependency Injection, Creating one of a kind application where a custom workflow widget that can be embedded in any webpage,
Stabilizing application by increasing code coverage through new unit tests.
New features of ASP.Net, custom workflow in application, 
Application reuse through common business layer, 
Performance improvement by using ProtoBuf.Net instead of XML serialization and Mutex to lock files when reading and writing.
Complex pocket PC application involving very rigorous performance requirements,
created custom controls for compact framework,
Performance tuning application.
Performance tuning application, removing deadlocks, was one of 5 members recruited by client for maintaining application.
Most Interesting Hardest Bug Enjoyed Most 
**Conflicts with Teammates** 
Conflict with Jeff about client side logging, showing an error message when an error occurs.
Conflict with Chris who was assigned a task and he was unable to complete. Talked to manager about it.

6 Essential C# Interview Questions*
Given an array of ints, write a C# method to total all the values that are even numbers.
There are of course many ways to do this, but two of the most straightforward would be either:
static long TotalAllEvenNumbers(int[] intArray) {
return intArray.Where(i => i % 2 == 0).Sum(i => (long)i);
}
or:
static long TotalAllEvenNumbers(int[] intArray) {
return (from i in intArray where i % 2 == 0 select (long)i).Sum();
}
Here are the key things to look for in the answer:
Does the candidate take advantage of the C# language constructs which make a one-liner solution possible (i.e.,
rather than employing a more lengthy solution which contains a loop, conditional statement, and accumulator)?
Does the candidate consider the possibility of overflow. For example, an implementation such as return
intArray.Where(i => i % 2 == 0).Sum() (regardless of the return type of the function) might be an “obvious” one-line
solution, but the probability of overflow here is high. While the approach used in the answers above of converting
to long doesn’t eliminate the possibility, it makes it a highly unlikely that an overflow exception will occur. Note
that, if the candidate asks about the expected size of the array and the magnitude of its members, he or she is
obviously considering this overflow issue, which is part of what we’re looking to ascertain.
What is the output of the short program below? Explain your answer.
class Program {
static String location;
static DateTime time;
static void Main() {
Console.WriteLine(location == null ? "location is null" : location);
Console.WriteLine(time == null ? "time is null" : time.ToString());
}
}
The output will be:
location is null
1/1/0001 12:00:00 AM
Although both variables are uninitialized, String is a reference type and DateTime is a value type. As a value type,
an unitialized DateTime variable is set to a default value of midnight of 1/1/1 (yup, that’s the year 1 A.D.), not
null.
Is the comparison of time and null in the if statement below valid or not? Why or why not?
static DateTime time;
/* ... */
if (time == null)
{
/* do something */
}
One might think that, since a DateTime variable can never be null (it is automatically initialized to Jan 1, 0001),
the compiler would complain when a DateTime variable is compared to null. However, due to type coercion, the
compiler does allow it, which can potentially lead to headfakes and pull-out-your-hair bugs.
Specifically, the == operator will cast its operands to different allowable types in order to get a common type on
both sides, which it can then compare. That is why something like this will give you the result you expect (as
opposed to failing or behaving unexpectedly because the operands are of different types):
double x = 5.0;
int y = 5;
Console.WriteLine(x == y); // outputs true
However, this can sometimes result in unexpected behavior, as is the case with the comparison of a DateTime
variable and null. In such a case, both the DateTime variable and the null literal can be cast to
Nullable<DateTime>. Therefore it is legal to compare the two values, even though the result will always be false.
Given an instance circle of the following class:
public sealed class Circle {
private double radius;
public double Calculate(Func<double, double> op) {
return op(radius);
}
}
write code to calculate the circumference of the circle, without modifying the Circle class itself.
The preferred answer would be of the form:
circle.Calculate(r => 2 * Math.PI * r);
Since we don’t have access to the private radius field of the object, we tell the object itself to calculate the
circumference, by passing it the calculation function inline.
A lot of C# programmers shy away from (or don’t understand) function-valued parameters. While in this case the
example is a little contrived, the purpose is to see if the applicant understands how to formulate a call to
Calculate which matches the method’s definition.
Alternatively, a valid (though less elegant) solution would be to retrieve the radius value itself from the object and
then perform the calculation with the result:
var radius = circle.Calculate(r => r);
var circumference = 2 * Math.PI * radius;
Either way works. The main thing we’re looking for here is to see that the candidate is familiar with, and
understands how to invoke, the Calculate method.
What is the output of the program below? Explain your answer.
class Program {
private static string result;
static void Main() {
SaySomething();
Console.WriteLine(result);
}
static async Task<string> SaySomething() {
await Task.Delay(5);
result = "Hello world!";
return “Something”;
}
}
Also, would the answer change if we were to replace await Task.Delay(5); with Thread.Sleep(5)? Why or why not?
The answer to the first part of the question (i.e., the version of the code with await Task.Delay(5);) is that the
program will just output a blank line (not “Hello world!”). This is because result will still be uninitialized when
Console.WriteLine is called.
Most procedural and object-oriented programmers expect a function to execute from beginning to end, or to a
return statement, before returning to the calling function. This is not the case with C# async functions. They only
execute up until the first await statement, then return to the caller. The function called by await (in this case
Task.Delay) is executed asynchronously, and the line after the await statement isn’t signaled to execute until
Task.Delay completes (in 5 milliseconds). However, within that time, control has already returned to the caller,
which executes the Console.WriteLine statement on a string that hasn’t yet been initialized.
Calling await Task.Delay(5) lets the current thread continue what it is doing, and if it’s done (pending any awaits),
returns it to the thread pool. This is the primary benefit of the async/await mechanism. It allows the CLR to
service more requests with less threads in the thread pool.
Asynchronous programming has become a lot more common, with the prevalence of devices which perform over-the
network service requests or database requests for many activities. C# has some excellent programming constructs
which greatly ease the task of programming asynchronous methods, and a programmer who is aware of them will
produce better programs.
With regard to the second part of the question, if await Task.Delay(5); was replaced with Thread.Sleep(5), the
program would output Hello world!. An async method without at least one await statement in it operates just like a
synchronous method; that is, it will execute from beginning to end, or until it encounters a return statement.
Calling Thread.Sleep() simply blocks the currently running thread, so the Thread.Sleep(5) call just adds 5
milliseconds to the execution time of the SaySomething() method.
What is the output of the program below? Explain your answer.
delegate void Printer();
static void Main()
{
List printers = new List();
for (int i = 0; i < 10; i++)
{
printers.Add(delegate { Console.WriteLine(i); });
}
foreach (var printer in printers)
{
printer();
}
}
This program will output the number 10 ten times.
Here’s why: The delegate is added in the for loop and “reference” (or perhaps “pointer” would be a better choice
of words) to i is stored, rather than the value itself. Therefore, after we exit the loop, the variable i has been set
to 10, so by the time each delegate is invoked, the value passed to all of them is 10.
Catching Unhandled Exceptions in ASP.NET
There are various methods that can be used to catch unhandled exceptions in an ASP.NET application. The appropriate
method to use depends on the nature of the exception being thrown. This post walks through several examples to
demonstrate several different types of “unhandled” exceptions and how to catch them.
This investigation into unhandled exceptions was initiated by a stack overflow exception being thrown in a production
application. That type of error proved to be the most challenging “unhandled exception” to handle, not least because of
some incomplete or unclear documentation.
The following examples were tested in an ASP.NET WebForms (yes, boring old WebForms) application compiled
with ASP.NET 4.0 and hosted with IIS 7.5 on Windows 7.
One type of “unhandled exception” is an exception thrown by a section of code that is not wrapped in a try-catch block.
These types of exceptions can be caught by adding an exception handler to the Application_Error event in
the global.asax file of a web application.
Most ASP.NET developers are familiar with the Application_Error event. The following example shows an implementation
of this event handler that catches and logs unhandled exceptions. Notice that the InnerException of the Exception is what
is actually logged. This is because the original exception is wrapped in anHttpUnhandledException by the time it is caught
by the Application_Error event.
void Application_Error(object sender, EventArgs e)
{
Exception ex = Server.GetLastError();
// The original error may have been wrapped in a HttpUnhandledException,
// so we need to log the details of the InnerException.
ex = ex.InnerException ?? ex;
try
{
// Log the error
string errMsg = string.Empty;
if (ex.Message != null) errMsg = "Message:" + ex.Message + "\r\n";
if (ex.StackTrace != null) errMsg += "Stack Trace:" + ex.StackTrace;
// * WRITE TO LOG *
Server.ClearError();
}
catch
{
}
Response.Redirect("~/Error.aspx?err=" + ex.Message, false);
}
A page with a single button can be used to test the Application_Error error handler. The code for the button click event is
shown here.
protected void btnException_Click(object sender, EventArgs e)
{
// This will raise an exception, which we won’t handle here
throw (new Exception("Test Exception"));
}
Another type of unhandled exception is an error (again not wrapped in a try-catch block) that occurs outside the normal
request processing context of the ASP.NET runtime. An example is an error that occurs on another thread. An HttpModule
that registers an event handler for the UnhandledException event of the current AppDomain can be used to catch such
exceptions.
Http Modules are assemblies that are called on every request. In that respect they are similar to ISAPI filters. Unlike
ISAPI filters, they are written in managed code and are integrated with the ASP.NET application life cycle. ASP.NETitself
uses modules to implement features such as forms authentication and caching. In regards to handling exceptions, the
most important feature of http modules is that can consume application events.
The following is the complete code of a class that implements the IHttpModule interface. It includes an event handler for
UnhandledException events.
using System;
using System;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;
using System.Web;
namespace WebMonitor {
public class UnhandledExceptionModule : IHttpModule
{
static int _unhandledExceptionCount = 0;
static string _sourceName = null;
static object _initLock = new object();
static bool _initialized = false;
public void Init(HttpApplication app)
{
// Do this one time for each AppDomain. Verify that we’re on the correct ASP.NET version and
// that the EventLog has been properly configured. If all is well, register an event handler for
// unhandled exceptions.
if (!_initialized) {
lock (_initLock) {
if (!_initialized) {
string webenginePath = Path.Combine(RuntimeEnvironment.GetRuntimeDirectory(),
"webengine.dll");
if (!File.Exists(webenginePath)) {
throw new Exception(String.Format(CultureInfo.InvariantCulture,
"Failed to locate webengine.dll at ‘{0}’. This module requires .NET Framework 2.0.",
webenginePath));
}
FileVersionInfo ver = FileVersionInfo.GetVersionInfo(webenginePath);
_sourceName = string.Format(CultureInfo.InvariantCulture, "ASP.NET {0}.{1}.{2}.0",
ver.FileMajorPart, ver.FileMinorPart, ver.FileBuildPart);
if (!EventLog.SourceExists(_sourceName)) {
throw new Exception(String.Format(CultureInfo.InvariantCulture,
"There is no EventLog source named ‘{0}’. Module requires .NET Framework 2.0.",
_sourceName));
}
AppDomain.CurrentDomain.UnhandledException +=
new UnhandledExceptionEventHandler(OnUnhandledException);
_initialized = true;
}
}
}
}
void OnUnhandledException(object o, UnhandledExceptionEventArgs e)
{
// Let this occur one time for each AppDomain.
if (Interlocked.Exchange(ref _unhandledExceptionCount, 1) != 0) return;
// Build a message containing the exception details
StringBuilder message = new StringBuilder("\r\n\r\nUnhandledException logged by
UnhandledExceptionModule.dll:\r\n\r\nappId=");
string appId = (string) AppDomain.CurrentDomain.GetData(".appId");
if (appId != null) message.Append(appId);
Exception currentException = null;
for (currentException = (Exception)e.ExceptionObject;
currentException != null;
currentException = currentException.InnerException) {
message.AppendFormat("\r\n\r\ntype={0}\r\n\r\nmessage={1}\r\n\r\nstack=\r\n{2}\r\n\r\n",
currentException.GetType().FullName,
currentException.Message,
currentException.StackTrace);
}
// Log the information to the event log
EventLog Log = new EventLog();
Log.Source = _sourceName;
Log.WriteEntry(message.ToString(), EventLogEntryType.Error);
}
}
}
To use the HttpModule within a web application, compile it and register the assembly in the web.config file, as shown
here.
<system.webServer>
<modules runAllManagedModulesForAllRequests="true">
<add type="WebMonitor.UnhandledExceptionModule" name="UnhandledExceptionModule"/>
</modules>
</system.webServer>
Testing this error handler is a bit more difficult, because the test needs to show that exceptions that bypass the
Application_Error event handler are caught by the HttpModule. An error needs to be thrown that is not caught by the
“normal” ASP.NET error pipeline (for example, the Application_Error event).
Again start with a single button on a web page. The click event of the button needs to spawn a thread that throws an
exception which is not wrapped in a try-catch block.. Here is the code for the click event.
protected void btnUnhandled_Click(object sender, EventArgs e)
{
// Queue the task.
ThreadPool.QueueUserWorkItem(new WaitCallback(ThreadProc));
// The Sleep gives the background thread time to run
Thread.Sleep(1000);
}
// This thread procedure performs the task.
static void ThreadProc(Object stateInfo) {
throw (new Exception("Test Unhandled exception"));
}
Because the exception happens on a separate thread, the Application_Error event does not catch it. However, the
HttpModule does.
Note that such an HttpModule exception handler will also catch any exceptions that an Application_Error event handler
in global.asax will catch. So, an HttpModule exception handler can be used in tandem with an Application_Error event
handler , or in place of the Application_Error event.
The final type of unhandled exception to examine is an exception that corrupts the state of the application. Probably the
best-known example of this is a stack overflow. Because they require special handling, it might seem that exceptions like
a StackOverflowException are simply unhandled exceptions that occur outside the normal request processing context
of ASP.NET, just as the error in the previous example. In fact, exceptions that corrupt the state of the application are a
different class of exception entirely, and by definition cannot be caught.
This is true despite conflicting documentation that suggests that http modules can catch such errors, or that the
legacyUnhandledExceptionPolicy setting in the aspnet.config file (located in the framework folder) can be modified to
allow ASP.NET to handle such exceptions in a legacy manner (i.e. like ASP.NET 1.0 and 1.1).
Furthermore, some documentation suggests that stack overflow errors can be caught if the block of code throwing the
error is decorated with
the System.Security.SecurityCritical andSystem.Runtime.ExceptionServices.HandleProcessCorruptedStateExceptions attrib
utes. (This, of course, assumes that you know the block of code throwing the error.)
The following is the codebehind for a page that generates a stack overflow error by calling a recursive function that never
exits. It illustrates the use of the SecurityCritical and HandleProcessCorruptedStateExceptions attributes that are
supposed to allow corrupted state exceptions, including stack overflows, to be caught. The attributes have no effect; the
exceptions are not caught by the try-catch block.
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace UnhandledExceptionWebApp
{
// Attribute doesn’t seem to work as advertised
[System.Security.SecurityCritical]
public partial class StackOverflow : System.Web.UI.Page
{
// Attribute doesn’t seem to work as advertised; the stack overflow is NOT caught
[System.Runtime.ExceptionServices.HandleProcessCorruptedStateExceptions]
protected void Page_Load(object sender, EventArgs e)
{
try
{
this.Overflow(true);
}
catch (Exception ex)
{
Response.Redirect("~/Error.aspx?err=" + ex.Message, false);
}
}
// Recursive function causes stack overflow
private void Overflow(Boolean keepGoing)
{
if (keepGoing) this.Overflow(keepGoing);
}
}
}
In addition, if this page is added to an application that implements the previously discussed Application_Error and
HttpModule event handlers, the stack overflow error is not caught. Even changing the legacyUnhandledExceptionPolicy
setting in the aspnet.config file has no effect. The stack overflow exception is not caught by any of the error handlers. It
seems that all of the documentation that suggests various methods for capturing stack overflow exceptions is incorrect or
misleading.
It appears that there is NO WAY to catch and log a stack overflow error. So, how can a stack overflow exception be
“handled”?
The answer is to use the Debug Diagnostic Tool from Microsoft (the latest version at the time of this writing is 1.2). This
tool includes a debugger service that can capture a dump file when a stack overflow occurs. That file can then be
analyzed to find the code that is causing the stack overflow.
Complete configuration and usage details for the Debug Diagnostic Tool are outside the scope of this post. In brief, the
steps to follow to capture a stack trace when a stack overflow exception occurs are:
1.Install the Debug Diagnostic Tool
2.Create a Rule to capture Stack Overflow exceptions and perform a Log Stack Trace action.
3.Run the web application.
4.Run the Debug Diagnostic Tool.
5.Cause the exception to occur.
For more detailed information, see the documentation of the tool here.
When a stack overflow exception occurs, the Debug Diagnostic Tool will capture a stack trace and write it to a log file. An
example of the log contents can be seen here (with the function call that is producing the stack overflow highlighted):
[9/1/2011 11:10:24 PM] First chance exception – 0xc00000fd caused by thread with System ID: 4004
[9/1/2011 11:10:24 PM] Stack Trace
ChildEBP RetAddr Args to Child
WARNING: Frame IP not in any known module. Following frames may be wrong.
03c5300c 00bc0c74 017751b4 00000000 00000001 0xbc0c6e
03c53020 00bc0c74 017751b4 00000000 00000001 0xbc0c74
03c53034 00bc0c74 017751b4 00000000 00000001 0xbc0c74
… (the preceding line repeated many many times)
…
03c8eccc 00bc0c74 StackOverflowWebApp.StackOverflow.Overflow(Boolean)
03c8ece0 00bc0c74 StackOverflowWebApp.StackOverflow.Overflow(Boolean)
03c8ecf4 00bc0c74 StackOverflowWebApp.StackOverflow.Overflow(Boolean)
… (the preceding line repeated many many times)
…
03c8ed08 00bc0bb5 StackOverflowWebApp.StackOverflow.Page_Load(System.Object, System.EventArgs)
03c8ed54 0116d5cf System.Web.Util.CalliHelper.EventArgFunctionCaller(IntPtr, System.Object, System.Object,
System.EventArgs)
03c8ed64 5d7d5694 System.Web.Util.CalliEventHandlerDelegateProxy.Callback(System.Object, System.EventArgs)
03c8ed78 5d7c8cbc System.Web.UI.Control.OnLoad(System.EventArgs)
03c8ed8c 5d7c8d1b System.Web.UI.Control.LoadRecursive()
03c8eda4 5d7c66e0 System.Web.UI.Page.ProcessRequestMain(Boolean, Boolean)
03c8efcc 5d7c5cad System.Web.UI.Page.ProcessRequest(Boolean, Boolean)
03c8f004 5d7c5bcf System.Web.UI.Page.ProcessRequest()
The log shows a stack trace which positively identifies the part of the code that is throwing the error (the
StackOverflowWebApp.StackOverflow.Overflow(Boolean) method).
Note that the Debug Diagnostic Tool service is set to start automatically. This may not be desirable, especially if the tool
is only needed briefly to debug a particular error. Also, the tool seems to affect the performance of the web site being
debugged. Use this tool carefully, especially if it must be pointed at a production web site.
In summary, unhandled exceptions in an ASP.NET application can be caught with an Application_Error event handler in
the global.asax, or by creating a HttpModule to catch the AppDomain.UnhandledException event. An HttpModule is
required to catch unhandled exceptions that occur outside the normal processing of requests by theASP.NET runtime. For
errors that corrupt the state of the application, such as stack overflow exceptions, use the Debug Diagnostic Tool to
capture a stack trace at the time of the error.
The complete source code for an application that includes all of the examples shown here is available for download.
Please note that the web site should be compiled and hosted under IIS to ensure that the the error handlers will behave
properly. Running the application in debugging mode from within Visual Studio produces different results than you will see
in a production environment. Visual Studio tries to help handle the errors, but that prevents some of the intended event
handlers from working as expected, and does not allow for a complete understanding of how the various error handlers
work outside the development environment.
Chapter 1: Introducing Entity Framework
Q1. Which of these problems does an ORM tool solve?
\1. Types in RDBMS and .NET framework are the same
\2. Impedance mismatch between RDBMS and object-orientated programming
\3. Learning SQL is hard
Q2. Developers must write SQL queries to work with Entity Framework. True or false?
Q3. What is the name of the technology that Entity framework uses to apply structural changes to the target database?
\1. Updates
\2. Conversions
\3. Migrations
Q4. Which is the key class that represents database abstraction with the Entity Framework Code-First approach?
\1. DbContext
\2. ObjectContext
\3. DataContext
Q5. Entity Framework can only work with Microsoft databases, such as SQL Server. True or false?
Q1. Impedance mismatch between RDBMS and object-orientated programming is the main problem that ORM tools solve.
They enable developers to talk to databases in the same way they talk to any other object, using the same programming
language, such as C# or VB.NET.
Q2. This statement is false. LINQ can be used to create queries in Entity Framework,thus enabling developers to use C# or
VB.NET instead of the SQL language.
Q3. Entity Framework Migrations are used to script and apply structural changes to the database, thus moving it from one
version of your software to the next.
Q4. DbContext is the abstraction that represents a database you are working with using Entity Framework Code-First. It
has collection-based properties that represent tables in the database.
Q5. The answer is false. As Entity Framework uses the provider architecture; it can work with any database that has a
provider written for it. At this point, all major database engines are supported, such as MySQL, DB2, and Oracle.
Chapter 2: Your First Entity Framework Application
Q1. What base class can be used to represent a table in a database inside the DbContext collection's property?
\1. List<T>/List(of T)
\2. DbSet<T>/DbSet(of T)
\3. ICollection<T>/ICollection(of T)
Q2. You do not have to call Dispose on DbContext after use, true or false?
Q3. Which method can be used to locate a row in the database using the primary key in Entity Framework?
\1. Find
\2. Locate
\3. Define
Q4. Which method of DbSet can you use after finding a record to delete it?
\1. Delete
\2. Remove
\3. Erase
Q5. You want to easily update the last name of a person in a record stored in the database. You can do so in Entity
Framework by:
\1. Issuing a SQL command
\2. Getting the corresponding object, setting the LastName property, and calling SaveChanges
\3. Creating an instance with the same id and different values for LastName, then adding it to DbSet using the Add method,
and then calling SaveChanges
Q6. You have changed a class that is mapped to a table by adding another property to it. What happens if you set the
database initializer to null and run the program?
\1. All other columns' data is shown
\2. An exception is thrown
\3. The database is changed to match the new schema, but the data is lost
Q1. DbSet<T> is the class you should be using to define a property in your context class that corresponds to a table in your
database. The type parameter T represents a class that defines that table's structure in terms of .NET.
Q2. As DbContext holds an underlying connection to the database, you should utilize the IDisposable pattern and call
Dispose on your context when you are done using it. You can also use the Using keyword to achieve the same.
Q3. The Find method can be used to locate a row in the database. It takes one or more parameters corresponding to the
values of the primary key. If you have a single column that defines the primary key, only one value is needed. Multiple
parameter values are reserved for tables with complex multicolumn primary keys.
Q4. You can use the Remove method and pass in an instance you would like to be deleted from the database when
SaveChanges is called on your context.
Q5. You can just find the corresponding object and set its LastName property to new values. Then, you can call
SaveChanges to commit the updated data to the database. You can use the Find method or LINQ to locate the matching
row in the database. We will see other methods to issue updates in later chapters.
Q6. You will get an exception because no initializer is used. We will see in later chapters how migrations solve this
problem.
Chapter 3: Defining the Database Structure
Q1. You would like to define a column to store a number without a fractional value, but you want to make the value
optional. What .NET type should you use for such property?
\1. Decimal
\2. Decimal?
\3. Int
\4. Int?
Q2. If you want to make the first name column to be non-nullable in the database, you can rely on default conventions in
Entity Framework and avoid all configuration, true or false?
Q3. You cannot override conventions that are preloaded with Entity Framework, such as the one that makes all foreign key
constraints be setup to cascade on delete, true or false?
Q4. Which of the following is not a type of relationship?
\1. One-to-Many
\2. Many-to-Many
\3. One-or-Zero-to-Many => this is One-to-many
\4. Many-to-Default
Q5. The best way to configure all properties in all classes is to list them one by one in OnModelCreating method of the
context, true or false?
Q6. If you do not configure any additional information for string properties, what type will be used in the SQL Server
database?
\1. NVARCHAR(4000)
\2. NVARCHAR(MAX)
\3. VARBINARY(MAX)
\4. VARCHAR(MAX)
Q7. Which is not an appropriate name for the first end in a relationship definition?
\1. Principal
\2. Parent
\3. Domain
Q8. If you want to use a "buddy" class to configure an entity, what class do you need to inherit from?
\1. EntityTypeConfiguration<T> (of T)
\2. PrimitivePropertyConfiguration<T> (of T)
\3. ComplexTypeConfiguration<T> (of T)
\4. EntityConfiguration<T> (of T)
Q1. If you want to make a value optional, you need to use nullable types in Entity Framework. As we need to store an
integer value, the correct answer is Int.
Q2. The statement is false because the string is a nullable type in .NET. Hence, by default the column will be nullable as
well.
Q3. The statement is false. You can remove the conventions from the Entity Framework configuration using the Remove
method on the Conventions collection in the model builder.
Q4. Many-to-Default is not a relationship type. One-to-Many (or One-to-Zero-toMany), One-to-One (or One-to-Zero-toOne), and Many-to-Many are the correct relationship types.
Q5. The answer is false. This approach will become unwieldy if you have many tables in the database.
Q6. By default, Entity Framework will use Unicode types, such as nvarchar for string properties. As there are no
constraints on the string property, the correct type will be nvarchar(max).
Q7. Domain is not a relationship type.
Q8. EntityTypeConfiguration is the correct "buddy" class to be used to configure persistence for an entity.
Chapter 4: Querying, Inserting, Updating, and Deleting Data
Q1. LINQ supports two types of query syntaxes—method, which looks like any other method calls in your programming
language, and Query, which resembles SQL in its appearance.
Q2. The answer is false. If an entity is tracked by the context after retrieval, all changes are tracked individually. Hence,
Entity Framework will create an update
query that only includes columns/properties touched by the code after the entity
in question was retrieved.
Q3. Only the first property in the sort order is specified by the OrderBy method; all
subsequent ones should be specified by the ThenBy method calls.
Q4. In order to specify multiple conditions, you need to use logical operators in a
single Where method.
Q5. All of the approaches are valid, although you may find that the AddRange is a bit
more readable.
Q6. The answer is false. Insert operations are different from other operations. You
can add a root entity to its DbSet, and all child entities are assumed to be in new state
as well.
Q7. True, since context was not tracking entities prior to the state being set, context
has to assume that all properties have been changed.
Q8. The answer is false. If you want to issue a delete query, you need to attach
an entity instead of adding it in order to simulate an existing entity in the
unchanged state.
www.it-ebooks.info
Answers to Self-test Questions
[ 148 ]
Q9. The detached state corresponds to any entity not tracked by the context. Since
it is not tracked, DbContext will not look at this entity when SaveChanges is called.
Entities in the unchanged state will also not result in any queries, but they are
tracked by the context.
Q10. The local property of DbSet will give you access to in-memory data only and
will never result in a database query to look for data.
Chapter 5: Advanced Modeling and
Querying Techniques
Q1. Since we are not creating a new entity, but a complex type, we need to use
ComplexTypeConfiguration of the T base class to configure it.
Q2. The answer is false. We can use the ToTable method in order to configure an
entity to be stored in a table with a name that is different from the class name for
this entity.
Q3. The answer is false. We can use the Ignore method to exclude some properties
from the persistence engine.
Q4. The process of selecting a subset of columns from a table, that is, a subset of
properties from an entity, is called projection.
Q5. We do not have to declare a type for a result set; we can always use
anonymous types.
Q6. We do not have to use joins to get related data in a query, since relationships
exist in properties inside entities. Thus, related data is available inside a query by
walking through these association properties.
Q7. In order to repeat parent entity data along with child data in the result set, we
need to use SelectMany method of LINQ.
Q8. The set operator Distinct can be used to create a set of unique values from
a query.
Q9. We cannot accomplish LEFT OUTER JOIN in LINQ with a single method.
Q10. The Skip and Take methods are used to accomplish paging. The Skip method,
as the name implies, excludes some number of records from the result set, even
though they match the filter. The Take method only takes a specified number
of rows to include in the result set, even though more rows match the filter.
www.it-ebooks.info
Appendix
[ 149 ]
Q11. We can definitely create grouping queries based on multiple properties. We can
typically use the anonymous type to specify which properties the grouped data is
based on.
Chapter 6: Working with Views, Stored
Procedures, the Asynchronous API,
and Concurrency
Q1. Although there is no first class support for views in Entity Framework, we can
always retrieve data from a view using the SqlQuery method.
Q2. The SqlQuery method can be used to call an arbitrary SQL statement, including
calling stored procedures or functions. Entity Framework will materialize the results
based on the generic type provided to this method.
Q3. This is not correct. Insert, update, and delete operations can be automatically
generated by Entity Framework. All we need to do is map an entity to stored
procedures inside an entity type configuration class.
Q4. This is not correct. Arbitrary use of the asynchronous API can result in
performance overhead.
Q5. SaveChangesAsync is the method on DbContext that can be called to flush
changes to the database asynchronously.
Q6. IsRowVersion is the only method called that needs to be made on the property
configuration class to mark a property as concurrency check property.
Q7. DbUpdateConcurrencyException is the correct type to catch from Entity
Framework Code-First to handle concurrency errors.
Chapter 7: Database Migrations and
Additional Features
Q1. This is correct. You have to run the Enable-Migrations commandlet to easily
create all the necessary artifacts to support migrations.
Q2. The answer is false. Some operations, such as setting custom default values,
cannot be done with automatic migrations. Neither can we create non-Entity
Framework objects, such as stored procedures.
www.it-ebooks.info
Answers to Self-test Questions
[ 150 ]
Q3. The answer is false. Entity Framework needs to compare our model, defined
by entity classes and context, with the target database to know what structures
have changed.
Q4. The answer is C—we need to create an empty migration which signals to Entity
Framework that the target structure matches the model.
Q5. This is not correct. We can use the NuGet Package Manager Console window
to run commandlets to maintain a local database.
Q6. The answer is false. The DbMigration class exposes many methods, including
those that create stored procedures.
Q7. The answer is false. We can use conventions or global configuration methods
of DbModelBuilder to achieve this task.
Q8. The answer is false. We can use the Log property of the Database object to log
commands run by Entity Framework against the database.
Q9. The answer is false. We can create LINQ queries and use methods of the
DbGeometry and DbGeography classes to execute native geospatial queries
against the database.  

