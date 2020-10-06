A table may have more than one combination of columns that could uniquely identify the rows in a table; each combination is a **candidate key**.

A **clustered index** is a special type of index that reorders the way in which records in the table are physically stored.Therefore table can have only one clustered index.

A **nonclustered index** is a special type of index in which the logical order of the index does not match the physical stored order of the rows on disk.

The ‘**fill factor**‘ option specifies how full SQL Server will make each index page. When there is no free space to insert new row on the index page, SQL Server will create new index page and transfer some rows from the previous page to the new one. This operation is called **page splits**.

**Difference between delete table and truncate**
DELETE TABLE syntax logs the deletes thus make the delete operation slow. TRUNCATE table does not log any information
but it logs information about deallocation of data page of the table so TRUNCATE table is faster as compared to delete table.
√ DELETE table can have criteria while TRUNCATE can not.
√ TRUNCATE table can not trigger.

**What are the different types of triggers in Sql SERVER 2000 ?**
There are two types of triggers :-
√ INSTEAD OF triggers
INSTEAD OF triggers fire in place of the triggering action. For example, if an INSTEAD OF UPDATE trigger exists on the Sales table and an UPDATE statement is executed against the Sales table, the UPDATE statement will not change a row in the sales table. Instead, the UPDATE statement causes the INSTEAD OF UPDATE trigger to be executed, which may or may not modify data in the Sales table.

√ AFTER triggers
AFTER triggers execute following the SQL action, such as an insert, update, or delete. This is the traditional trigger which existed in SQL SERVER. ==INSTEAD OF triggers gets executed automatically before the Primary Key and the Foreign Key constraints are checked, whereas the traditional AFTER triggers gets executed after these constraints are checked. Unlike AFTER triggers, INSTEAD OF triggers can be created on views.==

**Prevent deadlocks in database**
Although deadlocks cannot be completely avoided, following certain coding conventions can minimize the chance ofgenerating a deadlock. Minimizing deadlocks can increase transaction throughput and reduce system overhead because
fewer transactions are rolled back, undoing all the work performed by the transaction or Resubmitted by applications because they were rolled back when deadlocked.
==To help minimize deadlocks:
• Access objects in the same order.
• Avoid user interaction in transactions.
• Keep transactions short and in one batch.
• Use a lower isolation level.
• Use bound connections.==
• Use a row versioning-based isolation level.
• Set READ_COMMITTED_SNAPSHOT database option ON to enable read-committed transactions to use row versioning.
• Use snapshot isolation.

**Access Objects in the Same Order**
If all concurrent transactions access objects in the same order, deadlocks are less likely to occur. For example, if two concurrent transactions obtain a lock on the Supplier table and then on the Part table, one transaction is blocked on the Supplier table until the other transaction is completed. After the first transaction commits or rolls back, the second continues, and a deadlock does not occur. Using stored procedures for all data modifications can standardize the order of accessing objects.

**Avoid User Interaction in Transactions**
Avoid writing transactions that include user interaction, because the speed of batches running without user intervention is much faster than the speed at which a user must manually respond to queries, such as replying to a prompt for a parameter requested by an application. For example, if a transaction is waiting for user input and the user goes to lunch or even home for the weekend, the user delays the transaction from completing. This degrades system throughput because any locks held by the transaction are released only when the transaction is committed or rolled back. Even if a deadlock situation does not arise, other transactions accessing the same resources are blocked while waiting for the transaction to complete.

**Keep Transactions Short and in One Batch**
A deadlock typically occurs when several long-running transactions execute concurrently in the same database. The longer the transaction, the longer the exclusive or update locks are held, blocking other activity and leading to possible deadlock situations. ==Keeping transactions in one batch minimizes network roundtrips during a transaction, reducing possible delays in completing the transaction and releasing locks==

**Use a Lower Isolation Level**
Determine whether a transaction can run at a lower isolation level. Implementing read committed allows a transaction to read data previously read (not modified) by another transaction without waiting for the first transaction to complete. Using a lower isolation level, such as read committed, holds shared locks for a shorter duration than a higher isolation level, such as serializable. This reduces locking contention

**Use Bound Connections**
==Using bound connections, two or more connections opened by the same application can cooperate with each other. Any locks acquired by the secondary connections are held as if they were acquired by the primary connection, and vice versa. Therefore they do not block each other.==

**Use a Row Versioning-based Isolation Level**
When the READ_COMMITTED_SNAPSHOT database option is set ON, a transaction running under read committed isolation
level uses row versioning rather than shared locks during read operations. Note Some applications rely upon locking and blocking behavior of read committed isolation. For these applications, some change is required before this option can be enabled. Snapshot isolation also uses row versioning, which does not use shared locks during read operations. Before a transaction can run under snapshot isolation, the ALLOW_SNAPSHOT_ISOLATION database option must be set ON. Implement these isolation levels to minimize deadlocks that can occur between read and write operations.

The **FULL OUTER JOIN keyword** returns all the rows from the left table (Customers), and all the rows from the right table(Orders). If there are rows in “Customers” that do not have matches in “Orders”, or if there are rows in “Orders” that do not have matches in “Customers”, those rows will be listed as well.

**The SQL UNION Operator**: The UNION operator is used to combine the result-set of two or more SELECT statements. The UNION operator selects only distinct values by default. To allow duplicate values, use the ALL keyword with UNION.
UNION cannot be used to list ALL cities from the two tables. If several customers and suppliers share the same city, each city will only be listed once. **UNION selects only distinct values. Use UNION ALL to also select duplicate values!**

**SQL Injection:**
SQL injection is a technique where malicious users can inject SQL [commands](http://ajitgoel.net/encyclopedia/commands/) into an SQL statement, via web page input.
Injected SQL [commands](http://ajitgoel.net/encyclopedia/commands/) can alter SQL statement and compromise the security of a web application.
To protect a web site from SQL injection attacks use SQL parameters. SQL parameters are values that are added to an SQL query at execution time, in a controlled manner. The SQL engine checks each parameter to ensure that it is correct for its column and are treated literally, and not as part of the SQL to be executed

**GUIDS versus Primary Keys**
**GUID Pros**
Unique across every table, every database, every server
Allows easy merging of records from different databases
Allows easy distribution of databases across multiple servers
You can generate IDs anywhere, instead of having to roundtrip to the database
Most replication scenarios require GUID columns anyway

**GUID Cons**
<u>It is a whopping 4 times larger than the traditional 4-byte index value; this can have serious performance and storage implications if you’re not careful</u>
Cumbersome to debug where userid='{BAE7DF4-DDF-3RG-5TY3E3RF456AS10}’
The generated GUIDs should be partially sequential for best performance (eg, newsequentialid() on SQL 2005) and to
enable use of clustered indexes

------

**Difference between View and materialized view**
For a materialized view, data is persisted into a virtual table which is maintained by SQL Server itself.
**Benefits:**
Commonly used queries can be encapsulated in a view and indexed in order to improve read performance (compare running select from a single table versus, for instance, 5 tables that are joined)
Aggregations can be precomputed and would also improve read performance
**Drawbacks:**
It will certainly impact write performance because with each DML operation, SQL Server will have to update view.
When you’re indexing view, all objects used in view schema cannot be modified till indexed view exists.