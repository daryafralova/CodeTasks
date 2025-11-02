---Сделать в таблице колонку со средней суммой продаж для клиента за три дня: день в записи, предыдущий и следующий
---client_id - id клиента
---sum - сумма его покупок
---day - дата формата 2020-04-01

--- Вывод должен быть таким: client_id | sum | day | avg(sum) за три дня

select *
		, avg(sum) over(partition by client_id order by day 
		rows between 2 preceding row) as moving_avg
from table








