---В расчете учитывайте повышенную вероятность коллизий по агрегатам различных метрик, например, существует несколько продуктов 
---с одинаковой доходностью в промежутке времени. 
---В разные месяцы продукт может стоить по разному

---Таблица customers
---customer_id - идентификатор клиента
---age - возраст

---Таблица Receipts
---receiptid-идентификатор чека
---customerid- идентификатор клиента
---productid- идентификатор товара
---date - дата

---Таблица Products
---productid - идентификатор товара
---cost - стоимость
---month - month - string вида 202601

---A)какую сумму в среднем в месяц тратит:
----покупатель в возрвстном диапазоне от 20 до 30 лет включительно
----покупатель в возрастном диапазоне от 30 до 45 лет включительно


---A)Решение 1:
with 
as cte1(select p.month, avg(p.cost) as first_group
		from receipts
		inner join products p 
		on r.productid = p.productid and p.month =  concat(extract(year from r.date), extract(month from r.date) as date_str
		inner join customers c 
		on r.customerid = c.customer_id
		where c.age >=20 and c.age<=30
		group by p.month), 
as cte2(select p.month, avg(p.cost) as second_group
		from receipts
		inner join products p 
		on r.productid = p.productid and p.month =  concat(extract(year from r.date), extract(month from r.date) as date_str
		inner join customers c 
		on r.customerid = c.customer_id
		where c.age >=30 and c.age<=45
		group by p.month)

select cte1.month,  cte1.first_group, cte2.second_group
from cte1 
inner join cte2 
on cte1.month = cte2.month

---A) Решение 2:
select p.month
		, coalesce(avg(case when (c.age >=20 and c.age <=30) then p.cost end first_group),0)
		, coalesce(avg(case when (c.age >=30 and c.age <=45) then p.cost end second_group),0)
from receipts
inner join products p 
on r.productid = p.productid and p.month =  concat(extract(year from r.date), extract(month from r.date) as date_str
inner join customers c 
on r.customerid = c.customer_id
group by p.month







