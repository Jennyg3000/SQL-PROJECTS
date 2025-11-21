# World Database SQL  🌍📊

This repository contains the SQL dump for the **`world`** database, a classic sample database used for educational and demonstration purposes. It models geographic data, including countries, cities, and languages spoken in those countries.

## 🚀 Getting Started: Setup Instructions

This file is a standard **MySQL ** file. To set up the database:

1.  ✅ Ensure you have a MySQL server running (Version 8.0.19-debug was used for this dump).
2.  🔑 Log in to your MySQL client (e.g., `mysql -u your_user -p`).
3.  ⚙️ Execute the script using the source command:
    ```bash
    mysql -u your_user -p < create world db.sql
    ```
4.  ✨ The script will automatically:
    * Drop the `world` database if it exists (`DROP DATABASE IF EXISTS \`world\``).
    * Create a new database named **`world`** (`CREATE DATABASE \`world\``).
    * Switch to the new database (`USE \`world\``).
    * Create the necessary tables: `city`, `country`, and `countrylanguage`.
    * Populate the tables with data (`INSERT INTO` statements).

***

## 🔎 Database Schema Overview

The database consists of three main tables, with relationships established via Foreign Keys.

### 1. `city` Table 🏙️

This table stores data about individual cities.

| Column Name | Data Type | Key/Constraint | Description |
| :--- | :--- | :--- | :--- |
| **`ID`** | `INT` | **PRIMARY KEY**, AUTO\_INCREMENT | Unique identifier for the city. |
| **`Name`** | `CHAR(35)` | `NOT NULL` | The name of the city. |
| **`CountryCode`** | `CHAR(3)` | **FOREIGN KEY** | The 3-character country code (references `country.Code`). |
| **`District`** | `CHAR(20)` | `NOT NULL` | The district or province the city is located in. |
| **`Population`** | `INT` | `NOT NULL` | The population of the city. |

### 2. `country` Table 🗺️

This table stores comprehensive data about the countries of the world.

| Column Name | Data Type | Key/Constraint | Description |
| :--- | :--- | :--- | :--- |
| **`Code`** | `CHAR(3)` | **PRIMARY KEY** | The unique 3-character country code (e.g., 'USA', 'AFG'). |
| **`Name`** | `CHAR(52)` | `NOT NULL` | The official name of the country. |
| **`Continent`** | `ENUM` | `NOT NULL` | The continent the country belongs to. |
| **`Region`** | `CHAR(26)` | `NOT NULL` | The geographical region (e.g., 'Middle East', 'Nordic Countries'). |
| **`SurfaceArea`** | `DECIMAL(10,2)` | `NOT NULL` | The surface area of the country in km². |
| **`Population`** | `INT` | `NOT NULL` | The total population of the country. |
| **`LifeExpectancy`** | `DECIMAL(3,1)` | `NULL` | Average life expectancy. |
| **`GNP`** | `DECIMAL(10,2)` | `NULL` | Gross National Product. |
| **`LocalName`** | `CHAR(45)` | `NOT NULL` | The local name of the country. |
| **`GovernmentForm`** | `CHAR(45)` | `NOT NULL` | The form of government. |
| **`HeadOfState`** | `CHAR(60)` | `NULL` | The name of the country's head of state. |
| **`Capital`** | `INT` | `NULL` | The `ID` of the capital city (references `city.ID`). |
| **`Code2`** | `CHAR(2)` | `NOT NULL` | The 2-character country code. |

### 3. `countrylanguage` Table 🗣️

This table stores the languages spoken in each country.

| Column Name | Data Type | Key/Constraint | Description |
| :--- | :--- | :--- | :--- |
| **`CountryCode`** | `CHAR(3)` | **FOREIGN KEY** | The 3-character country code (references `country.Code`). |
| **`Language`** | `CHAR(30)` | `NOT NULL` | The name of the language. |
| **`IsOfficial`** | `ENUM` ('T'/'F') | `NOT NULL` | Indicates if the language is an official language (`T`/True, `F`/False). |
| **`Percentage`** | `DECIMAL(4,1)` | `NOT NULL` | The percentage of the country's population that speaks the language. |

***

## 🔗 Key Relationships

The primary relationships between the tables are:

