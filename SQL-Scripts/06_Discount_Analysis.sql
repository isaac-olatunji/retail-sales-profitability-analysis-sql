-- ============================================================
-- Script: 06_Discount_Analysis.sql
-- Project: Retail Sales Performance and Profitability Analysis
-- Analyst: isaactheanalyst
-- Description: Discount impact analysis by banded ranges.
--              Identifies the exact discount level at which
--              profitability turns negative.
-- ============================================================


-- ── Discount Impact on Profitability ─────────────────────────
-- Answers: How do discounts affect profitability?
-- Key finding: Margin turns negative the moment discounts exceed 20%
--              51-80% discount band = -119.20% margin, destroying $76.6K
--              0% discount = 29.51% margin (strongest performance)

SELECT
    CASE
        WHEN Discount = 0                          THEN '0%'
        WHEN Discount > 0    AND Discount <= 0.20  THEN '1% - 20%'
        WHEN Discount > 0.20 AND Discount <= 0.30  THEN '21% - 30%'
        WHEN Discount > 0.30 AND Discount <= 0.50  THEN '31% - 50%'
        ELSE '51% - 80%'
    END AS Discount_Range,

    COUNT(*)                                AS Orders_Count,
    ROUND(SUM(Sales), 2)                    AS Total_Sales,
    ROUND(SUM(Profit), 2)                   AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percent

FROM samplesuperstore
GROUP BY Discount_Range
ORDER BY
    CASE
        WHEN Discount_Range = '0%'        THEN 1
        WHEN Discount_Range = '1% - 20%'  THEN 2
        WHEN Discount_Range = '21% - 30%' THEN 3
        WHEN Discount_Range = '31% - 50%' THEN 4
        ELSE 5
    END;
