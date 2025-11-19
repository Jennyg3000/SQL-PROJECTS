use northwind;

SELECT data
FROM table1
JOIN table2
ON common field


/* Multiple line comment line are ignored execution */ 
-- Single Comment line
select *
from orders
inner join customers
on orders.customerid = customers.customerid;

select customers.customerid, customers.customername, orders.orderid
from orders
inner join customers
on orders.customerid = customers.customerid;

select customers.customerid, customername, orderid
from orders
inner join customers
on orders.customerid = customers.customerid;
/* if same column name are contained in different table, 
you should mention source table*/

/* Combine Orders and Employees Table*/
select firstname, lastname, orders.orderid
from employees
inner join orders
on employees.employeeid = orders.employeeid;

select firstname, lastname, orderid
from employees
inner join orders
on employees.employeeid = orders.employeeid
order by orderid;

/* Products - Suppliers = G'Day, Mate*/
select Productname, suppliername
from products
inner join suppliers
on products.supplierid = suppliers.supplierid
where suppliername = "G'Day, Mate";


select firstname,lastname,orders.orderid,orders.orderdate 
from employees 
inner join orders 
on orders.employeeid = employees.employeeid; 

SELECT * FROM orders 
INNER JOIN shippers 
ON orders.shipperid = shippers.shipperid 
WHERE ShipperName = 'United Package';

SELECT ProductName, CategoryName 
FROM Products 
INNER JOIN Categories 
ON Products.CategoryID = Categories.CategoryID; 

select products.productid, products.productname, order_details.quantity 
from products 
inner join order_details 
on products.productid = order_details.productid;


select products.productid, products.productname, order_details.quantity 
from order_details 
inner join products
on products.productid = order_details.productid;


SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;
/* all rows returned from employees table, 
only matching rows from orders table.
If there is no match , null values returned.*/

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;
/* return all customers even if they didnt
place any order*/

/*Return only missing values*/
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
where orderid is null;
/* customers with no orders*/

/* alisaing*/
SELECT c.CustomerName, o.OrderID
FROM Customers as c -- rename as c
LEFT JOIN Orders as o -- rename as o
ON c.CustomerID = o.CustomerID
where orderid is null;

SELECT count(*)
FROM Customers
CROSS JOIN Orders;
/* there are 91 rows in customers
multiplied by 196 rows in orders*/

select avg(price), productname
from products;


SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;
/* group by used with aggregated and non-aggragated column.
count(customerid) aggreagated
country non-aggregated*/

/* The following SQL statement lists the number of orders sent by each shipper*/
-- 1) combine shippers to orders details
-- 2) group by shippers
-- 3) count number of orders
select count(orderid) as totalorders, shippername
from shippers as s
inner join orders as o
on s.shipperid = o.shipperid
group by shippername;


SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalSales
FROM Order_Details as od
JOIN Products as p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC;
/* defult is inner join*/


/* Write SQL query to list the number of customers in each country.*/
-- use customers table to count customerid, group by country
select count(customerid) as noofcustomers, country
from customers
group by country;
/* all fields used in group by must be in select*/



/* Write a query to list each product category and 
the total quantity of products sold in that category.*/
select categoryname, sum(quantity) as totalquanity
from categories as c
join products as p
on c.categoryid = p.categoryid
join order_details as od
on od.productid = p.productid
group by categoryname;


/* Write a query to list each employee and 
the number of orders they have handled.*/
select firstname, lastname, count(orderid) as totalorders
from employees as e
join orders as o
on e.employeeid = o.employeeid
group by firstname, lastname;

select concat_ws(", ", firstname, lastname) as employee,
 count(orderid) as totalorders
from employees as e
join orders as o
on e.employeeid = o.employeeid
group by firstname, lastname;