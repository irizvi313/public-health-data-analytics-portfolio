-- ============================================
-- LOAD VIRGINIA PUBLIC HEALTH DATA (MySQL)
-- ============================================

-- Adjust the LOCAL path below depending on your machine
-- Example path: C:/Users/YourName/Downloads/public-health-data-analytics-portfolio/data/

LOAD DATA LOCAL INFILE 'data/county_info.csv'
INTO TABLE county_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(county_fips, county_name, state, population);

LOAD DATA LOCAL INFILE 'data/respiratory_reports.csv'
INTO TABLE respiratory_reports
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(report_date, county_fips, age_group, cases, tests, positive, hospitalizations, deaths);

LOAD DATA LOCAL INFILE 'data/vaccinations.csv'
INTO TABLE vaccinations
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(county_fips, report_month, series_completed_pct, booster_pct);
