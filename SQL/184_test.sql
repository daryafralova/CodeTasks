--Есть две таблицы:
--COUNTRY:
--country_name
--city

--SALES:
--data datetime
--city
--income

---Вывести список топ-5 городов по суммарной выручке
with cte1 as(
select city, sum(income) as rev_per_city
from sales 
group by city)

select *
from(select city
		, rev_per_city
		, dense_rank() over(order by rev_per_city desc) as dr
		from cte1) as rank
where dr<=5





