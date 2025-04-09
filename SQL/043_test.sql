---Определить товары, которые покупали более 1 раза
select good_name
from goods
	inner join payments on goods.good_id = payments.good
group by good_name
having count(good_name) > 1