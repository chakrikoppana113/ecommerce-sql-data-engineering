USE ecommerce_sql_project;


-- 1. Customers whose spending is above average

WITH customer_spending AS (

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
)

SELECT *
FROM customer_spending
WHERE total_spending >
(
    SELECT AVG(total_spending)
    FROM customer_spending
);


-- 2. Products that were never ordered

SELECT
    p.product_id,
    p.product_name
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;


-- 3. Customers who never placed an order

SELECT
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;


-- 4. Products with revenue greater than average product revenue

WITH product_revenue AS (

    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS revenue

    FROM products p

    JOIN order_items oi
        ON p.product_id = oi.product_id

    JOIN orders o
        ON oi.order_id = o.order_id

    WHERE o.order_status <> 'Cancelled'

    GROUP BY
        p.product_id,
        p.product_name
)

SELECT *
FROM product_revenue
WHERE revenue >
(
    SELECT AVG(revenue)
    FROM product_revenue
);


-- 5. Customers with more than 1 order

SELECT
    customer_id,
    customer_name
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) > 1
);