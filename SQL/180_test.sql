--Есть таблица Events с данными о поведении пользователей на сайте:
--user_client_id - уникальный id клиента (int)
--date - дата (timestamp)
--attributes - платформа с которой заходил пользователь (ios/android)
--page_current_url - url текущей страницы (/home, /catalog, /checkouts)
--action_type -тип действия пользователя (page_view / view/ click)
--widget_id - уникальный идентификатор элемента на странице

--Построить SQL-скрпит, который будет считать конверсию из события view виджета 522955 в событие click по нему с разбивкой по дням(date)
select date
		, count(distinct case when action_type ='view' then user_client_id end) as viewers
		, count(distinct case when action_type ='click' then yser_client_id end) as clickers
		, round(100.0 * count(distinct case when action_type = 'click' then user_client_id end) / nullif(count)distinct case when action_type = 'view' then user_id end), 0), 2) as conversion_rate_percent
from events
where 1=1
and widget_id = 522955 
and page_current_url = '/catalog'
and action_type in('view', 'click')
group by date





