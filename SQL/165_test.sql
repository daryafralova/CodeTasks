--Нужно получить топ 10 водителей по кол-ву заказов в каждом городе
--Таблица table:
--driver_id 
--city
--order_id 

select city, driver_d
from(select driver_id
		,city
		, row_number() over(partition by city order by count(order_id) desc) as rn
		from table
		group by city, driver_id) as first
where first.rn<=10


