--Напишите запрос, в котором для каждого анализа будет выведены название группы и нужный температурный режим.

--Таблица Analysis:
--an_id - id 
--an_cost - закупка
--an_price - розница
--an_group - группа (pk)

--Таблица Groups:
--gr_id - id(pk)
--gr_name - название
--gr_temp - температурный режим

select an_id, an_name, gr_name, gr_temp 
from analysis a 
inner join groups g 
on a.an_group = g.gr_id  
