---Для каждого департамента вывести его название, среднюю зп по департаменту и имена сотрудников, получающих зп выше средней по департаменту

--Таблица departments:
--department_id - номер департамента
--name -  название

--Таблица employee:
--employee_id - номер сотрудника
--f_name - имя сотрудника
--m_name - отчетсво
--l_name - фамилия сотрудника
--department_id - номер департамента
--salary - зп 

with cte1 as(select  e.department_id, avg(e.salary) as avg_salary_dep
			from employee e 
			group by e.department_id),
cte2 as(select *
		from employee 
		inner join departments d 
		on employee.department_id = d.department_id)
select cte1.name, cte1.avg_salary_dep, cte2.l_name
from cte1 
left join cte2
on cte1.avg_salary_dep > cte2.salary and cte1.department_id = cte2.department_id


