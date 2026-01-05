INSERT INTO orders (order_id, customer_id, order_date, status, total_amount)
VALUES
(201, 1, '2025-01-15', 'Completed', 8000000),
(202, 1, '2025-01-16', 'Completed', 9000000);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1001, 201, 1, 1, 8000000),
(1002, 202, 2, 1, 9000000);

SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent,
    AVG(o.total_amount) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id, c.customer_name
HAVING 
    COUNT(o.order_id) >= 3
    AND SUM(o.total_amount) > 10000000
ORDER BY total_spent DESC;
