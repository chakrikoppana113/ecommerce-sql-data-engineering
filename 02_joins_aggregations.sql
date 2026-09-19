USE ecommerce_sql_project;

-- 1. Orders with customer names

SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.order_status,
    o.total_amount
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id;


-- 2. Products with category names

SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.price
FROM products p
JOIN categories c
    ON p.category_id = c.category_id;


-- 3. Total number of orders per customer

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;


-- 4. Total revenue

SELECT
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status <> 'Cancelled';


-- 5. Revenue by customer

SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_spending DESC;


-- 6. Revenue by category

SELECT
    c.category_name,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM categories c
JOIN products p
    ON c.category_id = p.category_id
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY c.category_name
ORDER BY revenue DESC;


-- 7. Total quantity sold by product

SELECT
    p.product_name,
    SUM(oi.quantity) AS quantity_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY p.product_id, p.product_name
ORDER BY quantity_sold DESC;


-- 8. Average order value

SELECT
    AVG(total_amount) AS average_order_value
FROM orders
WHERE order_status <> 'Cancelled';


-- 9. Order count by status

SELECT
    order_status,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_status;


-- 10. Monthly revenue

SELECT
    YEAR(o.order_date) AS order_year,
    MONTH(o.order_date) AS order_month,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY
    YEAR(o.order_date),
    MONTH(o.order_date)
ORDER BY
    order_year,
    order_month;