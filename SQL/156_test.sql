--Посчитайте метрику MAU за ноябрь 2019 года. 
---Таблица events_201911:
---event_time
---event_type
---product_id
---category_id
---price
---user_id
---user_session

select date(date_trunc('month', event_time)) as dt
		, count(distinct user_session) as sessions
		, count(distinct (case when event_type = 'purchase'then user_session end)) as sessions_with_purchase
		, count(distinct user_id) as mau --кол-во пользователей которые заходили или на сайт или в приложение
		, count(distinct (case when event_type='view' then user_id end)) as users_with_view
		, count(distinct (case when event_type='cart' then user_id end)) as users_with_cart
		, count(distinct (case when event_type='purchase' then user_id end)) as users_with_purchase
		, sum(case when event_type='purchase' then price end) as gmv_created
from sandbox.events_201911
group by date(date_trunc('month', event_time)) 