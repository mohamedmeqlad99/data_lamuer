WITH cte_a AS (
    SELECT 
        ticker, 
        MIN(open) AS lowest_open, 
        MAX(open) AS highest_open 
    FROM 
        stock_prices 
    GROUP BY 
        ticker
)
SELECT 
    a.ticker,
    TO_CHAR(b.date, 'Mon-YYYY') AS highest_mth,
    a.highest_open,
    TO_CHAR(c.date, 'Mon-YYYY') AS lowest_mth,
    a.lowest_open
FROM 
    cte_a a
INNER JOIN 
    stock_prices b 
    ON a.ticker = b.ticker AND a.highest_open = b.open
INNER JOIN 
    stock_prices c 
    ON a.ticker = c.ticker AND a.lowest_open = c.open
ORDER BY 
    a.ticker;
