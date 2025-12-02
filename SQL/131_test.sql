

--Вывести название всех анализов, которые не продавались с 1 по 3 мая 2020 года.
--Результат отсортируйте по возрастанию поля an_name.

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



select a.an_name
from analysis a 
left join (select * 
            from orders o
            where o.ord_datetime >= '2020-05-01' and o.ord_datetime <='2020-05-03') as dt 
on a.an_id = dt.ord_an
where dt.ord_an is NULL
order by a.an_name