---Нужно найти общую выручку по товару "Кофеварка" за первое полугодие 2024 года(с 1 января по 30 июня включительно)
---Таблица SALES:
---sale_id (INT) - идентификатор продажи
---product_name (VARCHAR) - название товара
---sale_date (DATE) - дата продажи
---amount (DECIMAL) - сумма продажи


select product_name, sum(amount) as total
from sales
where 1=1
and product_name = 'Кофеварка' 
and sale_date between '01.01.2024' and '30.06.2024'
group by product_name