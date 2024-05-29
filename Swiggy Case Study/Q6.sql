-- Find restaurant with max repeated customers

SELECT r.r_name, t.loyal_customers
FROM (
    SELECT r_id, COUNT(*) AS loyal_customers
    FROM (
        SELECT r_id, user_id, COUNT(*) AS visits
        FROM orders
        GROUP BY r_id, user_id
        HAVING COUNT(*) > 1
    ) t1
    GROUP BY r_id
) t
JOIN restaurants r ON r.r_id = t.r_id
ORDER BY t.loyal_customers DESC
LIMIT 1;
