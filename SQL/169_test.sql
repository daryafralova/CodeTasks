---Для каждого города найти пользователя, который за последние 3 месяца сделал наибольшую сумму заказов.
---Если таких пользователей несколько - вывести всех.

---Таблица Orders:
---id -  уникальный идентификатор заказа
---user_id - идентификатор пользователя, который сделал заказ
---order_date - дата оформления заказа
---amount -сумма заказа (в условных единицах, например, рублях)
---city - город, в котором был оформлен заказ


select second.city, second.user_id, second.total
from (select 
		first.city
		, first.user_id
		, rank() over (partition by first.city order by first.total desc) as rank	
		from (select city
				, user_id
				, sum(amount) as total
				from orders 
				where order_date >= CURRENT_DATE - INTERVAL '90 days'
				group by city, user_id) as first
				) as second
where second.rank = 1 
