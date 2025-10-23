-- ============================================
-- 03 — COHORT & JOINED ANALYSIS
-- Per 100k rates + vaccination relationship
-- ============================================

-- 1) Join monthly surveillance with population & vaccination coverage
WITH joined AS (
  SELECT
    mr.county_fips,
    mr.report_month,
    ci.county_name,
    ci.state,
    ci.population,
    mr.cases,
    mr.hospitalizations,
    mr.deaths,
    v.series_completed_pct,
    v.booster_pct
  FROM monthly_reports mr
  JOIN county_info ci USING (county_fips)
  LEFT JOIN vaccinations v
    ON v.county_fips = mr.county_fips
   AND v.report_month = mr.report_month
)

-- 2) Convert raw counts to rates per 100k residents
, rates AS (
  SELECT
    county_fips,
    county_name,
    state,
    report_month,
    ROUND(100000.0 * cases / NULLIF(population,0), 2) AS cases_per_100k,
    ROUND(100000.0 * hospitalizations / NULLIF(population,0), 2) AS hosp_per_100k,
    ROUND(100000.0 * deaths / NULLIF(population,0), 2) AS deaths_per_100k,
    series_completed_pct,
    booster_pct
  FROM joined
)

-- 3) Exposure-response style grouping by booster % band
SELECT
  CASE
    WHEN booster_pct >= 60 THEN '60%+ coverage'
    WHEN booster_pct >= 40 THEN '40-59%'
    WHEN booster_pct >= 20 THEN '20-39%'
    ELSE '<20% coverage'
  END AS booster_band,
  ROUND(AVG(cases_per_100k), 2) AS avg_cases_per_100k,
  ROUND(AVG(hosp_per_100k), 2) AS avg_hosp_per_100k,
  ROUND(AVG(deaths_per_100k), 2) AS avg_deaths_per_100k
FROM rates
GROUP BY booster_band
ORDER BY avg_cases_per_100k DESC;

-- ============================================
-- COHORT BEHAVIOR (First outbreak month vs after)
-- ============================================

WITH first_month AS (
  SELECT county_fips, MIN(report_month) AS first_month
  FROM monthly_reports
  GROUP BY county_fips
),
labeled AS (
  SELECT
    mr.county_fips,
    mr.report_month,
    mr.cases,
    CASE
      WHEN mr.report_month = fm.first_month THEN 'Initial Outbreak Month'
      ELSE 'Post-Outbreak Period'
    END AS outbreak_phase
  FROM monthly_reports mr
  JOIN first_month fm USING (county_fips)
)

SELECT
  outbreak_phase,
  ROUND(AVG(cases), 2) AS avg_cases
FROM labeled
GROUP BY outbreak_phase;
