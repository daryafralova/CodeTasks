
---Таблица order_items:
---order_id - номер заказа
---product_id - номер товара
---quantity - кол-во
---order_date - дата
---revenue - выручка

---Таблица products:
---product_id - номет товара
---category - категория товара

---1) Найти топ-3 категории по выручке за прошлый месяц

select *
from(
select p.category, 
	dense_rank() over(order by sum(o.revenue) desc) as dr 
from order_items o 
inner join products p 
on o.product_id = p.product_id 
where o.order_date >= current_date - interval '1 month'
group by p.category) as first
where first.dr <=3





---2) с условием что с будут появляться данные за полный прошлый месяц, условно если сегодня март, то нужно вывести данные за период 01.02.26-28.02.2026:
select *
from(
select p.category, 
	dense_rank() over(order by sum(o.revenue) desc) as dr 
from order_items o 
inner join products p 
on o.product_id = p.product_id 
where order_date >= date_trunc('month', current_date - interval '1 month')
and order_date < date_trunc('month', current_date) 
group by p.category) as first
where first.dr <=3

---3) топ 3 по месяцам 
select *
from(
select p.category,  date_trunc('month', order_date) as date, sum(o.revenue),
	dense_rank() over(partition by date_trunc('month', order_date) order by sum(o.revenue) desc) as dr 
from order_items o 
inner join products p 
on o.product_id = p.product_id 
group by p.category, date_trunc('month', order_date)) as first
where first.dr <=3