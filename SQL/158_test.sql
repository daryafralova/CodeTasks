---В какой день в декабре была самая высокая конверсия из DAU в DAC? Дату укажите в формате 2025-04-20
---Таблица:
---event_time
---event_type
---product_id
---category_id
---price
---user_id
---user_session

select date(event_time) as dt
		, count(distinct user_session) as sessions
		, count(distinct (case when event_type = 'purchase'then user_session end)) as sessions_with_purchase
		, count(distinct user_id) as dau --кол-во пользователей которые заходили или на сайт или в приложение
		, count(distinct (case when event_type='view' then user_id end)) as users_with_view
		, count(distinct (case when event_type='cart' then user_id end)) as users_with_cart
		, count(distinct (case when event_type='purchase' then user_id end)) as dac
		, sum(case when event_type='purchase' then price end) as gmv_created
		, round((count(distinct (case when event_type='purchase' then user_id end))*1.0 / count(distinct user_id) * 100),2) as p
from sandbox.events_201912
group by date(event_time)
order by p desc