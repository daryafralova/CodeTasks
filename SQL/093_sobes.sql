---Таблица Shop:
---id - id магазина
---name - название
---city - город

---Таблица Cheque:
---uid - id чека
---created_at - дата чека
------sum - сумма  
---shop_id - id магазина
---customer_id - id покупателя

--- Вывести средний чек покупателя за последнюю неделю + когда у него была покупка
--- Вывод должен быть таким: customer_id | средний чек | дата последней покупки


select customer_id, avg(sum), max(created_at) 
from Cheque
where created_at >= current_date - interval '7 days'
group by customer_id