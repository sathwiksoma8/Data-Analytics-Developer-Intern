-- Task 04: Advanced SQL Analytics
-- Dataset: Sample Superstore (9,994 rows)
-- Database: Superstore.db
-- Tool: DB Browser for SQLite

-- ============================================
-- Query 1: Total Sales by Region using CTE
-- ============================================
WITH region_sales AS (
    SELECT Region, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
    FROM superstore
    GROUP BY Region
)
SELECT 
    Region,
    Total_Sales,
    Total_Profit,
    ROUND(Total_Profit * 100.0 / Total_Sales, 2) AS Profit_Margin_Pct
FROM region_sales
ORDER BY Total_Sales DESC;

-- ============================================
-- Query 2: Rank Products Within Each Category (ROW_NUMBER)
-- ============================================
SELECT 
    Category,
    "Product Name",
    SUM(Sales) AS Total_Sales,
    ROW_NUMBER() OVER (PARTITION BY Category ORDER BY SUM(Sales) DESC) AS Row_Num
FROM superstore
GROUP BY Category, "Product Name"
ORDER BY Category, Row_Num
LIMIT 15;

-- ============================================
-- Query 3: Compare ROW_NUMBER, RANK, DENSE_RANK
-- ============================================
SELECT 
    "Customer Name",
    SUM(Sales) AS Total_Sales,
    ROW_NUMBER() OVER (ORDER BY SUM(Sales) DESC) AS Row_Num,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS Rank_Num,
    DENSE_RANK() OVER (ORDER BY SUM(Sales) DESC) AS Dense_Rank_Num
FROM superstore
GROUP BY "Customer Name"
ORDER BY Total_Sales DESC
LIMIT 15;

-- ============================================
-- Query 4: LAG - Compare Each Month to Previous Month
-- ============================================
WITH monthly_sales AS (
    SELECT 
        substr("Order Date", 7, 4) || '-' || substr("Order Date", 4, 2) AS Year_Month,
        SUM(Sales) AS Total_Sales
    FROM superstore
    GROUP BY Year_Month
)
SELECT 
    Year_Month,
    Total_Sales,
    LAG(Total_Sales) OVER (ORDER BY Year_Month) AS Prev_Month_Sales,
    ROUND(Total_Sales - LAG(Total_Sales) OVER (ORDER BY Year_Month), 2) AS Change,
    ROUND(
        (Total_Sales - LAG(Total_Sales) OVER (ORDER BY Year_Month)) 
        * 100.0 / LAG(Total_Sales) OVER (ORDER BY Year_Month), 
        2
    ) AS Change_Pct
FROM monthly_sales
ORDER BY Year_Month
LIMIT 20;

-- ============================================
-- Query 5: LEAD - Compare Each Month to Next Month
-- ============================================
WITH monthly_sales AS (
    SELECT 
        substr("Order Date", 7, 4) || '-' || substr("Order Date", 4, 2) AS Year_Month,
        SUM(Sales) AS Total_Sales
    FROM superstore
    GROUP BY Year_Month
)
SELECT 
    Year_Month,
    Total_Sales,
    LEAD(Total_Sales) OVER (ORDER BY Year_Month) AS Next_Month_Sales
FROM monthly_sales
ORDER BY Year_Month
LIMIT 20;

-- ============================================
-- Query 6: Running Total of Sales by Month
-- ============================================
WITH monthly_sales AS (
    SELECT 
        substr("Order Date", 7, 4) || '-' || substr("Order Date", 4, 2) AS Year_Month,
        SUM(Sales) AS Monthly_Sales
    FROM superstore
    GROUP BY Year_Month
)
SELECT 
    Year_Month,
    Monthly_Sales,
    SUM(Monthly_Sales) OVER (ORDER BY Year_Month) AS Running_Total
FROM monthly_sales
ORDER BY Year_Month
LIMIT 20;

-- ============================================
-- Query 7: Running Total by Region (PARTITION)
-- ============================================
WITH monthly_region AS (
    SELECT 
        Region,
        substr("Order Date", 7, 4) || '-' || substr("Order Date", 4, 2) AS Year_Month,
        SUM(Sales) AS Monthly_Sales
    FROM superstore
    GROUP BY Region, Year_Month
)
SELECT 
    Region,
    Year_Month,
    Monthly_Sales,
    SUM(Monthly_Sales) OVER (PARTITION BY Region ORDER BY Year_Month) AS Running_Total_By_Region
FROM monthly_region
ORDER BY Region, Year_Month
LIMIT 20;

-- ============================================
-- Query 8: Top 3 Products per Category (CTE + RANK)
-- ============================================
WITH ranked_products AS (
    SELECT 
        Category,
        "Product Name",
        SUM(Sales) AS Total_Sales,
        RANK() OVER (PARTITION BY Category ORDER BY SUM(Sales) DESC) AS Sales_Rank
    FROM superstore
    GROUP BY Category, "Product Name"
)
SELECT 
    Category,
    "Product Name",
    Total_Sales,
    Sales_Rank
