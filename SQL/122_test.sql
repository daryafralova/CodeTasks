--Необходимо найти названия всех округов, жители которых никогда не совершали покупки в этом магазине.


select county.name
from county 
left join customer c 
on c.county_code = county.county_code
left join c_orders o 
on c.id_customer = o.id_customer
where o.id_customer is Null