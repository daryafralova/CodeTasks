---таблица  Journal:	
---last_name	Фамилия
---subject	Предмет
---score	Оценка
---date	Дата

---1) Написать запрос, чтобы отобрать учеников, которые поедут на олимпиаду по математике
---Критерии для участников:
--- - отличник по математике: смотрим на средний балл - достаточно, чтобы при округлении до целого было 5
--- - нет двоек по математике
--- - хорошист по всем предметам в целом: смотрим на средний балл - не ниже 4
 
 with cte1 as(
		select last_name
		from journal 
		group by last_name
		having  round(avg(score),0) >= 4),

	cte2 as(
		select last_name 
		from journal 
		where  subject = 'math' and score ! = 2 
		group by last_name
		having round(avg(score),0) = 5)

select last_name
from cte1
inner join cte2
on cte1.last_name = cte2.last_name 