FROM ranked_products
WHERE Sales_Rank <= 3
ORDER BY Category, Sales_Rank;

-- ============================================
-- Query 9: Customer Rank Within Each Region (PARTITION)
-- ============================================
SELECT 
    Region,
    "Customer Name",
    SUM(Sales) AS Total_Sales,
    RANK() OVER (PARTITION BY Region ORDER BY SUM(Sales) DESC) AS Rank_In_Region
FROM superstore
GROUP BY Region, "Customer Name"
ORDER BY Region, Rank_In_Region
LIMIT 20;

-- ============================================
-- Query 10: Yearly Sales with YoY Growth (LAG)
-- ============================================
WITH yearly_sales AS (
    SELECT 
        substr("Order Date", 7, 4) AS Year,
        SUM(Sales) AS Total_Sales
    FROM superstore
    GROUP BY Year
)
SELECT 
    Year,
    Total_Sales,
    LAG(Total_Sales) OVER (ORDER BY Year) AS Prev_Year_Sales,
    ROUND(
        (Total_Sales - LAG(Total_Sales) OVER (ORDER BY Year)) 
        * 100.0 / LAG(Total_Sales) OVER (ORDER BY Year),
        2
    ) AS YoY_Growth_Pct
FROM yearly_sales
ORDER BY Year;

-- ============================================
-- Query 11: Moving Average (3-month)
-- ============================================
WITH monthly_sales AS (
    SELECT 
        substr("Order Date", 7, 4) || '-' || substr("Order Date", 4, 2) AS Year_Month,
        SUM(Sales) AS Monthly_Sales
    FROM superstore
    GROUP BY Year_Month
)
SELECT 
    Year_Month,
    Monthly_Sales,
    ROUND(
        AVG(Monthly_Sales) OVER (
            ORDER BY Year_Month 
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ), 
        2
    ) AS Moving_Avg_3M
FROM monthly_sales
ORDER BY Year_Month
LIMIT 20;

-- ============================================
-- Query 12: Quarter-wise Sales Analysis
-- ============================================
SELECT 
    substr("Order Date", 7, 4) AS Year,
    CASE 
        WHEN CAST(substr("Order Date", 4, 2) AS INTEGER) BETWEEN 1 AND 3 THEN 'Q1'
        WHEN CAST(substr("Order Date", 4, 2) AS INTEGER) BETWEEN 4 AND 6 THEN 'Q2'
        WHEN CAST(substr("Order Date", 4, 2) AS INTEGER) BETWEEN 7 AND 9 THEN 'Q3'
        ELSE 'Q4'
    END AS Quarter,
    COUNT(*) AS Order_Count,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Year, Quarter
ORDER BY Year, Quarter;

-- ============================================
-- Query 13: Month-over-Month Profit Change (CTE + LAG)
-- ============================================
WITH monthly_profit AS (
    SELECT 
        substr("Order Date", 7, 4) || '-' || substr("Order Date", 4, 2) AS Year_Month,
        SUM(Profit) AS Total_Profit
    FROM superstore
    GROUP BY Year_Month
)
SELECT 
    Year_Month,
    Total_Profit,
    LAG(Total_Profit) OVER (ORDER BY Year_Month) AS Prev_Profit,
    ROUND(Total_Profit - LAG(Total_Profit) OVER (ORDER BY Year_Month), 2) AS Profit_Change
FROM monthly_profit
ORDER BY Year_Month
LIMIT 20;

-- ============================================
-- Query 14: Cumulative Profit by Region
-- ============================================
WITH monthly_region_profit AS (
    SELECT 
        Region,
        substr("Order Date", 7, 4) || '-' || substr("Order Date", 4, 2) AS Year_Month,
        SUM(Profit) AS Monthly_Profit
    FROM superstore
    GROUP BY Region, Year_Month
)
SELECT 
    Region,
    Year_Month,
    Monthly_Profit,
    ROUND(
        SUM(Monthly_Profit) OVER (
            PARTITION BY Region 
            ORDER BY Year_Month
        ),
        2
    ) AS Cumulative_Profit_By_Region
FROM monthly_region_profit
ORDER BY Region, Year_Month
LIMIT 20;

-- ============================================
-- Query 15: Top Customer per Region (RANK + WHERE)
-- ============================================
WITH customer_ranks AS (
    SELECT 
        Region,
        "Customer Name",
        SUM(Sales) AS Total_Sales,
        ROW_NUMBER() OVER (PARTITION BY Region ORDER BY SUM(Sales) DESC) AS Rank_In_Region
    FROM superstore
    GROUP BY Region, "Customer Name"
)
SELECT 
    Region,
    "Customer Name",
    Total_Sales
FROM customer_ranks
WHERE Rank_In_Region = 1
ORDER BY Region;