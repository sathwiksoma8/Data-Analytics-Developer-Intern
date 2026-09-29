# Task 05 — Python for Data Analytics

**Tool:** Jupyter Notebook (Anaconda)
**Dataset:** Sample Superstore (9,994 rows)
**Libraries:** Pandas, NumPy

## Deliverables
- `Task05_Python_Analysis.ipynb` — full analysis notebook
- `SampleSuperstore.csv` — raw dataset
- `output_*.csv` — 4 exported summary tables
- `screenshots/` — 5 key result screenshots

## Skills Demonstrated
- Loading CSV data with pandas
- Data type conversion (text → datetime)
- Filtering (WHERE equivalent)
- Grouping and aggregation (GROUP BY)
- Multi-column groupby
- Sorting and Top-N analysis
- Merging DataFrames (JOIN)
- Pivot tables
- Time-series analysis (monthly trends)
- CASE-style logic with `pd.cut()`
- Window functions (ranking within groups)
- Descriptive statistics
- Correlation analysis
- Exporting results to CSV for reproducibility

## Analysis Highlights

### 1. Regional Performance
- West region leads in sales (~$725K) and profit ($108K)
- Central region has the weakest profit margin

### 2. Category Analysis
- Technology and Office Supplies are consistently profitable
- Furniture has high sales but low profit
- Tables, Bookcases, Supplies are loss-making sub-categories

### 3. Discount Impact
- Orders with no discount: avg profit $66.90
- Discounts above 20% turn average profit negative
- Discount ↔ Profit correlation: -0.219

### 4. Segment Analysis
- Consumer drives ~50% of sales
- Home Office has the highest average order value ($241)
- Corporate is a balanced middle segment

### 5. Time Trends
- Sales peak in Q4 (Sep–Dec) each year
- 2015 shows ~29% YoY growth vs 2014

## Reproducibility
- All analysis contained in the notebook
- Raw data: `SampleSuperstore.csv`
- Output CSVs saved for verification
- Open the notebook in Jupyter, run all cells top to bottom
- 
