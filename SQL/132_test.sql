

---В таблице Analysis, найти все уникальные анализы на антитела (содержат 'anti'), а также анализы, имеющие в названии любую форму слова 'кровь'. 
---В результат вывести только те, у которых розничная цена (an_price) меньше 1000.
---Результат должен быть отсортирован по убыванию розничной цены.

--Таблица Analysis:
--an_id - (pk)
--an_name
--an_cost
--an_price
--an_group





select an_name, an_price
from analysis 
where 1=1
and (lower(an_name) like '%anti%'
or lower(an_name) like '%кровь%')
and an_price < 1000
order by an_price desc