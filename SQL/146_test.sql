---Для каждой категории определите на сколько процентных пунктов изменилась её доля GMV Created 
---в от общего GMV Created за неделю 2018-07-09 по сравнению с неделей 2018-07-02.
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
		, sum(od.quantity * od.price) / sum(sum(od.quantity * od.price)) over() as share
from sandbox.orders o 
inner join sandbox.order_details od 
on o.order_id = od.order_id 
where o.date_created >= '2018-07-09' and o.date_created < '2018-07-16'
group by od.category_name
order by gmv_created desc),
w2 as(select od.category_name
		, sum(od.quantity * od.price) as gmv_created
		, sum(od.quantity * od.price) / sum(sum(od.quantity * od.price)) over() as share
from sandbox.orders o 
inner join sandbox.order_details od 
on o.order_id = od.order_id 
where o.date_created >= '2018-07-02' and o.date_created < '2018-07-09'
group by od.category_name
order by gmv_created desc)
select *, round((w1.share - w2.share) * 100, 1) as change_pp
from w1
inner join w2
on w1.category_name = w2.category_name