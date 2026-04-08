--Для каждого юзера найти день, когда сумма его покупок превысила 1000 руб
--Таблица t:
--date - дата
--user_id - id пользователя
--amount - сумма покупок

--На выходе должен быть user_id и date

select user_id, min(date) as date
from(
	select *,
		sum(amount) over( partition by user_id order by date) as running_total
	from t
	) rt
where rt.running_total > = 1000
