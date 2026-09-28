# Task 02 — Advanced Excel & Power Query Analytics

**Dataset:** Sample Superstore

## Deliverables
- `Task02_Excel_PowerQuery.xlsx`
- `SampleSuperstore.xlsx` (raw dataset)
- `screenshots/` (5 PNGs)

## What I Did

### Power Query (ETL)
- Imported CSV via Get Data → From Text/CSV
- Removed Row ID column
- Removed duplicates
- Removed blank rows
- Fixed data types
- Trimmed and cleaned text columns
- Sorted by Order Date
- Loaded to sheet `CleanData`
- Kept raw data in sheet `RawData`

### Excel Analysis
- **Lookup sheet** — XLOOKUP + INDEX-MATCH to fetch Customer Name, Category, Sales by Order ID
- **Filters sheet** — Data Validation dropdowns for Region and Category
- **Analysis sheet** — SUMIFS, COUNTIFS, AVERAGEIFS linked to dropdowns
- **Dashboard sheet** — 3 PivotTables with slicers and charts:
  - Sales by Region × Category (column chart)
  - Profit by Sub-Category (bar chart)
  - Sales by Segment (pie chart)

## Key Insights

1. **Overall Sales: ~$1,099,862** across 5,009 unique orders.
2. **Furniture is loss-making in the East region** despite strong sales volume.
3. **Sub-categories losing money:** Tables (-$10,997), Bookcases (-$1,247), Supplies (-$754). Driven by discount rates above 40%.
4. **Top profit drivers:** Copiers ($22,402), Phones ($20,938), Accessories ($19,209).
5. **Consumer segment** accounts for the largest share of Sales across all regions.
