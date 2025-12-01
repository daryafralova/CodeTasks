---Найти количество продаж с разбивкой по датам в период дат с '2019-10-25' до '2019-11-02'. 
---Оставить только те строки, где количество заказов больше 5.
select date(ord_datetime) as date, count(ord_id) as cnt
from orders 
where date(ord_datetime) between '2019-10-25' and '2019-11-02'
group by date(ord_datetime)
having count(ord_id)>5
