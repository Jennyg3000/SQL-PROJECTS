# Northwind Database SQL Repository 📦🌐

This repository contains the SQL scripts necessary to set up and query the **Northwind sample database**. It is a classic resource for learning relational database concepts, especially focused on sales, orders, and products.

## 🚀 Getting Started: Setup Instructions

The database structure and initial data are provided in `Northwind Database create.sql`.

1.  **Preparation:** Ensure you have a MySQL server instance running.
2.  **Execution:** Run the `Northwind Database create.sql` script.
3.  **Result:** The script will automatically:
    * Drop and recreate a schema named **`NorthWind`**.
    * Create tables including `categories`, `customers`, `employees`, `orders`, `products`, `shippers`, and `suppliers`.
    * Populate all tables using `INSERT INTO` statements.
    * Set up **Primary Keys** and **Foreign Keys** (`REFERENCES`) to define relationships between tables.

***

## 🔎 Database Schema Overview

The Northwind database models a fictional company selling specialty food products.

| Table Name | Description | Key Relationships |
| :--- | :--- | :--- |
| **`categories`** | Defines product categories (e.g., 'Beverages', 'Seafood'). | Linked to `products` |
| **`customers`** | Information on all purchasing clients. | Linked to `orders` |
| **`employees`** | Information on sales staff. | Linked to `orders` |
| **`orders`** | Records of sales transactions. | Links `customers`, `employees`, and `shippers` |
| **`products`** | Inventory and pricing data. | Links `categories` and `suppliers` |
| **`shippers`** | Defines shipping companies used for orders. | Linked to `orders` |
| **`suppliers`** | Information on product vendors. | Linked to `products` |

***

## 🔗 Key Relationships (Foreign Keys) 🤝

这些关系通过外键（Foreign Keys）将数据连接起来，是执行连接查询（JOINs）的基础。

| Source Table (Child) | Foreign Key | References (Parent Table) | Relationship Type |
| :--- | :--- | :--- | :--- |
| **`products`** | `SupplierID` | `suppliers(SupplierID)` | Many Products to One Supplier |
| **`products`** | `CategoryID` | `categories(CategoryID)` | Many Products to One Category |
| **`orders`** | `CustomerID` | `customers(CustomerID)` | Many Orders to One Customer |
| **`orders`** | `EmployeeID` | `employees(EmployeeID)` | Many Orders to One Employee |
| **`orders`** | `ShipperID` | `shippers(ShipperID)` | Many Orders to One Shipper |
| **`order_details`** | `OrderID` | `orders(OrderID)` | Many Details to One Order |
| **`order_details`** | `ProductID` | `products(ProductID)` | Many Details to One Product |

***

## 💡 Key SQL Commands and Functions

The query files (`Northwind Database Basic Queries.sql` and `Northwind Classwork Joins and Group By.sql`) demonstrate various essential SQL concepts.

### 1. Basic Retrieval & Setup ⚙️

| Command/Clause | Description | Example Usage |
| :--- | :--- | :--- |
| **`USE [database]`** | Activates and sets the default schema for subsequent queries. | `USE northwind;` |
| **`SELECT *`** | Selects all columns from the table. | `SELECT * FROM categories;` |
| **`AS`** | Assigns a temporary **alias** (a new name) to a column or table for readability. | `select customerid as ID, customername as Customers` |
| **`--` / `/* */`** | Used to write **comments**. Double dash (`--`) for single-line comments; `/* */` for multi-line comments. | `-- Single Comment line` |

### 2. Filtering and Sorting Data 🎯

| Command/Clause | Description | Example Usage |
| :--- | :--- | :--- |
| **`WHERE`** | Filters the records to include only those that satisfy a specified condition. | `WHERE Country = 'Mexico'` |
| **`AND / OR / NOT`** | Logical operators used to combine multiple conditions in a `WHERE` clause. | `WHERE Country = 'Germany' OR Country = 'Spain'` |
| **`!=`** | **Not Equal** to a value. | `where city != "Madrid"` |
| **`LIKE`** | Used in a `WHERE` clause to search for a specified **pattern** in a column. | `where productname like "%choco%"` |
| **`%` (Wildcard)** | Represents any sequence of zero or more characters when used with `LIKE`. | `"%choco%"` finds "Chocolade" or "Chocolate". |
| **`IN`** | Specifies multiple possible values for a column. | `where city in("Berlin","Paris","Madrid")` |
| **`BETWEEN`** | Selects values within a specified range, inclusive. | `WHERE Price BETWEEN 10 AND 20` |
| **`ORDER BY`** | Sorts the result set by one or more columns. | `ORDER BY Country desc, city, customerid desc` |
| **`DESC` / `ASC`** | Specifies sorting order: **`DESC`** for descending (high-to-low), **`ASC`** for ascending (low-to-high, default). | `order by price desc` |
| **`LIMIT`** | Restricts the number of rows returned by the query, often used to find "Top N" results. | `LIMIT 3` |

### 3. Aggregate Functions & Grouping 🔢

| Function/Clause | Description | Example Usage |
| :--- | :--- | :--- |
| **`COUNT()`** | Returns the number of rows that match a specified criterion. | `select count(distinct city) from customers;` |
| **`DISTINCT`** | Used inside `SELECT` or `COUNT()` to return only unique values. | `SELECT DISTINCT Country FROM Customers;` |
| **`SUM()`** | Calculates the total sum of a numeric column. | `SUM(od.Quantity * p.Price) AS TotalSales` |
| **`AVG()`** | Calculates the average value of a numeric column. | `select avg(price) from products;` |
| **`MIN()` / `MAX()`** | Finds the lowest (`MIN`) or highest (`MAX`) value in a column. | `select min(price) from products;` |
| **`GROUP BY`** | Groups rows that have the same values in specified columns into a single summary row. | `GROUP BY p.ProductName` |

### 4. Combining Tables (Joins) 🤝

| Command/Clause | Description | Example Usage |
| :--- | :--- | :--- |
| **`INNER JOIN` / `JOIN`** | Returns records that have matching values in **both** tables. `JOIN` defaults to `INNER JOIN`. | `FROM orders inner join customers` |
| **`ON`** | Specifies the condition for joining two tables, typically linking the foreign key to the primary key. | `ON orders.customerid = customers.customerid` |

### 5. String Functions 📝

| Function | Description | Example Usage |
| :--- | :--- | :--- |
| **`CONCAT_WS()`** | Concatenates two or more strings, separating them with a specified **W**ith **S**eparator string. | `select concat_ws(", ", firstname, lastname) as employee...` |
