--Необходимо вывести имена всех сотрудников, у которых зарплата больше, чем у их менеджеров.

----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+

select empl.name
from employee empl
inner join employee chief
on empl.managerid = chief.id
where empl.salary > chief.salary