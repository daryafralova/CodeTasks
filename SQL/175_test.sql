--Есть таблица orders:
--order_id (int)
--user_id (int)
--order_ts (timestamp) — дата и время оформления
--status (string) — 'created', 'paid', 'cancelled', 'delivered'

--Есть таблица order_items:
--order_id (int)
--item_id (int)
--price (decimal) — цена на момент покупки
--quantity (int)

--Рассчитайте для каждого дня за последние 30 дней:
--Количество уникальных покупателей (user_id), совершивших хотя бы один оплаченный заказ (status='paid').

-- Решение1:
select cast(order_ts as date), count(distinct user_id) as users
from orders
where 1=1
and cast(order_ts as date) >= current_day - interval '30 days'  
and status ='paid'
group by cast(order_ts as date)

-- Решение 2:
with cte1 as(
select generate_series(current_date - interval '30 days', current_date, '1 day')::date AS calendar_date), 

cte_2 as(select cast(order_ts as date),  count(distinct user_id) as users
		from orders
		where 1=1
		and cast(order_ts as date) >= current_day - interval '30 days'  as date
		and status ='paid'
		group by cast(order_ts as date))
select cte1.calendar_date
		,case when cte2.user_id is null then 0, else cte2.users end as users 
from cte1
left join cte2
on cte1.calendar_date = cte2.date











