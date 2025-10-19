---Напишите запрос, который выводит зарплату каждого сотрудника
--, а также разницу в процентах между его зарплатой и 
--следующей по убыванию зарплаты в этом департаменте. 
select e.name
		, e.salary
		, e.department_id
		, lead(e.salary, 1, 0) over(partition by e.department_id order by e.salary desc)
		, e.salary - lead(e.salary, 1, 0) over(partition by e.department_id order by e.salary desc ) as diff
		, round(100.0*(e.salary - lead(e.salary, 1, 0) over(partition by e.department_id order by e.salary desc )) / e.salary,0) as diff
from sber.employee e 