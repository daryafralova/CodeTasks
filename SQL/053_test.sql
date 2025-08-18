---Нарастающим итогом рассчитать, как каждый месяц каждого года увеличивалось количество проданных тестов с разбивкой по группе.
Analysis:
an_id	an_name	an_cost	an_price	an_group

Groups:
gr_id	gr_name	gr_temp

Orders:
ord_id	ord_datetime	ord_an

---Таблица после джойнов:

Analysis					Groups			Orders		
										
an_id	an_name	an_cost	an_price	an_group	gr_id	gr_name	gr_temp	ord_id	ord_datetime	ord_an
1	кровь_1	12	23	555	555	кровушка	10,00	234	02.02.2024	1
1	кровь_1	12	23	555	555	кровушка	10,00	234	02.02.2024	1
2	кровь_2	17	20	666	666	кровушка	15	121	04.02.2024	2
1	кровь_1	12	23	555	555	кровушка	10,00	234	02.03.2024	1
2	кровь_2	17	20	666	666	кровушка	15	121	04.03.2024	2
1	кровь_1	12	23	555	555	кровушка	10,00	234	02.04.2024	1
2	кровь_2	17	20	666	666	кровушка	15	121	04.04.2024	2
1	кровь_1	12	23	555	555	кровушка	10,00	234	02.05.2024	1
2	кровь_2	17	20	666	666	кровушка	15	121	04.05.2024	2
1	кровь_1	12	23	555	555	кровушка	10,00	234	02.02.2025	1
2	кровь_2	17	20	666	666	кровушка	15	121	04.02.2025	2
1	кровь_1	12	23	555	555	кровушка	10,00	234	02.03.2025	1
2	кровь_2	17	20	666	666	кровушка	15	121	04.03.2025	2
1	кровь_1	12	23	555	555	кровушка	10,00	234	02.04.2025	1
2	кровь_2	17	20	666	666	кровушка	15	121	04.04.2025	2
1	кровь_1	12	23	555	555	кровушка	10,00	234	02.05.2025	1
2	кровь_2	17	20	666	666	кровушка	15	121	04.05.2025	2

---Что должна получить на выходе:

нарастающий итог	year	month	кол-во тестов(quantity)	группа(an_group)
2	2024	2	2	кровь_1
1	2024	2	1	кровь_2
3	2024	3	1	кровь_1
2	2024	3		кровь_2
	2024	4		кровь_1
	2024	4		кровь_2
	2024	5		кровь_1
	2024	5		кровь_2
	2025	2		кровь_1
	2025	2		кровь_2
	2025	3		кровь_1
	2025	3		кровь_2
	2025	4		кровь_1
	2025	4		кровь_2
	2025	5		кровь_1
	2025	5		кровь_2

---Решение:

select sum(quantity) over (partition by an_group order by year, month)
from (
		select count(orders.ord_an) as quantity, 
		analysis.an_group, 
		extract(month from orders.ord_datetime) as month, 
		extract(year from orders.ord_datetime) as year
from analysis
inner join groups
on analysis.an_group = groups.gr_id
inner join orders
on analysis.an_id = orders.ord_an
group by analysis.an_group, extract(month from orders.ord_datetime) as month, extract(year from orders.ord_datetime) as year
	) as t_1