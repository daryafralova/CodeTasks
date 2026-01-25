---gmv по дням в разрезе категорий
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

select od.category_name
		, date(o.date_created)
		, sum(od.quantity * od.price) as gmv_created
from sandbox.orders o 
inner join sandbox.order_details od 
on o.order_id = od.order_id 
group by od.category_name, date(o.date_created)