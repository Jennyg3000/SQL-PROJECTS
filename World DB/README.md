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
