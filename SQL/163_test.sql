--Для каждого пользователя:
-- посчитать сколько дней прошло между первым install и первой purchase, если она была
-- вывести revenue первой purchase

--Таблица Events:
--user_id - идентификатор пользователя
--event_type - тип действия - install / purchase / open_app
--event_time - дата
--revenue -выручка

-- посчитать сколько дней прошло между первым install и первой purchase, если она была:
with 
cte1 as(select user_id, min(event_time) as min_install_date
		from events 
		where event_type='install'
		group by user_id), 
cte2 as(select user_id, min(event_time) as min_purchase_date
		from events 
		where event_type = 'purchase'
		group by user_id)
select cte1.user_id, (cte2.min_purchase_date - cte1.min_install_date) as difference
from cte1 
inner join cte2 
on cte1.user_id=cte2.user_id

-- вывести revenue первой purchase:
select r.user_id, r.revenue
from(select *
			, row_number() over(partition by user_id order by event time asc) as rn 
			from events 
			where event_type='purchase') as r
where r.rn = 1



















