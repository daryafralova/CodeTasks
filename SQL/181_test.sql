--Перед тобой база реализованных объявлений о сдаче квартир в следующей структуре
--Таблица adv_data:
--adv_id - уникальный идентификатор успешно закрытого объявления на сайте(сданных объектов)
--adv_open_dt - дата закрытия объявления на сайте
--agent_id - уникальный идентификатор риэлтора

--Таблица agents_data:
--agent_id - уникальный идентификатор риэлтора
--company_name - название организации, представляющей риэлтора
--comission -комиссия риэлтора со сделки

--Вывести кол-во риэлторов с суммарной комиссией выше 500 000 рублей
--суммарная комиссия это comission * кол-во закрытых объявлений

Решение 1:
with cte1 as(select ag.agent_id, count(ad.adv_id) as total_adv
			from adv_data ad
			inner join agents_data ag
			on ad.agent_id = ag.agent_id 
			group by ag.agent_id), 
cte2 as(select *, (agents_data.comission * cte1.total_adv) as sum_comission
		from agents_data 
		inner join cte1
		on cte1.agent_id = agents_data.agent_id)

select count(cte2.agent_id)
from cte2
where cte2.sum_comission > 500000


Решение 2:
select count(distinct agent_id)
from (select *
		, ag.comission * (count(ad.adv_id) over(partition by ad.agent_id)) as sum_comission
	from adv_data ad
	inner join agents_data ag
	on ad.agent_id = ag.agent_id
	) as f 
where f.sum_comission > 500000


Решение 3:
select count(*) from (
select ad.agent_id
from adv_data ad
inner join agents_data ag
on ad.agent_id = ag.agent_id
group by ad.agent_id
having sum(commision) > 500000	
) q
	