-- ============================================
-- 03 — Joins & Cohort Analysis (MySQL)
-- Vaccination + Monthly Rollup Schema
-- ============================================

-- Remove any previous version
DROP TABLE IF EXISTS vaccinations;

-- Vaccination coverage by county & month
CREATE TABLE vaccinations (
  county_fips VARCHAR(5) NOT NULL,
  report_month CHAR(7) NOT NULL, -- YYYY-MM
  series_completed_pct DECIMAL(5,2) NOT NULL, -- Percent fully vaccinated
  booster_pct DECIMAL(5,2) NOT NULL,          -- Percent boosted
  PRIMARY KEY (county_fips, report_month),
  CONSTRAINT fk_vax_fips FOREIGN KEY (county_fips)
    REFERENCES county_info(county_fips)
);

-- Monthly rollup view for respiratory reports
-- (so later queries are cleaner)
DROP VIEW IF EXISTS monthly_reports;
CREATE VIEW monthly_reports AS
SELECT
  county_fips,
  DATE_FORMAT(report_date, '%Y-%m') AS report_month,
  SUM(cases) AS cases,
  SUM(tests) AS tests,
  SUM(positive) AS positive,
  SUM(hospitalizations) AS hospitalizations,
  SUM(deaths) AS deaths
FROM respiratory_reports
GROUP BY county_fips, DATE_FORMAT(report_date, '%Y-%m');
