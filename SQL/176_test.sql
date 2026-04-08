--Дана таблица transaction со следующей структурой:
--transaction_id - идентификатор транзакции
--customer_id - идентификатор клиента
--amount_rur - сумма транзакции в рублях
--success_flg - флаг успешности транзакции
--transaction_dttm - дата и время транзакции


--Необходимо для каждого клиента, у которого суммарная сумма успешных транзакций превышает 100 000 руб, вывести его первую успешную транзакцию.
--Под 'первой' понимается транзщакция с минимальной датой и временем
--В результате нужно вывести поля:
--transaction_id
--customer_id
--amount_rur
--transaction_dttm

--Решение 1:
select f.customer_id, f.transaction_id, f.amount_rur, f.transaction_dttm
from (
		select *
		,sum(amount_rur) over(partition by customer_id) as total
		,row_number() over(partition by customer_id order by  transaction_dttm ) as rn
		from transaction
		where success_flg = 1
		) as f
where f.total > 100000 and f.rn = 1

--Решение 2:
with cte1 as(
select customer_id
	from transaction
	where success_flg = 1
	group by  customer_id
	having sum(amount_rur) > 100000) 
select d.customer_id, d.transaction_id, d.amount_rur, d.transaction_dttm
from(
		select *
		, row_number() over(partition by t.customer_id order by  t.transaction_dttm) as rn
		from transaction t
		inner join cte1
		on cte1.customer_id = t.customer_id and t.success_flg=1
		) as d
where d.rn = 1



