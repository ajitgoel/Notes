**Difference betweeen IEnumerable and IQueryable:**
IEnumerable interface is useful when your collection is loaded using LINQ or Entity framework and you want to apply filter on the collection.
Consider the below simple code which uses IEnumerable with entity framework. It’s using a Where filter to get records whose EmpId is 2.

EmpEntities ent = new EmpEntities();
**IEnumerable<Employee>** emp = ent.Employees;
IEnumerable<Employee> temp = emp.Where(x => x.Empid == 2).ToList<Employee>();
This where filter is executed on the client side where the IEnumerable code is. ==In other words all the data is fetched from the database and then at the client its scans and gets the record with EmpId is 2.==

But now see the below code we have changed IEnumerable to IQueryable. ==It creates a SQL Query at the server side and only necessary data is sent to the client side.==

EmpEntities ent = new EmpEntities();
**IQueryable<Employee>** emp = ent.Employees;
IQueryable<Employee> temp = emp.Where(x => x.Empid == 2).ToList<Employee>();
enter image description here

==So if you working with only in-memory data collection IEnumerable is a good choice but if you want to query data collection which is connected with database `IQueryable is a better choice as it reduces network traffic and uses the power of SQL language.==

**SelectMany:** The SelectMany LINQ operator is used in query expressions that have multiple from clauses. It’s called SelectMany because, instead of selecting a single output item for each input item, you provide it with a lambda that produces a whole collection for
each input item.   

int[][] arrays =
{
new[] { 1, 2 },
new[] { 1, 2, 3, 4, 5, 6 },
new[] { 1, 2, 4 },
new[] { 1 },
new[] { 1, 2, 3, 4, 5 }
};  
var flattened = arrays.SelectMany(row => row);  

**What are advantages of LINQ?**
Ans. There are following advantages of using LINQ:
\1. It provides a uniform programming model (i.e. common query syntax) to query data sources (like SQL databases, XML documents, ADO.NET Datasets, Various Web services and any other objects such as Collections, Generics etc.)
\2. It has full type checking at compile-time and IntelliSense support in Visual Studio. This powerful feature helps you to avoid run-time errors.
\3. It supports various powerful features like filtering, ordering and grouping with minimum code.
\4. Its Query can be reused.
\5. It also allows debugging through .NET debugger

**What are disadvantages of LINQ?**
Ans. There are following disadvantages of using LINQ:
==\2. LINQ doesn’t take the full advantage of SQL features like cached execution plan for stored procedure.
\4. If you have done some changes in your query, you have to recompile it and redeploy its dll to the server.==
\1. LINQ is not good to write complex queries like SQL.
\3. Performance is degraded if you don’t write the LINQ query correctly.