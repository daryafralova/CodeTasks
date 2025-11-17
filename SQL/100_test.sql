---Вывести список всех товаров (их названия) вместе с названиями их категорий. 
---Включить в результат даже те товары, у которых категория не задана (NULL)

---Таблицы:
---1 - Products
---product_id (INT) - идентификатор товара
---product_name (VARCHAR) - название товара
---category_id (INT) - идентификатор категории

---2 - Categories
---category_id (INT) - идентификатор категории
---category_name (VARCHAR) - название категории

select product_name, category_name
from products 
left join categories
on products.category_id = category.category_id
