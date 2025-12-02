
---Выведите следующую информацию для анализов, которые продавались с 5 февраля 2020 и следующие 7 дней (включительно оба значения):
---название анализа (an_name)
---стоимость закупки анализа (an_cost)
---дата и время заказа (ord_datetime)
---Результат должен быть отсортирован по возрастанию значений в столбцах ord_datetime и an_cost.

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


select a.an_name, a.an_cost, o.ord_datetime
from analysis a 
inner join orders o 
on a.an_id = o.ord_an
where o.ord_datetime between '2020-02-05'::date and '2020-02-05'::date + interval '7 days'
order by o.ord_datetime, a.an_cost