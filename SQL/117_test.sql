--Выведите ID и названия всех анализов, которые никогда не заказывались.

--Таблица Analysis:
--an_id - id 
--an_cost - закупка
--an_price - розница
--an_group - группа (pk)

--Таблица Orders:
--ord_id - id 
--ord_datetime - дата и время
--ord_an - анализ

select an_id, an_name
from analysis a
left join orders o 
on o.ord_an = a.an_id
where ord_datetime is NULL