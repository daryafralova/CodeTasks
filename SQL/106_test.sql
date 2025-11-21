---Напишите запрос, который выведет полное имя сотрудников и даты их рождения. 
---Соедините фамилию(last_nm), имя (first_nm) и отчество (middle_nm) в один столбец с названием fio, 
---разделите фамилию, имя и отчество пробелами и дефисами.

---Таблица Employee
---employee_id
---first_nm
---middle_nm
---last_nm
---birth_dt

select concat(last_nm, ' - ', first_nm, ' - ', middle_nm) as fio, birth_date
from tinkoff.employees e 
