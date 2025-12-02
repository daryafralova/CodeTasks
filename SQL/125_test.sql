---Вывести из таблицы Заказов информацию по средней наценке с разбивкой по годам.
---Наценка рассчитывается по формуле Наценка = (Розница - Себестоимость)/Себестоимость
---Результат отсортируйте по возрастанию года.

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



select y.year, avg((y.an_price-y.an_cost)::NUMERIC/y.an_cost) as mean_markup
from (select *, extract(year from o.ord_datetime) as year
      from orders o
      inner join analysis a 
       on o.ord_an = a.an_id) as y
group by y.year
order by y.year