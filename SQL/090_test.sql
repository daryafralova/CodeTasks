---Таблица Sales:
---sale_id — идентификатор продажи
---product_id — идентификатор товара
---sale_date — дата продажи
---quantity — проданное количество
---price — цена за единицу

---Что нужно сделать:
---Проранжируйте все продажи по убыванию выручки  в рамках каждого товара. 
---Выведите все поля таблицы и полученный ранг.

select *,
		row_number() over(partition by product_id order by price*quantity) as total
from  sales
