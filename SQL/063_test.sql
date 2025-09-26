

---Assume you are given the table below on Uber transactions made by users. Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.
---transactions Example Input:
---user_id	spend	transaction_date
---111	100.50	01/08/2022 12:00:00
---111	55.00	01/10/2022 12:00:00
---121	36.00	01/18/2022 12:00:00
---145	24.99	01/26/2022 12:00:00
---111	89.60	02/05/2022 12:00:00
---Example Output:
---user_id	spend	transaction_date
---111	89.60	02/05/2022 12:00:00





select user_id, spend, transaction_date
from (
  SELECT user_id, spend, transaction_date, dense_rank() over(partition by user_id order by transaction_date) AS third_transaction
  FROM transactions
) as f 

where third_transaction = 3 