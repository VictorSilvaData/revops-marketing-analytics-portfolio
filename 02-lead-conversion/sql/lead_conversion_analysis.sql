-- =========================================
-- 1. CREATE TABLES
-- =========================================

-- Leads table
CREATE TABLE leads (...);

-- Customers table
CREATE TABLE customers (...);

-- =========================================
-- 2. DATA GENERATION
-- =========================================

-- Insert leads
INSERT INTO leads
SELECT ...

-- Insert customers
INSERT INTO customers
SELECT ...

-- =========================================
-- 3. ANALYTICAL VIEW
-- =========================================

CREATE OR REPLACE VIEW lead_conversion_dataset AS
SELECT ...

-- =========================================
-- 4. ANALYSIS QUERIES
-- =========================================

-- Conversion Rate by Source
SELECT ...

-- Revenue by Source
SELECT ...

-- Lead Quality Distribution
SELECT ...