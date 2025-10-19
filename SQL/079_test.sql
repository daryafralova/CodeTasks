---Напишите запрос, который вычисляет разницу между зарплатой каждого сотрудника 
---и средней зарплатой в его департаменте.
select name
	, department_id
	, salary
	, round(((avg(salary) over(partition by department_id)) - salary), 0) as diff
from sber.employee e