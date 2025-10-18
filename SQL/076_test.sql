---Создайте запрос, который выводит топ-3 продукта по количеству продаж в каждом месяце
select *
from (
select *,
		dense_rank() over(partition by fg.month order by  fg.total desc) as dr
from(
	select g.good_name, extract (month from p.date) as month, sum(p.amount) as total
	from family.goods g 
	inner join family.payments p 
	on g.good_id = p.good
	group by g.good_name, extract (month from p.date) 
	order by  total desc
) as fg 
) as d
where dr <= 3