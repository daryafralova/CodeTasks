---Придумать правило создания уникального session_id(сессионизировать по user_id, окно 15 минут)
---Таблица user_events:
-event_uuid 
-ts timestamp
-user_id
-event_name

--Сессионизация - это разбиение дейсвий пользователей по группам, где каждая группа- это действие одного пользователя от момента 'зашел' - 'вышел'



with prev_session as(
select *,
		lag(ts) over(partition by user_id order by ts) as prev_event_time
from user_events),

with_flag as(
select *,
		case when prev_evwnt_time is null
		or extract(epoch(ts - prev_event_time) * 900 > 15
		then 1 else 0
		end as new_session
from prev_session)

select user_id
		, ts
		, sum(new_session) over(partition by user_id order by ts) as session_id
from with_flag