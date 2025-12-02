---Отобрать все анализы, которые были заказаны в апреле 2018 года.
---Результат должен быть отсортирован по возрастанию поля an_name.

--Таблица Orders:
--ord_id - (pk)
--ord_datetime 
--ord_an


--Таблица Analysis:
--an_id - (pk)
--an_name
--an_cost
--an_price
--an_group



select distinct a.an_name
from orders o 
inner join analysis a 
on o.ord_an = a.an_id
where o.ord_datetime >= '2018-04-01' and o.ord_datetime <= '2018-04-30'
order by a.an_name