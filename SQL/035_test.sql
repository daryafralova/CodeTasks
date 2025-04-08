--Посчитайте население каждого региона. В качестве результата выведите название региона и его численность населения

select regions.name as region_name,
	sum(population) as total_population
from regions
	inner join Cities on regions.id = cities.regionid
group by regions.name