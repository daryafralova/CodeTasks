--Перед тобой база реализованных объявлений о сдаче квартир в следующей структуре
--Таблица adv_data:
--adv_id - уникальный идентификатор успешно закрытого объявления на сайте(сданных объектов)
--adv_open_dt - дата закрытия объявления на сайте
--agent_id - уникальный идентификатор риэлтора

--Таблица agents_data:
--agent_id - уникальный идентификатор риэлтора
--company_name - название организации, представляющей риэлтора
--comission -комиссия риэлтора со сделки

--Нужно посчитать кол-во уникальных закрытых объявлений по организациям в декабре.

select agents_data.company_name, count(*) as quantity
from adv_data
inner join agents_data
on adv_data.agent_id = agents_data.agent_id 
where extract(month from adv_data.adv_open_dt) = 12
group by agents_data.company_name


