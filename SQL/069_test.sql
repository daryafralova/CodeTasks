---Написать запрос, который выводит количество пятёрок и фамилии тех учеников, 
---которые имеют более трёх двоек.
---name	mark	subj
---Иванов	5	Математика
---Иванов	4	Физика
---Петров	5	Математика
---Смирнов	5	Математика
---Петров	2	Физика
---Иванов	2	Математика
---Смирнов	5	Математика

select name, count(mark)
from journal 
where mark = 5 and in(
select name
from joirnal 
where mark = 2
group by name
having(count) > 3)
group by name