-- Restaurants with monthly sales>x for

select r.r_name, sum(amount) as 'revenue'
from  orders o
join restaurants r
on o.r_id = r.r_id
where monthname(date) like 'June'
group by r.r_name
having revenue > 500;