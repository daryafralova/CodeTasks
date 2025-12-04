

--Напишите запрос, определяющий столбец median - медианную цену всех, оформленных в августе заказов.


select PERCENTILE_DISC(0.5) within group(order by price)
from c_orders 
where extract(month from date_payment) = 8