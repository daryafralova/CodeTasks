--Примечание по накопительному итогу: накопительный итог суммы розничных продаж считайте по дате в хронологическом порядке, 
--а в пределах одной даты по возрастанию номера заказа.

select date(c.ord_datetime) as dt, c.ord_id, c.an_price, c.cumsum
from (
select *,
        sum(a.an_price) over(order by o.ord_datetime, o.ord_id) as cumsum
from analysis a 
inner join orders o 
on a.an_id = o.ord_an 
order by o.ord_datetime) as c 
