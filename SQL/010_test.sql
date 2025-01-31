---Найдите максимальный возраст (количество лет) среди обучающихся 10 классов на сегодняшний день. 
---Для получения текущих даты и времени используйте функцию NOW()

select max(TIMESTAMPDIFF(YEAR, birthday, CURDATE())) AS max_year
from class
left join Student_in_class
on student_in_class.class=class.id
left join Student
on Student_in_class.student = student.id
where class.name = 10