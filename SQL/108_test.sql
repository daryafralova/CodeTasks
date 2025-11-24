---Выберите ID товара с самым большим количеством заказов с разбивкой по годам.
---Примечание. Год должен быть представлен в виде извлеченной из даты строки.
---Результат отсортируйте по возрастанию столбцов year, an_id

---Таблица Analysis:
---an_id(pk) - id 
---an_name - название
---an_cost - закупка
---an_price - розница
---an_group -группа

---Таблица Orders:
---ord_id(pk) - id
---ord_datetime - дата и время заказа
---ord_an - анализ

---Таблица Groups:
---gr_d (pk) - id
---gr_name - название 
---gr_temp - 

select * 
from(
select cast(r.year as text) as year, r.an_id, r.cnt 
from (
select *,
       DENSE_RANK() over(partition by g.year order by g.cnt DESC) as rn
from(select a.an_id, extract(year from o.ord_datetime) as year, count(*) as cnt
    from analysis a 
    inner join orders o 
    on a.an_id = o.ord_an
    group by a.an_id, extract(year from o.ord_datetime)) as g
order by year ) r
where r.rn = 1
  )f 
 order by f.year, f.an_id