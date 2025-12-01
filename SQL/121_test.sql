
--Напишите запрос, который выведет всех сотрудников на 2020-10-10. Это подразумевает всех сотрудников, которые были наняты до этой даты и все еще работают.
--Отчет должен включать фамилию, имя, отчество сотрудника и название текущей должности.

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



SELECT e.last_nm, e.first_nm, e.middle_nm, j.position_nm
from tinkoff.employees e 
join tinkoff.job j on e.position_id = j.position_id
where j.valid_from_dttm <= '2020-10-10' and j.valid_to_dttm >= '2020-10-10'