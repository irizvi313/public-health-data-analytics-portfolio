-- ============================================
-- 02 — EXPLORATORY SQL ANALYSIS
-- County-Level Respiratory Surveillance
-- ============================================

-- 1) Monthly aggregation of core metrics per county
WITH daily AS (
  SELECT
    county_fips,
    DATE_FORMAT(report_date, '%Y-%m') AS month,
    SUM(cases) AS total_cases,
    SUM(tests) AS total_tests,
    SUM(positive) AS total_positive,
    SUM(hospitalizations) AS total_hospitalizations,
    SUM(deaths) AS total_deaths
  FROM respiratory_reports
  GROUP BY county_fips, DATE_FORMAT(report_date, '%Y-%m')
)
SELECT d.*, ci.county_name, ci.state
FROM daily d
JOIN county_info ci USING (county_fips)
ORDER BY month, county_fips;


-- 2) Top 10 fastest rising counties (month-over-month change)
WITH monthly AS (
  SELECT
    county_fips,
    DATE_FORMAT(report_date, '%Y-%m') AS month,
    SUM(cases) AS total_cases
  FROM respiratory_reports
  GROUP BY county_fips, DATE_FORMAT(report_date, '%Y-%m')
),
with_lag AS (
  SELECT
    county_fips,
    month,
    total_cases,
    LAG(total_cases) OVER (PARTITION BY county_fips ORDER BY month) AS prev_month_cases
  FROM monthly
)
SELECT wl.county_fips, ci.county_name, ci.state,
       wl.month, wl.total_cases, wl.prev_month_cases,
       (wl.total_cases - wl.prev_month_cases) AS change_in_cases
FROM with_lag wl
JOIN county_info ci USING (county_fips)
WHERE wl.prev_month_cases IS NOT NULL
ORDER BY change_in_cases DESC
LIMIT 10;


-- 3) Age group distribution of positive results
SELECT
  age_group,
  SUM(positive) AS total_positive,
  ROUND(
    100.0 * SUM(positive) /
    NULLIF((SELECT SUM(positive) FROM respiratory_reports), 0),
    2
  ) AS percent_of_total
FROM respiratory_reports
GROUP BY age_group
ORDER BY total_positive DESC;


-- 4) Positivity trend over time
SELECT
  DATE_FORMAT(report_date, '%Y-%m') AS month,
  SUM(positive) AS total_positive,
  SUM(tests) AS total_tests,
  ROUND(100.0 * SUM(positive) / NULLIF(SUM(tests), 0), 2) AS positivity_rate
FROM respiratory_reports
GROUP BY month
ORDER BY month;
