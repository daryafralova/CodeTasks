
--Рассчитать и вывести наценку для каждой строки таблицы Заказов.
--Наценка рассчитывается по формуле: Наценка = (Розница - Себестоимость)/Себестоимость
--Рассчитанную наценку округлите до 3 знака после запятой и выразите в % (то есть не 0.01, а 1).

--Таблица Analysis:
--an_id
--an_name
--an_cost
--an_price
--an_group

--Таблица Orders:
--ord_id
--ord_datetime
--ord_an

select o.ord_id
, o.ord_datetime
, o.ord_an
, round(((a.an_price - a.an_cost) *1.0 / a.an_cost * 100), 3) as markup
from orders  o 
inner join analysis a 
on o.ord_an = a.an_id