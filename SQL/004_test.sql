---Your task is to sort the information in the provided table 'companies' by number of employees (high to low). 
---Returned table should be in the same format as provided:
---companies table schema
---id
---ceo
---motto
---employees

select id, ceo, motto, employees
from companies
order by employees  DESC
