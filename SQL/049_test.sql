---3. Напишите SQL запрос, который найдет количество клиентов (client_id) по кадому ASM. 
select monbth(t1.date), t1.city, t2.ASM, count(distinct client_id) as count_client_id
from t1
inner join t2
on t1.client_id = t2.client_id
group by monbth(t1.date), t1.city, t2.ASM