---Assume you have an events table on Facebook app analytics. Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.

---Definition and note:

---Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
---To avoid integer division, multiply the CTR by 100.0, not 100.




select app_id, round(100.00 * sc / si, 2) as ctr
from(
    select app_id,  sum(clicks) as sc, sum(impressions) as si
    from (
          SELECT 
            app_id, 
            case when event_type = 'click' then 1 else 0 end as clicks,
            case when event_type = 'impression' then 1 else 0 end as impressions
          FROM events
          where timestamp between '2022-01-01' and  '2023-01-01') as t1
    group by app_id)as t2