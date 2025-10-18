---Вывести информацию (что за товар, суммарные продажи в месяц по этому товару) о каждой второй покупке в каждом месяце. 
with cte_1 as(
select good, date 
from (
select good
		, row_number() over(partition by extract(year from date), extract(month from date) order by date) as rn
		, date
from family.payments p 
) as d 
where rn = 2)
select good_name, extract(year from cte_1.date) as year, extract(month from cte_1.date) as month, sum(amount * unit_price) as total
from family.payments p 
inner join  cte_1
on p.good = cte_1.good 
and extract(year from p.date) = extract(year from cte_1.date) 
and extract(month from p.date) = extract(month from cte_1.date)
inner join family.goods g 
on p.good = g.good_id
group by good_name, extract(year from cte_1.date), extract(month from cte_1.date)