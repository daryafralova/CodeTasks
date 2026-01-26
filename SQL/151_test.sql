---Посчитайте количество селлеров с продажами в месяце 2017-03-01, у которых первая продажа была в месяце 2017-02-01. 
---Дату продажи определяйте по date_created
---Таблица orders:
---order_id
---date_created
---date_paid
---customer_id
---delivery_city
---delivery_state (регион доставки)

---Таблица order_details
---order_id
---product_id
---category_name
---seller_id
---quantity
---price
---commission

with first_sale as(
select *
from(select od.seller_id
			, date_trunc('month', min(o.date_created)) AS first_sale_month
		from sandbox.order_details od 
		inner join orders o 
		on o.order_id = od.order_id 
		group by od.seller_id
) as g 
where g.first_sale_month = '2017-02-01'),
march_sales as(
select *
from sandbox.orders o 
inner join order_details od 
on o.order_id = od.order_id 
where o.date_created >= '2017-03-01' and o.date_created < '2017-04-01')
select count(distinct march_sales.seller_id) 
from march_sales
inner join first_sale 
on march_sales.seller_id = first_sale.seller_id
