---Посчитайте самый высокий DAU в декабре 2019 года.
---Таблица:
---event_time
---event_type
---product_id
---category_id
---price
---user_id
---user_session

select *
from (select date(event_time) as df
		, count(distinct user_id) as dau
	 from sandbox.events_201912
     group by date(event_time)) as dt
where dt.df >= '2019-12-01' and dt.df < '2020-01-01'
order by dt.dau desc