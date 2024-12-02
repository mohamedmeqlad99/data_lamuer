WITH uc AS (
  SELECT COUNT(case_id) AS uncategorised_calls
  FROM callers
  WHERE call_category IS NULL
    OR call_category = 'n/a'
)

SELECT 
  ROUND(100.0 * uncategorised_calls
    / (SELECT COUNT(*) FROM callers),1) AS uncategorised_call_pct
FROM uc;
