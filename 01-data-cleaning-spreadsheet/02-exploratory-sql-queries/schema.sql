-- Schema for respiratory surveillance exploratory analysis

DROP TABLE IF EXISTS county_info;
DROP TABLE IF EXISTS respiratory_reports;

-- County metadata (population + geography)
CREATE TABLE county_info (
  county_fips VARCHAR(5) PRIMARY KEY,
  county_name VARCHAR(100) NOT NULL,
  state VARCHAR(2) NOT NULL,
  population INT NOT NULL
);

-- Daily respiratory illness reporting
CREATE TABLE respiratory_reports (
  report_id INT AUTO_INCREMENT PRIMARY KEY,
  report_date DATE NOT NULL,
  county_fips VARCHAR(5) NOT NULL,
  age_group VARCHAR(10) NOT NULL, -- '0-17','18-49','50-64','65+'
  cases INT NOT NULL,
  tests INT NOT NULL,
  positive INT NOT NULL,
  hospitalizations INT NOT NULL,
  deaths INT NOT NULL,
  CONSTRAINT fk_county FOREIGN KEY (county_fips) REFERENCES county_info(county_fips)
);

-- Performance improvements for analytics
CREATE INDEX idx_rr_date ON respiratory_reports(report_date);
CREATE INDEX idx_rr_fips ON respiratory_reports(county_fips);
CREATE INDEX idx_rr_age ON respiratory_reports(age_group);
