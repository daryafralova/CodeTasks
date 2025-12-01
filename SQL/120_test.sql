--Вывести все анализы, которые в рознице стоят от 250 до 500 рублей.

--Таблица Analysis:
--an_id
--an_name
--an_cost
--an_price
--an_group

select an_id, an_name, an_price 
from analysis 
where  an_price >=250 and an_price <= 500
order by an_id