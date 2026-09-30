# Task 07 — Exploratory Data Analysis (EDA)

**Tool:** Jupyter Notebook (Python, Pandas, Matplotlib, Seaborn)
**Dataset:** Superstore Clean (9,979 rows, 21 columns)

## Deliverables
- `Task07_EDA.ipynb` — full EDA notebook
- `Superstore_Clean.csv` — cleaned dataset from Task 6
- `screenshots/` — 6 key visualizations

## Analyses Performed

### Univariate
- Sales distribution (histogram + boxplot)
- Profit distribution (histogram + boxplot)
- Category, Region, Ship Mode distributions

### Bivariate
- Sales vs Profit (scatter)
- Discount vs Profit (scatter)
- Sales by Category (boxplot)
- Profit by Region (boxplot)

### Multivariate
- Correlation heatmap
- Pairplot of numeric columns

### Trends
- Monthly sales trend (2012–2015)

### Anomalies
- IQR-based outlier detection
- Top 10 highest-profit and biggest-loss orders

### Segment Differences
- Segment × Category sales
- Segment × Region profit

## Key Findings

- Sales is right-skewed — most orders under $100
- 1,800+ loss-making orders identified
- Sales ↔ Profit correlation: **+0.48**
- Discount ↔ Profit correlation: **-0.22** (key negative relationship)
- Losses concentrate at high discount levels (>40%)
- West region leads in profit; Central lags
- Q4 sales spike every year (holiday season)
- Consumer drives most sales; Home Office has highest AOV
- Tables and Bookcases are consistent loss-makers

## Business Recommendations

1. Cap discounts at 20% — profit turns negative beyond that
2. Investigate Furniture pricing — high sales but low margin
3. Focus Q4 marketing investment
4. Target Home Office for premium product lines
5. Review Tables and Bookcases product strategy
