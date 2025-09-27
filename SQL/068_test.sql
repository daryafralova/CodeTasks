
---A Microsoft Azure Supercloud customer is defined as a customer who has purchased at least one product from every product category listed in the products table.

---Write a query that identifies the customer IDs of these Supercloud customers.

---customer_contracts Table:
---Column Name	Type
---customer_id	integer
---product_id	integer
---amount	integer

---products Table:
---Column Name	Type
---product_id	integer
---product_category	string
---product_name	string

---Example Output:
---customer_id
---1

SELECT customer_id
FROM customer_contracts  cc
inner join products pp 
on cc.product_id = pp.product_id 
group by customer_id 
having count(distinct product_category) = (select count(distinct product_category) from products)