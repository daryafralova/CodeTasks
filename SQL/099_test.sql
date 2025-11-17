Найти всех клиентов, которые сделали свой первый заказ в марте 2024 года. 
Вывести customer_id и дату этого заказа.

---Дана таблица: Orders
---order_id (INT) - идентификатор заказа
---customer_id (INT) - идентификатор клиента
---order_date (DATE) - дата заказа 


select first.customer_id, first.order_date 
from  (select *, row_number() over(partition by customer_id order by order_date) as rn
	   from orders) as first
where 1=1
and extract(month from first.order_date) = 3 
and extract(year from first.order_date) = 2024 
and first.rn = 1 

