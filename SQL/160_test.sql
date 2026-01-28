---Найдите категорию с самой высокой конверсией из просмотра в покупку. Укажите category_id.
---Таблица:
---event_time
---event_type
---product_id
---category_id
---price
---user_id
---user_session

select d.category_id, round(d.users_with_purchase * 1.0 / d.users_with_view *100,2) as result
from (select    category_id
		, count(distinct user_session) as sessions
		, count(distinct (case when event_type = 'purchase'then user_id end)) as users_with_purchase
		, count(distinct (case when event_type='view' then user_id end)) as users_with_view
		, count(distinct (case when event_type='cart' then user_id end)) as users_with_cart
from sandbox.events_201912
group by category_id) as d 
where users_with_view > 0
order by result desc
