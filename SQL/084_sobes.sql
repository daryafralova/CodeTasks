---Вывести список пользователей, 
---смотревших video_id 1 и 3 (посмотрел и видео 1, и видео 3), 
---но не смотревших 2

---Таблица watch_content (таблица с просмотрами видео):

---user_id - идентификатор пользователя
---video_id - идентификатор просмотренного видео
---date - дата просмотра видео

--- Примечание: 1 строка в таблице - 1 просмотр видео 

with v2 as(			
	select distinct user_id
	from watch_content
	where video_id = 2),
v1 as(
	select distinct user_id
	from watch_content
	where video_id = 1),
v3 as(
	select distinct user_id
	from watch_content
	where video_id = 3)

select user_id 
from v1
where 1=1
and user_id in (select user_id from v3)
and user_id not in (select user_id from v2)

