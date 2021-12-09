

-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT 
 ProductName, CategoryName
FROM Product AS P
LEFT JOIN Category AS C
ON P.CategoryID = C.ID;


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select
id, CompanyName
from [Order]
JOIN shipper as S
on [order].ShipVia=S.Id
where [order].orderdate < '2012-08-09'
;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select
ProductName, quantity
from Orderdetail as o
Join product as P
on o.ProductId=P.id
where o.id like '%10251%'
;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
