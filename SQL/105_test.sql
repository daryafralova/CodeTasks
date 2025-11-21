---Требуется вывести уникальное количество людей из города (city) “Москва”, которые купили category “Телефон” в сентябре и октябре.
---месяц должен быть представлен в виде извлеченной из даты строки на английском языке
---предполагается, что рассматриваемые данные относятся к одному календарному году.
---Таблица users
---id - id покупателя (pk)
---created_at -дата регистрация
---name - фамилия клиента
---city - город

---Таблица purchases
---id - id покупателя (pk)
---created_at -дата покупки
---user_id - id покупателя (fk) 
---sku_id - id товара (fk)

---Таблиуа skus:
---id -  id покупателя (pk)
---price - цена товара
---category - категория товара

SELECT 
case when  extract(month from p.created_at) = 9 then 'September' else 'October' end as month
, count(distinct u.id) as cnt_people 
from ozon.purchases p 
inner join ozon.skus s 
on p.sku_id=s.id 
inner join ozon.users u 
on p.user_id=u.id
where 1=1
and u.city='Москва' 
and s.category='Телефон'
and extract(month from p.created_at) in (9,10) 
group by 