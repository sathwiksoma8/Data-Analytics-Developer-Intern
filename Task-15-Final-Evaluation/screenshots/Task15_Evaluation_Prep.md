# Task 15 — Final Technical Evaluation Prep

**Analyst:** Sathwik Soma
**Goal:** Be able to explain and defend the end-to-end analytics work.

---

## 1. The Business Problem (The "Why")
- **Problem:** High sales ($2.3M) but low profit margin (12.47%).
- **Goal:** Identify the root causes of low profitability and give leadership actionable recommendations.

## 2. Data Sources & Cleaning (The "Input")
- **Source:** Superstore CSV (9,994 rows, 21 columns).
- **Issues Found:** Dates were stored as text in DD-MM-YYYY format.
- **Fix in Python:** Used `pd.to_datetime(format='%d-%m-%Y')` to fix it.
- **Fix in SQL:** Used `substr()` because SQLite doesn't recognize that date format natively.

## 3. SQL Analysis (The "Relational View")
- **Skills Used:** GROUP BY, HAVING, JOIN.
- **Key Query:** Filtered for loss-making sub-categories using `HAVING SUM(Profit) < 0`.
- **Insight:** Found that Tables (-$17.7K) and Bookcases (-$3.4K) are the biggest money-losers.

## 4. Python & EDA (The "Programming View")
- **Libraries:** Pandas (cleaning), Matplotlib/Seaborn (charts).
- **Skills:** Merged DataFrames (JOIN), grouped by Region/Category, handled nulls.
- **Insight:** Created a scatter plot proving that discounts >20% immediately tank profit.

## 5. Statistics (The "Proof")
- **T-Test:** Compared profit of discounted vs. full-price orders. P-value < 0.05, proving discounts cause significant losses.
- **ANOVA:** Compared profit across the 4 regions. P-value < 0.05, proving the Central region is statistically underperforming compared to the West.

## 6. Power BI & DAX (The "Dashboard View")
- **Data Model:** Star Schema (1 Fact table, 4 Dimension tables, 1 Date table).
- **Relationships:** One-to-Many from Dims to Fact.
- **DAX Measures:**
  - `Total Sales = SUM(FactSales[Sales])`
  - `Profit Margin = DIVIDE([Total Profit], [Total Sales], 0)`
  - `Sales YoY = CALCULATE([Total Sales], SAMEPERIODLASTYEAR(DateTable[Date]))`

## 7. Recommendations (The "So What?")
1. Cap discounts at 20%.
2. Discontinue or reprice Tables and Bookcases.
3. Audit the Central region's sales strategy.