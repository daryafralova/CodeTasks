---2.Напишите SQL запрос, который найдет клиента с максимальным заказом в городе. 

---Вариант 1
select client.id, transaction_id, second.city, max_order_revenue
from t1
inner join (
	select city, max(revenue) as max_order_revenue
	from t1
	group by city
	) as second
on t1.city = second.city and  t1.revenue = second.max_order_revenue



---Вариант 2
select client.id, transaction_id, city
from 
	(
	select * ,max(revenue) over(partition by city) as maxorderrev
	from t1
	) as fgf
where revenue=maxorderrev