* **One-to-Many (Country to Cities):** 🗺️➡️🏙️ One country can have many cities. The `city.CountryCode` links to `country.Code`.
* **Many-to-One (Languages to Country):** 🗣️➡️🗺️ Many languages are associated with one country. The `countrylanguage.CountryCode` links to `country.Code`.

***

## 💡 SQL Query Examples and Functions (World-TEST.sql)

The `World-TEST.sql` file demonstrates various essential SQL concepts for querying and analyzing the database.

### 1. Basic Retrieval and Aggregation

| SQL Command | Example Query | Explanation |
| :--- | :--- | :--- |
| **`SELECT * FROM`** | `SELECT * FROM CITY;` | Fetches **all columns** (`*`) and **all rows** from the specified table (`CITY`). |
| **`COUNT()`** | `SELECT COUNT(C.ID) AS NumberOfCity...` | An **aggregate function** that counts the number of non-NULL values in a specified column or expression. |
| **`AS`** | `...COUNT(C.ID) AS NumberOfCity...` | Used to assign a **temporary alias** (a new name) to a column, an expression, or a table for readability. |
| **`GROUP BY`** | `...GROUP BY CT.Name;` | Groups rows that have the same values in specified columns into summary rows, often used with aggregate functions like `COUNT()` or `AVG()`. |

### 2. Filtering and Sorting Data

| SQL Command | Example Query | Explanation |
| :--- | :--- | :--- |
| **`WHERE`** | `...WHERE Population > 2000000` | Filters the result set to include only rows that satisfy a specified condition. |
| **`ORDER BY`** | `...ORDER BY Population DESC` | Sorts the result set by a specified column. `DESC` sorts in **descending** order (largest to smallest). `ASC` sorts in **ascending** order (smallest to largest), which is the default. |
| **`LIMIT`** | `...LIMIT 10;` | Restricts the number of rows returned by the query, typically used to fetch the **Top N** results (e.g., the top 10 largest cities). |
| **`LIMIT offset, count`** | `...LIMIT 30, 10;` | Used for **pagination**. Skips the first `offset` (30) rows and then returns the next `count` (10) rows. |
| **`LIKE`** | `WHERE Name like 'Be%';` | Used in the `WHERE` clause to search for a specified pattern in a column. The wildcard `%` matches any sequence of zero or more characters. |
| **`BETWEEN`** | `WHERE Population BETWEEN 500000 AND 1000000` | Selects values within a given range (inclusive). Equivalent to using `>=` and `<=`. |
| **`DISTINCT`** | `SELECT DISTINCT Name...` | Eliminates duplicate rows in the result set, ensuring each unique value appears only once. |

### 3. Joining Tables

| SQL Command | Example Query | Explanation |
| :--- | :--- | :--- |
| **Implicit Join** | `FROM City C, Country CT WHERE C.CountryCode=CT.Code` | A legacy join syntax where tables are listed in `FROM` and the join condition is in `WHERE`. |
| **`JOIN` (Explicit)** | `FROM City C JOIN Country CT ON C.CountryCode=CT.Code` | The modern and preferred join syntax. By default, it performs an **`INNER JOIN`**, returning only rows where the join condition (`ON`) is met in both tables. |
| **`ON`** | `...ON C.CountryCode=CT.Code` | Specifies the condition for joining the tables (i.e., which columns must match). |

### 4. Mathematical Functions and Subqueries

| SQL Command | Example Query | Explanation |
| :--- | :--- | :--- |
| **Arithmetic** | `Population/SurfaceArea AS Population_Dens` | Performs mathematical operations (e.g., division `/`) directly within the `SELECT` statement to create a calculated column (Population Density). |
| **`AVG()`** | `SELECT AVG(GNP/Population) AS Value from country;` | An **aggregate function** that calculates the average value of a numeric column or expression. |
| **Subquery** | `...WHERE (CT.GNP/CT.Population)> (SELECT AVG(GNP/Population) FROM Country)` | A query nested inside another SQL query (usually in the `WHERE` or `FROM` clauses). The inner query executes first, and its result is used by the outer query. This example finds all countries with a per-capita GNP greater than the global average. |

---
*(Above is a visualization of the main SQL query clauses.)*
