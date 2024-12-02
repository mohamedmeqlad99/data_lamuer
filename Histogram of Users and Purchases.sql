with d as (SELECT user_id,MAX(transaction_date) transaction_date
FROM user_transactions 
GROUP BY user_id)

SELECT d.transaction_date,d.user_id,COUNT(u.product_id) as purchase_count
from user_transactions as u
RIGHT join d
on d.user_id = u.user_id
WHERE u.transaction_date = d.transaction_date
GROUP BY d.transaction_date,d.user_id
