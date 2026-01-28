---Посчитайте размер когорты селлеров, совершивших первую продажу в месяце 2018-01-01. 
---Когорта определяется по дате первого выкупленного заказа date_paid
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
with cte1 as(
select od.seller_id, date(date_trunc('month', min(o.date_paid)))  as cohort_month
from sandbox.orders o 
inner join sandbox.order_details od 
on o.order_id = od.order_id 
group by od.seller_id)
select count(distinct cte1.seller_id)
from sandbox.orders o 
inner join sandbox.order_details od 
on o.order_id = od.order_id 
inner join cte1
on cte1.seller_id = od.seller_id
where cte1.cohort_month = '2018-01-01'