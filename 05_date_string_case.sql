USE ecommerce_sql_project;


-- 1. Orders from 2025

SELECT *
FROM orders
WHERE YEAR(order_date) = 2025;


-- 2. Orders from January to March

SELECT *
FROM orders
WHERE MONTH(order_date) BETWEEN 1 AND 3;


-- 3. Customer names in uppercase

SELECT
    UPPER(customer_name) AS customer_name
FROM customers;


-- 4. Customer names in lowercase

SELECT
    LOWER(customer_name) AS customer_name
FROM customers;


-- 5. Customer name length

SELECT
    customer_name,
    LENGTH(customer_name) AS name_length
FROM customers;


-- 6. Categorize products by price

SELECT
    product_name,
    price,

    CASE
        WHEN price >= 50000 THEN 'Premium'
        WHEN price >= 10000 THEN 'Mid-Range'
        ELSE 'Budget'
    END AS price_category

FROM products;


-- 7. Categorize orders

SELECT
    order_id,
    total_amount,

    CASE
        WHEN total_amount >= 50000 THEN 'High Value'
        WHEN total_amount >= 10000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_category

FROM orders;


-- 8. Number of orders by year

SELECT
    YEAR(order_date) AS order_year,
    COUNT(*) AS total_orders
FROM orders
GROUP BY YEAR(order_date);


-- 9. Number of orders by month

SELECT
    MONTH(order_date) AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY MONTH(order_date)
ORDER BY order_month;