-- Find most loyal customers for all restaurants



SELECT r.r_name AS restaurant_name, u.name AS customer_name, t.max_visits
FROM (
    SELECT o.r_id, o.user_id, COUNT(*) AS visits, MAX(COUNT(*)) OVER (PARTITION BY o.r_id) AS max_visits
    FROM orders o
    GROUP BY o.r_id, o.user_id
) t
JOIN restaurants r ON r.r_id = t.r_id
JOIN users u ON u.user_id = t.user_id
WHERE t.visits = t.max_visits
ORDER BY r.r_name, u.name;
