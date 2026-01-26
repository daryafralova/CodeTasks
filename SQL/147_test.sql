---В какое количество штатов (поле delivery_state) был доставлен хотя бы 1 заказ?
---Таблица orders:
---order_id
---date_created
---date_paid
---customer_id
---delivery_city
---delivery_state (регион доставки)

select count(distinct delivery_state) as  ds
from sandbox.orders o 