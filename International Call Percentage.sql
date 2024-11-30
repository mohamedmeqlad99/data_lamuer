SELECT ROUND(100.0 * COUNT(*) FILTER(WHERE b.country_id != c.country_id) /
  COUNT(*), 1)
FROM phone_calls AS a
JOIN phone_info AS b
  ON a.caller_id = b.caller_id
JOIN phone_info AS c
  ON a.receiver_id = c.caller_id
