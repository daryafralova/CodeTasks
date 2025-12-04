--Найти анализы с наценкой выше 35% или из 7 категории. 
--Если какие-то анализы относятся сразу к двум категориям, то их необходимо продублировать.
--Наценка рассчитывается по формуле Наценка = (Розница - Себестоимость)/Себестоимость
--Результат отсортируйте по возрастанию поля an_id.
--Наценку округлите до 3 знака после запятой и выведите в виде %, то есть 3, а не 0,03.


--Таблица Analysis:
--an_id
--an_name
--an_cost
--an_price
--an_group

--Таблица Orders:
--ord_id
--ord_datetime
--ord_an

WITH charges as (SELECT an_id
                      , an_name
                      , an_cost
                      , an_price
                      , an_group
                      , ROUND((an_price - an_cost) *100.0 / NULLIF(an_cost, 0), 3) as charge
FROM Analysis 
ORDER BY an_id
),

final as (SELECT an_id
                 , an_name
                 , an_cost
                 , an_price
                 , an_group
                 , charge
                 , CASE 
                   WHEN charge > 35 OR an_group = '7' THEN 1 ELSE 0 
                   END as flag
FROM charges
)

SELECT an_id
      , an_name
      , an_cost
      , an_price
      , an_group
      , charge
FROM final 
WHERE flag = 1
ORDER BY an_id