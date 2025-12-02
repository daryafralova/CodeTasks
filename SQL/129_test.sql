
--Вывести все заказы, которые содержат анализы, предполагающие режим хранения 22.
--Результат отсортируйте по возрастанию ID заказов.

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


select o.ord_id, o.ord_an, a.an_name, g.gr_temp 
from analysis a 
inner join groups g 
on a.an_group = g.gr_id 
inner join orders  o 
on a.an_id = o.ord_an 
where g.gr_temp = 22
order by o.ord_id