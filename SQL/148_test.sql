---Какой штат лидирует по количеству заказов за неделю 2018-07-09.
---Таблица orders:
---order_id
---date_created
---date_paid
---customer_id
---delivery_city
---delivery_state (регион доставки)

select delivery_state, count(order_id) as quantity
from sandbox.orders o 
where o.date_created >= '2018-07-09' and o.date_created < '2018-07-16'
group by delivery_state
order by quantity desc