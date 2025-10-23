---Таблица Purchases:

---purchase_id — идентификатор покупки
---customer_id — идентификатор покупателя
---purchase_date — дата и время покупки
---amount — сумма покупки

---Задача:
---Для каждой покупки выведите ее идентификатор, клиента, дату и сумму, 
---а также средний чек по всем покупателям за тот же месяц, что и покупка.

select purchase_id, customer_id, purchase_date, amount
		, avg(amount) over(partition by extract(month from purchase_date)) as avg_m
from purcahses


p_id c_id date 		amount	avg_m
1	1	2025-10-02	100		366,6
2	1	2025-09-01	200		333,33
3	2	2025-09-01	300		333,33
4	2	2025-10-24	400		366,6
5	3	2025-09-01	500		333,33
6	3	2025-10-23	600		366,6


