**Types Of loading data:**
**Eagerly Loading:** ==Eager loading is the process whereby a query for one type of entity also loads related entities as part of the query. Eager loading is achieved by use of the Include method.==

using (var context = new BloggingContext())
{
    // Load all blogs and related posts
    var blogs1 = context.Blogs.==Include(b => b.Posts)==.ToList();

**Lazy Loading:** ==Lazy loading is the process whereby an entity or collection of entities is automatically loaded from the database the first time that a property referring to the entity/entities is accessed.==

public class Blog
{  
    public int BlogId { get; set; }  
    public string Name { get; set; }  
    public string Url { get; set; }  
    public string Tags { get; set; }  
==//when using the Blog entity class defined below, the related Posts will be loaded the first time the Posts navigation property is accessed:
    public virtual ICollection Posts { get; set; }==
}

**Turn off lazy loading for all entities**

public class BloggingContext : DbContext
{
    public BloggingContext()
    {
        ==this.Configuration.LazyLoadingEnabled = false;==
    }
}

**Explicitly Loading:** You can lazily load related entities with an explicit call by using the Load method on the related entity’s entry.

using (var context = new BloggingContext())
{
    var post = context.Posts.Find(2);
    context.Entry(post).==Reference(p => p.Blog).Load();==

**Reference:** [Querying Related Data](https://docs.microsoft.com/en-us/ef/ef6/querying/related-data)

------

## ==Using Include vs ThenInclude==
=="Include" works well with list of object, but if you need to get multi-level data, then "ThenInclude" is the best fit.== Let me explain it with an example. Say we have two entities, Company and Client:

```cs
public class Company
{
    public string Name { get; set; }
    public string Location { get; set; }
    public List<Client> Clients {get;set;}
}
 public class Client
 {
    public string Name { get; set; }
    public string Domains { get; set; }
    public List<string> CountriesOfOperation { get; set; }
 }
```

Now if you want just companies and the entire client list of that company, you can just use "Include":

```cs
using (var context = new YourContext())
{
  var customers = context.Companies
    .Include(c => c.Clients)
    .ToList();
}
```

But if you want a Company with "CountriesOfOperation" as related data, you can use "ThenInclude" after including Clients like below:

```cs
using (var context = new MyContext())
{
   var customers = context.Companies.Include(i => i.Clients).ThenInclude(a => a.CountriesOfOperation).ToList();
}
```

------

**Code First Approach versus Database First Approach**
**Code First Approach**: In the Code First approach, you focus on the domain of your application and start creating classes for your domain entity to match your database design.
**Database First Approach**: In the Database First approach, you design your database and then generate the domain of your application by reversing engineering the database.

<u>**Entity Framework and Multithreading:**</u>

DataContext are threadsafe, Every thread should use its own DataContext instance.

<u>**Guidelines when deciding on the lifetime of the context:**</u>

When working with Web applications, use a context instance per request.
When working with Windows Presentation Foundation (WPF) or Windows Forms, use a context instance per form. This lets you use change-tracking functionality that context provides.
If the context instance is created by a dependency injection container, it is usually the responsibility of the container to dispose the context.
If the context is created in application code, remember to dispose of the context when it is no longer required.
When working with long-running context consider the following:
As you load more objects and their references into memory, the memory consumption of the context may increase rapidly. This may cause performance issues.
==The context is not thread-safe, therefore it should not be shared across multiple threads doing work on it concurrently.==
If an exception causes the context to be in an unrecoverable state, the whole application may terminate.
==The chances of running into concurrency-related issues increase as the gap between the time when the data is queried and updated grows.==

------

**<u>Improving bulk insert performance:</u>**

**Set:**
yourContext.Configuration.AutoDetectChangesEnabled = false;
yourContext.Configuration.ValidateOnSaveEnabled = false;
**Do `SaveChanges()` in packages of 100 inserts...** or you can try with packages of 1000 items and see the changes in performance.
Since during all this inserts, the context is the same and it is getting bigger, you can **rebuild your context object every 1000 inserts.** `var yourContext = new YourContext();`

------

**Introducing Entity Framework**
Q1. Which of these problems does an ORM tool solve?
\1. Types in RDBMS and .NET framework are the same
**2. Impedance mismatch between RDBMS and object-orientated programming**
\3. Learning SQL is hard

Q2. Developers must write SQL queries to work with Entity Framework. True or **false**?

Q3. What is the name of the technology that Entity framework uses to apply structural changes to the target database?
\1. Updates
\2. Conversions
==3. Migrations==

==Q4. Which is the key class that represents database abstraction with the Entity Framework Code-First approach?==
==1. DbContext==
\2. ObjectContext
\3. DataContext

Q5. Entity Framework can only work with Microsoft databases, such as SQL Server. True or **false**?

**Your First Entity Framework Application**
Q1. What base class can be used to represent a table in a database inside the DbContext collection’s property?
\1. List/List(of T)
**2. DbSet/DbSet(of T)**
\3. ICollection/ICollection(of T)

Q2. You do not have to call Dispose on DbContext after use, true or **false**?

Q3. Which method can be used to locate a row in the database using the primary key in Entity Framework?
**1. Find**
\2. Locate
\3. Define

Q4. Which method of DbSet can you use after finding a record to delete it?
\1. Delete
**2. Remove**
\3. Erase

Q5. You want to easily update the last name of a person in a record stored in the database. You can do so in Entity
Framework by:
1. Issuing a SQL command
**2. Getting the corresponding object, setting the LastName property, and calling SaveChanges**
\3. Creating an instance with the same id and different values for LastName, then adding it to DbSet using the Add method, and then calling SaveChanges

Q6. You have changed a class that is mapped to a table by adding another property to it. What happens if you set the
database initializer to null and run the program?
\1. All other columns’ data is shown
**2. An exception is thrown**
\3. The database is changed to match the new schema, but the data is lost

**Defining the Database Structure**
==Q1. You would like to define a column to store a number without a fractional value, but you want to make the value optional. What .NET type should you use for such property?==
\1. Decimal
\2. Decimal?
==\3. Int4. Int?==

Q2. If you want to make the first name column to be non-nullable in the database, you can rely on default conventions in Entity Framework and avoid all configuration, true or **false?//the string is a nullable type in .NET. Hence, by default the column will be nullable as well.**

Q3. You cannot override conventions that are preloaded with Entity Framework, such as the one that makes all foreign key constraints be setup to cascade on delete, true or **false? //You can remove the conventions from the Entity Framework configuration using the Remove method on the Conventions collection in the model builder.**

Q4. Which of the following is not a type of relationship?
\1. One-to-Many
\2. Many-to-Many
\3. One-or-Zero-to-Many => this is One-to-many
**\4. Many-to-Default**

Q5. The best way to configure all properties in all classes is to list them one by one in OnModelCreating method of the
context, true or **false? //This approach will become unwieldy if you have many tables in the database.**

==Q6. If you do not configure any additional information for string properties, what type will be used in the SQL Server database?==
\1. NVARCHAR(4000)
==\2. NVARCHAR(MAX)==
\3. VARBINARY(MAX)
\4. VARCHAR(MAX)

Q7. Which is not an appropriate name for the first end in a relationship definition?
\1. Principal
\2. Parent
**\3. Domain //Domain is not a relationship type.**

Q8. If you want to use a “buddy” class to configure an entity, what class do you need to inherit from?
**\1. EntityTypeConfiguration (of T) //is the correct “buddy” class to be used to configure persistence for an entity.**
\2. PrimitivePropertyConfiguration (of T)
\3. ComplexTypeConfiguration (of T)
\4. EntityConfiguration (of T)

