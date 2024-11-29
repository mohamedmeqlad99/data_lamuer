WITH H as (
select max(order_occurrences) as order_occurrences
from items_per_order
)
select item_count
from items_per_order as i 
RIGHT JOIN H 
ON H.order_occurrences = i.order_occurrences
