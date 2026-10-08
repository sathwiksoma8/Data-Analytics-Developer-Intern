# Task 12 — Business KPI, Trend & Time-Based Analysis

**Tool:** Microsoft Power BI Desktop
**Dataset:** Superstore Clean (9,994 rows)

## Deliverables
- `Task12_KPI_Analysis.pbix` — full KPI analysis dashboard
- `Superstore_Clean.csv` — source dataset
- `screenshots/` — 5 key screenshots
- README with documentation

## Page 4 — KPI Trends Dashboard

### KPI Cards (6)
| KPI | Value |
|-----|-------|
| Total Sales | $2.30M |
| Total Profit | $286.40K |
| Profit Margin | 12% |
| Total Orders | 5K |
| Sales YoY | 27% |
| Avg Order Value | $458.61 |

### Time-Based Analysis

**Sales Trend by Year (with YoY)**
- Line chart: Total Sales + Sales YoY across 2012–2015
- 2015 shows strong year-over-year growth (+27%)

**Sales Trend by Month (with MoM)**
- Line chart: Total Sales + Sales MoM per month
- Clear seasonal peaks visible in Q4 each year
- Month-over-month variance highlights growth spikes

### Contribution Analysis

**Sales by Category (Treemap)**
- Technology: $836K (36.4%)
- Furniture: $742K (32.3%)
- Office Supplies: $719K (31.3%)

### Variance Analysis

**Total Profit + Sales YoY by Region**
- West leads in profit (~$108K)
- East: $91.5K
- Central: $39.7K (weakest)
- South: $46.7K

### Detailed Matrix

Category → Sub-Category breakdown with:
- Total Sales
- Total Profit
- Profit Margin

Matrix reveals:
- Copiers, Phones, Accessories are top profit drivers
- Tables, Bookcases, Supplies are loss-making

## Trend Insights

1. **Strong upward trend** — Sales grew steadily from 2012 to 2015
2. **2015 breakout year** — +27% YoY growth
3. **Seasonal pattern** — Q4 (Sep–Dec) sales spike every year
4. **Category shift** — Technology maintaining largest share
5. **Regional disparity** — West outperforms consistently

## Business Recommendations

1. **Double Q4 investment** — highest ROI period
2. **Fix Central region** — low profit margin (7.9% vs 15% in West)
3. **Cut loss-making sub-categories** — Tables, Bookcases, Supplies
4. **Focus on Technology** — highest sales and profit contribution
5. **Investigate MoM volatility** — smooth out sales dips to improve forecasting

## Validation
- Total Sales: $2,297,200.86 (cross-checked with SQL/Python)
- Total Profit: $286,397.02
- Profit Margin: 12.47%
- Sales YoY 2015: 27%
