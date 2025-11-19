SELECT * FROM categories;
USE northwind;
SELECT * FROM SUPPLIERS;
select CUSTOMERNAME, CITY, COUNTRY FROM CUSTOMERS;
SELECT PRODUCTID, PRODUCTNAME FROM PRODUCTS;
SELECT COUNT(DISTINCT COUNTRY) FROM CUSTOMERS;
SELECT COUNT(DISTINCT CITY) FROM CUSTOMERS; 
SELECT CUSTOMERNAME, ADDRESS, CITY FROM CUSTOMERS;
SELECT DISTINCT CITY FROM SUPPLIERS;
SELECT COUNT(DISTINCT CITY) FROM SUPPLIERS;
SELECT * FROM CUSTOMERS WHERE COUNTRY='Mexico';
SELECT * FROM CUSTOMERS WHERE COUNTRY='UK';
SELECT * FROM PRODUCTS WHERE PRODUCTID=1;
SELECT * FROM CUSTOMERS WHERE CITY='LONDON';
SELECT * FROM PRODUCTS WHERE PRICE> 100;
SELECT * FROM ORDERS WHERE ORDERDATE>'1996-07-30';
SELECT CUSTOMERNAME, CITY, COUNTRY FROM CUSTOMERS WHERE CITY !='MADRID';
SELECT CUSTOMERNAME, CITY, COUNTRY FROM CUSTOMERS WHERE CITY <>'MADRID';
SELECT * FROM CUSTOMERS WHERE COUNTRY='GERMANY' AND CITY='BERLIN';
SELECT * FROM SUPPLIERS WHERE COUNTRY='Japan' AND CITY='TOKYO';
SELECT * FROM CUSTOMERS WHERE CITY='STUTTGART' OR CITY='BERLIN';
SELECT * FROM CUSTOMERS WHERE CUSTOMERNAME LIKE 'A%';
SELECT * FROM CUSTOMERS WHERE CUSTOMERNAME LIKE '%A';
SELECT * FROM CUSTOMERS WHERE CUSTOMERNAME LIKE '%a%';
SELECT * FROM CUSTOMERS WHERE CUSTOMERNAME LIKE '_A%';
SELECT * FROM CUSTOMERS WHERE CUSTOMERNAME LIKE 'A_%';
SELECT * FROM CUSTOMERS WHERE CUSTOMERNAME LIKE 'A%a';
SELECT * FROM CUSTOMERS, ORDERS WHERE CUSTOMERS.CUSTOMERID 
IN (SELECT ORDERS.CustomerID FROM ORDERS);
SELECT DISTINCT C.CustomerID, C.CustomerName, C.City, C.Country 
FROM CUSTOMERS AS C, ORDERS AS O WHERE C.CUSTOMERID=O.CustomerID;


SELECT DISTINCT C.CustomerID, C.CustomerName, C.City, C.Country 
FROM CUSTOMERS AS C, ORDERS AS O 
WHERE C.CUSTOMERID IN (SELECT O.CUSTOMERID FROM ORDERS);
SELECT P.PRODUCTID, P.PRODUCTNAME, P.SUPPLIERID, S.SUPPLIERID, S.SupplierName, S.ContactName, S.Country FROM 
SUPPLIERS AS S, PRODUCTS AS P WHERE S.SUPPLIERID=P.SUPPLIERID;
SELECT * FROM PRODUCTS P, SUPPLIERS S 
WHERE S.SUPPLIERID=P.SUPPLIERID;

SELECT P.PRODUCTNAME, S.SupplierName 
FROM PRODUCTS P JOIN SUPPLIERS S 
WHERE S.SUPPLIERID=P.SUPPLIERID;

SELECT P.ProductID, P.ProductName, S.SupplierName 
FROM Products P JOIN Suppliers S 
WHERE P.SupplierID=S.SupplierID; 

SELECT P.PRODUCTNAME, C.CATEGORYNAME 
FROM CATEGORIES C JOIN PRODUCTS P
WHERE C.CATEGORYID=P.CATEGORYID;

SELECT P.PRODUCTNAME, C.CATEGORYNAME 
FROM CATEGORIES C, PRODUCTS P
WHERE C.CATEGORYID=P.CATEGORYID;




SELECT P.PRODUCTNAME, C.CATEGORYNAME 
FROM CATEGORIES C, PRODUCTS P
WHERE P.CATEGORYID IN (
SELECT C.CATEGORYID FROM CATEGORIES 
WHERE C.CATEGORYNAME LIKE 'Meat/Poultry');

SELECT P.PRODUCTNAME, C.CATEGORYNAME 
FROM CATEGORIES C JOIN PRODUCTS P
ON C.CATEGORYID=P.CATEGORYID
WHERE C.CATEGORYNAME='MEAT/POULTRY';

SELECT P.PRODUCTNAME, C.CATEGORYNAME  
FROM Categories C, Products P 
WHERE C.CategoryID =P.CategoryID AND C.CategoryName='Meat/Poultry';  

SELECT O.OrderID, O.OrderDate, C.CustomerName, concat_ws('.', E.FirstName, E.LastName) as EmployeeName 
FROM Orders O, Customers C, Employees E 
WHERE O.CustomerID = C.CustomerID and O.EmployeeID = E.EmployeeID;

