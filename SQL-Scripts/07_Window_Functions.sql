-- ============================================================
-- Script: 07_Window_Functions.sql
-- Project: Retail Sales Performance and Profitability Analysis
-- Analyst: isaactheanalyst
-- Description: Window function analysis including state sales
--              ranking, profit ranking, running totals, percentage
--              contribution, and Pareto (80/20) analysis.
-- ============================================================


-- ── 1. State Sales Ranking using RANK() ──────────────────────
-- Answers: How do states rank by total sales?
-- Key finding: Texas ranks 3rd by sales but is worst by profit

SELECT
    State,
    ROUND(SUM(Sales), 2)    AS Total_Sales,
    RANK() OVER (
        ORDER BY SUM(Sales) DESC
    )                       AS Sales_Rank
FROM samplesuperstore
GROUP BY State;


-- ── 2. State Profit Ranking using DENSE_RANK() ───────────────
-- Answers: How do states rank by profitability?
-- Key finding: Texas is last in profit despite top-3 revenue rank
-- DENSE_RANK used to avoid gaps in ranking sequence

SELECT
    State,
    ROUND(SUM(Profit), 2)   AS Total_Profit,
    DENSE_RANK() OVER (
        ORDER BY SUM(Profit) DESC
    )                       AS Profit_Rank
FROM samplesuperstore
GROUP BY State;


-- ── 3. Running Total of Sales by State ───────────────────────
-- Answers: How do sales accumulate across states?

SELECT
    State,
    ROUND(SUM(Sales), 2)    AS Total_Sales,
    ROUND(SUM(SUM(Sales)) OVER (
        ORDER BY SUM(Sales) DESC
    ), 2)                   AS Running_Total_Sales
FROM samplesuperstore
GROUP BY State
ORDER BY Total_Sales DESC;


-- ── 4. Running Total of Profit by State ──────────────────────

SELECT
    State,
    ROUND(SUM(Profit), 2)   AS Total_Profit,
    ROUND(SUM(SUM(Profit)) OVER (
        ORDER BY SUM(Profit) DESC
    ), 2)                   AS Running_Profit_Total
FROM samplesuperstore
GROUP BY State
ORDER BY Total_Profit DESC;


-- ── 5. Percentage Contribution Analysis ──────────────────────
-- Answers: What share of total revenue does each state contribute?
-- Key finding: California = 19.92% of total sales alone

SELECT
    State,
    ROUND(SUM(Sales), 2)    AS Total_Sales,
    ROUND(
        (SUM(Sales) / (SELECT SUM(Sales) FROM samplesuperstore)) * 100,
    2)                      AS Sales_Contribution_Percent
FROM samplesuperstore
GROUP BY State
ORDER BY Total_Sales DESC;


-- ── 6. Pareto Analysis — Running Total + Cumulative % ────────
-- Answers: How many states account for 80% of total revenue?
-- Key finding: Top 5 states = 52% of total revenue
-- California alone = 19.92%

SELECT
    State,
    ROUND(SUM(Sales), 2)    AS Total_Sales,
    ROUND(SUM(SUM(Sales)) OVER (
        ORDER BY SUM(Sales) DESC
    ), 2)                   AS Running_Total,
    ROUND(
        (SUM(SUM(Sales)) OVER (
            ORDER BY SUM(Sales) DESC
        ) / SUM(SUM(Sales)) OVER ()
        ) * 100,
    2)                      AS Cumulative_Percent
FROM samplesuperstore
GROUP BY State
ORDER BY Total_Sales DESC;
