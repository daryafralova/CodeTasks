--Найти анализ, который продавался больше всего раз за весь период времени
select a.an_id, count(*) as cnt
from analysis a 
inner join orders o 
on a.an_id = o.ord_an
group by a.an_id
order by cnt DESC
limit 1