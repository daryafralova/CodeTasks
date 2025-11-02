---Дана таблица logs с логами действий пользователя:
---ts - timestamp
---user_id - id пользователя
---item_id - id товара
---action_type - тип действия viewed/click

---Для каждого пользователя найти id последнего товара на который он кликнул (user_id, item_id)
----в одну секунду пользователь мог кликнуть на несколько товаров

select d.user_id, d.item_id
from(select *
			, dense_rank() over(partition by user_id order by ts desc) as rn
	 from logs
	 where action_type = 'click') as d
where 1=1
and d.rn = 1