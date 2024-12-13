SELECT 
SUM(
CASE WHEN session_status = 'start' 
THEN -(EXTRACT(DAY from status_time)) 
ELSE EXTRACT(DAY from status_time) END) 
as total_uptime_days
FROM server_utilization
