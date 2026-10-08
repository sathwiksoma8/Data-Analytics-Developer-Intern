# Task 11 — Advanced Interactive Power BI Dashboard

**Tool:** Microsoft Power BI Desktop
**Dataset:** Superstore Clean (9,994 rows)

## Deliverables
- `Task11_Dashboard.pbix` — full interactive dashboard
- `Superstore_Clean.csv` — source dataset
- `screenshots/` — 5 key screenshots
- README with documentation

## Dashboard Pages

### Page 1 — Executive Overview
- 5 KPI cards: Total Sales, Total Profit, Profit Margin, Total Orders, Avg Order Value
- Monthly Sales Trend (line chart with Year → Month hierarchy)
- Sales by Category (donut chart)
- Sales by Region (clustered bar chart)
- 3 Slicers: Year, Region, Category

### Page 2 — Product Analysis
- Top 10 Products by Sales (Clustered bar, filtered with Top N)
- Profit by Sub-Category (Clustered bar, sorted descending)
- Drill-down chart: Category → Sub-Category → Product Name

### Page 3 — Customer Details (Drill-through target)
- Order Details table
- Total Sales and Total Orders cards
- Drill-through enabled on Customer Name

## Interactive Features

### Slicers
- Year slicer (range style)
- Region slicer (list with checkboxes)
- Category slicer (list with checkboxes)
- All visuals respond to slicer selections in real time

### Drill-down
- Hierarchy on the drill-down chart: Category → Sub-Category → Product Name
- Right-click a bar → Drill down → next level shown
- Right-click → Drill up → back to previous level

### Drill-through
- Right-click a data point → "Drill through → Customer Details"
- Page 3 opens filtered to that customer's data
- Back button allows returning to previous page

### Tooltips
- Default tooltips on all charts
- Hover over any bar/line to see detailed values

## Design Principles

- **Consistent color palette** across all charts (blue, orange, green)
- **Aligned KPI cards** with consistent sizing
- **Clear titles** on every visual
- **Sorted data** — highest values at top/bottom for readability
- **Right chart for data type:**
  - Line chart for time series
  - Donut for part-to-whole (Category)
  - Bar charts for comparisons (Region, Sub-Category, Products)
  - Cards for KPIs

## Validation

- Cross-checked Total Sales against SQL / Python results: **$2,297,200.86**
- Cross-checked Total Profit: **$286,397.02**
- Cross-checked Order Count: **9,994**
- All slicer combinations correctly filter the visuals
- Drill-through correctly passes customer context to Page 3

## Key Insights Visible in Dashboard

- West region leads in both Sales and Profit
- Technology drives the largest share of revenue
- Tables and Bookcases are loss-making sub-categories
- Sales peak in Q4 (Sep–Dec) each year
- Consumer segment is the dominant segment across all regions

## Reproducibility

Open `Task11_Dashboard.pbix` → click **Refresh** to rebuild from the CSV.
