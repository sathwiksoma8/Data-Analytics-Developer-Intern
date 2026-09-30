# Task 09 — Data Visualization & Storytelling

**Tool:** Jupyter Notebook (Python, Matplotlib, Seaborn)
**Dataset:** Superstore Clean (9,979 rows)

## Deliverables
- `Task09_Visualization_Storytelling.ipynb` — full notebook
- `Superstore_Clean.csv` — cleaned dataset
- `screenshots/` — 5 key visualizations
- README with the analytical story

## Charts Produced (8 total)

1. **Monthly Sales Trend** — line chart with peak annotation
2. **Regional Performance** — grouped bar (Sales + Profit by region)
3. **Category Sales Share** — donut chart
4. **Discount vs Profit** — scatter with regression line
5. **Top 10 Sub-Categories** — horizontal bar chart
6. **Segment × Category** — grouped bar chart
7. **Profit Heatmap** — Region × Category
8. **Sales Seasonality** — Year × Month heatmap

## Visualization Principles Applied

- **Right chart for the data:**
  - Line charts for time series
  - Bar charts for categorical comparisons
  - Scatter plots for relationships
  - Heatmaps for two-dimensional matrices
  - Donut charts for part-to-whole (single dimension)
- **Consistent color palette** — same colors used across charts for the same categories
- **Annotations** — peaks, troughs, and key values labeled
- **Clear titles and axis labels** — every chart is self-explanatory
- **Sorted bars** — highest values at top for easy reading
- **Diverging colormap (RdYlGn)** for profit heatmap — red = loss, green = profit

## The Superstore Story

### The Big Picture
- **$2.3M in sales** across 4 years (2012–2015)
- **~$286K total profit** (12.5% margin)
- **9,979 orders** analyzed

### What's Working
- Technology is the top category ($836K in sales)
- West region leads in both Sales and Profit
- Consumer segment drives ~50% of revenue
- Copiers, Phones, Accessories are top profit drivers

### What's Broken
- Furniture is unprofitable in multiple regions
- Tables and Bookcases are consistent loss-makers
- Heavy discounting (>40%) destroys profit
- Central region lags (~8% margin vs West's ~15%)

### The Critical Insight
Discounting is the #1 profit-killer. Correlation between discount and profit is **-0.22**.
- Zero discount orders: avg profit **$66**
- 40%+ discount orders: avg profit **-$100**

### Recommendations
1. Cap discounts at 20% — statistically supported threshold
2. Sunset or reprice Tables and Bookcases
3. Focus Q4 marketing (30–40% sales spikes)
4. Replicate West's playbook in Central
5. Target Home Office for premium products (highest AOV: $241)

## Why This Matters
The business is growing (+29% YoY in 2015), but profitability is being undermined
by pricing strategy — not demand. Fixing discount policy could add an estimated
**$100K+ to annual profit** without losing significant volume.
