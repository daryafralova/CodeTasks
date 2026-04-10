--Нужно вывести риэлторов с кол-вом успешных сдач выше, чем в среднем по рынку.
--Таблица adv_data:
--adv_id - уникальный идентификатор успешно закрытого объявления на сайте(сданных объектов)
--adv_open_dt - дата закрытия объявления на сайте
--agent_id - уникальный идентификатор риэлтора

--Таблица agents_data:
--agent_id - уникальный идентификатор риэлтора
--company_name - название организации, представляющей риэлтора
--comission -комиссия риэлтора со сделки



with agent_cnt as 
(
	select 
	agent_id
	, count(*) as quantity
	from adv_data ad
	group by ad.agent_id
			)
select *
from agent_cnt 
where quantity > (select avg(a_cnt.quantity) from agent_cnt a_cnt)




