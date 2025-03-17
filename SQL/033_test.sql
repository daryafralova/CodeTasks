---Вывести имена людей, у которых есть полный тёзка среди пассажиров

SELECT name
from passenger
GROUP by name
having count(*) > 1