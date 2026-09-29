-- Task 03: SQL Data Analysis
-- Dataset: Sample Superstore (9,994 rows)
-- Database: Superstore.db
-- Tool: DB Browser for SQLite

-- Query 1: Total Sales
SELECT SUM(Sales) AS Total_Sales
FROM superstore;

-- Query 2: Total Sales by Region
SELECT Region, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Query 3: Sales and Profit by Category
SELECT Category, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Query 4: Top 10 Products by Sales
SELECT "Product Name", SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY "Product Name"
ORDER BY Total_Sales DESC
LIMIT 10;

-- Query 5: Top 10 Customers by Sales
SELECT "Customer Name", SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY "Customer Name"
ORDER BY Total_Sales DESC
LIMIT 10;

-- Query 6: Order Count by Ship Mode
SELECT "Ship Mode", COUNT(*) AS Order_Count
FROM superstore
GROUP BY "Ship Mode"
ORDER BY Order_Count DESC;

-- Query 7: Average Discount by Category
SELECT Category, AVG(Discount) AS Avg_Discount
FROM superstore
GROUP BY Category
ORDER BY Avg_Discount DESC;

-- Query 8: Profit by Sub-Category (Worst to Best)
SELECT "Sub-Category", SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY "Sub-Category"
ORDER BY Total_Profit ASC;

-- Query 9: High-Value Orders in West Region
SELECT "Order ID", "Customer Name", Region, Sales, Profit
FROM superstore
WHERE Region = 'West' AND Sales > 1000
ORDER BY Sales DESC
LIMIT 20;

-- Query 10: Top Loss-Making Orders
SELECT "Order ID", "Customer Name", Category, Sales, Profit, Discount
FROM superstore
WHERE Profit < 0
ORDER BY Profit ASC
LIMIT 20;

-- Query 11: Order Size Categorization (CASE)
SELECT 
    CASE 
        WHEN Sales < 100 THEN 'Small'
        WHEN Sales < 500 THEN 'Medium'
        WHEN Sales < 1000 THEN 'Large'
        ELSE 'Very Large'
    END AS Order_Size,
    COUNT(*) AS Order_Count,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Order_Size
ORDER BY Total_Sales DESC;

-- Query 12: States with Above-Average Sales (Subquery)
SELECT State, SUM(Sales) AS State_Sales
FROM superstore
GROUP BY State
HAVING SUM(Sales) > (
    SELECT AVG(State_Total)
    FROM (
        SELECT SUM(Sales) AS State_Total
        FROM superstore
        GROUP BY State
    )
)
ORDER BY State_Sales DESC;

-- Query 13: High-Profit Category + Segment (HAVING)
SELECT Category, Segment, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Category, Segment
HAVING SUM(Profit) > 50000
ORDER BY Total_Profit DESC;

-- Query 14: NULL Value Check
SELECT
    COUNT(*) AS Total_Rows,
    COUNT("Postal Code") AS Non_Null_Postal,
    COUNT("Customer ID") AS Non_Null_Customer,
    COUNT(Profit) AS Non_Null_Profit,
    COUNT(*) - COUNT("Postal Code") AS Postal_Nulls,
    COUNT(*) - COUNT("Customer ID") AS Customer_Nulls,
    COUNT(*) - COUNT(Profit) AS Profit_Nulls
FROM superstore;

-- Query 15: JOIN demonstration (superstore + customers)
-- (customers table was created earlier in the session)
SELECT 
    s."Order ID",
    s."Customer Name",
    c.Region,
    c.Segment,
    s.Sales,
    s.Profit
FROM superstore s
JOIN customers c ON s."Customer ID" = c."Customer ID"
WHERE c.Region = 'West'
ORDER BY s.Sales DESC
LIMIT 15;

-- Query 16: Monthly Sales Trend
SELECT 
    strftime('%Y-%m', "Order Date") AS Year_Month,
    COUNT(*) AS Order_Count,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Year_Month
ORDER BY Year_Month ASC;

-- Query 17: Top Product per Category (Correlated Subquery)
SELECT 
    s.Category,
    s."Product Name",
    SUM(s.Sales) AS Total_Sales
FROM superstore s
GROUP BY s.Category, s."Product Name"
HAVING SUM(s.Sales) = (
    SELECT MAX(Category_Total)
    FROM (
        SELECT Category, "Product Name", SUM(Sales) AS Category_Total
        FROM superstore
        GROUP BY Category, "Product Name"
    )
    WHERE Category = s.Category
)
ORDER BY s.Category;

-- Query 18: Customer Lifetime Value Segments
SELECT 
    Customer_Tier,
    COUNT(*) AS Customer_Count,
    SUM(Total_Sales) AS Total_Sales
FROM (
    SELECT 
        "Customer ID",
        SUM(Sales) AS Total_Sales,
        CASE 
            WHEN SUM(Sales) >= 10000 THEN 'VIP'
            WHEN SUM(Sales) >= 5000 THEN 'High Value'
            WHEN SUM(Sales) >= 1000 THEN 'Medium'
            ELSE 'Low'
        END AS Customer_Tier
    FROM superstore
    GROUP BY "Customer ID"
) AS customer_totals
GROUP BY Customer_Tier
ORDER BY Total_Sales DESC;

-- Query 19: Profit Margin by Segment
SELECT 
    Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS Profit_Margin_Pct
FROM superstore
GROUP BY Segment
ORDER BY Profit_Margin_Pct DESC;

-- Query 20: Discount Impact on Profit
SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.2 THEN '1-20%'
        WHEN Discount <= 0.4 THEN '21-40%'
        WHEN Discount <= 0.6 THEN '41-60%'
        ELSE '60%+'
    END AS Discount_Band,
    COUNT(*) AS Order_Count,
    ROUND(AVG(Profit), 2) AS Avg_Profit,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Discount_Band
ORDER BY Avg_Profit DESC;