---Посчитайте какое количество уникальных селлеров seller_id, которые совершили свою первую продажу в месяце 2017-02-01. 
---Дату первой продажи определяйте по полю date_created.
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

with first_date as(
select od.seller_id
		, date_trunc('month', min(o.date_created)) AS first_sale_month
from sandbox.order_details od 
inner join orders o 
on o.order_id = od.order_id 
group by od.seller_id)
select count(seller_id)
from first_date
where first_sale_month = '2017-02-01'