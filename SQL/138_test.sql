---Посчитайте прирост метрики Margin, $ неделя 2018-07-09 к неделе 2018-07-02 в процентах. Ответ округлите до 1 знака после запятой.
---Таблица orders:
---order_id
---date_created
---date_paid
---customer_id
---delivery_city
---delivery_state (регион доставки)

with cte_1 as(
		select  sum(od.price * od.quantity * od.commission) as margin_1
		from sandbox.orders o
		inner join sandbox.order_details od 
		on o.order_id = od.order_id
		where o.date_paid >='2018-07-09' and o.date_paid < '2018-07-16'),
cte_2 as(
select  sum(od.price * od.quantity * od.commission) as margin_2
		from sandbox.orders o
		inner join sandbox.order_details od 
		on o.order_id = od.order_id
		where o.date_paid >='2018-07-02' and o.date_paid < '2018-07-09')	
select round(((cte_1.margin_1 / cte_2.margin_2)-1)*100,1) as d
from cte_1
cross join  cte_2

