---Посчитать общее количество заказов и суммарную сумму заказов для каждого города за последний месяц:

---Таблица Orders:
---id - идентификатор заказа
---user_id - идентификатор пользователя, который сделал заказ
---order_date - дата оформления заказа
---amount - сумма заказа
---city - город, в котором был оформлен заказ
				
		
select dfdf.city, count(*), sum(dfdf.amount) as total
from(	
select *,
		dense_rank() over(partition by city order by extract(year from order_date) desc, extract(month from order_date) desc) as dr 		
from orders ) as dfdf
where dfdf.dr = 1 
group by dfdf.city


	

