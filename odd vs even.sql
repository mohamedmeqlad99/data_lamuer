with cte as(
SELECT measurement_id,measurement_value,CAST(measurement_time as date) as measurement_time,row_number()OVER(PARTITION BY CAST(measurement_time as date)order BY measurement_time) as row_no  
FROM measurements
)

SELECT measurement_time,SUM(measurement_value) filter(WHERE row_no%2=1) as odd_sum,SUM(measurement_value) filter(WHERE row_no%2=0) as even_sum
FROM cte 
GROUP BY measurement_time
