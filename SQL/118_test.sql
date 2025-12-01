--Напишите запрос, который на дату '2022-10-10' выведет всех актуальных сотрудников, имеющих заработную плату в пределах от 20000 до 50000.
--Таблица Employee:
--employee_id
--first_nm
--middle_nm
--last_nm
--hire_dt
--birth_dt
--login
--position_id



--Таблица Job:
--position_id
--position_nm
--salary
--valid_from_dttm
--valid_to_dttm




select  last_nm, first_nm, middle_nm, salary, hire_dt
from tinkoff.employees e 
inner join tinkoff.job j 
on e.employee_id = j.position_id 
where 1=1
and j.salary between 20000 and 50000 
and  '2022-10-10' between  j.valid_from_dttm  and j.valid_to_dttm