Таблица Orders:
order_id — идентификатор заказа
customer_id — идентификатор покупателя
order_date — дата заказа
total_amount — общая сумма заказа

Что нужно сделать:
Для каждого покупателя и каждого его заказа определите, 
является ли этот заказ самым крупным для данного покупателя. 
Выведите идентификатор заказа, покупателя, сумму заказа и флаг (1 - если заказ самый крупный у этого клиента, 0 - если нет).



select rang.order_id, rang.customer_id, rang.total_amount
	case when rn = 1 then 1 else 0
	end as flag
from (select *,
		row_number() over(partition by customer_id order by total_amount desc) as rn
		from orders 
		) as rang
		
customer_id order_id total_amount rn
1			23			43434     1
1			21			233       2
2			14			213		  1
2