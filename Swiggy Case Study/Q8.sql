
-- Customer's favourite food

with temp as(
	select o.user_id, od.f_id, count(*) as 'frequency'
	from orders o 
	join order_details od
	on o.order_id = od.order_id
	group by o.user_id, od.f_id
)

select u.name, f.f_name, t1.frequency
from temp t1 
join users u
on u.user_id = t1.user_id
join food f
on f.f_id = t1.f_id
where t1.frequency = (
			select max(frequency)
            from temp t2 
            where t2.user_id = t1.user_id
)

