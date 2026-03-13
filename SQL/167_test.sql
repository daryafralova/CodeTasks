--Нужно вывести топ-10 сайтов по обороту среди тех, которые имеют более 25% плохих кликов
--Таблица  stat_collector: - статистика показов рекламы в рекламных блоках
--block_id
--shows
--good_clicks
--fraud_clicks
--revenue 

--Таблица block_domains: - словарь соответсвия рекламных блоков доменам, на которых те установлены
--block_id
--block_description
--domain_id
--domain_name


select b.domain_id 
from block_domains  as b 
left join stat_collector as s 
on s.block_id = b.block_id
group by b.domain_id 
having sum(s.fraud_clicks)*1.0/(sum(s.fraud_clicks) + sum(s.good_clicks)) > 0.25
order by sum(s.revenue) desc
limit 10
