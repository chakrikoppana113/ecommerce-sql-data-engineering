# ecommerce-sql-data-engineering
E-commerce Sales and Customer Analytics database built using MySQL and SQL.
cd "C:\Users\YourName\Desktop\ecommerce-sql-data-engineering"
# E-Commerce Sales & Customer Analytics Database

## Project Overview

This project implements a relational e-commerce database using MySQL and SQL.

The purpose of the project is to analyze customer behavior, product performance, sales revenue, order trends, and category performance.

The project demonstrates SQL skills required for a Junior Data Engineer role.

## Technologies

- MySQL 8+
- SQL
- Git/GitHub

## Database Tables

The database contains five tables:

1. Customers
2. Categories
3. Products
4. Orders
5. Order_Items

## Database Relationships

Customers 1 ---- M Orders

Categories 1 ---- M Products

Orders 1 ---- M Order_Items

Products 1 ---- M Order_Items

## SQL Concepts

The project demonstrates:

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- INNER JOIN
- LEFT JOIN
- Aggregate Functions
- CASE
- String Functions
- Date Functions
- Subqueries
- CTEs
- RANK
- DENSE_RANK
- LAG
- Window Functions
- Views
- Stored Procedures
- Indexes
- EXPLAIN
- Query Optimization

## Business Questions

The project answers questions such as:

- What is the total revenue?
- Which customers spend the most?
- Which products generate the highest revenue?
- Which category generates the most revenue?
- What is the monthly revenue?
- Which customers have never placed an order?
- Which products have never been ordered?
- What are the top products in each category?
- What is the average order value?
- What is the running revenue over time?

## Project Structure

ecommerce-sql-data-engineering/

├── README.md

├── 01_database/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   └── 03_insert_data.sql

├── 02_queries/
│   ├── 01_basic_queries.sql
│   ├── 02_joins_aggregations.sql
│   ├── 03_cte_subqueries.sql
│   ├── 04_window_functions.sql
│   └── 05_date_string_case.sql

├── 03_views/
│   └── 01_sales_summary_view.sql

├── 04_procedures/
│   └── 01_customer_sales_procedure.sql

└── 05_performance/
    └── 01_indexes_and_explain.sql

## How to Run

Run the SQL files in this order:

1. Create database
2. Create tables
3. Insert data
4. Run basic queries
5. Run JOIN and aggregation queries
6. Run CTE and subquery queries
7. Run window-function queries
8. Run date/string/CASE queries
9. Create the sales view
10. Create the stored procedure
11. Create indexes and analyze queries

## Future Azure Extension

This project can later be converted into an Azure Data Engineering pipeline:

MySQL
↓
Azure Data Factory
↓
ADLS Gen2 - Bronze
↓
Azure Databricks / PySpark
↓
Delta Lake - Silver/Gold
↓
Azure Synapse
