-- ============================================================
-- Script: 05_Segment_Analysis.sql
-- Project: Retail Sales Performance and Profitability Analysis
-- Analyst: isaactheanalyst
-- Description: Customer segment performance analysis across
--              Consumer, Corporate, and Home Office segments.
-- ============================================================


-- ── Customer Segment Analysis ────────────────────────────────
-- Answers: Which customer segments contribute the most value?
-- Key finding: Home Office is smallest by revenue but most
--              margin-efficient at 14.03%
-- Consumer is largest but carries lowest margin at 11.55%

SELECT
    Segment,
    ROUND(SUM(Sales), 2)                        AS Total_Sales,
    ROUND(SUM(Profit), 2)                       AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percent
FROM samplesuperstore
GROUP BY Segment
ORDER BY Total_Sales DESC;
