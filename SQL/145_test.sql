---Рассчитайте долю GMV Created в процентах каждой категории от общего GMV Created за неделю 2018-07-09.
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

select od.category_name
		, sum(od.quantity * od.price) as gmv_created
		, sum(sum(od.quantity * od.price)) over()
		, sum(od.quantity * od.price) / sum(sum(od.quantity * od.price)) over() as growth
from sandbox.orders o 
inner join sandbox.order_details od 
on o.order_id = od.order_id 
where o.date_created >= '2018-07-09' and o.date_created < '2018-07-16'
group by od.category_name
order by gmv_created desc