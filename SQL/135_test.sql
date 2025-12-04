--Найти все пары различных клиентов (поле FIRST_NAME) из города Moscow.

--Таблица Customer:
--id_customer 
--address1
--address2
--company
--frist_name
--town
--county_code



select c1.first_name as customer1, c2.first_name as customer2 
from customer c1 
inner join customer c2 
on c1.town = c2.town
where 1=1
and c1.town = 'Moscow' 
and c1.id_customer <> c2.id_customer