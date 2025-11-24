---Необходимо вывести информацию о продажах за те даты, когда продажи были больше, чем за предыдущий день из таблицы sales
---Таблица SALES:
---ID
---DATE
---VALUE

select *
from(
select s.date, s.value, lag(s.value, 1, '0') over(order by date) as lg
from(select date, sum(value) as value
    from sales
    group by date
    order by date) as s
  )l
where l.value > l.lg