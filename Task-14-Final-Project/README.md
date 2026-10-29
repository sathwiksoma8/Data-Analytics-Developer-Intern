# Task 14 — Final Industry-Style Data Analytics Project

**Analyst:** Sathwik Soma
**Business Problem:** Why is Superstore's profit margin only 12.47% despite $2.29M in sales, and where should leadership focus?

## Deliverables
- `Task14_Final_Project.ipynb` — Python ETL, EDA, and Statistical Analysis
- `Task14_SQL_Analysis.sql` — SQL queries
- `Task12_KPI_Analysis.pbix` — Power BI Dashboard (reused from Task 12)
- `Task14_Business_Report.md` — Final executive summary and recommendations
- `SampleSuperstore.csv` — Raw dataset
- `screenshots/` — SQL, EDA, and Stats proofs

## Methodology
1. **Python ETL:** Cleaned data, handled dates, removed duplicates.
2. **SQL (SQLite):** Aggregated regional performance and isolated loss-making categories.
3. **EDA:** Visualized discount impact and category profit.
4. **Statistics:** Used T-Tests and ANOVA to prove discount thresholds and regional disparities.
5. **Power BI:** Built interactive KPI dashboards.

## Key Insights
1. **The Discount Trap:** Discounts >20% consistently destroy profit (Statistically proven).
2. **Loss-Making Products:** Tables (-$17.7K), Bookcases (-$3.4K), Supplies (-$1.2K).
3. **Regional Gap:** Central region margin (7.9%) is half of West region (14.9%).

## Strategic Recommendations
1. Cap discounts at 20%.
2. Discontinue or reprice Tables and Bookcases.
3. Audit the Central region's discounting strategy.
4. Focus marketing on high-margin Technology products.
