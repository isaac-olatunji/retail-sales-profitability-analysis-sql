# 📊 Retail Sales Performance and Profitability Analysis Using SQL

![Cover](Assets/cover.svg)

**Tools:** SQL · Aggregate Functions · Window Functions · Subqueries
**Dataset:** Sample Superstore — 9,994 transactions across product categories, customer segments, and U.S. regions

Business-focused SQL analysis of retail sales and profitability, leveraging aggregation, ranking, subqueries, and window functions to identify revenue drivers, margin erosion, discount impacts, and geographic performance trends.

---

## Project Overview

This project analyzes retail sales performance using SQL to evaluate revenue, profitability, regional performance, customer segments, product categories, and discount behavior.

The objective was to move beyond surface-level revenue reporting and uncover the underlying drivers of profitability. Through a combination of aggregation, ranking, and window function techniques, the analysis identifies where profit is generated, where it is lost, and what business actions could improve performance.

---

## Business Problem

The company generated **$2.30M in sales** and **$286K in profit**, resulting in an overall **12.47% profit margin**.

While the business appears healthy at a high level, profitability varies significantly across product categories, customer segments, states, and discount levels. This analysis was conducted to identify the key drivers of profitability and uncover the root causes behind underperforming markets and product lines.

---

## Dataset Overview

| Attribute | Detail |
|------------|------------|
| Transactions | 9,994 Orders |
| Geography | U.S. States & Regions |
| Product Scope | Categories & Sub-Categories |
| Customer Scope | Consumer, Corporate, Home Office |
| Key Metrics | Sales, Profit, Quantity, Discount |
| Source | Sample Superstore Dataset |

---

## Analytical Techniques & SQL Skills

- **Data Exploration** – dataset validation and structure review
- **Aggregation Analysis** – `SUM()`, `AVG()`, `COUNT()` with `GROUP BY`
- **Profit Margin Calculations** – category and state-level profitability analysis
- **Window Functions** – `RANK()`, `DENSE_RANK()`, and running totals using `SUM() OVER()`
- **Percentage Contribution Analysis** – cumulative revenue share calculations
- **Subqueries** – comparative and contribution-based analysis
- **Business Performance Analysis** – identifying revenue drivers and profit leakages

---

## Business Questions Answered

1. What is the company's overall sales and profit performance?
2. Which product categories generate the highest revenue and profit?
3. Which customer segments contribute the most value?
4. Which states and regions drive profitability and which generate losses?
5. How do discounts affect profitability?
6. Which product sub-categories perform best and worst?
7. Where is revenue most concentrated geographically?
8. What are the primary drivers of loss within the business?
9. Why is Texas generating losses despite strong sales performance?

---

## Key Findings

| Finding | Detail |
|----------|----------|
| Overall Profit Margin | 12.47% across $2.30M in sales |
| Technology Margin | 17.40% — highest-performing category |
| Furniture Margin | 2.49% despite generating over $742K in sales |
| Texas Performance | -$25.7K profit on $170K revenue with a 37% average discount |
| Discount Threshold | Profitability declines sharply beyond ~30% discount |
| Revenue Concentration | Top 5 states account for 52% of total revenue |
| Top Profit Sub-Category | Copiers generated $55.6K profit |
| Largest Loss Driver | Tables generated -$17.7K profit |

---

## Results Preview

### Overall Business Performance
![Overall Business Performance](Assets/screenshots/01_Overall_Business_Performance.png)

### Category Performance
![Category Performance](Assets/screenshots/02_Category_Performance.png)

### Texas Profitability Investigation
![Texas Deep Dive](Assets/screenshots/10_Texas_Profitability_Investigation.png)

---

## Business Impact

This analysis revealed that profitability challenges are driven less by revenue generation and more by discounting practices and product mix decisions.

Key opportunities identified include:
- Strengthening discount governance, particularly above 30%
- Improving Furniture category profitability
- Expanding focus on high-margin product lines such as Copiers and Phones
- Replicating successful practices observed in California and New York
- Implementing state-level profitability monitoring to detect margin erosion early

---

## Repository Structure

```text
retail-sales-profitability-analysis-sql/
│
├── README.md
│
├── SQL Scripts/
│   ├── 01_Data_Exploration.sql
│   ├── 02_Business_Performance.sql
│   ├── 03_Category_Analysis.sql
│   ├── 04_Regional_Analysis.sql
│   ├── 05_Segment_Analysis.sql
│   ├── 06_Discount_Analysis.sql
│   └── 07_Window_Functions.sql
│
├── Assets/
│   ├── cover.svg
│   └── screenshots/
│
├── Analysis Report/
│   ├── SQL_Sales_Performance_Report.md
│   └── SQL_Sales_Performance_Report.pdf
│
└── Dataset/
    └── SampleSuperstore.csv
```

---

## Project Assets

Screenshots of SQL query outputs and analysis results are available in the **Assets/screenshots** folder.

---

## Detailed Analysis Report

For complete methodology, SQL query breakdowns, business insights, the Texas profitability investigation, and strategic recommendations:

📖 **[View Full Analysis Report](./Analysis%20Report/SQL_Sales_Performance_Report.md)**

---

## Author

**Isaac Olatunji**
Business Intelligence Analyst focused on transforming data into actionable business insights through SQL, Power BI, Excel, and data storytelling.

GitHub: **isaactheanalyst**
