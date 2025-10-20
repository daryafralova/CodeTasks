---Выведите имя самого старшего человека. Если таких несколько, то выведите их всех.
select member_name, birthday
from family.familymembers f 
where birthday in (select min(birthday)
				from family.familymembers f)