SELECT 
    O.OrderID,
    O.OrderDate,
    C.CustomerName,
    concat_ws(' ', E.FirstName, E.LastName) as EmployeeName
FROM Orders O
JOIN Customers C
    ON O.CustomerID = C.CustomerID
JOIN Employees E
    ON O.EmployeeID = E.EmployeeID;
    
SELECT 
    P.ProductName,
    C.CategoryName,
    S.SupplierName
FROM Products P
JOIN Categories C
    ON P.ProductID = C.CategoryID
JOIN Suppliers S
    ON P.SupplierID = S.SupplierID;
    
Select distinct P.ProductName, P.SupplierID, 
S.SupplierID, S.SupplierName from Products P, Suppliers S 
where P.SupplierID=S.SupplierID;
/*, Categories C  C.CategoryName,*/

Select distinct P.ProductName, P.SupplierID, 
S.SupplierID, S.SupplierName 
from products P, suppliers S where P.SupplierID = S.SupplierID;

Select P.ProductName, P.SupplierID, C.CategoryName,
S.SupplierID, S.SupplierName 
from Products P, Suppliers S, Categories C
where P.SupplierID=S.SupplierID and P.CategoryID=C.CategoryID;

Select P.ProductName, P.SupplierID, C.CategoryName,
S.SupplierID, S.SupplierName 
from Products P join Suppliers S
on P.SupplierID=S.SupplierID
join Categories C
on P.CategoryID=C.CategoryID;

Select P.ProductName, P.SupplierID, C.CategoryName, 
S.SupplierID, S.SupplierName from Products P, Suppliers S, Categories C 
where P.SupplierID=S.SupplierID and P.CategoryID=C.CategoryID;

SELECT O.OrderID, O.OrderDate, C.CustomerName, CONCAT_WS(' ', FirstName, LastName) AS EmployeeName 
FROM Orders O, Customers C, Employees E
WHERE O.CustomerID=C.CustomerID AND O.EmployeeID=E.EmployeeID 
AND O.OrderDate BETWEEN '1996-01-01'AND '1996-12-31';

select * from orders where OrderDate BETWEEN '1996-01-01'AND '1996-12-31';

SELECT O.OrderID, O.OrderDate, C.CustomerName, CONCAT_WS(' ', FirstName, LastName) AS EmployeeName 
FROM Orders O JOIN Customers C
ON O.CustomerID=C.CustomerID 
JOIN Employees E 
ON O.EmployeeID=E.EmployeeID 
WHERE O.OrderDate BETWEEN '1996-01-01'AND '1996-12-31';

SELECT C.CategoryName, COUNT(P.ProductName) AS ProductNumber FROM Products P, Categories C
WHERE C.CategoryID=P.CategoryID GROUP BY C.CategoryName;

SELECT C.CategoryName, COUNT(P.ProductName) AS ProductNumber 
FROM Products P JOIN Categories C
ON C.CategoryID=P.CategoryID GROUP BY C.CategoryName;

SELECT P.ProductName, P.Price, SUM(OD.Quantity) AS TOTALUNIT, SUM(OD.Quantity*P.Price) AS TOTALSALE
FROM Order_details OD, Orders O, Products P
WHERE O.OrderID=OD.OrderID AND P.ProductID=OD.ProductID
GROUP BY P.ProductName, P.Price;

SELECT P.ProductName, P.Price, SUM(OD.Quantity) AS TOTALUNIT, SUM(OD.Quantity*P.Price) AS TOTALSALE
FROM Order_details OD JOIN Orders O
ON O.OrderID=OD.OrderID 
JOIN Products P
ON P.ProductID=OD.ProductID
GROUP BY P.ProductName, P.Price;


select * from orders 
inner join customers on orders.customerid = customers.customerid;

select firstname, lastname, orders.orderid
from employees inner join orders 
on employees.employeeid=orders.employeeid
order by orderid;

select p.productname, s.SupplierName
from products p 
inner join suppliers s
on p.supplierid=s.supplierid
where s.suppliername="
G'Day, Mate";

select o.orderdate, concat_ws(' ', e.firstname, e.lastname) as emplyeename
from orders as o inner join employees as e
where o.EmployeeID=e.EmployeeID;

select o.orderid, o.orderdate, s.shipperName
from orders o
inner join shippers s
on o.shipperid=s.shipperid and s.shipperName= 'Speedy Express';

select p.productname, c.categoryname 
from products p 
inner join categories c
on p.categoryID=c.categoryID;

select p.productname, o.quantity
from order_details o
inner join products p
on p.ProductID=o.ProductID;

select count(customerid), country
from customers
group by country;

select c.CustomerName, o.orderid
from customers c
left join orders o 
on c.CustomerID=o.CustomerID
where o.orderid is null;

select count(o.orderid), s.shippername
from orders o join shippers s
on s.shipperID=o.shipperID 
group by s.shippername;

select count(customerid), country
from customers
group by country;

select count(p.productid) as totalproduct, c.categoryname, sum(od.quantity) as salequantity 
from order_details od join orders o
on od.orderid=o.orderid 
join products p
on od.ProductID=p.ProductID
join categories c
on p.CategoryID=c.CategoryID
group by  c.categoryname;

select e.EmployeeID, count(o.orderid), LastName,FirstName
from orders o join employees e
on o.EmployeeID=e.EmployeeID
group by e.EmployeeID;
