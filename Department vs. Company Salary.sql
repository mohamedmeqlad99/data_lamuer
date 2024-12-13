WITH TEMP AS (
  SELECT
    department_id,
    amount,
    TO_CHAR(payment_date, 'MM-YYYY') AS payment_date
  FROM employee
  JOIN salary USING(employee_id)
)

SELECT
  department_id,
  payment_date,
  CASE WHEN AVG(amount) > t.avg then 'higher'
       WHEN AVG(amount) < t.avg then'lower'
       ELSE 'same'
  END as comparison
FROM TEMP, (SELECT AVG(amount) as avg FROM TEMP) as t
WHERE payment_date = '03-2024'
GROUP BY department_id, payment_date, t.avg
ORDER BY department_id
