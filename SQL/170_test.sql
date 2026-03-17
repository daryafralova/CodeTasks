---Для каждого города вывести количество уникальных пользователей, 
---которые сделали хотя бы 2 заказа за последние два месяца, 
---и среднюю сумму заказа среди этих пользователей (считать среднее по всем их заказам).

---Таблица Orders:
---id -  уникальный идентификатор заказа
---user_id - идентификатор пользователя, который сделал заказ
---order_date - дата оформления заказа
---amount  -сумма заказа (в условных единицах, например, рублях)
---city - город, в котором был оформлен заказ
 

select f.city, count(*) as people, avg(f.avg_user) as avg_city
from(select city, user_id, avg(amount) as avg_user
from orders 
where order_date >= current_date - interval '2 months'
group by city, user_id
having count(*) >= 2) as f 
group by f.city








