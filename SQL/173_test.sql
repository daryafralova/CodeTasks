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

select f.department_name, f.avg_salary_dep, f.l_name
from (select *,
		avg(e.salary) over(partition by  d.department_id) as avg_salary_dep
		from employee e 
		inner join departments d 
		on e.department_id = d.department_id) as f
where f.avg_salary_dep > f.salary
