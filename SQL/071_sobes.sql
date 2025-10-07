---3 таблицы:
---Products---
---id	- Идентификатор продукта
---title - Название продукта
---category -	Категория продукта

---Prices---	
---product_id -	Идентификатор продукта
---price -Цена за единицу
---date_from - Дата начала действия цены
---date_to - Дата окончания действия цены

---Sales---	
---product_id - Идентификатор продукта
---quantity - Количество
---date - Дата-время продажи

---1) Вывести цены всех продуктов на дату X
select *
from price
inner join prod
where '2025-04-10' between coalesce(date_from, '01.01.1500') and coalesce(date_to, '01.01.9999')


---2) В каждой категории вывести топ-5 продуктов по сумме продаж за апрель 2024
select p1.category, p1.title, dr
from (
select p1.category, p1.title, dense_rank() over(partition by p1.category, p1.title order by total desc) as dr
from (
select p1.category, p1.title, sum(p2.price * s.quantity) as total 
from products as p1
inner join prices p2
on p1.id = p2.product_id
inner join sales s 
on p2.product_id = s.product_id and s.date between p2.date_from and date_to
where s.date between '01.04.20024' and '31.04.2024'
group by p1.category, p1.title) as df
) as ghg
where dr <= 5

---3) По каждому продукту вывести долю продаж в своей категории за апрель 2024
--- через оконки:
select *, round((total_by_name / total_by_category) * 100, 0) as share
from(
select  p1.category, p1.title, sum(p2.price * s.quantity) as total_by_name
		, sum(sum(p2.price * s.quantity) over(partition by p1.category) as total_by_category
from products as p1
inner join prices p2
on p1.id = p2.product_id
inner join sales as s 
on p2.product_id = s.product_id and s.date between p2.date_from and date_to 
where s.date between '01.04.20024' and '31.04.2024'
group by p1.category, p1.title ) as f

--- через cte:
with 
cte1 as(
			select p1.category, p1.title, sum(p2.price * s.quantity) as total_item 
			from products as p1 
			inner join prices as p2 
			on p1.id = p2.product_id 
			inner join sales as s 
			on p2.product_id = s.product_id and s.date between p2.date_from and date_to
			group by p1.category, p1.title),
cte2 as(
			select p1.category, sum(p2.price * s.quantity) as total_category
			from products as p1 
			inner join prices as p2 
			on p1.id = p2.product_id 
			inner join sales as s 
			on p2.product_id = s.product_id and s.date between p2.date_from and date_to
			group by p1.category)
			
select cte1.*, cte2.total_category, round((100.0 * cte1.total_item / cte2.total_category),0) as share
from cte1 
inner join cte2
on cte1.category = cte2.category

