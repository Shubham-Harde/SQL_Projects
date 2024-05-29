-- Show all orders with order details for a particular customer in a particular date range

select o.order_id, r.r_name, f.f_name
from orders o 
join restaurants r
on r.r_id = o.r_id
join order_details od
on o.order_id = od.order_id
join food f 
on f.f_id = od.f_id
where user_id = (select user_id from users where name like 'Ankit')
and date > '2022-06-10' AND date < '2022-07-10';