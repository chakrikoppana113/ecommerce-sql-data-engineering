USE ecommerce_sql_project;


-- 1. Rank customers based on spending

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

SELECT
    *,
    RANK() OVER (
        ORDER BY total_spending DESC
    ) AS spending_rank
FROM customer_spending;


-- 2. Dense rank customers

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

SELECT
    *,
    DENSE_RANK() OVER (
        ORDER BY total_spending DESC
    ) AS spending_rank
FROM customer_spending;


-- 3. Rank products inside each category

WITH product_revenue AS (

    SELECT
        p.product_id,
        p.product_name,
        p.category_id,
        SUM(oi.quantity * oi.unit_price) AS revenue

    FROM products p

    JOIN order_items oi
        ON p.product_id = oi.product_id

    JOIN orders o
        ON oi.order_id = o.order_id

    WHERE o.order_status <> 'Cancelled'

    GROUP BY
        p.product_id,
        p.product_name,
        p.category_id
)

SELECT
    *,
    DENSE_RANK() OVER (
        PARTITION BY category_id
        ORDER BY revenue DESC
    ) AS category_rank
FROM product_revenue;


-- 4. Running monthly revenue

WITH monthly_sales AS (

    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        SUM(oi.quantity * oi.unit_price) AS revenue

    FROM orders o

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.order_status <> 'Cancelled'

    GROUP BY
        DATE_FORMAT(o.order_date, '%Y-%m')
)

SELECT
    sales_month,
    revenue,

    SUM(revenue) OVER (
        ORDER BY sales_month
    ) AS running_revenue

FROM monthly_sales;


-- 5. Previous month's revenue

WITH monthly_sales AS (

    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
        SUM(oi.quantity * oi.unit_price) AS revenue

    FROM orders o

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.order_status <> 'Cancelled'

    GROUP BY
        DATE_FORMAT(o.order_date, '%Y-%m')
)

SELECT
    sales_month,
    revenue,

    LAG(revenue) OVER (
        ORDER BY sales_month
    ) AS previous_month_revenue

FROM monthly_sales;