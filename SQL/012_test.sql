---Определить группы товаров, которые не приобретались в 2005 году


select good_type_name
from goodtypes
where goodtypes.good_type_name not in (
		select distinct goodtypes.good_type_name as t
		from goods
			inner join payments on payments.good = goods.good_id
			inner join goodtypes on goods.type = goodtypes.good_type_id
			and year(payments.date) = '2005'
	)