# 01 — Spreadsheet Data Cleaning (Excel)

**Goal:** Convert messy county-level respiratory surveillance data into a clean, analysis-ready dataset.

This simulates receiving raw data exports from a public health agency that need to be standardized before SQL or dashboarding.

---

## 🏁 Starting Point (Raw Data)
Typical raw file issues:
- Mixed date formats (MM/DD/YYYY + text dates)
- County names not standardized (ex: "St. Louis" vs "Saint Louis")
- Numeric columns stored as text
- Duplicate rows by date & age_group
- Missing population alignment
- Age groups written inconsistently (e.g., "0-17 ", "0-17y")

---

## ✅ Cleaning Tasks Performed

| Step | Description |
|------|-------------|
| 1 | Converted all date fields to `YYYY-MM-DD` |
| 2 | Trimmed whitespace & standardized county names |
| 3 | Ensured `county_fips` is the unique geographic key |
| 4 | Cast cases/tests/positive/hospitalizations/deaths to numeric |
| 5 | Removed duplicate rows |
| 6 | Created `month` and `week` fields for later aggregation |
| 7 | Calculated `positivity_rate = positive / tests` |

---

## 📈 Output (Clean File)
- `cleaned_public_health_data.xlsx`
- Columns are standardized and validated
- Ready to be imported into MySQL for SQL queries

---

## 🔍 What This Shows to Employers
This project demonstrates:
- Realistic data-cleaning workflow
- Ability to prepare public health datasets
- Foundation for analytics that follow in Projects 2–5

---

## 📎 Next Step
The cleaned file from this project is used in **02-exploratory-sql-queries** to begin trend analysis.
