# Task 10 — Power BI Data Modeling, Power Query & DAX

**Tool:** Microsoft Power BI Desktop
**Dataset:** Superstore Clean (9,994 rows)

## Deliverables
- `Task10_PowerBI_Model.pbix` — full Power BI file
- `Superstore_Clean.csv` — source dataset
- `screenshots/` — 5 key screenshots
- README with documentation

## Power Query Transformations
- Loaded CSV via Get Data → Text/CSV
- Split into 5 tables (FactSales + 4 Dimensions) via Duplicate
- Removed Row ID column
- Removed duplicates from each dimension
- Trimmed FactSales to only keys + metrics

## Star Schema Design

**Fact table:**
- **FactSales** — Order ID, Order Date, Ship Date, Ship Mode, Customer ID, Product ID, Postal Code, Sales, Quantity, Discount, Profit

**Dimension tables:**
- **DimCustomer** — 793 unique customers (Customer ID, Name, Segment)
- **DimProduct** — ~1,900 products (Product ID, Category, Sub-Category, Name)
- **DimGeography** — 632 unique locations (Postal Code, City, State, Region, Country)
- **DimShipMode** — 4 shipping modes
- **DateTable** — calendar 2012-2015 with Year, Quarter, Month, YearMonth, DayOfWeek

## Relationships
- FactSales[Customer ID] → DimCustomer[Customer ID]
- FactSales[Product ID] → DimProduct[Product ID]
- FactSales[Postal Code] → DimGeography[Postal Code]
- FactSales[Ship Mode] → DimShipMode[Ship Mode]
- FactSales[Order Date] → DateTable[Date]

All are many-to-one, single-direction (standard star schema).

## DAX Measures

| Measure | Formula |
|---------|---------|
| Total Sales | `SUM(FactSales[Sales])` |
| Total Profit | `SUM(FactSales[Profit])` |
| Profit Margin | `DIVIDE([Total Profit], [Total Sales], 0)` |
| Total Orders | `DISTINCTCOUNT(FactSales[Order ID])` |
| Avg Order Value | `DIVIDE([Total Sales], [Total Orders], 0)` |
| Sales Last Year | `CALCULATE([Total Sales], SAMEPERIODLASTYEAR(DateTable[Date]))` |
| Sales YoY | `DIVIDE([Total Sales] - [Sales Last Year], [Sales Last Year], 0)` |
| Sales Running Total | `CALCULATE([Total Sales], FILTER(ALL(DateTable[Date]), DateTable[Date] <= MAX(DateTable[Date])))` |
| Sales MoM | `DIVIDE([Total Sales] - CALCULATE([Total Sales], DATEADD(DateTable[Date], -1, MONTH)), CALCULATE([Total Sales], DATEADD(DateTable[Date], -1, MONTH)), 0)` |
| Total Quantity | `SUM(FactSales[Quantity])` |

## Time Intelligence
- **SAMEPERIODLASTYEAR** — used for YoY comparison
- **DATEADD** — used for MoM comparison
- **CALCULATE + FILTER + ALL** — used for running totals
- **DateTable marked as date table** — enables proper time intelligence

## Filter Context
- `CALCULATE` modifies filter context for specific measures
- `ALL(DateTable[Date])` removes date filters for running totals
- All measures respond correctly to slicers and page filters

## Results
- Total Sales: **~$2,297,200** across 2012-2015
- 2015 YoY growth: **~29%**
- Overall profit margin: **~12.5%**

## Reproducibility
Open the `.pbix` file → click **Refresh** in the Home tab → model rebuilds from the CSV.
