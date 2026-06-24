-- ============================================================
-- Script: 01_Data_Exploration.sql
-- Project: Retail Sales Performance and Profitability Analysis
-- Analyst: isaactheanalyst
-- Description: Initial database setup, dataset preview, row
--              count verification, and table structure review.
-- ============================================================


-- ── 1. Create and select the database ───────────────────────
CREATE DATABASE superstore_db;

USE superstore_db;


-- ── 2. Preview first 10 rows ────────────────────────────────
SELECT *
FROM samplesuperstore
LIMIT 10;


-- ── 3. Count total records ───────────────────────────────────
SELECT COUNT(*)
FROM samplesuperstore;

SELECT COUNT(*) AS Total_Records
FROM samplesuperstore;


-- ── 4. Review table structure ────────────────────────────────
-- Confirms column names, data types, and nullability
DESCRIBE samplesuperstore;
