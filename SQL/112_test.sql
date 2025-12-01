--В рамках каждого дня пронумеруйте строки, опираясь на дату и время заказа (по убыванию). 
--Для каждого нового дня нумерация должна начинаться заново.

select date(w.ord_datetime) as dt, w.ord_datetime, w.ord_id, w.ord_an, w.rn
from (
select *,
        row_number() over(partition by ord_datetime order by ord_datetime) as rn
from orders
order by ord_datetime)as w 