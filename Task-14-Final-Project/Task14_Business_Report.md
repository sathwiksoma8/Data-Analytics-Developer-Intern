# Task 14 — Final Industry-Style Data Analytics Project

**Analyst:** Sathwik Soma
**Tools Used:** Python (Pandas, Matplotlib, Seaborn, SciPy), SQL (SQLite), Power BI
**Dataset:** Sample Superstore (9,994 transactions, 2011–2014)

---

## 1. The Business Problem
Superstore generated **$2.29M** in sales, but the overall profit margin is only **12.47%**. Leadership needs to understand why profit is low and where they should focus to improve it.

---

## 2. Methodology (End-to-End Pipeline)

1. **Data Cleaning (Python):** Removed duplicates, converted text dates to proper Datetime objects, and handled missing values. Added time-based features (Year, Month).
2. **SQL Analysis (SQLite):** Created an in-memory database to run grouped aggregations (Regions, Sub-Categories) using `HAVING` filters to isolate losses.
3. **Exploratory Data Analysis (Python):** Generated 4 key visuals to identify relationships between Discounts, Profit, and Categories.
4. **Statistical Testing (SciPy):** Ran a T-Test to prove the impact of discounts and an ANOVA test to prove regional differences.
5. **Dashboarding (Power BI):** Built a 3-page interactive dashboard for business users.

---

## 3. Key Findings

### A. The Discount Trap (Statistical Proof)
A two-sample T-Test was conducted comparing the profit of discounted orders vs full-price orders.
- **Full-Price Orders:** Average profit is positive (~$66).
- **Discounted Orders:** Average profit drops significantly, turning deeply negative when discounts exceed 20%.
- **P-value < 0.05:** The loss in profit from discounting is statistically significant. It is not random chance.

### B. Loss-Making Products
While Technology drives overall profit, the Furniture category is bleeding money.
- **Tables:** -$17,725 (Worst performer)
- **Bookcases:** -$3,472
- **Supplies:** -$1,189

### C. Regional Disparity
ANOVA testing confirmed that regional performance is not equal. 
- **West:** $725K Sales / 14.9% Margin
- **East:** $678K Sales / 13.5% Margin
- **Central:** $501K Sales / **7.9% Margin** (Significantly underperforming)
- **South:** $391K Sales / 11.9% Margin

---

## 4. Recommendations

Based on the analysis, the following actions are recommended:

1. **Implement a Discount Cap:** Restrict sales reps from offering discounts above 20% without manager approval. The data shows this is the exact threshold where the company loses money.
2. **Discontinue Loss-Making Products:** Reprice or stop selling Tables and Bookcases. The company loses $17K+ per year just on Tables.
3. **Audit the Central Region:** Investigate why the Central region's margin (7.9%) is half that of the West (14.9%). Are they over-discounting? Are shipping costs higher?
4. **Double Down on Technology:** Focus marketing spend on Copiers, Phones, and Accessories, which have the highest profit margins.

---

## 5. Deliverables Included
- `Task14_Final_Project.ipynb` — Python cleaning, SQL analysis, EDA, and Statistics.
- `Task14_SQL_Analysis.sql` — SQL queries used for analysis.
- `Task14_Final_Dashboard.pbix` — Power BI dashboard (from Task 12).
- `Task14_Business_Report.md` — This document.
- `screenshots/` — Proof of charts and SQL results.