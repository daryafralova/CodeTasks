---Посчитайте количество селлеров с продажами MAS в месяце 2017-03-01. Дату продажи определяйте по date_created. Укажите количество селлеров.
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
select count(distinct od.seller_id) as MAS
from sandbox.orders o 
inner join order_details od 
on o.order_id = od.order_id 
where o.date_created >= '2017-03-01' and o.date_created < '2017-04-01'