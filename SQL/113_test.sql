--Выведите анализы с нечетным ID, у которых себестоимость больше 100.
select an_id, an_name, an_cost
from analysis 
where an_id % 2 != 0 and an_cost > 100