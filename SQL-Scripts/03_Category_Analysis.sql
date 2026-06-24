-- ============================================================
-- Script: 03_Category_Analysis.sql
-- Project: Retail Sales Performance and Profitability Analysis
-- Analyst: isaactheanalyst
-- Description: Category-level performance including sales,
--              profit, margin, and average discount per category.
--              Also includes sub-category breakdown.
-- ============================================================


-- ── 1. Category Performance with Profit Margin ──────────────
-- Answers: Which product categories generate the highest revenue and profit?
-- Key finding: Furniture generates 32% of sales but only 2.49% margin

SELECT
    Category,
    ROUND(SUM(Sales), 2)                            AS Total_Sales,
    ROUND(SUM(Profit), 2)                           AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2)     AS Profit_Margin_Percent
FROM samplesuperstore
GROUP BY Category
ORDER BY Profit_Margin_Percent DESC;


-- ── 2. Discount Impact by Category ──────────────────────────
-- Answers: How does avg discount correlate with category margin?
-- Key finding: Technology lowest discount (13%), highest margin (17.4%)

SELECT
    Category,
    ROUND(AVG(Discount), 2)    AS Avg_Discount,
    ROUND(SUM(Sales), 2)       AS Total_Sales,
    ROUND(SUM(Profit), 2)      AS Total_Profit
FROM samplesuperstore
GROUP BY Category
ORDER BY Avg_Discount DESC;


-- ── 3. Top 10 Profit-Generating Sub-Categories ──────────────
-- Key finding: Copiers ($55.6K) highest profit without highest sales

SELECT
    `Sub-Category`,
    ROUND(SUM(Sales), 2)    AS Total_Sales,
    ROUND(SUM(Profit), 2)   AS Total_Profit
FROM samplesuperstore
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC
LIMIT 10;


-- ── 4. Loss-Making Sub-Categories ───────────────────────────
-- Key finding: Tables (-$17.7K) is the largest loss driver

SELECT
    `Sub-Category`,
    ROUND(SUM(Sales), 2)    AS Total_Sales,
    ROUND(SUM(Profit), 2)   AS Total_Profit
FROM samplesuperstore
GROUP BY `Sub-Category`
ORDER BY Total_Profit ASC
LIMIT 10;


-- ── 5. Avg Discount by Sub-Category ─────────────────────────
-- Key finding: Binders (37% discount, still $30K profit) vs
--              Tables (26% discount, -$17.7K loss)
-- Supplies loses at 8% discount — a cost problem, not discount

SELECT
    `Sub-Category`,
    ROUND(AVG(Discount), 2)    AS Avg_Discount,
    ROUND(SUM(Sales), 2)       AS Total_Sales,
    ROUND(SUM(Profit), 2)      AS Total_Profit
FROM samplesuperstore
GROUP BY `Sub-Category`
ORDER BY Avg_Discount DESC;
