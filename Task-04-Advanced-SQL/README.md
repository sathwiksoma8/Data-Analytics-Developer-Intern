# Task 04 — Advanced SQL Analytics

**Database:** Superstore.db (SQLite)
**Dataset:** Sample Superstore (9,994 rows)
**Tool:** DB Browser for SQLite

## Deliverables
- `Task04_Advanced_SQL.sql` — 15 advanced SQL queries
- `Superstore.db` — SQLite database
- `SampleSuperstore.xlsx` — raw dataset
- `screenshots/` — 15 query result screenshots

## Skills Demonstrated
- CTEs (WITH clause)
- Window Functions: ROW_NUMBER, RANK, DENSE_RANK
- LAG / LEAD for period-over-period comparison
- PARTITION BY for group-wise calculations
- Running / Cumulative totals
- Moving averages (ROWS BETWEEN)
- Date/time analysis
- Advanced aggregations

## Query List

1. Total Sales by Region (CTE)
2. Rank Products Within Each Category (ROW_NUMBER)
3. Compare ROW_NUMBER, RANK, DENSE_RANK
4. LAG — Month-over-Month Sales Change
5. LEAD — Compare to Next Month
6. Running Total of Sales
7. Running Total by Region (PARTITION BY)
8. Top 3 Products per Category (CTE + RANK)
9. Customer Rank Within Region
10. Year-over-Year Growth (LAG)
11. 3-Month Moving Average
12. Quarterly Sales Analysis
13. Month-over-Month Profit Change
14. Cumulative Profit by Region
15. Top Customer per Region

## Key Insights

1. **West region leads** with 14.94% profit margin; Central lowest at 7.92%.
2. **2015 showed ~29% YoY growth** in sales.
3. **Q4 is consistently the strongest quarter** (holiday season).
4. **Moving averages smooth month-to-month volatility** — useful for trend forecasting.
5. **Top customer per region** identified — key accounts for retention.
6. **Cumulative profit by region** reveals growth trajectory over time.

## Note on Date Format

The "Order Date" column is stored as DD-MM-YYYY text. All date queries use
`substr()` to extract year and month, instead of `strftime()`, because
SQLite only recognizes ISO 8601 dates (YYYY-MM-DD) natively.
