# 05 — Python Mini ETL (Pandas)

**Goal:** Simulate an ETL (Extract → Transform → Load) step that takes a raw CSV export from a public health agency and standardizes it for use in SQL + downstream dashboards.  

This demonstrates basic Python data wrangling and automation skills.

---

## 🧩 Workflow

| Step | Description |
|------|-------------|
| Extract | Load `raw_data.csv` (messy data) |
| Transform | Clean columns, fix dates, coerce numeric values, deduplicate |
| Load | Output `clean_data_cleaned.csv`, ready for SQL import |

---

## 🛠 Technologies Used
- Python
- Pandas
- CSV parsing
- Data validation

---

## 📁 Files in this Folder

| File | Description |
|------|-------------|
| `raw_data.csv` | Placeholder raw file (to be added later) |
| `clean_data.py` | ETL script |
| `clean_data_cleaned.csv` | Output created by Python script |

---

## ✅ Key Skills Demonstrated
- Light ETL logic (beginner-friendly)
- Python data cleaning replicating Excel steps
- Proper data formatting before SQL ingestion
- Reproducible workflow (rerun anytime for updates)

---

## 🔗 Pipeline Connection

This step represents the early automation of Project 01:  
instead of manual Excel cleaning forever, Python begins to replace part of that workflow.

Eventually this could evolve into a full ETL refresh cycle.

