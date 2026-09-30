# Task 08 — Statistical Analysis for Business Decisions

**Tool:** Jupyter Notebook (Python, Pandas, SciPy, Matplotlib, Seaborn)
**Dataset:** Superstore Clean (9,979 rows)
**Approach:** Apply statistics to practical business questions and interpret results in business terms

## Deliverables
- `Task08_Statistical_Analysis.ipynb` — full analysis notebook
- `Superstore_Clean.csv` — cleaned dataset from Task 6
- `screenshots/` — 5 key statistical test outputs

## Analyses Performed

### Descriptive Statistics
- Mean, median, std for Sales, Quantity, Discount, Profit
- Skewness and kurtosis measures

### Distribution Analysis
- Histograms of Sales and Profit
- Shapiro-Wilk normality test
- Result: both variables are NOT normally distributed (right-skewed)

### Sampling Demonstration
- 10 random samples of size 100
- Demonstrated Central Limit Theorem (sample means converge to population mean)

### Confidence Intervals
- 95% CI for mean Sales
- 95% CI for mean Profit

### Correlation Analysis
- Pearson correlation (linear relationships)
- Spearman correlation (rank-based, robust to outliers)
- Correlation heatmap

### Hypothesis Tests

| Test | Question | Result |
|------|----------|--------|
| Two-sample t-test (West vs East) | Is profit different by region? | Reject H0 — regions differ |
| Two-sample t-test (Discounted vs Non) | Do discounts reduce profit? | Reject H0 — discounts hurt |
| Chi-square (Region × Category) | Are region and category independent? | Reject H0 — they are related |
| One-way ANOVA (4 regions) | Are all region profits equal? | Reject H0 — at least one differs |

## Key Statistical Findings

- **Sales and Profit are right-skewed** — median is lower than mean
- **Mean Sales 95% CI:** roughly $157–$177
- **Mean Profit 95% CI:** roughly $25–$32 (fully above 0 → profitable on average)
- **Sales ↔ Profit correlation:** +0.48 (moderate positive)
- **Discount ↔ Profit correlation:** -0.22 (moderate negative)
- **Discounted orders have significantly lower profit** than non-discounted (t-test p < 0.001)
- **Regions differ significantly in profit** (ANOVA p < 0.05)
- **Region and Category are not independent** — some categories are concentrated regionally

## Business Recommendations

1. **Cap discounts at 20%** — statistical evidence that higher discounts erode profit
2. **Region-specific strategy** — West outperforms; Central needs intervention
3. **Focus on high-margin categories** (Technology, Copiers)
4. **Use statistical testing** for future decisions instead of intuition
5. **Monitor discount policy** — statistical evidence supports tighter discount controls

## Interpretation Notes

All hypothesis tests use a significance level of α = 0.05. Results are interpreted
in plain business language — not just reported as p-values.
