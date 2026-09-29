# Task 03 — SQL Data Analysis

**Database:** Superstore.db (SQLite)
**Dataset:** Sample Superstore (9,994 rows)
**Tool:** DB Browser for SQLite

## Deliverables
- `Task03_SQL_Queries.sql` — 20 SQL queries
- `Superstore.db` — SQLite database
- `SampleSuperstore.csv` — raw dataset
- `screenshots/` — 20 query result screenshots

## Skills Demonstrated
- SELECT, WHERE, ORDER BY, LIMIT
- GROUP BY with COUNT, SUM, AVG
- HAVING clause
- JOINs (superstore + customers table)
- Subqueries (nested + correlated)
- CASE expressions
- NULL handling
- Date functions (strftime)
- Calculated columns

## Query List

1. Total Sales
2. Sales by Region
3. Sales & Profit by Category
4. Top 10 Products by Sales
5. Top 10 Customers by Sales
6. Order Count by Ship Mode
7. Average Discount by Category
8. Profit by Sub-Category (worst to best)
9. High-Value Orders in West Region
10. Top Loss-Making Orders
11. Order Size Categorization (CASE)
12. States with Above-Average Sales (Subquery)
13. High-Profit Category + Segment (HAVING)
14. NULL Value Check
15. JOIN: Superstore + Customers
16. Monthly Sales Trend
17. Top Product per Category (Correlated Subquery)
18. Customer Lifetime Value Segments
19. Profit Margin by Segment
20. Discount Impact on Profit

## Key Insights

1. **Total Sales: $2,297,200.86** across 9,994 order lines.
2. **West region leads** in sales ($725K), followed by East, Central, South.
3. **Furniture is the weakest category** — high sales but low profit.
4. **Tables (-$17,725), Bookcases (-$3,472), Supplies (-$1,189)** are loss-making sub-categories.
5. **Heavy discounting destroys profit.** Orders with >40% discount have negative average profit.
6. **Sales peak in Q4** (September–December each year).
7. **VIP customers** (spending >$10K) drive a disproportionate share of revenue.
8. **Home Office segment** has the highest profit margin.
9. **Standard Class** is the most-used shipping mode (~60% of orders).
