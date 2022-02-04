# Shadow Property in Entity Framework Core

Entity Framework Core introduced a new type of property called "Shadow" property which was not exist in EF 6.x.

==Shadow properties are the properties that are not defined in your .NET entity class directly; instead, you configure it for the particular entity type in the entity data model.== They can be configured in the OnModelCreating() method of the context class.

The following figure illustrates the shadow property.

[![img](https://www.entityframeworktutorial.net/Images/efcore/shadow-property.png)](https://www.entityframeworktutorial.net/Images/efcore/shadow-property.png)

As you can see in the above figure, shadow properties are not part of your entity class. So, you cannot access it as you access other properties of an entity. Shadow properties can only be configured for an entity type while building an Entity Data Model and they are also mapped to a database column. The value and state of the shadow properties are maintained purely in the Change Tracker.

Let's understand the practical aspect of the shadow property. Assume that we need to maintain the created and updated date of each record in the database table. You learned [how to set created and modified date of entities in EF Core](https://www.entityframeworktutorial.net/faq/set-created-and-modified-date-in-efcore.aspx) by defining `CreatedDate` and `UpdatedDate` properties in entity classes. Here, we will see how to achieve the same result by using shadow properties without including them in entity classes.

Consider the following `Student` entity class.

```
public class Student
{
    public int StudentID { get; set; }
    public string StudentName { get; set; }
    public DateTime? DateOfBirth { get; set; }
    public decimal Height { get; set; }
    public float Weight { get; set; }
}
```

The above `Student` class does not include `CreatedDate` and `UpdatedDate` properties to maintain created or updated time. We will configure them as shadow properties on the `Student` entity.

## Defining Shadow Property

You can define the shadow properties for an entity type using the Fluent API in the `OnModelCreating()` using the `Property()` method.

The following configure two shadow properties `CreatedDate` and `UpdatedDate` on the `Student` entity.



```
public class SchoolContext : DbContext
{
    public SchoolContext() : base()
    {
    }  
    protected override void OnModelCreating(ModelBuilder modelBuilder) {
        modelBuilder.Entity<Student>().Property<DateTime>("CreatedDate");
        modelBuilder.Entity<Student>().Property<DateTime>("UpdatedDate");
    }
    public DbSet<Student> Students { get; set; }
}
```

As you can see, the `Property()` method is used to configure a shadow property. Specify the name of the shadow property as a string and the type as a generic parameter. If the name specified in the `Property()` method matches the name of an existing property, then the EF Core will configure that existing property as a shadow property rather than introducing a new shadow property.

## Shadow Properties in the Database

Once we define shadow properties, we need to update the database schema because shadow properties will be mapped to the corresponding database column.

To do this, add database migration using the following command in Package Manager Console in Visual Studio.

PM> add-migration <migration-name>
PM> update-database

Now, the `Student` table will include two columns, `CreatedDate` and `UpdatedDate` in SQL Server, as shown below.

[![img](https://www.entityframeworktutorial.net/Images/efcore/shadow-property-in-db.png)](https://www.entityframeworktutorial.net/Images/efcore/shadow-property-in-db.png)

Thus, the database will have corresponding columns even if we haven't included these properties in the `Student` class and configured them as shadow properties.

ADVERTISEMENT

## Access Shadow Property

You can get or set the values of the shadow properties using the `Property()` method of `EntityEntry`. The following code access the value of the shadow property.

```
using (var context = new SchoolContext())
{
    var std = new Student(){ StudentName = "Bill"  };    
    // sets the value to the shadow property
    context.Entry(std).Property("CreatedDate").CurrentValue = DateTime.Now;
    // gets the value of the shadow property
    var createdDate = context.Entry(std).Property("CreatedDate").CurrentValue; 
}
```

However, in our scenario, we want to set the value to these shadow properties automatically on the `SaveChanges()` method, so that we don't have to set them manually on each entity object. So, override the SaveChanges() method in the context class, as shown below.

```
public override int SaveChanges()
{
    var entries = ChangeTracker
        .Entries()
        .Where(e =>
                e.State == EntityState.Added
                || e.State == EntityState.Modified);
    foreach (var entityEntry in entries)
    {
        entityEntry.Property("UpdatedDate").CurrentValue = DateTime.Now;
        if (entityEntry.State == EntityState.Added)
        {
            entityEntry.Property("CreatedDate").CurrentValue = DateTime.Now;
        }
    }
    return base.SaveChanges();
}
```

This will automatically set values to `CreatedDate` and `UpdatedDate` shadow properties.

Now, execute the following code and check the record in the database.

```
using (var context = new SchoolContext())
{
    var std = new Student(){ StudentName = "Bill"  };
    context.Add(std);
    context.SaveChanges();
}
```

The above code will insert the following record with `CreatedDate` and `UpdatedDate` in the `Students` table.

[![img](https://www.entityframeworktutorial.net/Images/efcore/db-record.png)](https://www.entityframeworktutorial.net/Images/efcore/db-record.png)

Thus, by configuring shadow properties, we don't have to include them in the entity class.

## Configuring Shadow Properties on All Entities

You can configure shadow properties on all entities at once, rather than configuring them manually for all.

For example, we can configure `CreatedDate` and `UpdatedDate` on all the entities at once, as shown below.

```
protected override void OnModelCreating(ModelBuilder modelBuilder)
{
    var allEntities = modelBuilder.Model.GetEntityTypes();
    foreach (var entity in allEntities)
    {
        entity.AddProperty("CreatedDate",typeof(DateTime));
        entity.AddProperty("UpdatedDate",typeof(DateTime));
    }
}
```

## When to use shadow properties?

==Shadow properties can be used in two scenarios:==

1. ==When you don't want to expose database columns on the mapped entities,== such as the scenario discussed above.
2. When you don't want to expose foreign key property and want to manage relationship only using navigation properties. The foreign key property will be shadow property and mapped to the database column but will not be exposed as a property of an entity. (In EF Core, if you don't define foreign key property in entity classes then it will automatically generate shadow property for that. You don't need to configure foreign key property manually.)