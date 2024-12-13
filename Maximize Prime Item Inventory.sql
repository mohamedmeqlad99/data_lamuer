with sc as (
SELECT
  item_type,
  SUM(square_footage) as ss, 
  COUNT(*) as cc  
FROM inventory 
GROUP BY item_type),
pc as (
SELECT
  item_type,
  FLOOR(500000.0/ss)*cc as item_count,
  (500000 - FLOOR(500000.0/ss)*ss) resid
FROM sc
WHERE item_type = 'prime_eligible')
SELECT sc.item_type, FLOOR(pc.resid/sc.ss)*sc.cc as item_count 
FROM sc, pc 
WHERE sc.item_type='not_prime'
UNION 
SELECT item_type, item_count FROM pc
ORDER BY item_count DESC
