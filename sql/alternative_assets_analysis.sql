-- ===============================
-- Alternative Assets Market Intelligence
-- Schema + Analysis Queries
-- ===============================

-- CREATE TABLES

CREATE TABLE firms (
    firm_id INT PRIMARY KEY,
    firm_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE funds (
    fund_id INT PRIMARY KEY,
    firm_id INT,
    fund_name VARCHAR(150),
    strategy VARCHAR(50),
    vintage_year INT,
    fund_size_usd BIGINT,
    FOREIGN KEY (firm_id) REFERENCES firms(firm_id)
);

CREATE TABLE deals (
    deal_id INT PRIMARY KEY,
    fund_id INT,
    portfolio_company VARCHAR(150),
    industry VARCHAR(50),
    deal_year INT,
    deal_value BIGINT,
    FOREIGN KEY (fund_id) REFERENCES funds(fund_id)
);

-- ===============================
-- ANALYSIS QUERIES
-- ===============================

-- 1. Deal Volume by Industry
SELECT industry, COUNT(*) AS total_deals
FROM deals
GROUP BY industry
ORDER BY total_deals DESC;

-- 2. Investment Trend by Year
SELECT deal_year, SUM(deal_value) AS total_investment
FROM deals
GROUP BY deal_year
ORDER BY deal_year;

-- 3. Average Deal Size by Strategy
SELECT strategy, AVG(deal_value) AS avg_deal_size
FROM deals
JOIN funds ON deals.fund_id = funds.fund_id
GROUP BY strategy
ORDER BY avg_deal_size DESC;

-- 4. Deals by Fund
SELECT fund_name, COUNT(deal_id) AS total_deals
FROM deals
JOIN funds ON deals.fund_id = funds.fund_id
GROUP BY fund_name
ORDER BY total_deals DESC;

-- 5. Funds by Region
SELECT region, COUNT(fund_id) AS fund_count
FROM funds
JOIN firms ON funds.firm_id = firms.firm_id
GROUP BY region
ORDER BY fund_count DESC;

-- 6. Total Investment by Region
SELECT region, SUM(deal_value) AS total_investment
FROM deals
JOIN funds ON deals.fund_id = funds.fund_id
JOIN firms ON funds.firm_id = firms.firm_id
GROUP BY region
ORDER BY total_investment DESC;

-- 7. Average Fund Size by Strategy
SELECT strategy, AVG(fund_size_usd) AS avg_fund_size
FROM funds
GROUP BY strategy
ORDER BY avg_fund_size DESC;
