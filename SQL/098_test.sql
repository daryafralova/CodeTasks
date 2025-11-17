---Вывести названия отделов и среднюю зарплату в каждом из них. Отсортировать результат по убыванию средней зарплаты.

---Дана таблица: Employees
---employee_id (INT) - идентификатор сотрудника
---name (VARCHAR) - имя сотрудника
---department (VARCHAR) - отдел
---salary (DECIMAL) - зарплата

select department, avg(salary) as avg 
from employees
group by dapartment 
order by avg desc 
 