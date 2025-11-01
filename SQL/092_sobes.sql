---Для каждого клиента вычислить средний интервал между его заказами в днях, используя таблицы:
---Таблица order:
- order_id - уникальный идентификатор заказа
- date_time - дата и время заказа
- amount - сумма заказа
- customer_id - идентификатор клиента

---Таблица customer:
-customer_id - уникальный идентификатор клиента
-age - возраст

select customer_id, avg(diff) from (
	select customer_id,
			date_time - lag(date_time) over(partition by customer_id order by date_time) as diff
	from order
) q
group by customer_id
