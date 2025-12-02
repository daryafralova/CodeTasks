--Необходимо вывесть количество людей, которые покупали товар с id = 5 после 10 октября 2021 (включительно).

--Таблица Customer:
--id_customer(pk)
--adress_1 
--adress_2
--company
--first_name
--county_code
--town
--last_name
--postcode
--telephone

--Таблица Purchases:
--id
--created_at
--user_id(pk)
--sku_id

--Таблица SKUS:
--id(pk)
--price
--category



select count(distinct user_id) as count
from customer c 
inner join purchases p 
on c.id_customer = p.user_id
inner join skus s 
on p.sku_id = s.id
where 1=1 
and s.id = '5'
and p.created_at >= '2021-10-10'