---Выведите пассажиров с самым длинным ФИО. 
---Пробелы, дефисы и точки считаются частью имени.

select *
from planes.passenger p 
where length(name) = (select max(length(name)) as len
					 from planes.passenger p )