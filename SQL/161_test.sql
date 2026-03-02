---Нужно вывести список топ-5 городов в каждой стране по суммарной выручке
---Таблица Country
---country_name - страна
---city - город 

---Таблица Sales
---date - дата
---city - город 
---income - доход

select *
from (
select *,
		row_number() over(partition by grouped.country, order by grouped.total desc) as rn
from(select c.country, s.city, sum(s.income) as total 
	from country c
	inner join sales 
	on c.city = s.city
	group by c.country, s.city) as grouped
	)  as r
where r.rn<=5








