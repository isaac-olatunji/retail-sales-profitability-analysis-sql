-- ============================================================
-- Script: 02_Business_Performance.sql
-- Project: Retail Sales Performance and Profitability Analysis
-- Analyst: isaactheanalyst
-- Description: Overall business performance metrics including
--              total sales, profit, quantity, and profit margin.
-- ============================================================


-- ── Overall Business Performance ────────────────────────────
-- Answers: What is the company's overall sales and profit performance?
-- Result: $2.30M sales | $286K profit | 12.47% margin

SELECT
    ROUND(SUM(Sales), 2)                            AS Total_Sales,
    ROUND(SUM(Profit), 2)                           AS Total_Profit,
    SUM(Quantity)                                   AS Total_Quantity,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2)     AS Profit_Margin_Percent
FROM samplesuperstore;
