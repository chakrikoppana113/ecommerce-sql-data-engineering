USE ecommerce_sql_project;

-- 1. Display all customers
SELECT *
FROM customers;


-- 2. Display customer names and cities
SELECT customer_name, city
FROM customers;


-- 3. Customers from Hyderabad
SELECT *
FROM customers
WHERE city = 'Hyderabad';


-- 4. Products above ₹10,000
SELECT *
FROM products
WHERE price > 10000;


-- 5. Products between ₹1,000 and ₹10,000
SELECT *
FROM products
WHERE price BETWEEN 1000 AND 10000;


-- 6. Products sorted by price descending
SELECT product_name, price
FROM products
ORDER BY price DESC;


-- 7. Total number of customers
SELECT COUNT(*) AS total_customers
FROM customers;


-- 8. Average product price
SELECT AVG(price) AS average_price
FROM products;


-- 9. Maximum product price
SELECT MAX(price) AS highest_price
FROM products;


-- 10. Minimum product price
SELECT MIN(price) AS lowest_price
FROM products;