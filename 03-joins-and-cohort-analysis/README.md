# 03 — Joins & Cohort Analysis (MySQL)

**Goal:** Enrich the data by joining population + vaccination coverage so we can calculate *rates per 100k* and analyze whether higher vaccination coverage is associated with lower case or hospitalization burden.

This simulates what a real public health analyst does after basic trend monitoring — adjusting for population size and intervention levels.

---

## ✅ Key Analysis Ideas

| Metric | Why it matters |
|--------|----------------|
| Cases per 100k | Raw numbers are misleading without population normalization |
| Hospitalizations per 100k | Signals severity & healthcare strain |
| Deaths per 100k | Outcome measurement |
| Booster % Bands | Used for comparison (ex: <20% vs 60%+) |
| Cohort Entry Month | Check how counties behave in their *first outbreak month* |

---

## 🗂 Files in This Folder

| File | Description |
|------|-------------|
| `schema.sql` | Adds vaccination table + monthly rollup view |
| `cohort_analysis.sql` | Performs the joins & rate comparisons |

---

## 🧠 What This Shows Employers

- Multi-table joins
- Per-capita normalization (public health standard)
- Window functions + grouping logic
- Real analytical storytelling (vaccination vs burden)

---

## 📎 Next Step

After this, the cleaned + aggregated data powers the **Excel dashboard** in Project 04.
