

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
order by productname
;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select
id as Order_Id, CompanyName as customer_Company_Name,LastName as employee_Lastname
from [Order]
JOIN employee as E
on [order].employeeid=E.Id
JOIN customer as C
on [order].CustomerId=C.Id
;


-- Find the number of shipments by each shipper. Displays 5654 for Federal, 5572 for Speedy and 5592 for united

select
count([order].id) as shipments_count, CompanyName
from [Order]
JOIN shipper as S
on [order].ShipVia=S.Id
group by companyName
;


-- Find the top 5 best performing employees measured in number of orders. 1964	Janet Leverling, 1918	Nancy Davolio, 1907	Margaret Peacock, 1859	Steven Buchanan, 1849	Michael Suyama

select 
count([order].id) as number_orders, firstname || ' ' || lastname as employee
from [Order]
JOIN employee as E
on [order].employeeid=E.Id
group by employee 
order by number_orders desc
Limit 5
;


-- Find the top 5 best performing employees measured in revenue.


-- Find the category that brings in the least revenue.


-- Find the customer country with the most orders.


-- Find the shipper that moves the most cheese measured in units.