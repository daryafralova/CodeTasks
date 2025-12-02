
---Округлите наценку на каждую позицию из таблицы Заказов до ближайшего десятка. Выберите только те строки, где наценка больше 50%.
---Наценка рассчитывается по формуле Наценка = (Розница - Себестоимость)/Себестоимость

--Таблица Orders:
--ord_id - (pk)
--ord_datetime 
--ord_an


--Таблица Analysis:
--an_id - (pk)
--an_name
--an_cost
--an_price
--an_group


SELECT o.*, ROUND((a.an_price - a.an_cost)/a.an_cost::NUMERIC*100, -1) as markup
FROM orders o 
inner join analysis a 
on o.ord_an = a.an_id
WHERE ROUND((an_price*1.0 - an_cost*1.0)/(an_cost*1.0), 1)*100.0 > 50