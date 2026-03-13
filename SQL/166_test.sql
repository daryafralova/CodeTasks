--У каких сотрудников зп выше чем у руководителей
--Таблица db:
--user_id - id сотрудника
--boss_id - id руководителя
--payment - зарплата в рублях

select *
from db as t1
inner join db as t2 
on t1.boss_id = t2.user_id  and t1.payment > t2.payment
