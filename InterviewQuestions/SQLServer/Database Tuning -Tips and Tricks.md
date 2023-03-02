a. Avoid loops in your code.  
b. Don’t update a table row if the column value is the same as the value being updated.  
`UPDATE TableName SET ColumnName=@VALUE WHERE ColumnName<>@ValueBeingUpdated`  
c. Use joins instead of correlated subqueries i.e instead of  
`SELECT c.Name, c.City, (SELECT CompanyName FROM Company WHERE ID = c.CompanyID) AS CompanyName FROM Customer c`  
do  
`SELECT c.Name, c.City, co.CompanyName FROM Customer c LEFT JOIN Company co ON c.CompanyID = co.CompanyID`  
d. If you are performing batch inserts of million-plus rows, then drop the SQL indexes before performing the batch inserts and then recreate the indexes.  
e. Use `Exists`instead of `Count.`  
Eg: use  
`IF EXISTS(SELECT FIRSTNAME FROM EMPLOYEES)`  
instead of  
`IF (SELECT COUNT(1) FROM EMPLOYEES) > 0`  
f. select only the columns you need Eg: instead of  
`SELECT * FROM Employees`  
use  
`SELECT FirstName, City, Country FROM Employees`