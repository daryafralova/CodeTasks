-- # ДАННЫЕ
-- Таблица reports_stg.watch_content (таблица с просмотрами видео):
user_id    video_id    date
=================================
1          1           2021-01-01
1          2           2021-01-01
1          3           2021-02-15
2          1           2019-12-31
2          2           2020-07-01
3          4           2022-12-10
4          1           2022-12-11
5          1           2021-01-01
5          3           2021-02-15
               ...
-- Поля:
-- user_id - идентификатор пользователя
-- video_id - идентификатор просмотренного видео
-- date - дата просмотра видео
-- Примечание: 1 строка в таблице - 1 просмотр видео

-- ## ЗАДАЧА:
-- Вывести список пользователей, смотревших video_id 1 и 3 (посмотрел и видео 1, и видео 3), но не смотревших 2

--Решение 1:
with cte1 as(
			select user_id
			from reports_stg.watch_content r
			where video_id in (1,3)
			group by user_id
			having count(distinct video_id)) = 2,
cte2 as(
		select user_id
		from reports_stg.watch_content r
		where video_id = 2
		group by user_id)
select cte1.user_id
from cte1 
left join cte2
on cte1.user_id = cte2.user_id
where cte2.user_id is null

--Решение 2:
select user_id
from reports_stg.watch_content r
where video_id in (1,3) and user_id not in (		
											select distinct user_id
											from reports_stg.watch_content r
											where video_id = 2
											)
group by user_id
having count(distinct video_id)) = 2