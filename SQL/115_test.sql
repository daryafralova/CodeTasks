--Вывести все номера заказов, которые были совершены в апреле 2020 года.

--Таблица Orders:
--ord_id - id 
--ord_datetime - дата и время
--ord_an - анализ

select ord_id, ord_datetime
from  orders
where ord_datetime >= '2020-04-01' and ord_datetime < '2020-05-01'
order by ord_datetime