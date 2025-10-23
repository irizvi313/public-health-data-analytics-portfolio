# Dataset: Virginia Respiratory Surveillance (Sample Public Health Dataset)

This folder contains a synthetic but realistic public health surveillance dataset modeled after county-level trends in **Virginia (VA)**. The data represents a 12-month respiratory illness monitoring period with vaccination coverage by county.

The goal of this dataset is to demonstrate real-world public health analytics skills across:
- Data cleaning (Excel / Python ETL)
- Trend analysis (SQL)
- Cohort analysis (vaccination vs burden)
- Dashboard visualization (Excel / BI tools)

---

## 📁 Files

| File | Description |
|------|-------------|
| `county_info.csv` | Population & county metadata (Virginia counties + independent cities) |
| `respiratory_reports.csv` | Monthly respiratory surveillance data by age group |
| `vaccinations.csv` | Vaccination & booster coverage by county and month |

---

## 📊 Data Structure

### `county_info.csv`
| Column | Description |
|--------|-------------|
| county_fips | Federal Information Processing Standard code |
| county_name | County or independent city name |
| state | VA (Virginia) |
| population | Estimated population |

### `respiratory_reports.csv`
| Column | Description |
|--------|-------------|
| report_date | First day of the month to represent monthly aggregation |
| county_fips | Links to `county_info` |
| age_group | 0-17, 18-49, 50-64, 65+ |
| cases | Number of respiratory illness cases |
| tests | Total tests conducted |
| positive | Positive test results |
| hospitalizations | Severe outcomes |
| deaths | Mortality |

### `vaccinations.csv`
| Column | Description |
|--------|-------------|
| county_fips | Links to `county_info` |
| report_month | YYYY-MM |
| series_completed_pct | % of population with primary vaccination series |
| booster_pct | % with booster coverage |

---

## 🔗 How This Data Is Used in the Portfolio

| Project | How data is used |
|---------|------------------|
| 01 Excel Cleaning | Raw → cleaned simulation |
| 02 SQL Exploratory | Basic surveillance analytics |
| 03 Cohort Analysis | Vaccination vs hospitalization/case burden |
| 04 Dashboard | Public health visualizations |
| 05 Python ETL | Automating future dataset refresh cycles |

---

## ✅ Why Virginia?

Virginia is a **realistic statewide model** because:
- It includes *independent cities* (treated like counties), which improves realism
- You live in the DMV region → authenticity boost for recruiters
- Public health hiring managers favor localized datasets over generic Kaggle CSVs

---

This dataset gives credibility to the entire portfolio by providing a realistic scenario that simulates work done by public health analysts in government or healthcare settings.
