# 04 — Excel Public Health Dashboard

**Goal:** Build a single-page Excel dashboard that visualizes monthly respiratory illness trends, hotspots, and vaccination relationships for decision-makers.

This simulates what a county or state public health analyst would present to leadership during a respiratory spike.

---

## 📊 Dashboard Contents

| Component | Description |
|-----------|-------------|
| KPI Cards | Key metrics (cases, hospitalizations, deaths, positivity rate) |
| Trend Line | Monthly cases trend |
| Heat Map | Counties ranked by cases per 100k |
| Slicers | Month and County (optional: Age Group) |
| Booster Coverage Comparison | Rates by booster % band |

---

## 📁 Files in this Folder

| File | Description |
|------|-------------|
| `public_health_dashboard.xlsx` | Final Excel dashboard (to be uploaded once completed) |

---

## 📌 Data Source

The dashboard uses data exported from:
- `02-exploratory-sql-queries`
- `03-joins-and-cohort-analysis`

This reflects the realistic pipeline:  
**Raw Excel → SQL cleaning/trends → dashboard view for decision makers**

---

## 🧠 What This Shows Employers

✓ You can turn SQL insights into **visual communication**  
✓ You understand **public health storytelling**  
✓ You can build a **decision-facing dashboard**, not just queries  
✓ You’re comfortable with KPI design and layout

---

## 📎 Next Step

In Project 05 (Python Mini ETL), we simulate an automated cleaning step so future data could be refreshed programmatically before SQL ingestion.
