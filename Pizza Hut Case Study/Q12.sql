-- Analyze the cumulative revenue generated over time.

SELECT order_date, 
sum(revenue) OVER(ORDER BY order_date) AS cum_revenue
FROM 
(SELECT orders.order_date,
sum(orders_details.quantity*pizzas.price) AS revenue
FROM orders_details
JOIN pizzas
ON orders_details.pizza_id = pizzas.pizza_id
JOIN orders
ON orders.order_id = orders_details.order_id
GROUP BY orders.order_date) AS sales;





