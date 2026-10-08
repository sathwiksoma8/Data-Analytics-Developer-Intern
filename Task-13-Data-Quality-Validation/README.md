# Task 13 — Data Quality & Analytics Validation

**Validated Solution:** Power BI KPI Dashboard (Tasks 10–12) + SQL + Python cross-checks
**Dataset:** Sample Superstore (9,994 rows)

## Deliverables
- `Task13_Validation_Report.md` — full validation report (11 sections)
- `Superstore_Clean.csv` — validated source dataset
- `Task12_KPI_Analysis.pbix` — the analytics solution being validated
- `screenshots/` — 5 key validation screenshots

## Validation Summary

### Source Data
- Row count: 9,994 ✔
- Column count: 21 ✔
- Order Date format: DD-MM-YYYY (validated, required fixing)
- No duplicate rows ✔

### Transformations
- All dimensions deduplicated correctly
- FactSales row count preserved (9,994)
- Data types correct

### Relationships
- 5 relationships set up (FactSales ↔ 4 Dims + DateTable)
- No orphan rows ✔
- No duplicate keys ✔

### 3-Way Cross-Check (SQL vs Python vs Power BI)

| Metric | SQL | Python | Power BI |
|--------|-----|--------|----------|
| Total Sales | $2,297,200.86 | $2,297,200.86 | 2.30M |
| Total Profit | $286,397.02 | $286,397.02 | 286.40K |
| Total Orders | 5,009 | 5,009 | 5K |
| Profit Margin | 12.47% | 12.47% | 12% |

**All values match across all three tools.**

### KPI Validation
- Total Sales ✔
- Total Profit ✔
- Profit Margin ✔
- Total Orders ✔
- Avg Order Value ✔
- Sales YoY ✔

### Dashboard Validation
- KPI cards correct ✔
- Slicers filter correctly ✔
- Drill-down works ✔
- Drill-through works ✔
- Matrix totals match cards ✔
- Treemap % adds to 100 ✔

## Issues Found & Fixed

| # | Issue | Fix |
|---|-------|-----|
| 1 | Order Date stored as TEXT | Replaced strftime with substr |
| 2 | Row ID blocked dedup | Removed Row ID before dedup |
| 3 | Postal Code as Integer | Switched to Text |
| 4 | Power BI showed $1.67M | Rebuilt CSV from raw with correct dedup |
| 5 | Line chart descending months | Applied Sort ascending |
| 6 | Missing Year→Month hierarchy | Added hierarchy |

## Assumptions
1. Order Date = transaction date
2. Profit provided directly by dataset
3. Discount is a percentage (0–1)
4. Each row is a unique order line
5. All values in USD

## Limitations
1. No data beyond Dec 2015
2. No cost breakdown
3. No marketing attribution
4. No returns data
5. USD only
6. DateTable hard-coded 2012–2015

## Conclusion

All primary metrics match across three independent tools (SQL, Python, Power BI). Transformations preserved data integrity. Joins are correct. KPIs are validated. Dashboard visuals accurately represent the underlying data.

**Data quality score: 9/10**
**Status: Validated and fit for business decision-making**
