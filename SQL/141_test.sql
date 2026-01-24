---В разрезе месяцев посчитайте сколько маржи приносит один выполненный заказ. 
---Для этого разделите Margin, $ на количество выполненных заказов. 
---Метрику назовем Margin per Order. 
---В каком месяце метрика Margin per Order оказалась самой высокой? Ответ укажите в формате 2025-05-27
---Таблица orders:
---order_id
---date_created
---date_paid
---customer_id
---delivery_city
---delivery_state (регион доставки)

---Таблица order_details
---order_id
---product_id
---category_name
---seller_id
---quantity
---price
---commission

--select concat(y,'-',case when m <10 then concat('0',m) else m::varchar end,'-','01'), mpr from (
select extract(month from o.date_paid) as m, extract(year from o.date_paid) as y
	, sum(od.quantity * od.price * od.commission) / count(*) as mpr
from sandbox.orders o 
inner join sandbox.order_details od 
on o.order_id  = od.order_id
where o.date_paid is not NULL
group by extract(month from o.date_paid), extract(year from o.date_paid) 
order by mpr desc
limit 1
--) q
