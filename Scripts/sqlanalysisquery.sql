select * from stock_prices;


select 
Ticker,
AVG(Close) 
from stock_prices
group by Ticker;

Select Ticker,
max(Close) as Max_value
from stock_prices
group by Ticker;


select Ticker,
SUM(Volume) as Total_volume
from stock_prices
group by Ticker;

-- # the stock with the highest average closing price.
select Ticker,
AVG(Close) as high_avg
from stock_prices
group by ticker
order by Ticker DESC;

-- all rows where volume is greater than the average volume of all stocks.
select *
from stock_prices
where volume > (select AVG(Volume) from stock_prices);


-- the number of trading days for each stock.
select 
Ticker,
count(Date) 
from stock_prices
group by Ticker;

-- the top 5 highest closing prices overall.

select * 
from stock_prices
order by Close DESC
limit 5;

-- the yearly average closing price for each stock.

select Ticker,
year(Date),
avg(Close)
from stock_prices
group by Ticker, year(Date);

-- the latest trading date available for each stock.
select Ticker,
max(Date) as latest_trades
from stock_prices
group by Ticker;	

-- the average closing price for each stock AFTER 2025 only.

select Ticker,
Avg(Close) as avg_stock
from stock_prices
where Year(Date) > 2025
group by Ticker, Year(Date);

-- stocks whose average closing price is greater than 250.

select Ticker,
Avg(Close) as avg_close
from stock_prices
group by Ticker
having avg_close > 250;




select * from holdings;
select * from stock_prices;

WITH cte AS (

    SELECT 
        h.Ticker,
        h.quantity,
        h.Buy_Price,
        s.Close,

        ROW_NUMBER() OVER(
            PARTITION BY Ticker
            ORDER BY Date DESC
        ) AS Maxdate

    FROM holdings AS h

    INNER JOIN stock_prices AS s 
    ON h.Ticker = s.Ticker
)

SELECT * 
FROM cte 
WHERE Maxdate = 1;

-- current market value of each holding.
with cte2 as (
SELECT 
        h.Ticker,
        h.quantity,
        h.Buy_Price,
        s.Close,

        ROW_NUMBER() OVER(
            PARTITION BY Ticker
            ORDER BY Date DESC
        ) AS rn

    FROM holdings AS h

    INNER JOIN stock_prices AS s 
    ON h.Ticker = s.Ticker
)
SELECT 
Ticker,
quantity, 
rn,
Quantity * close as current_market_Value
from cte2 
where rn = 1;


Select 
Ticker,
Date,
Close,
LAG(Close) over(partition by Ticker order by Date) as previo,
Close - LAG(Close) over(order by Date DESC) diff
from stock_prices; 


-- Moving Average
with cte as (
select
Ticker,
Date,
Close,
AVG(Close) OVER(partition by Ticker order by date rows between 9 preceding and current row) as moving_avg
from stock_prices
)

select 
Ticker,
Date,
Close,
moving_avg,
CASE
    When Close > moving_avg then "Bullish"
	else "Bearish"
end as market_behaviour
from cte;


-- Calculate the profit percentage: ((Current_Price - Buy_Price) / Buy_Price) * 100

with cte as (
select 
h.Ticker,
h.quantity,
h.Buy_Price,
s.Close,
s.Date,
Row_number() over (partition by ticker order by Date desc) as Current_price
from holdings as h
INNER JOIN stock_prices as s
on h.Ticker = s.Ticker
)

select 
Ticker,
quantity,
date,
Buy_Price,
CASE 
    WHEN Buy_Price = 0 THEN NULL 
    ELSE ((Close - Buy_Price) / Buy_Price) * 100 
END as profit_percent
from cte 
where current_price = 1;

-- Volatile calculation 

with volatile as (
select 
Ticker,
stddev(Close) as vol
from stock_prices
group by Ticker
)
select 
Ticker,
vol,
case 
when vol > (select avg(vol) from volatile) then "Above Average risk"
else "Stable"
end as risk_indicator
from volatile;



-- day over day today - yesterday / yesterday * 100
select 
Ticker,
Date,
Close,
((Close - LAG(Close) Over(partition by Ticker order by Date)) / LAG(Close) Over(partition by Ticker order by Date)) *100 as dod
from stock_prices; 


INSERT INTO holdings (Ticker, quantity, Buy_Price, date)
VALUES ('TSLA', 10, 215.30, '2025-03-29');
use papertradex;

select * from holdings;

CREATE VIEW market_behaviour_view AS

WITH cte AS (
    SELECT
        Ticker,
        Date,
        Close,
        AVG(Close) OVER(
            PARTITION BY Ticker
            ORDER BY Date
            ROWS BETWEEN 9 PRECEDING AND CURRENT ROW
        ) AS moving_avg
    FROM stock_prices
)

SELECT
    Ticker,
    Date,
    Close,
    moving_avg,

    CASE
        WHEN Close > moving_avg THEN 'Bullish'
        ELSE 'Bearish'
    END AS market_behaviour

FROM cte;
