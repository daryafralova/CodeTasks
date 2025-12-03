
--Написать SELECT-запрос для уменьшения цены на 20% для тех продуктов в таблице STORE, которые содержат пометку note = DISCOUNT.
--Если пометки нет, то необходимо оставить исходную цену.

--Таблица STORE:
--id_product
--unit_price
--key_producer 
--units
--descr
--note


select *,
        case 
        when note='DISCOUNT' then unit_price * 0.8 else unit_price
        end as price_with_discount 
from store