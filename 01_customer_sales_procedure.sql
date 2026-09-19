USE ecommerce_sql_project;

DELIMITER //

CREATE PROCEDURE GetCustomerSales(
    IN p_customer_id INT
)

BEGIN

    SELECT
        c.customer_id,
        c.customer_name,
        SUM(oi.quantity * oi.unit_price) AS total_spending

    FROM customers c

    JOIN orders o
        ON c.customer_id = o.customer_id

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE c.customer_id = p_customer_id
      AND o.order_status <> 'Cancelled'

    GROUP BY
        c.customer_id,
        c.customer_name;

END //

DELIMITER ;