---Для когорты, совершившей первую продажу в месяце 2018-01-01, посчитайте ARPPS в месяце 2018-02-01 (второй месяц жизни когорты). 
---Когорту определяйте по дате первого выкупленного заказа date_paid.
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
select cte1.cohort_month
	   ,date(date_trunc('month',o.date_paid)) as purchase_month
	   ,count(distinct cte1.seller_id) as sellers_paid
	   ,row_number() over(partition by cte1.cohort_month order by date(date_trunc('month',o.date_paid))) purchase_month_number
	   ,sum(od.quantity * od.price) as gmv_paid
	   ,sum(od.quantity * od.price) / count(distinct cte1.seller_id) as arpps_paid
from sandbox.orders o 
inner join sandbox.order_details od 
on o.order_id = od.order_id 
inner join cte1
on cte1.seller_id = od.seller_id
where cte1.cohort_month = '2018-01-01'
group by cte1.cohort_month, date(date_trunc('month',o.date_paid))