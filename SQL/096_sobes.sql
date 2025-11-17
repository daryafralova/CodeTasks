---Есть две таблицы:
---Таблица ads(екламные объявления):
----ad_id
----campaign_id
----status

---Таблица events:
----event_id
----ad_id
----source
----event_type
----event_date
----event_hour

---Надо рассчитать кол-во событий в разрезе рекламных кампаний (capmaign_id) и типов событий(event_type)

select ads.campaign_id, events.event_type, count(*)
from ads
inner join events
on ads.ad_id = events.ad_id
group by  ads.campaign_id, events.event_type
