-- this is an example of a slow query
EXPLAIN ANALYZE
SELECT first_name, last_name, email, (
  SELECT COUNT(*)
  FROM orders
  WHERE customers.customer_id = orders.customer_id
) AS order_count
FROM customers, (
  SELECT *
  FROM orders
) AS orders2
WHERE customers.customer_id = orders2.customer_id;

-- this is a faster query
EXPLAIN ANALYZE
SELECT customers.first_name, customers.last_name, customers.email, COUNT(orders.order_id) AS order_count
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id
