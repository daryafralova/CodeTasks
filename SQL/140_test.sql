---Маркетплейс взимает разный размер комиссии с продажи в зависимости от категории товара. 
---Выведите информацию о категории и ее коммиссии 

---Таблица order_details
---order_id
---product_id
---category_name
---seller_id
---quantity
---price
---commission

select category_name, commission 
from sandbox.order_details od 
group by category_name, commission 
order by commission desc
