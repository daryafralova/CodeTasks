---Отранжируйте суммарные затраты всех членов семьи. (Самые большие траты - 1 место)
select d.status
		, d.total
		, dense_rank() over(order by total desc) as rang 
from(
	select  f.status, sum(p.amount * p.unit_price) as total
	from family.familymembers f 
	inner join family.payments p
	on f.member_id = p.family_member
	group by f.status ) as d