# Public Health Data Analytics Portfolio (County-Level Respiratory Surveillance)

This portfolio showcases beginner-friendly **data analytics** projects using **Excel, MySQL, and Python (Pandas)**. It simulates a realistic public health workflow where a county health department tracks **respiratory illness trends (COVID/RSV-style)** across time, demographics, and geography.

---

## 📂 Projects Included

| # | Project | Tools | Description |
|---|---------|--------|-------------|
| 1 | Data Cleaning (Spreadsheet) | Excel | Clean messy public health data into analysis-ready format |
| 2 | Exploratory SQL Queries | MySQL | Identify trends, rising counties, and age-group impact |
| 3 | Joins & Cohort Analysis | MySQL | Combine population & vaccination data to compute per-100k rates |
| 4 | Excel Dashboard | Excel | One-page public health surveillance dashboard |
| 5 | Python Mini ETL | Python (Pandas) | Convert raw CSV export → standardized clean dataset |

---

## 🧠 Skills Demonstrated

- Data cleaning & validation (Excel)
- SQL analytics (`GROUP BY`, `JOIN`, `WINDOW FUNCTIONS`)
- Cohort and per-capita rate calculations (per 100k)
- Public health surveillance logic & interpretation
- Dashboard building with slicers/KPIs
- Python ETL concepts (basic Pandas preprocessing)

---

## 🔬 Real-World Storyline (What this simulates)

> A county public health team is monitoring respiratory illness trends to identify early signals of outbreaks.  
> As the analyst, I cleaned raw agency data, built SQL queries to track hotspots, joined vaccination metrics,  
> and designed an Excel dashboard to support leadership decisions on outreach and testing resources.

---

## 📊 Data Model

**Tables**
- `county_info(county_fips, county_name, state, population)`
- `respiratory_reports(report_id, report_date, county_fips, age_group, cases, tests, positive, hospitalizations, deaths)`
- `vaccinations(county_fips, report_month, series_completed_pct, booster_pct)`

**Granularity:** County-level, time-series, age-segmented

---

## 📌 Next Steps

This portfolio will continue to expand with:
- Additional SQL case studies
- Deeper ETL/cleaning scripts
- Simple forecasting experiments (time-series)

---

## 📎 About this Portfolio

This repository was created to display real analysis workflow skills for internship and entry-level data analytics roles — especially those in **public health, healthcare analytics, or government data work**.

---
