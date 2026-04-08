--Для каждого юзера найти все дни, когда сумма его покупок за посление 3 дня превысила 1000 руб
--Таблица t:
--date - дата
--user_id - id пользователя
--amount - стоимость покупки


select *
from(
	select *
	, sum(amount) over(partition by user_id order by date rows between 2 preceding and current row) as sum_last_3_days
	from t
		) as rs
where rs.sum_last_3_days >=1000
