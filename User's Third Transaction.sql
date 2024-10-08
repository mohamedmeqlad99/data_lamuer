SELECT user_id, spend, transaction_date
FROM (
    SELECT user_id, spend, transaction_date,
           ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date) AS transaction_rank
    FROM transactions
) AS ranked_transactions
WHERE transaction_rank = 3;
