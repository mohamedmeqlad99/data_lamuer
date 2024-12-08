WITH last_transaction AS (
    SELECT 
        transaction_id, 
        merchant_id, 
        credit_card_id, 
        amount, 
        transaction_timestamp,
        LAG(transaction_timestamp) OVER (
            PARTITION BY merchant_id,credit_card_id,amount
            ORDER BY transaction_id
        ) AS previous_transaction_timestamp
    FROM transactions
),
repeated_payments AS (
    SELECT 
        transaction_id, 
        merchant_id, 
        credit_card_id, 
        amount
    FROM last_transaction
    WHERE 
        previous_transaction_timestamp IS NOT NULL 
        AND transaction_timestamp <= previous_transaction_timestamp + INTERVAL '10 minutes'
)
SELECT COUNT(*)
FROM repeated_payments
