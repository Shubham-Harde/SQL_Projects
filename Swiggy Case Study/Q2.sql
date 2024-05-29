-- Average Price per Dish


select f.f_name, avg(price) as 'Avg Price'
from menu m
join food f
on m.f_id = f.f_id
group by f.f_name;


-- select f_id, avg(price) from menu group by f_id