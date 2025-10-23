-- Напиши запрос, выводящий все отделы, в которых меньше 5 разработчиков (position = 'Software Developer'').

-- Таблица employees:
--  - full_name VARCHAR (PK),
--  - position VARCHAR,
--  - department VARCHAR.

***Стоит учесть отделы, где разрабов вообще нет


select f.department
from (	select department,
		case when position = 'Software Developer' then 1 else 0
		end 
		as  sd_per_dep
		from employees
		group by department) as f
group by f.dapartment
having sum(f.sd_per_dep)<5


