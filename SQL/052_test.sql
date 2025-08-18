---Вывести название и цену каждого анализа, которые продавались 5 февраля 2020 года и в течение всей следующей недели.
Analysis:
an_id	an_name	an_cost	an_price	an_group

Groups:
gr_id	gr_name	gr_temp

Orders:
ord_id	ord_datetime	ord_an


select an_name, an_price
from analysis
inner join orders
on analysis.an_id = orders.ord_an
where ord_date between  '05.02.2020' and '13.02.2020'
		