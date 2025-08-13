---1.Напишите SQL запрос результатом которго станет таблица вида:

-- Вариант 1
select client_id, Month(date), sum(revenue), avg(revenue) as AOV
, sum(revenue) / (select sum(revenue) from t1 )
from t1
group by client_id, Month(date)




-- Вариант 2
select client_id, Month(date), sum(revenue), avg(revenue) as AOV
, sum(revenue) / sum(revenue) over (partition by month(date))
from t1
group by client_id, Month(date)



-- Вариант 3
select a.client_id, a.month, a.rev, a.aov, a.rev / b.rev as rev_percent
from 
(
	select client_id, Month(date) month, sum(revenue) as rev, avg(revenue) as AOV
	from t1
	group by client_id, Month(date)
) 
as a 
inner join 
(
	select  Month(date) month, sum(revenue) rev
	from t1
	group by  Month(date)
) as b
on a.month = b.month