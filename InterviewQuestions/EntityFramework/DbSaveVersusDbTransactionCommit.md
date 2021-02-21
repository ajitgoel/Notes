# [db.SaveChanges() vs dbTransaction.Commit](https://stackoverflow.com/questions/50844828/ef-db-savechanges-vs-dbtransaction-commit)

I am fairly new to entity framework and I have a doubt on EF's db.SaveChange. From some posts and MSDN I learned that `db.SaveChange` by default does all the changes in transaction. Also there is a way we can create a transaction of our own using `db.Database.BeginTransaction()` ,"db" being my context class object. So I have two questions:

1. What to use & when
2. If I am inserting data to one table whose @@identity is foreign key to my next inserting table, rather than using `db.SaveChange()` to get the @@identity is there any other way (`db.SaveChanges()` is in a user defined transaction scope) and will `db.SaveChanges()` commit my changes to DB

Never had a need for explicit transactions. Unit of work is fine. I suppose there are use cases. See [here](https://msdn.microsoft.com/en-us/library/dn456843(v=vs.113).aspx). – [Steve Greene](https://stackoverflow.com/users/1549450/steve-greene) [Jun 13 '18 at 19:40](https://stackoverflow.com/questions/50844828/ef-db-savechanges-vs-dbtransaction-commit#comment88693519_50844828)

==An explicit transaction is useful when wishing/needing to have multiple 'SaveChanges' inside a single DB transaction==, possibly interleaved with non-EF DB access. It may also be useful in distributed-transaction cases, although DTC can be rather complex and is probably best avoided in most cases.. – [user2864740](https://stackoverflow.com/users/2864740/user2864740) [Jun 13 '18 at 19:56](https://stackoverflow.com/questions/50844828/ef-db-savechanges-vs-dbtransaction-commit#comment88694024_50844828) 

Yes, if you explicitly wrap your context within a transaction such as .Net's TransactionScope, you can retrieve auto-generated IDs from entities after a .SaveChanges() call, without committing the scoped transaction.

```cs
using (var tx = new TransactionScope())
{
  using (var context = new MyDbContext())
  {
     var newEntity = populateNewEntity();
     context.MyEntities.Add(newEntity);
     context.SaveChanges();
     int entityId = newEntity.EntityId; // Fetches the identity value.
  }
} // Rolls back the transaction. Entity not committed.
```

However, operations like this should be avoided unless absolutely necessary, and cautiously. Firstly, the above example is common use of TransactionScope, and the default isolation level of TransactionScope is "Serializable" which is the most pessimistic in terms of locking. Even moderate use of this pattern on systems that have a number of concurrent operations/users will result in deadlocks and performance hits due to lock waits. So if using a TransactionScope, be sure to specify an isolation level.

DTC is useful in scenarios where you want to coordinate commits between databases or other Tx-bound operations. For instance system A is saving changes and needs to coordinate an update/insert with system B through an API. A & B need to be configured to use DTC, but once that is done A can start a transaction, register it with DTC, append the DTC token to the header for B's API, B can find that token, create a ScopedTransaction linked to that token, and commit/rollback based on what A signals. This has an overhead cost meaning transactions on both systems are open longer than usual. If it's necessary then that is a cost of business. If it's not necessary then it is a waste and potential source of headaches.

One other reason that someone might look at using an explicit Tx is when they want to update FK's in a related entity. Creating an order has an option to create a new customer, order has a customer ID so we need to create the customer, get it's ID to set on the Order, then save the order. If the order save fails then the customer creation should roll back.

```cs
using (var tx = new TransactionScope())
{
  using (var context = new MyDbContext())
  {
     var newCustomer = createNewCustomer(); // dummy method to indicate creating a customer entity.
     context.Customers.Add(newCustomer);
     context.SaveChanges();
     var newOrder = createNewOrder(); 
     newOrder.CustomerId = newCustomer.CustomerId;
     context.Orders.Add(newOrder);
     context.SaveChanges();
  }
  tx.Commit();  
} 
```

With EF this scenario should be mitigated by using navigation properties with a relationship between order and customer. In this way you can create a customer, create the order, set the order's Customer reference to the new customer, add the order to the DbContext, and .SaveChanges(). This lets EF take care of going through the order, seeing the referenced customer, inserting that, associating the FK in the order, and committing the changes in one implicit Tx.

```cs
using (var context = new MyDbContext())
{
    var newCustomer = createNewCustomer();
    var newOrder = createNewOrder();
    newOrder.Customer = newCustomer;
    context.Orders.Add(newOrder);
    context.SaveChanges();
}
```

Update: To outline avoiding FK references in your entities... (many-to-one)

EntityTypeConfiguration for Order With FK in entity:

```cs
HasRequired(x => x.Customer)
  .WithMany(x => x.Orders) // Links to an element in the Orders collection of the Customer. If Customer does not have/need an Orders collection then .WithMany()
  .HasForeignKey(x => x.CustomerId); // Maps Order.Customer to use CustomerId property on Order entity.
```

EntityTypeConfiguration for Order With No FK in entity:

```cs
HasRequired(x => x.Customer)
  .WithMany(x => x.Orders)
  .Map(x => x.MapKey("CustomerId")); // Maps Order.Customer to use CustomerId column on underlying Order table. Order entity does not expose a CustomerId.
```

With EF Core -- From memory, may need to be updated.

```cs
HasRequired(x => x.Customer)
  .WithMany(x => x.Orders) // Links to an element in the Orders collection of the Customer. If Customer does not have/need an Orders collection then .WithMany()
  .HasForeignKey("CustomerId"); // Creates a shadow property where Entity does not have a CustomerId property.
```

Both approaches (with or without mapped FK) work the same. The benefit of the second approach is that there is no confusion in the code about how to update or assess the customer reference for the order. For example if you have both a Customer, and a CustomerId on the Order, changing the CustomerId and calling SaveChanges does not move the order to a new customer, only setting the Customer reference. Setting the Customer reference does not automatically update the CustomerId, so any code "getting" the customerId via the CustomerId property on order would still retrieve the old customer reference until the entity is refreshed.

The important thing to using navigation properties is to leverage them with deferred execution or eager-load them efficiently. For example if you want to load a list of orders and include their customer name:

```cs
using (var myContext = new MyDbContext())
{
  var orders = myContext.Orders.Where(x => x.OrderDate >= startDate && x.OrderDate < endDate).ToList();
  return orders;
}
```

** Bad: If this is MVC/Web API the serializer will take the orders collection, and attempting to serialize them hit every navigation property and attempt to load it. This triggers lazy-load calls one-by-one. So if Order has a Customer, that is a hit to the DB /w "SELECT * FROM Customers WHERE CustomerId = 42" If Order has Order lines then "SELECT * FROM OrderLines WHERE OrderLineId = 121", "SELECT * FROM OrderLines WHERE OrderLineId = 122" ... (You might think it'd know to fetch order lines by OrderId, but nope! Huge performance impact returning Entities, just don't do it.

```cs
using (var myContext = new MyDbContext())
{
  var orders = myContext.Orders
    .Include(x => x.Customer)
    .Include(x => x.OrderLines)
    .Where(x => x.OrderDate >= startDate && x.OrderDate < endDate).ToList();
  return orders;
}
```

** Better, but still bad. You might only include the items you think you'll need, but the serializer will still fetch everything on the order. This comes back to bite you as entities are revised to include new links to data. Even if you Include everything this is wasteful if all you wanted was the Customer Name.

```cs
using (var myContext = new MyDbContext())
{
  var orders = myContext.Orders
    .Where(x => x.OrderDate >= startDate && x.OrderDate < endDate)
    .Select(x => new OrderLineViewModel 
    {
      OrderId = x.OrderId,
      OrderNumber = x.OrderNumber,
      OrderAmount = x.OrderAmount,
      CustomerName = x.Customer.Name
    }).ToList();
  return orders;
}
```

** ==This is the sweet spot with navigation properties and deferred execution. The SQL that gets run on the DB returns just those 4 columns from the related data. No lazy load hits, and you send across the wire just the amount of data you need.==

Some might argue that if you commonly need a CustomerId reference from an Order for example that having a CustomerId on the Order entity saves referencing the Customer. But as outlined above, that Id may not be reliable, and by using deferred execution to let EF use the entities to populate the data you want Getting the customer IDs of orders is just a matter of including/selecting `x.Customer.CustomerId` which includes just that desired column, not loading the entire entity to get it.

createNewCustomer() and createNewOrder say returns an entityModel, so when you are assigning order.Customer to the newly created customer object will assign the foreign key? I saw a code from one of my friends where he created the customer object called db.SaveChanges(), then created the order object and assigned customerid from the saved object and finally calling transaction.commit(). is this a bad approach? – [Arjun Menon](https://stackoverflow.com/users/3851706/arjun-menon) [Jun 14 '18 at 3:44](https://stackoverflow.com/questions/50844828/ef-db-savechanges-vs-dbtransaction-commit#comment88701512_50846922)

Yes, when EF is set up to know that the PK's are identity columns (DB will set) and the relationships between Customer and Order, when you add the Order to the DbSet and call SaveChanges, it goes through the entity for mapped associations and inserts those, resolving the FKs automatically. With references you don't set FKs directly and should even exclude them from your entities. (MapKey in EF6 or shadow properties in Core) – [Steve Py](https://stackoverflow.com/users/423497/steve-py) [Jun 14 '18 at 8:42](https://stackoverflow.com/questions/50844828/ef-db-savechanges-vs-dbtransaction-commit#comment88709115_50846922)

With references you don't set FKs directly and should even exclude them from your entities. (MapKey in EF6 or shadow properties in Core) , Can you elaborate ? I have seen FK set using Virtual class. Also my transaction has 10 table insertions , do we need to manually open a transaction or just keep on creating model class and on a single go call db.SaveChanges? – [Arjun Menon](https://stackoverflow.com/users/3851706/arjun-menon) [Jun 14 '18 at 10:48](https://stackoverflow.com/questions/50844828/ef-db-savechanges-vs-dbtransaction-commit#comment88713902_50846922)

Updated the answer to elaborate on that. – [Steve Py](https://stackoverflow.com/users/423497/steve-py) [Jun 14 '18 at 22:03](https://stackoverflow.com/questions/50844828/ef-db-savechanges-vs-dbtransaction-commit#comment88735403_50846922)

- 

  

  How about DB level transactions. Forexample MS SQL Server support many types of transaction. May be you should update your answer with DbContext.Database.BeginTransactionAsync and DbContext.Database.BeginTransaction – [Nuri YILMAZ](https://stackoverflow.com/users/550279/nuri-yilmaz) [Jun 2 '19 at 15:34](https://stackoverflow.com/questions/50844828/ef-db-savechanges-vs-dbtransaction-commit#comment99428702_50846922)

- 

  

  ==All operations within the SaveChanges are performed within a single transaction. The only times you should need explicit transactions or a transaction scope is when dealing with multiple DbContexts (i.e. multiple updates across bounded contexts) or transaction scoped operations in conjunction with the DbContext updates==. These situations are generally the exception, not the norm.