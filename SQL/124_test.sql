

--Найти все уникальные названия анализов, которые фигурировали в заказах и имеют в названии любую форму слова 'кровь'.

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
on a.an_id = o.ord_an 
where lower(a.an_name) like '%кров%'
order by a.an_name