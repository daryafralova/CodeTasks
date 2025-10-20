---Выгрузить всех клиентов с суммарным весом покупок более 2 кг за последний месяц.

---Таблица SALES:
---client_id - id клиента
---date - дата в формате yyyy-mm-dd
---sku - id товара
---cnt - кол-во

---Таблица DICT:
---sku - товар
---weight - вес в кг

---Решение:
select client_id
from sales s
inner join dict d 
on s.sku = d.sku 
where s.date between '2025-09-01' and '2025-10-01'
group by client_id
having sum(cnt*weight) > 2
