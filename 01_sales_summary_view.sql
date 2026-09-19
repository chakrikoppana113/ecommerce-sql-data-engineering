USE ecommerce_sql_project;

CREATE OR REPLACE VIEW sales_summary AS

SELECT
    o.order_id,
    o.order_date,
    o.order_status,

    c.customer_id,
    c.customer_name,

    p.product_id,
    p.product_name,

    cat.category_name,

    oi.quantity,
    oi.unit_price,

    oi.quantity * oi.unit_price AS revenue

FROM orders o

JOIN customers c
    ON o.customer_id = c.customer_id

JOIN order_items oi
    ON o.order_id = oi.order_id

JOIN products p
    ON oi.product_id = p.product_id

JOIN categories cat
    ON p.category_id = cat.category_id;