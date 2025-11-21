---Напишите запрос, который посчитает количество звонков, сделанных между 2022-10-01 и сегодняшним днем. 
---Полученная таблица должна состоять из двух столбцов: date и cnt_calls. 
---В столбце date должен находиться день вызова (без времени), 
---а в столбце "cnt_calls" должно отображаться количество звонков, совершенных в этот день.

---Таблица Calls:
---call_id
---customer_id
---employee_id
---start_dttm
---end_dttm
---system_id
---duration


select start_dttm as date, count(call_id) as cnt_calls
from calls 
where start_dttm >='2022-10-01'
group by start_dttm