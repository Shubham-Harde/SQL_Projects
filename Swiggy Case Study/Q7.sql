-- Month over month revenue growth of swiggy

select month, ((revenue - prev)/prev)*100 from (

with sales as 
(
	select monthname(date) as 'month', sum(amount) as revenue
	from orders
	group by month
)

select month, revenue, lag(revenue, 1) over(order by revenue) as prev from sales
) t