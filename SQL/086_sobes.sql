-- Надо рассчитать:
-- Кол-во событий в разрезе рекламных кампаний (campaign_id) и типов событий (event_type).

--Таблица ads(рекламные объявления):
--   - ad_id (PK),
--   - campaign_id (FK),
--   - status.

-- Таблица events(события):
--   - event_id (PK),
--   - ad_id (FK),
--   - source,
--   - event_type,
--   - event_date,
--   - event_hour.

--Если у всех объявлений есть события:
select a.campaign_id, e.event_id, count(*) as event_quantity
from ads  a
inner join events e
on a.ad_id = e.ad_id
group by a.campaign_id, e.event_id

-- Если у некоторых объявлений не было событий:
select a.campaign_id, e.event_id, count(e.event_id) as event_quantity
from ads  a
left join events e
on a.ad_id = e.ad_id
group by a.campaign_id, e.event_id


