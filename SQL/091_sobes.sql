---Таблица с 100 млн. строк:
---id- идентификационный номер
---name-имя
---age-возраст

---Неизвестно, является ли id первичным ключом таблицы
Как узнать?
-Есть два способа - прямой- посмотреть схему и косвенный(посмотреть есть ли дубли и null значения):
select * 
from table
group by id
having count(*) > 1 

select *
from table 
where id is null 


---Нужно добавить в эту таблицу столбец с количеством строк , сколько каждое name встречается в таблице.
---Как это сделать?

select *
		, count(name) over(partition by name) 
from table


---Допустим, нужно определить возраст, который чаще всего встречается в таблице.
---Как это сделать?
select age, count(age) as dfg
from table
group by age 
order by dfg desc
limit 1


