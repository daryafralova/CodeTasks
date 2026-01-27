---Мы хотим провести когортный анализ активности продавцов на платформе. 
---Когортой считается месяц, когда продавец совершил свою первую покупку на платформе.
---Необходимо проанализировать, как продавцы из разных когорт ведут себя с течением времени.
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

---Запрос должен вывести следующие метрики для каждой когорты продавцов по месяцам:
---Когортный месяц (cohort_month) - месяц, когда продавец совершил свою первую покупку
---Месяц покупки (purchase_month) - месяц, в котором была совершена продажа
---Количество активных продавцов (sellers_created) - количество уникальных продавцов из когорты, совершивших покупки в данном месяце
---Номер месяца с момента вступления в когорту (purchase_month_number) - порядковый номер месяца с момента первой покупки (0 - когортный месяц, 1 - через месяц, 2 - через два месяца и т.д.)
---Общая выручка (gmv_created) - суммарная выручка от продаж всех продавцов из когорты в данном месяце (рассчитывается как сумма quantity * price)
---Средняя выручка на активного продавца (arpps_created) - средняя выручка на одного платящего продавца в данном месяце

with cte as(select od.seller_id, date(date_trunc('month', min(o.date_created))) as cohort_month
from sandbox.orders o 
inner join order_details od 
on o.order_id = od.order_id 
group by od.seller_id)
select cte.cohort_month -- вывожу столбец месяц когорты
		, date(date_trunc('month',o.date_created)) as purchase_month --- расчитываю месяц покупки
		, count(distinct od.seller_id) as sellers_created
		, row_number() over(partition by cte.cohort_month order by date(date_trunc('month',o.date_created))) as purchase_month_number---порядковый номер месяца продажи по каждой когорте
		, sum(od.quantity * od.price) as gmv_created
		, sum(od.quantity * od.price) / count(distinct od.seller_id) as arpps_created -- средняя выручка на одно платящего селлера
from sandbox.orders o
inner join sandbox.order_details od 
on o.order_id = od.order_id 
inner join cte
on cte.seller_id = od.seller_id  
group by cohort_month, date(date_trunc('month',o.date_created))