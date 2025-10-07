
---Вывести "отличников", т.е. учеников, получивших не менее 10 "пятёрок", но у которых нет двоек

---FIO	        Subject	   Mark
---...	…	…
---Иванов ВВ	ИЗО	5
---Иванов ВВ	Математика	5
---Иванов ВВ	История	2
---Петров ПП	ИЗО	3
---Петров ПП	Труд	4
---...	…	…

--- решение 1:
select  fio
from table
where mark = 5  and fio not in (select  fio from table where mark = 2 )
group by FIO
having count(mark) >= 10 

--- решение 2:
with  fives as(	select fio  
				from table 
				where mark = 5 
				group by fio 
				having count(fives.mark) >= 10 ),
only two( 	select fio 
			from table 
			where mark = 2 
			group by fio) 
select  fio 
from fives  
left join only_two  
on fio. fives = fio.onle_two 
where only_two.fio is null