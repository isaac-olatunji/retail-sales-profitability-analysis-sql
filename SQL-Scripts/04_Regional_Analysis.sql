-- ============================================================
-- Script: 04_Regional_Analysis.sql
-- Project: Retail Sales Performance and Profitability Analysis
-- Analyst: isaactheanalyst
-- Description: Regional and state-level performance analysis
--              including profit margins, top states, loss-making
--              states, and root-cause deep dive into Texas.
-- ============================================================


-- ── 1. Regional Overview ─────────────────────────────────────
-- Answers: Which regions drive profitability?
-- Key finding: Central region weakest at 7.92% margin —
--              Texas, Illinois, Ohio all sit in Central

SELECT
    Region,
    ROUND(SUM(Sales), 2)                        AS Total_Sales,
    ROUND(SUM(Profit), 2)                       AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percent
FROM samplesuperstore
GROUP BY Region
ORDER BY Total_Sales DESC;


-- ── 2. Top 10 States by Sales ────────────────────────────────
-- Key finding: Texas is top-3 by revenue but loss-making

SELECT
    State,
    ROUND(SUM(Sales), 2)    AS Total_Sales,
    ROUND(SUM(Profit), 2)   AS Total_Profit
FROM samplesuperstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;


-- ── 3. State Profit Analysis (All States) ───────────────────
-- Answers: Which states are profitable and which are not?

SELECT
    State,
    ROUND(SUM(Profit), 2)   AS Total_Profit
FROM samplesuperstore
GROUP BY State
ORDER BY Total_Profit DESC;


-- ── 4. Worst 10 States by Profit ─────────────────────────────
-- Key finding: 10 loss-making states; top 4 destroy $70K+ combined

SELECT
    State,
    ROUND(SUM(Sales), 2)    AS Total_Sales,
    ROUND(SUM(Profit), 2)   AS Total_Profit
FROM samplesuperstore
GROUP BY State
ORDER BY Total_Profit ASC
LIMIT 10;


-- ── 5. Texas Deep Dive — Category Breakdown ──────────────────
-- Key finding: Office Supplies (-$18.6K) and Furniture (-$10.4K)
--              loss-making in Texas; Technology only profitable category

SELECT
    Category,
    ROUND(SUM(Sales), 2)    AS Total_Sales,
    ROUND(SUM(Profit), 2)   AS Total_Profit
FROM samplesuperstore
WHERE State = 'Texas'
GROUP BY Category
ORDER BY Total_Profit;


-- ── 6. Texas Deep Dive — Discount Summary ───────────────────
-- Key finding: 37% avg discount places Texas in -24.8% margin band

SELECT
    ROUND(AVG(Discount), 2)    AS Avg_Discount,
    ROUND(SUM(Sales), 2)       AS Total_Sales,
    ROUND(SUM(Profit), 2)      AS Total_Profit
FROM samplesuperstore
WHERE State = 'Texas';
