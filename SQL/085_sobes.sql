---Для каждого пользователя вывести наименование 
---и цену самого дорогого товара в его первой транзакции

-- Таблица raw.orders (таблица с покупками товаров по датам):
-- user_id - идентификатор пользователя
-- tran_datetime - дата и время покупки (для одного пользователя не может быть два заказа в одно и тоже время)
-- item_id - id товара
-- order_id - id покупки

---Таблица dicts.items (словарь соответствия id товара и наименование бренда, наименования товара):
item_id - id товара
brand - наименование быть 
name - название товара
price - цена

select g.user_id, g.name
from (select *
		, max(f.price) over(partition by rn.user_id) as mprice
		from (select *
					,row_number() over(partition by ro.user_id order by ro.tran_datetime desc) as rn
				from raw.orders ro 
				inner join dict.items di 
				on ro.item_id = di.item_id ) as f
		where rn = 1) as g
where price = mprice


		





