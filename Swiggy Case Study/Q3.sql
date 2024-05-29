-- Find top restaurant in terms of number of orders for a given month

select r.r_name, count(*) as 'month' 
from orders o
join restaurants r
on o.r_id = r.r_id
where monthname(date) like 'June'
group by r.r_name
order by count(*) desc limit 1;