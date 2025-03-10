---For this challenge you need to create a simple SELECT statement that will return all columns from the products table, 
---and join to the companies table so that you can return the company name.

---products table schema
---id
---name
---isbn
---company_id
---price

---companies table schema
---id
---name

select   products.id,
  products.name,
  products.isbn,
  products.company_id,
  products.price,
  companies.name as company_name
from products
inner join companies 
on products.company_id = companies.id
