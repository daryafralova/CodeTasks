---Вывести кол-во людей, купивших 2023-10-01 товар с sku_id = 5
---Результат запроса должен возращать одно число.
---Таблица Purchases:
---id(pk)
---created_at - дата покупки
---user_id - id покупателя
---sku_id - id товара

select count(p.user_id) as people
from purchases
where p.created_at = '2023-10-01' and p.sku_id = 5