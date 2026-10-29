-- Task 14: Final SQL Analysis
-- Dataset: Sample Superstore
-- Note: Tables are run against the 'superstore' table.

-- 1. Overall Performance
SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin_Pct
FROM superstore;

-- 2. Regional Performance
SELECT 
    Region, 
    ROUND(SUM(Sales), 2) AS Sales, 
    ROUND(SUM(Profit), 2) AS Profit
FROM superstore 
GROUP BY Region 
ORDER BY Sales DESC;

-- 3. Loss-Making Sub-Categories
SELECT 
    "Sub-Category", 
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore 
GROUP BY "Sub-Category" 
HAVING SUM(Profit) < 0 
ORDER BY Total_Profit ASC;