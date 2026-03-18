---Предположим, что некоторые сотрудники одновременно числяться  в разных департаментах.
---Вывести названия департаментов, имена сотрудников, которые числятся одновременно в двух и более  департаментах.

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

select f.department_name, f.l_name
from (select *,
			row_nwmber() over(partition by e.employee_id) as rn 
	from  employee e 
	inner join departments d 
	on e.department_id = d.department_id ) as f
where f.rn > = 2
