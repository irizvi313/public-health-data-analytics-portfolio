# 02 — Exploratory SQL Queries (MySQL)

**Goal:** Perform exploratory data analysis to understand respiratory illness trends across counties, time, and age groups.

This step simulates the work of a public health analyst who uses SQL to identify *which communities are rising in cases*, *which age groups are most impacted*, and *how positivity rates change over time*.

---

## ✅ Questions Answered with SQL

| # | Question | Purpose |
|---|----------|---------|
| 1 | Which counties are rising the fastest month-over-month? | Detect emerging hotspots |
| 2 | Which age group has the highest positivity count? | Identify high-risk populations |
| 3 | What is the positivity trend over time? | Check if spread is growing or declining |
| 4 | Which counties contribute the most to total cases? | Resource allocation decisions |

---

## 🛠 Tools / Concepts Used

- `GROUP BY` and aggregation
- Month-over-month deltas
- Basic window functions (`LAG`)
- Data rollups
- Joining metadata (county_info)
- Time-based grouping

---

## 📂 Files in This Folder

| File | Description |
|------|-------------|
| `schema.sql` | Creates the database tables |
| `analysis_queries.sql` | Contains exploratory SQL queries |

---

## 📎 Next Step

These findings will later be combined with population and vaccination data in **Project 03 — Joins & Cohort Analysis** to create per-capita (per 100k) rates and vaccination impact analysis.
