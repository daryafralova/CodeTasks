---Для каждой категории посчитайте прирост GMV Created неделя 2018-07-09 к неделе 2018-07-02.
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

with w1 as(select od.category_name
			, sum(od.quantity * od.price) as gmv_created
			from sandbox.orders o 
			inner join sandbox.order_details od 
			on o.order_id = od.order_id 
			where o.date_created >= '2018-07-09' and o.date_created < '2018-07-16'
			group by od.category_name
			order by gmv_created desc),
w2 as(select od.category_name
		, sum(od.quantity * od.price) as gmv_created
		from sandbox.orders o 
		inner join sandbox.order_details od 
		on o.order_id = od.order_id 
		where o.date_created >= '2018-07-02' and o.date_created < '2018-07-09'
		group by od.category_name
		order by gmv_created desc)
select w1.category_name, round((w1.gmv_created / w2.gmv_created -1)*100,1) as g
from w1
inner  join w2
on w1.category_name = w2.category_name