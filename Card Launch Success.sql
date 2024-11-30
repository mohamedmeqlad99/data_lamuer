WITH c as (
SELECT card_name,MIN(issue_month)
FROM monthly_cards_issued
GROUP BY card_name
)
select c.card_name,MIN(m.issued_amount)
from monthly_cards_issued as m
INNER JOIN c
ON c.card_name = m.card_name
GROUP BY c.card_name
ORDER BY card_name DESC
