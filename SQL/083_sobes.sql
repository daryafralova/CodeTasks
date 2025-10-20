---Есть пользователи, их чеки и дата покупки. 
---Вытащить последние 7 чеков каждого пользователя
---Таблица Sales:
---client_id - id клиента
---date - дата в формате yyyy-mm-dd 
---check_id - номер чека


select f.client_id, f.check_id
from (select *
		, row_number() over(partition by client_id order by  date desc) as rn
		from sales) as f
where rn <= 7