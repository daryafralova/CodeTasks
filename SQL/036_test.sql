---Выведи для каждого пользователя первое наименование, которое он заказал (первое по времени транзакции).
SELECT user_id, item
FROM (
    SELECT user_id, item, 
           ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_ts) AS rn
    FROM transactions
) AS first_order
WHERE rn = 1;
