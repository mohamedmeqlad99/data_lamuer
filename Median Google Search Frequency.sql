WITH TEMP AS
(SELECT searches, GENERATE_SERIES(1, num_users)
FROM search_frequency
ORDER BY searches)

SELECT * 
FROM TEMP;
