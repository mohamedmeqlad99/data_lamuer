SELECT DISTINCT(user_id)
FROM emails
WHERE email_id IN (
    SELECT email_id
    FROM texts
    GROUP BY email_id
    HAVING COUNT(email_id) = 2
);
