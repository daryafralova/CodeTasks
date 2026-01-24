---Посчитайте прирост метрики Margin, %: На сколько процентных пунктов (сокращенно p. p.) изменилась метрика Margin, % неделя 2018-07-09 к неделе 2028-07-02. Ответ округлите до 1 знака после запятой.

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

with cte_1 as(
		select  sum(od.price * od.quantity * od.commission) as margin_1
				,sum(od.price * od.quantity) as gmv_1
		from sandbox.orders o
		inner join sandbox.order_details od 
		on o.order_id = od.order_id
		where o.date_paid >='2018-07-09' and o.date_paid < '2018-07-16'),
cte_2 as(
select  sum(od.price * od.quantity * od.commission) as margin_2
		,sum(od.price * od.quantity) as gmv_2
		from sandbox.orders o
		inner join sandbox.order_details od 
		on o.order_id = od.order_id
		where o.date_paid >='2018-07-02' and o.date_paid < '2018-07-09')	
select round((cte_1.margin_1/cte_1.gmv_1)*100,1) - round((cte_2.margin_2/cte_2.gmv_2)*100,1) as p
from cte_1
cross join  cte_2